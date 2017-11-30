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
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import remoteagent.beans.AlarmLimitsUpdater;
import remoteagent.beans.ArchiveFavoriteParams;
import remoteagent.beans.ExcelAlarmReport;
import remoteagent.beans.ExcelReport;
import remoteagent.beans.LevelToVolume;
import remoteagent.beans.OilAccount;
import remoteagent.beans.ProductAccount;
import remoteagent.beans.TSP_Account;
import remoteagent.beans.VoidAgent;

/**
 *
 * @author yura_
 */
public class RemoteAgent {

    private static LevelToVolume ltv;
    private static OilAccount oa;
    private static ProductAccount pa;
    private static VoidAgent va;
    private static ArchiveFavoriteParams afp;
    private static ExcelReport er;
    private static ExcelAlarmReport ear;
    private static AlarmLimitsUpdater alu;
    private static TSP_Account ta;
    private static RemoteAgent singleton;
    private static Thread ltvThread;
    private static Thread oaThread;
    private static Thread paThread;
    private static Thread vaThread;
    private static Thread afpThread;
    private static Thread erThread;
    private static Thread earThread;
    private static Thread aluThread;
    private static Thread taThread;
    private static List<ServerNode> servers;
    private ObjectName[] objName;
    private RemoteMethodRunner[] agent;
    
    public void init(){
        try {
            ltv = new LevelToVolume();
            oa = new OilAccount();
            pa = new ProductAccount();
            afp = new ArchiveFavoriteParams();
            er = new ExcelReport();
            ear = new ExcelAlarmReport();
            alu = new AlarmLimitsUpdater();
            ta = new TSP_Account();
            ObjectName mLTV = new ObjectName ("agent.remoteagent:type=LevelToVolume");
            ObjectName mOA = new ObjectName ("agent.remoteagent:type=OilAccount");
            ObjectName mPA = new ObjectName ("agent.remoteagent:type=ProductAccount");
            ObjectName mAFP = new ObjectName ("agent.remoteagent:type=ArchiveFavoriteParams");
            ObjectName mER = new ObjectName ("agent.remoteagent:type=ExcelReport");
            ObjectName mEAR = new ObjectName ("agent.remoteagent:type=ExcelAlarmReport");
            ObjectName mALU = new ObjectName ("agent.remoteagent:type=AlarmLimitsUpdater");
            ObjectName mTA = new ObjectName ("agent.remoteagent:type=TSP_Account");
            getMBeanServer().registerMBean(ltv, mLTV);
            getMBeanServer().registerMBean(oa, mOA);
            getMBeanServer().registerMBean(pa, mPA);
            getMBeanServer().registerMBean(afp, mAFP);
            getMBeanServer().registerMBean(er, mER);
            getMBeanServer().registerMBean(ear, mEAR);
            getMBeanServer().registerMBean(alu, mALU);
            getMBeanServer().registerMBean(ta, mTA);
            ltvThread = new Thread(ltv);
            ltvThread.setPriority(Thread.MIN_PRIORITY);
            oaThread = new Thread(oa);
            oaThread.setPriority(Thread.MIN_PRIORITY);
            paThread = new Thread(pa);
            paThread.setPriority(Thread.MIN_PRIORITY);
            afpThread = new Thread(afp);
            afpThread.setPriority(Thread.MIN_PRIORITY);
            erThread = new Thread(er);
            erThread.setPriority(Thread.MIN_PRIORITY);
            earThread = new Thread(ear);
            earThread.setPriority(Thread.MIN_PRIORITY);
            aluThread = new Thread(alu);
            aluThread.setPriority(Thread.MIN_PRIORITY);
            taThread = new Thread(ta);
            taThread.setPriority(Thread.MIN_PRIORITY);
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
            //String path = System.getProperty("user.dir");
            //path = path +"\\build\\classes\\remoteagent\\agent\\";
            //InputStream fis;
            //URL url = getClass().getResource("agents.xml");
            //fis = url.openStream();
            doc = db.parse(xmlFile);
            System.out.println("Agents.xml opened!!!");
        
            Node node = doc.getChildNodes().item(0);
        
            NodeList agentList = doc.getElementsByTagName("Agent");
            List<AgentNode> agents = getAgents(agentList);
                        
            String[] modules;
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
            //agentThreads = new Thread[modules.length];
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
            ltvThread.start();                                                
            oaThread.start();            
            paThread.start();            
            afpThread.start();
            erThread.start();
            earThread.start();
            aluThread.start();
            taThread.start();
        }
        return singleton;
    } 
    
    public MBeanServer getMBeanServer() {
        return mbs;
    }
    public static void main(String[] args) {
    
        
    }
    
     private final MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
}
