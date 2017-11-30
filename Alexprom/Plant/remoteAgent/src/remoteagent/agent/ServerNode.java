package remoteagent.agent;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;

public final class ServerNode {
    Node node;
        public String name;
        public String driver;
        public String URL;
        public String Source;
        public String Username;
        public String Password;
        
        public ServerNode(Node node) {
            this.node = node;
            this.name = getName();
            this.driver = getDriver();
            this.URL = getURL();
            this.Source = getSource();
            this.Username = getUsername();
            this.Password = getPassword();            
        }
        
        public String getName() {
            NamedNodeMap attributes = node.getAttributes();
            Node nameAttrib = attributes.getNamedItem("name");
            return nameAttrib.getNodeValue();
        }
        
        public String getDriver() {
            NamedNodeMap attributes = node.getAttributes();
            Node nameAttrib = attributes.getNamedItem("driver");
            return nameAttrib.getNodeValue();
        }
        
        public String getURL(){
            NamedNodeMap attributes = node.getAttributes();
            Node nameAttrib = attributes.getNamedItem("URL");
            return nameAttrib.getNodeValue();
        }
        
        public String getSource(){
            NamedNodeMap attributes = node.getAttributes();
            Node nameAttrib = attributes.getNamedItem("Source");
            return nameAttrib.getNodeValue();
        }
        
        public String getUsername(){
            NamedNodeMap attributes = node.getAttributes();
            Node nameAttrib = attributes.getNamedItem("User");
            return nameAttrib.getNodeValue();
        }
        
        public String getPassword(){
            NamedNodeMap attributes = node.getAttributes();
            Node nameAttrib = attributes.getNamedItem("Password");
            return nameAttrib.getNodeValue();
        }
}
