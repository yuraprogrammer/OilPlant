/*
 * AgentBase.java
 *
 * Created on 29 апреля 2016 г., 10:06
 */
package excelreport;

import java.util.Date;
import java.util.concurrent.Exchanger;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Class AgentBase
 *
 * @author yura_
 */
public class AgentBase implements AgentBaseMXBean, Runnable {
    
    private static String configDriver;
    private static String configDB;
    private static String configServer;
    private static String configUser;
    private static String configPassword;
    private static String dataDriver;
    private static String dataDB;
    private static String dataServer;
    private static String dataUser;
    private static String dataPassword;
    public static JDbConnection dbConfig, dbData;
    public int taskDelay = 1000;    
    private static int shift;
    private static Date reportDate;
    private static int progress;
    private static boolean reportType;
    static Exchanger<String> exchanger;
    
    public AgentBase(Exchanger<String> ex) {
        exchanger = ex;
    }   
    
        
    @Override
    public void initAgent(){
        //createLogger();
    }
            
    @Override
    public void setConfigDriver(String driver) {
        configDriver = driver;
    }

    @Override
    public String getConfigDriver() {
        return configDriver;
    }

    @Override
    public void setConfigURL(String url) {
        configDB = url;
    }

    @Override
    public String getConfigURL() {
        return configDB;
    }

    @Override
    public void setConfigServerName(String serverName) {
        configServer = serverName;
    }

    @Override
    public String getConfigServerName() {
        return configServer;
    }

    @Override
    public void setConfigUsername(String userName) {
        configUser = userName;
    }

    @Override
    public String getConfigUsername() {
        return configUser;
    }

    @Override
    public void setConfigPassword(String password) {
        configPassword = password;
    }

    @Override
    public String getConfigPassword() {
        return configPassword;
    }

    @Override
    public void setDataDriver(String driver) {
        dataDriver = driver;
    }

    @Override
    public String getDataDriver() {
        return dataDriver;
    }

    @Override
    public void setDataURL(String url) {
        dataDB = url;
    }

    @Override
    public String getDataURL() {
        return dataDB;
    }

    @Override
    public void setDataServerName(String serverName) {
        dataServer = serverName;
    }

    @Override
    public String getDataServerName() {
        return dataServer;
    }

    @Override
    public void setDataUsername(String userName) {
        dataUser = userName;
    }

    @Override
    public String getDataUsername() {
        return dataUser;
    }

    @Override
    public void setDataPassword(String password) {
        dataPassword = password;
    }

    @Override
    public String getDataPassword() {
        return dataPassword;
    }

    @Override
    public void getDbConnection() {
        //agentLog.log(Level.INFO, "Соединение с базой данных конфигурации.");
        dbConfig = new JDbConnection(configDriver, configDB, configServer, configUser, configPassword);
        //agentLog.log(Level.INFO, "Соединение с базой данных системы автоматизации.");
        dbData = new JDbConnection(dataDriver, dataDB, dataServer, dataUser, dataPassword);        
    }
    
    //Получение задания для агента
    @Override
    public void getTask(){              
        
    }
    
    //Выполенние задания агентом
    @Override
    public void doTask(){
        
    }
    
    @Override
    @SuppressWarnings("empty-statement")
    public void run() {
        while (true){
            synchronized(this){                
                doTask();   
                try {
                    Thread.sleep(taskDelay);
                } catch (InterruptedException ex) {
                    Logger.getLogger(AgentBase.class.getName()).log(Level.SEVERE, null, ex);
                }
            }    
        }    
    }

    @Override
    public void setShift(int shift) {
        this.shift = shift;
    }

    @Override
    public int getShift() {
        return this.shift;
    }

    @Override
    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    @Override
    public Date getReportDate() {
        return this.reportDate;
    }

    @Override
    public void setProgress(int progress) {
        this.progress = progress;
    }

    @Override
    public int getProgress() {
        return this.progress;
    }

    @Override
    public boolean getReportType() {
        return reportType;
    }

    @Override
    public void setReportType(boolean rt) {
        reportType = rt;
    }
}
