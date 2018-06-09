package remoteagent.beans;

import com.alexprom.libwincctags.iWinCCTagReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static remoteagent.beans.AgentBase.dbConfig;

/**
 * Class OilAccount
 *
 * @author yura_
 */
public class OilAccount extends AgentBase{
    
    private iWinCCTagReader tags;
    private final List<String> volumeTags = new ArrayList<>();
    private final List<String> accountTags = new ArrayList<>();
    private double oldE1, oldE1_1, newE1, newE1_1, accountE1, accountE1_1, accountUPPG;
    private boolean shiftStarted, firstCycle;
    private int shift, currentShiftID;
    private String avgProcessingTag;
    
    public OilAccount() {
        super();
        
    }

    @Override
    public void initAgent(){        
        firstCycle = true;
        tags = iWinCCTagReader.INSTANCE;
        tags.WinCC_Connect(); 
    }
    //Получение задания агентом
    @Override
    public void getTask(){              
        try {
            Statement stmt = dbConfig.db.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=0 and name=2");
            while (rs.next()){
                volumeTags.add(rs.getString(1));                
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=5 and name=2");
            while (rs.next()){
                accountTags.add(rs.getString(1));
            }
            rs.close();
            stmt.close();
            avgProcessingTag = "avgProcessing.Value";
                        
        } catch (SQLException ex) {
            Logger.getLogger(LevelToVolume.class.getName()).log(Level.SEVERE, null, ex);
            getDbConnection();
        }
    }
    
    //Выполенние задания агентом
    @Override
    public void doTask(){
    
        try{           
        int count = volumeTags.size();
        if (count!=0){
            if (tags.ProjectStatus()==0){
            //Определение начала новой смены
            Date d1 = new Date();       //Текущие дата и время
            Date d2 = new Date();       //Дата и время первой смены сегодня
            Date d3 = new Date();       //Дата и время второй смены сегодня
            d2.setHours(8);             
            d2.setMinutes(0);
            d2.setSeconds(0);
            d3.setHours(20);
            d3.setMinutes(0);
            d3.setSeconds(0); 
            int cnt = 0;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");                                 
            
            //Определение номера смены    
            if (d1.after(d2) && !d1.after(d3)){
                shift=1;                    
            }else{
                shift=2;                    
            }
            int currentHour = d1.getHours();
            if (currentHour>=0 && currentHour<=7){
                int curDay = d1.getDate();
                int yesterday = curDay-1;
                d1.setDate(yesterday);                        
            }
            try 
            {
                //Определение повторного запуска операций для текущей смены
                Statement stm = dbData.db.createStatement();
                String sql="select count(ID) from account_processing where convert(varchar, aDate) = '"+dateFormat.format(d1)+"' and aShift="+String.valueOf(shift);
                //System.out.println(sql);
                ResultSet rs = stm.executeQuery(sql);                
                while (rs.next()){
                    cnt = rs.getInt(1);
                }
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                getDbConnection();
            }
            
            //Определение признака начала новой смены
            shiftStarted = false;
            if (cnt==0){shiftStarted = true;}
             
            //Чтение значений тэгов объемов
            newE1 = tags.ReadTag_Real32(volumeTags.get(0));            
            newE1_1 = tags.ReadTag_Real32(volumeTags.get(1));
            
            //Если началась новая смена - обнуляем учетные данные переработки
            if (shiftStarted){                
                accountE1 = 0.0;
                accountE1_1 = 0.0;
                accountUPPG = 0.0; 
                oldE1 = newE1;
                oldE1_1 = newE1_1;
            }else{//Если смена продолжается
                try {
                    //Определение повторного запуска операций для текущей смены
                    if (firstCycle){
                        oldE1 = newE1;
                        oldE1_1 = newE1_1;
                    }
                    Statement stm = dbData.db.createStatement();
                    String sql="select * from account_processing where ID=(select max(id) from account_processing)";
                    ResultSet rs = stm.executeQuery(sql);                
                    while (rs.next()){
                        accountE1 = rs.getDouble("aE1");
                        accountE1_1 = rs.getDouble("aE1_1");
                        accountUPPG = rs.getDouble("aUPPG");
                    }
                    rs.close();
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                    getDbConnection();
                }
            }        
            
            //Расчет переработки из емкости Е1
            if (newE1<oldE1){
                accountE1 = accountE1 + (oldE1 - newE1);
                accountUPPG = accountUPPG + accountE1;
            }                            
            //Расчет переработки из емкости Е1.1
            if (newE1_1<oldE1_1){
                accountE1_1 = accountE1_1 + (oldE1_1 - newE1_1);
                accountUPPG = accountUPPG + accountE1_1;
            }                         
            
            //Вычисление среднего расхода за смену
            try 
            {                    
                Statement stm = dbData.db.createStatement();
                String sql="select dbo.getAvgProcessing ('"+dateFormat.format(d1)+"', "+String.valueOf(shift)+")";
                System.out.println(sql);
                ResultSet rs = stm.executeQuery(sql);                
                while (rs.next()){
                    double avgProcessing = rs.getDouble(1);
                    tags.WriteTag_Real(avgProcessingTag, avgProcessing);                        
                }
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                getDbConnection();
            }
            
            //Запись значений в тэги
            tags.WriteTag_Real(accountTags.get(0), accountE1);
            tags.WriteTag_Real(accountTags.get(1), accountE1_1);
               
            //Сохранение учетных данных в базу данных
            Statement stmt;
            try {
                stmt = dbData.db.createStatement();
                String query = "exec oilAccount '"+dateFormat.format(d1)+"',"+String.valueOf(shift)+","+String.valueOf(accountE1)+","+String.valueOf(accountE1_1);                
                stmt.execute(query);
                double momentary_aE1 = oldE1-newE1;
                double momentary_aE1_1 = oldE1_1-newE1_1;
                if (momentary_aE1<0.0) momentary_aE1 = 0.0;
                if (momentary_aE1_1<0.0) momentary_aE1_1 = 0.0;
                if ((momentary_aE1!=0.0) || (momentary_aE1_1!=0.0)){
                    query = "exec accountArchive '"+dateFormat.format(d1)+"',"+String.valueOf(shift)+","+String.valueOf(momentary_aE1)+","+String.valueOf(momentary_aE1_1);                    
                    stmt.execute(query);
                }    
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                getDbConnection();
                getTask();
            }
            oldE1 = newE1;
            oldE1_1 = newE1_1;
            firstCycle = false;
            }else{
               System.out.println(OilAccount.class.getName()+": WinCC Runtime is closed. Task running is aborted");
            }
        }        
    }catch (java.lang.UnsatisfiedLinkError | java.lang.NoClassDefFoundError ex){
        System.out.println("WinCC connection failed!!!");
    }
    
    }     
}
