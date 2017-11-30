package excelreport;

import java.util.Date;

public interface AgentBaseMXBean {
    public void setConfigDriver(String driver);
    public String getConfigDriver();
    public void setConfigURL(String url);
    public String getConfigURL();
    public void setConfigServerName(String serverName);
    public String getConfigServerName();
    public void setConfigUsername(String userName);
    public String getConfigUsername();
    public void setConfigPassword(String password);
    public String getConfigPassword();
    public void setDataDriver(String driver);
    public String getDataDriver();
    public void setDataURL(String url);
    public String getDataURL();
    public void setDataServerName(String serverName);
    public String getDataServerName();
    public void setDataUsername(String userName);
    public String getDataUsername();
    public void setDataPassword(String password);
    public String getDataPassword();
    public void setShift(int shift);
    public int getShift();
    public void setReportDate(Date reportDate);
    public Date getReportDate();
    public void setProgress(int progress);
    public int getProgress();
    public boolean getReportType();
    public void setReportType(boolean rt);
    public void getDbConnection();    
    public void getTask();
    public void doTask();
    public void run();
    public void initAgent();
}
