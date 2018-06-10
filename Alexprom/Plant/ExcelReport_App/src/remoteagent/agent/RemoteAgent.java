package remoteagent.agent;

import java.io.File;
import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.management.Attribute;
import javax.management.AttributeNotFoundException;
import javax.management.InstanceAlreadyExistsException;
import javax.management.InstanceNotFoundException;
import javax.management.InvalidAttributeValueException;
import javax.management.MBeanException;
import javax.management.MBeanRegistrationException;
import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.NotCompliantMBeanException;
import javax.management.ObjectName;
import javax.management.ReflectionException;
import javax.swing.JFrame;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import remoteagent.beans.CountersReport;
import remoteagent.beans.ExcelAlarmReport;
import remoteagent.beans.ExcelReport;


public class RemoteAgent extends JFrame{

    private static ExcelReport er;
    private static ExcelAlarmReport ear;
    private static CountersReport cr;
    private static RemoteAgent singleton;
    private static Thread erThread;
    private static Thread earThread;
    private static Thread crThread;
    private static List<ServerNode> servers;
    private ObjectName[] objName;
    private RemoteMethodRunner[] agent;

    public RemoteMethodRunner[] getAgent() {
        return agent;
    }

    public void setAgent(RemoteMethodRunner[] agent) {
        this.agent = agent;
    }
    private static String[] modules;
    
    public void init(){
        try {
            er = new ExcelReport();
            ear = new ExcelAlarmReport();
            cr = new CountersReport();
            ObjectName mER = new ObjectName ("agent.remoteagent:type=ExcelReport");
            ObjectName mEAR = new ObjectName ("agent.remoteagent:type=ExcelAlarmReport");
            ObjectName mCR = new ObjectName ("agent.remoteagent:type=CountersReport");
            getMBeanServer().registerMBean(er, mER);
            getMBeanServer().registerMBean(ear, mEAR);
            getMBeanServer().registerMBean(cr, mCR);
            erThread = new Thread(er);
            erThread.setPriority(Thread.NORM_PRIORITY);
            earThread = new Thread(ear);
            earThread.setPriority(Thread.NORM_PRIORITY);
            crThread = new Thread(cr);
            crThread.setPriority(Thread.NORM_PRIORITY);
            
        } catch (MalformedObjectNameException | InstanceAlreadyExistsException | MBeanRegistrationException | NotCompliantMBeanException ex) {
            Logger.getLogger(RemoteAgent.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    private void startRemoteTasks(){
        try {                                                        
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); 
            DocumentBuilder db = null;
            try {
                db = dbf.newDocumentBuilder();
            } catch (ParserConfigurationException ex) {
                System.out.println("Unable create document!!!");
            }
            Document doc = null;
            File xmlFile = new File(System.getProperty("user.dir")+File.separator+"agents.xml");            
            doc = db.parse(xmlFile);
            System.out.println("Agents.xml opened!!!");
        
            Node node = doc.getChildNodes().item(0);
        
            NodeList agentList = doc.getElementsByTagName("Agent");
            List<AgentNode> agents = getAgents(agentList);
                        
            
            modules = new String[agents.size()];
            for (int i=0; i<agents.size(); i++){
                modules[i] = agents.get(i).getName();
            }
            
            NodeList serverList = doc.getElementsByTagName("Server");
            
                       
            NodeList ipList = doc.getElementsByTagName("AgentPath");
            Node ipNode = ipList.item(0);
            NamedNodeMap attributes = ipNode.getAttributes();
            Node nameAttrib = attributes.getNamedItem("name");
            String agentIP = nameAttrib.getNodeValue();
            
            
            
            servers = getServers(serverList);                    
            agent = new RemoteMethodRunner[modules.length];
            objName = new ObjectName[modules.length];
            
            for (int i=0; i<modules.length; i++){
                
                agent[i] = RemoteMethodRunner.getDefault(agentIP);
                objName[i] = new ObjectName("agent.remoteagent:type="+modules[i]);
                
                for (int j=0; j<servers.size(); j++){
                    switch (servers.get(j).getName()){
                    case "ConfigServer":{
                        try {
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("ConfigDriver", servers.get(j).getDriver()));
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("ConfigURL", servers.get(j).getSource())); 
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("ConfigServerName", servers.get(j).getURL())); 
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("ConfigUsername", servers.get(j).getUsername())); 
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("ConfigPassword", servers.get(j).getPassword()));                                         
                        } catch (InstanceNotFoundException | AttributeNotFoundException | InvalidAttributeValueException | MBeanException | ReflectionException | IOException ex) {
                            System.out.println(ex);
                        }
                        break;
                    }
                    case "DataServer":{
                        try {
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("DataDriver", servers.get(j).getDriver()));
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("DataURL", servers.get(j).getSource())); 
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("DataServerName", servers.get(j).getURL())); 
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("DataUsername", servers.get(j).getUsername())); 
                            agent[i].getMBeanServerConnection().setAttribute(objName[i], new Attribute("DataPassword", servers.get(j).getPassword()));                                         
                        } catch (InstanceNotFoundException | AttributeNotFoundException | InvalidAttributeValueException | MBeanException | ReflectionException | IOException ex) {
                            System.out.println(ex);
                        }
                        break;
                    }            
                }}
                agent[i].getMBeanServerConnection().invoke(objName[i], "initAgent", null, null);
                agent[i].getMBeanServerConnection().invoke(objName[i], "getDbConnection", null, null);                                                
                agent[i].getMBeanServerConnection().invoke(objName[i], "getTask", null, null);
            }
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    
    private static List<AgentNode> getAgents(NodeList list){
        ArrayList<AgentNode> agents = new ArrayList<>();
        for (int i=0; i<list.getLength(); i++){
            AgentNode agent= new AgentNode(list.item(i));
            agents.add(agent);
        }
        return agents;
    }
    
    private static List<ServerNode> getServers(NodeList list){
        ArrayList<ServerNode> servers = new ArrayList<>();
        for (int i=0; i<list.getLength(); i++){
            ServerNode server = new ServerNode(list.item(i));
            servers.add(server);
        }
        return servers;
    }
    
    public synchronized static RemoteAgent getDefault() throws Exception {
        if(singleton == null) {
            singleton = new RemoteAgent();
            singleton.init();
            singleton.startRemoteTasks();
            
            /*for (int i=0; i<modules.length; i++){
                                
                if (modules[i].equals("ExcelReport")){
                    erThread.start();
                }
                if (modules[i].equals("ExcelAlarmReport")){
                    earThread.start();
                }
                                                
                if (modules[i].equals("CountersReport")){
                    crThread.start();
                }
            }*/
            
        }
        return singleton;
    } 
    
    public MBeanServer getMBeanServer() {
        return mbs;
    }
    
    public static void main(String[] args) {
            try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(RemoteAgent.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(RemoteAgent.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(RemoteAgent.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(RemoteAgent.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new RemoteAgent().setVisible(true);
            }
        });
    }
    
     private final MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
}
