package remoteagent.beans;


import com.alexprom.libwincctags.iWinCCTagReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Class LevelToVolume
 *
 * @author yura_
 */
public final class LevelToVolume extends AgentBase {
       
    private iWinCCTagReader tags;
    private final List<String> levelTags = new ArrayList<>();
    private final List<String> volumeTags = new ArrayList<>();
    private final List<String> tankID = new ArrayList<>();    
    
    public LevelToVolume() {
        super();        
    }
       
    //Инициализация агента - подключение к WinCC
    @Override
    public void initAgent(){
       //this.tags = new WinCCTags();
       tags = iWinCCTagReader.INSTANCE;
       tags.WinCC_Connect();
    }
    
    //Получение задания для агента
    @Override
    public void getTask(){
        
        try {
            Statement stmt = dbConfig.db.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=0 and name=1");
            while (rs.next()){
                levelTags.add(rs.getString(1));
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=5 and name=1");
            while (rs.next()){
                volumeTags.add(rs.getString(1));
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=6 and name=1");
            while (rs.next()){
                tankID.add(rs.getString(1));
            }
            rs.close(); 
            /*rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=2 and name=2");
            while (rs.next()){
                taskDelay = Integer.parseInt(rs.getString(1));
            }*/
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(LevelToVolume.class.getName()).log(Level.SEVERE, null, ex);
            getDbConnection();
        }
        
    }
    
    //Выполенние задания агентом
    @Override
    public void doTask(){
    
        try{
            int count = tankID.size();
                if (count!=0){
                    if (tags.ProjectStatus()==0){
                    try {
                    for (int i=0; i<count; i++){
                        double level = tags.ReadTag_Real32(levelTags.get(i));                        
                        Statement stmt = dbData.db.createStatement();
                        ResultSet rs = stmt.executeQuery("select mat_volume from grad_tank where mat_level="+String.valueOf(Math.round(level))+" and tank_id="+tankID.get(i));
                        int volume = 0;
                        if (rs.next()){
                            volume = rs.getInt(1);
                            System.out.println(tankID.get(i)+", "+level + " - " + volume);
                            tags.WriteTag_Real(volumeTags.get(i), volume);
                            rs.close();
                            stmt.close();
                        }    
                    }                                        
                    
            } catch (SQLException ex) {
                Logger.getLogger(LevelToVolume.class.getName()).log(Level.SEVERE, null, ex);
                getDbConnection();
            }
            }else{
                System.out.println(LevelToVolume.class.getName()+": WinCC Runtime is closed. Task running is aborted");
            }   
                }
    }catch (java.lang.UnsatisfiedLinkError | java.lang.NoClassDefFoundError ex){
        System.out.println("WinCC connection failed!!!");
    }
        
    }
}
