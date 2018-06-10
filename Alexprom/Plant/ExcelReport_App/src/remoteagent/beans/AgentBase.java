/*
 * AgentBase.java
 *
 * Created on 29 апреля 2016 г., 10:06
 */
package remoteagent.beans;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.management.ObjectName;
import remoteagent.lib.HtmlFormatter;
import remoteagent.lib.JDbConnection;

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
    static String ip;
    public static JDbConnection dbConfig, dbData;
    public int taskDelay = 1000;
    private Logger agentLog;
    ObjectName obj;
    
    public AgentBase() {
        createLogger();
    }   
    
    private void createLogger(){
        this.agentLog = Logger.getLogger(AgentBase.class.getName());
        FileInputStream fis;
        try {
		FileHandler fh = new FileHandler("%t"+AgentBase.class.getName());
		agentLog.addHandler(fh);
                HtmlFormatter htmlformatter = new HtmlFormatter();
		FileHandler htmlfile = new FileHandler(AgentBase.class.getName()+"_Log.htm");
		htmlfile.setFormatter(htmlformatter);
		agentLog.addHandler(htmlfile);
	} catch (SecurityException e) {
		agentLog.log(Level.SEVERE,"Не удалось создать файл лога из-за политики безопасности.", e);
	} catch (IOException e) {
		agentLog.log(Level.SEVERE,"Не удалось создать файл лога из-за ошибки ввода-вывода.", e);
	}
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
        agentLog.log(Level.INFO, "Соединение с базой данных конфигурации.");
        dbConfig = new JDbConnection(agentLog, configDriver, configDB, configServer, configUser, configPassword);
        agentLog.log(Level.INFO, "Соединение с базой данных системы автоматизации.");
        dbData = new JDbConnection(agentLog, dataDriver, dataDB, dataServer, dataUser, dataPassword);        
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
                        agentLog.log(Level.SEVERE, null, ex);
                    }                
            }    
        }    
    }

    @Override
    public void setRemoteAddress(String address) {
        ip=address;
    }

    @Override
    public String getRemoteAddress() {
        return ip;
    }
}
