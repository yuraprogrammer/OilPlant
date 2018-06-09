package remoteagent.beans;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.sql.Connection;
import java.util.Properties;
import java.util.logging.Logger;
import org.libnodave.Nodave;
import org.libnodave.PLCinterface;
import org.libnodave.TCPConnection;
import remoteagent.lib.ProcessA;

public class JPlcAgent{
    private InputStream plcInputStream = null;
    private OutputStream plcOutputStream = null;
    private Socket sock;
    private PLCinterface di;
    public TCPConnection dc;
    private Connection dataBase;
    private Properties sysProp;
    private String host = "localhost";
    private boolean Connected = false;
    private int LifeCycle = 0;    
    private int cycleTime = 1000;
    private ProcessA levelE38, levelE39, levelE40, volE38, volE39, volE40;
    private double maxLevel = 0.0;
    private Logger agentLog;
    int increment, increment_old = 0;
    private String plcName; 
    private int iFace = 1;
    
    public JPlcAgent(String plcHost, String name, int iFace){
        setiFace(iFace);
        setPlcName(name);
        createSocket(plcHost);
        setInterface(plcInputStream, plcOutputStream, this.iFace);
        if (di.initAdapter()==0){
            System.out.println("PLC initialization complete");            
        }
        setConnection(di);
        try{
            int res = dc.connectPLC();
            Connected = res==0;
            if (Connected){
                System.out.println("Connect to PLC success");                
            }
        }catch(java.lang.NullPointerException ex){
            System.out.println("PLC connection not established");            
        }        
    }
           
    private void createSocket(String host){
        try {
            sock = new Socket(host, 102);
            plcInputStream = sock.getInputStream();
            plcOutputStream = sock.getOutputStream();
        } catch (IOException ex) {
            System.out.println(ex.getLocalizedMessage());
        }catch (java.lang.NullPointerException eee){
            
        }
        
    }

    public int getiFace() {
        return iFace;
    }

    public void setiFace(int iFace) {
        this.iFace = iFace;
    }
    
    
    private void setInterface(InputStream is, OutputStream os, int iFace){
        di = new PLCinterface(os,is,"IF".concat(String.valueOf(iFace)),2,Nodave.PROTOCOL_ISOTCP);
    }
    
    private void setConnection(PLCinterface i){
        dc = new TCPConnection(i, 0, 1);
    }
    
    private int tryReconnect(){
        int res=-1;
        try{
            dc.disconnectPLC();
            di.disconnectAdapter();
            sock.close();
            createSocket(host);
            setInterface(plcInputStream, plcOutputStream, this.iFace);
        if (di.initAdapter()==0){
            System.out.println("PLC initialization complete");            
        }
        setConnection(di);
        try{
            res = dc.connectPLC();
            Connected = res==0;
            if (Connected){
                System.out.println("Connect to PLC success");                
            }
        }catch(java.lang.NullPointerException ex){
            System.out.println("PLC connection not established");            
        }
        }catch(Exception ex){
            System.out.println(ex.getLocalizedMessage());
        }
        return res;
    }
    
    public ProcessA readDBData(int numDB, int startOffset, int cnt){
        int res=-1;
        ProcessA plcVal = new ProcessA();
        byte[] by;
        
        res = dc.readBytes(Nodave.DB, numDB, startOffset, cnt, null);
        plcVal.setValue(dc.getFloat(0));
        plcVal.setFault(res!=0);
        return plcVal;
    }                

    public byte readIntData(int area, int numDB, int startOffset, int cnt){
        int res=-1;
        byte[] by;
        res = dc.readBytes(area, numDB, startOffset, cnt, null);
        
        return (byte) dc.getBYTE();
    }
    
    public String getPlcName() {
        return plcName;
    }

    public void setPlcName(String plcName) {
        this.plcName = plcName;
    }
        
}
