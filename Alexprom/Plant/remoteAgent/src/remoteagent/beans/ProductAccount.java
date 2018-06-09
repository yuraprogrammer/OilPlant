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
import static remoteagent.beans.AgentBase.dbData;

/**
 *
 * @author yura_
 */
public class ProductAccount extends AgentBase{
    
    private iWinCCTagReader tags;
    private final List<String> volumeTags = new ArrayList<>();
    private final List<String> accountTags = new ArrayList<>();
    private double oldE31, oldE32, oldE33, accountE31, accountE32, accountE33;
    private boolean shiftStarted, firstCycle;
    private int shift, currentShiftID;    
    
    public ProductAccount() {
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
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=0 and name=3");
            while (rs.next()){
                volumeTags.add(rs.getString(1));                
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=5 and name=3");
            while (rs.next()){
                accountTags.add(rs.getString(1));
            }
            rs.close();
            stmt.close();            
                        
        } catch (SQLException ex) {
            Logger.getLogger(LevelToVolume.class.getName()).log(Level.SEVERE, null, ex);
            getDbConnection();
            getTask();
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
                String sql="select count(ID) from account_product where convert(varchar, aDate) = '"+dateFormat.format(d1)+"' and aShift="+String.valueOf(shift);
                System.out.println(sql);
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
            //System.out.println(cnt);
            //Определение признака начала новой смены
            shiftStarted = false;
            if (cnt==0){shiftStarted = true;}
            
            //Чтение значений тэгов объемов
            double newE31=0.0;
            newE31= tags.ReadTag_Real32(volumeTags.get(0));            
            double newE32=0.0;
            newE32= tags.ReadTag_Real32(volumeTags.get(1));
            double newE33=0.0;
            newE33= tags.ReadTag_Real32(volumeTags.get(2));
            System.out.println(volumeTags.get(0)+". Volume E31: "+newE31);
            System.out.println(volumeTags.get(1)+". Volume E32: "+newE32);
            System.out.println(volumeTags.get(2)+". Volume E33: "+newE33);
            
            //Если началась новая смена - обнуляем учетные данные переработки
            if (shiftStarted){                
                accountE31 = 0.0;
                accountE32 = 0.0;
                accountE33 = 0.0;
                oldE31 = newE31;
                oldE32 = newE32;
                oldE33 = newE33;
            }else{//Если смена продолжается
                try {
                    //Определение повторного запуска операций для текущей смены
                    if (firstCycle){
                        oldE31 = newE31;
                        oldE32 = newE32;
                        oldE33 = newE33;
                    }
                    Statement stm = dbData.db.createStatement();
                    String sql="select * from account_product where ID=(select max(id) from account_product)";
                    ResultSet rs = stm.executeQuery(sql);                
                    while (rs.next()){
                        accountE31 = rs.getDouble("aE31");
                        accountE32 = rs.getDouble("aE32");
                        accountE33 = rs.getDouble("aE33");
                    }
                    rs.close();
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                    getDbConnection();
                }
            }      
                
            
            //Расчет производства в емкости Е31
            if (newE31>oldE31){
                accountE31 = accountE31 + (newE31 - oldE31);                
            }                            
            if (newE32>oldE32){
                accountE32 = accountE32 + (newE32 - oldE32);                
            }                               
            if (newE33>oldE33){
                accountE33 = accountE33 + (newE33 - oldE33);                
            }                                                        
            
            //Запись значений в тэги
            tags.WriteTag_Real(accountTags.get(0), accountE31);
            tags.WriteTag_Real(accountTags.get(1), accountE32);
            tags.WriteTag_Real(accountTags.get(2), accountE33);
            
            //Сохранение учетных данных в базу данных
            Statement stmt;
            try {
                stmt = dbData.db.createStatement();
                String query = "exec productAccount '"+dateFormat.format(d1)+"',"
                                +String.valueOf(shift)+","
                                +String.valueOf(accountE31)+","
                                +String.valueOf(accountE32)+","
                                +String.valueOf(accountE33);
                //System.out.println(query);
                stmt.execute(query);
                double momentary_aE31 = newE31 - oldE31;
                double momentary_aE32 = newE32 - oldE32;
                double momentary_aE33 = newE33 - oldE33;
                
                if (momentary_aE31<0) momentary_aE31 = 0.0;
                if (momentary_aE32<0) momentary_aE32 = 0.0;
                if (momentary_aE33<0) momentary_aE33 = 0.0;
                if ((momentary_aE31!=0.0) || (momentary_aE32!=0.0) || (momentary_aE33!=0.0)){
                    query = "exec accountProductArchive '"+dateFormat.format(d1)+"',"
                            +String.valueOf(shift)+","
                            +String.valueOf(momentary_aE31)+","
                            +String.valueOf(momentary_aE32)+","
                            +String.valueOf(momentary_aE33);
                    stmt.execute(query);}
                stmt.close();
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                getDbConnection();
            }
            oldE31 = newE31;
            oldE32 = newE32;
            oldE33 = newE33;
            firstCycle = false;
            }else{
               System.out.println(ProductAccount.class.getName()+": WinCC Runtime is closed. Task running is aborted");
            }
        }        
    }catch (java.lang.UnsatisfiedLinkError | java.lang.NoClassDefFoundError ex){
        System.out.println("WinCC connection failed!!!");
    } 
    
    } 
}
