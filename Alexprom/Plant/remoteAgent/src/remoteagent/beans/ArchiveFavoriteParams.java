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
public class ArchiveFavoriteParams extends AgentBase{
    private iWinCCTagReader tags;
    private final List<String> archieveTags = new ArrayList<>();
    private final List<String> archieveTagsDesc = new ArrayList<>();
    private boolean shiftStarted;
    private int shift, currentShiftID;
    
    public ArchiveFavoriteParams(){
        super();
    }
    
    //Инициализация агента - подключение к WinCC
    @Override
    public void initAgent(){
        tags = iWinCCTagReader.INSTANCE;  
        tags.WinCC_Connect();   
    }
    
    //Получение задания агентом
    @Override
    public void getTask(){              
        try {
            Statement stmt = dbConfig.db.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=0 and name=4");
            while (rs.next()){
                archieveTags.add(rs.getString(1));                
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=7 and name=4");
            while (rs.next()){
                archieveTagsDesc.add(rs.getString(1));                
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
        int count = archieveTags.size();        
        String currentOperatorName = "currentOperatorName";        
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
                String sql="select count(ID) from ProcessArchieve where aDate = '"+dateFormat.format(d1)+"' and aShift="+String.valueOf(shift);
                ResultSet rs = stm.executeQuery(sql);                
                while (rs.next()){
                    cnt = rs.getInt(1);
                }
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                getDbConnection();
                getTask();
            }
            
            //Определение признака начала новой смены
            shiftStarted = cnt==0;                            
            
            //Чтение значений тэгов и запись в базу данных
            for (int i=0; i<archieveTags.size(); i++){                
                
                double newTag = tags.ReadTag_Real32(archieveTags.get(i));
                String currentOperator;
                //currentOperator = tags.readTagText(currentOperatorName);
                double index = tags.ReadTag_Real32("operatorIndex");
                int opIndex = (int)index;
                //Сохранение данных в архив
                Statement stmt;
                try {
                    stmt = dbData.db.createStatement();
                    /*ResultSet rs = stmt.executeQuery("select name from dbo.setOperators where id="+String.valueOf(opIndex));
                    String name = null;
                    while (rs.next()){
                        name = rs.getString(1);
                    }
                    rs.close();*/
                    //System.out.println(index+","+opIndex+","+name);
                    String query = "exec addProcessArchieve '"+
                                    dateFormat.format(d1)+"',"+
                                    String.valueOf(shift)+",'"+
                                    archieveTags.get(i)+"',"+
                                    opIndex+","+
                                    String.valueOf(newTag);
                    stmt.execute(query);                    
                    stmt.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                    getDbConnection();
                    getTask();
                } 
            }                                                                   
            }else{
                    System.out.println(ArchiveFavoriteParams.class.getName()+": WinCC Runtime is closed. Task running is aborted");
            }
        }
    }catch (java.lang.UnsatisfiedLinkError | java.lang.NoClassDefFoundError ex){
        System.out.println("WinCC connection failed!!!");
    }
    
    }         
    
    @Override
    @SuppressWarnings("empty-statement")
    public void run() {
        while (true){
            synchronized(this){                
                doTask();   
                try {
                    Thread.sleep(5000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(LevelToVolume.class.getName()).log(Level.SEVERE, null, ex);
                }
            }    
        }    
    }
}
