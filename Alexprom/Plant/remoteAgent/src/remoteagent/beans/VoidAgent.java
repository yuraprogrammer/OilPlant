package remoteagent.beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author yura_
 */
public class VoidAgent extends AgentBase{

    public VoidAgent(){
        super();
    }
    
    @Override
    public void doTask() {
        try {            
            Statement stmt = dbData.db.createStatement();
            ResultSet rs = stmt.executeQuery("select * from alexpromusers");
            System.out.println("VoidAgent task cycle done!!!");
        } catch (SQLException ex) {
            Logger.getLogger(VoidAgent.class.getName()).log(Level.SEVERE, null, ex);
            this.getDbConnection();
        }
    }    
    
}
