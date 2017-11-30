package excelreport;

import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;

public class AgentNode {
    Node node;
         
        public AgentNode(Node node) {
            this.node = node;
        }
        //Получаем имя агента
        public String getName() {
 
            NamedNodeMap attributes = node.getAttributes();
            Node nameAttrib = attributes.getNamedItem("name");
            return nameAttrib.getNodeValue();
        }
}
