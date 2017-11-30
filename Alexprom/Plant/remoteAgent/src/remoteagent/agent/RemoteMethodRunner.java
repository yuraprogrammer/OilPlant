package remoteagent.agent;

import java.util.HashMap;
import java.util.Map;
import javax.management.MBeanServerConnection;
import javax.management.remote.JMXConnector;
import javax.management.remote.JMXConnectorFactory;
import javax.management.remote.JMXServiceURL;

/**
 * JMX manager class
 *
 * @author yura_
 */
public class RemoteMethodRunner{
    
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
                      
        //Manager instantiation and connection to the remote agent
        //RemoteMethodRunner manager = RemoteMethodRunner.getDefault();        
        // SAMPLE MBEAN NAME DISCOVERY. Uncomment following code.
        /*
         * Set resultSet =
         * manager.getMBeanServerConnection().queryNames(null, null);
         * for(Iterator i = resultSet.iterator(); i.hasNext();) {
         * System.out.println("MBean name: " + i.next());
         * } */
        // Close connection
        //manager.close();
        //System.out.println("Connection closed.");
    }

    /**
     * JMX Agent connection This method is called automatically when
     * <CODE>getDefault()</CODE> is called
     */
    public void connect(String ip) throws Exception {
        // Create JMX Agent URL
        JMXServiceURL url = new JMXServiceURL("service:jmx:rmi://"+ip+":1099/jndi/rmi://"+ip+":1099/jmxrmi");
        /*
         * SAMPLE CREDENTIALS. Uncomment following code.
         * Replace userName and userPassword with your parameters.
         * Provide env parameter when calling JMXConnectorFactory.connect(url, env)
         *  */
        
        Map env = new HashMap();
        env.put(JMXConnector.CREDENTIALS, new String[]{"", ""});
        // Connect the JMXConnector
        connector = JMXConnectorFactory.connect(url, null);
        // Get the MBeanServerConnection
        mbsc = connector.getMBeanServerConnection();
    }

    /**
     * Returns a manager singleton.
     */
    public synchronized static RemoteMethodRunner getDefault(String ip) throws Exception {
        if (singleton == null) {
            singleton = new RemoteMethodRunner();
            singleton.connect(ip);
        }
        return singleton;
    }
    
    public MBeanServerConnection getMBeanServerConnection() {
        return mbsc;
    }
    
    public void close() throws Exception {

        //Close the connection
        connector.close();
    }

    //MBeanServerConnection definition
    private MBeanServerConnection mbsc;

    //The JMX Connector definition
    private JMXConnector connector;

    //Singleton instance
    private static RemoteMethodRunner singleton;
    
}
