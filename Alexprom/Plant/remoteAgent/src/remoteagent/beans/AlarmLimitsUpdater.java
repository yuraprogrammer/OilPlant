package remoteagent.beans;

import com.alexprom.libwincctags.iWinCCTagReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static remoteagent.beans.AgentBase.dbConfig;

/**
 *
 * @author yura_
 */
public class AlarmLimitsUpdater extends AgentBase{
    private iWinCCTagReader tags;
    private final List<String> alarmTagsMax = new ArrayList<>();
    private final List<String> alarmTagsMin = new ArrayList<>();
    private final List<String> alarmValuesMax = new ArrayList<>();
    private final List<String> alarmValuesMin = new ArrayList<>();
    private final List<String> alarmValuesId = new ArrayList<>();
    public AlarmLimitsUpdater(){
        super();
    }
    
    @Override
    public void initAgent(){
        
    }
    
    @Override
    public void getTask(){
        tags = iWinCCTagReader.INSTANCE;
        tags.WinCC_Connect();
        try (Statement stmt = dbConfig.db.createStatement()) {
            ResultSet rs;
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=0 and name=4 and VAR_TYPE=4");
            while (rs.next()){
                String tagName = rs.getString(1);
                String baseTagName = tagName.substring(0, tagName.length()-6);
                String alarmHH = baseTagName+"_Alarms.HH";
                System.out.println(alarmHH);
                alarmTagsMax.add(alarmHH);
                String alarmLL = baseTagName+"_Alarms.LL";
                System.out.println(alarmLL);
                alarmTagsMin.add(alarmLL);
            }
            rs.close();
            rs = stmt.executeQuery("select VAR_ID from viewLevelTags where VAR_CLASS=3 and NAME=4 and VAR_TYPE=4");
            while (rs.next()){
                alarmValuesId.add(rs.getString(1));
                System.out.println(rs.getString(1));
            }
            rs.close();   
        } catch (SQLException ex) {
            Logger.getLogger(AlarmLimitsUpdater.class.getName()).log(Level.SEVERE, null, ex);
            getDbConnection();
            getTask();
        }    
    }
    
    @Override
    public void doTask(){    
        try{                     
        int cnt = alarmValuesId.size();
        if (cnt!=0){
            if (tags.ProjectStatus()==0){
                for (int i=0; i<cnt; i++){
                    double alarmHH = tags.ReadTag_Real32(alarmTagsMax.get(i));
                    double alarmLL = tags.ReadTag_Real32(alarmTagsMin.get(i));
                    try (Statement stmt = dbConfig.db.createStatement()) {                    
                        int id = Integer.parseInt(alarmValuesId.get(i));                    
                        String query = "update dbo.VAR_PROPERTIES SET PROP_VALUE='"+String.valueOf(alarmLL)+
                                "' where VAR_ID="+String.valueOf(id);
                        stmt.execute(query);
                        id++;
                        query = "update dbo.VAR_PROPERTIES SET PROP_VALUE='"+String.valueOf(alarmHH)+
                            "' where VAR_ID="+String.valueOf(id);
                        stmt.execute(query);
                        stmt.close();    
                    } catch (SQLException ex) {
                        System.out.println(ex);
                    }
                }        
        //tags.disconnect();
        }else{
           System.out.println(AlarmLimitsUpdater.class.getName()+": WinCC Runtime is closed. Task running is aborted");
        }
        }
    }catch (java.lang.UnsatisfiedLinkError | java.lang.NoClassDefFoundError ex){
        System.out.println("WinCC connection failed!!!");
    }
    
    }
}
