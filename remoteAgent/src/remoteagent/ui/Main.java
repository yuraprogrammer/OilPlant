package remoteagent.ui;

import java.util.logging.Level;
import java.util.logging.Logger;
import remoteagent.agent.RemoteAgent;

/**
 *
 * @author yura_
 */
public class Main {
    public static void main(String[] args) {        
            RemoteAgent agent;
            while (true){
                try {
                   agent = RemoteAgent.getDefault();
                } catch (Exception ex) {
                    Logger.getLogger(RemoteAgent.class.getName()).log(Level.SEVERE, null, ex);                    
                }
            }        
    }
}
