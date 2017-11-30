package excelreport;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public final class JDbConnection {
    private String url;
    public Connection db;
    //private DriverManager dm;
    private String serverName;
    private String dbName;
    //private String port;
    private String user;
    private Logger agentLog;
    private String driver;
    
    public JDbConnection(String driver, String dbName, String serverName, String userName, String password){
        
        
        this.serverName = serverName;
        //port = sysProp.getProperty("Port");
        this.dbName = dbName;
        user = userName;
        
        url = this.serverName+";databaseName="+this.dbName;
        this.driver = driver;
        
        try {
            db = getConnection(this.driver, url, user, password);
            Logger.getLogger(JDbConnection.class.getName()).log(Level.INFO, "{0} connection successfull!!!", url);
        } catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(JDbConnection.class.getName()).log(Level.SEVERE, ex.getLocalizedMessage());
        }
    }
    
    public Connection getConnection(String driver, String url, String user, String password) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        
        Class.forName(driver).newInstance();
        Connection conn = DriverManager.getConnection(url, user, password);
        return conn;        
    }
}
