package remoteagent.beans;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import static remoteagent.beans.AgentBase.dbData;
import remoteagent.lib.PlcTag;
import remoteagent.lib.SimaticAddressParser;

/**
 *
 * @author yura_
 */
public class DAQ_And_Store extends AgentBase{
    
    private JPlcAgent plc[];
    private SimaticAddressParser tags[];
    private PlcTag plcTags[];
    private NodeList paramList;
    private NodeList plcList;
    private int shift, currentShiftID;
    private boolean shiftStarted, firstCycle;
    
    @Override
    public void getTask(){
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = null;
            try {
                db = dbf.newDocumentBuilder();
            } catch (ParserConfigurationException ex) {
                System.out.println("Unable create document!!!");
            }
            Document doc = null;
            File xmlFile = new File(System.getProperty("user.dir")+File.separator+"plcTags.xml");
            doc = db.parse(xmlFile);
                    
            Node node = doc.getChildNodes().item(0);
            
            paramList = doc.getElementsByTagName("PlcTag");
            plcTags = new PlcTag[paramList.getLength()];
            for (int i=0; i<paramList.getLength(); i++){
                plcTags[i] = new PlcTag();
                NamedNodeMap attributes = paramList.item(i).getAttributes();
                Node nameAttrib = attributes.getNamedItem("name");
                plcTags[i].setTagName(nameAttrib.getNodeValue());
                Node plcAttrib = attributes.getNamedItem("plcName");
                plcTags[i].setPlcName(plcAttrib.getNodeValue());
                Node addrAttrib = attributes.getNamedItem("S7Addr");
                plcTags[i].setS7Addr(addrAttrib.getNodeValue());                
                Node maxAttrib = attributes.getNamedItem("maxValue");
                plcTags[i].setMaxValue(Double.parseDouble(maxAttrib.getNodeValue()));
                Node minAttrib = attributes.getNamedItem("minValue");
                plcTags[i].setMinValue(Double.parseDouble(minAttrib.getNodeValue()));
            }
            tags = new SimaticAddressParser[paramList.getLength()];
                for (int i=0; i<paramList.getLength(); i++){
                    tags[i] = new SimaticAddressParser(plcTags[i].getS7Addr());
                }
            plcList = doc.getElementsByTagName("PLC");
            plc = new JPlcAgent[plcList.getLength()];
            for (int i=0; i<plcList.getLength(); i++){
                NamedNodeMap attributes = plcList.item(i).getAttributes();
                Node plcAttrib = attributes.getNamedItem("host");
                Node nameAttrib = attributes.getNamedItem("name");
                plc[i] = new JPlcAgent(plcAttrib.getNodeValue(), nameAttrib.getNodeValue(), i+1);
            }
        } catch (SAXException | IOException ex) {
            Logger.getLogger(DAQ_And_Store.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public void doTask(){
        int count = paramList.getLength();
        if (count!=0){
            
            //Определение начала новой смены
            Date d1 = new Date();       //Текущие дата и время
            Date d2 = new Date();       //Дата и время первой смены сегодня
            Date d3 = new Date();       //Дата и время второй смены сегодня
            d2.setHours(8);             
            d2.setMinutes(0);
            d2.setSeconds(0);
            d3.setHours(20);
            d3.setMinutes(0);
            d3.setSeconds(0); 
            int cnt = 0;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");                                 
            
            //Определение номера смены    
            if (d1.after(d2) && d1.before(d3)){
                shift=1;                    
            }else{
                shift=2;                    
            }
            int currentHour = d1.getHours();
            if (currentHour>=0 && currentHour<=7 && shift==2){                
                d1.setDate(d1.getDate()-1);                        
            }
            try 
            {                
                //Определение повторного запуска операций для текущей смены
                Statement stm = dbData.db.createStatement();
                String sql = "select count(id) from counters_daq where daq_dt = '"+dateFormat.format(d1)+"' and shift="+String.valueOf(shift);                
                ResultSet rs = stm.executeQuery(sql);                
                while (rs.next()){
                    cnt = rs.getInt(1);
                }
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                getDbConnection();
            }
            
            //Определение признака начала новой смены
            shiftStarted = false;
            if (cnt==0){shiftStarted = true;}
            //Проверка наличия данных за вторую смену во время первой
                try{
                    Statement stm = dbData.db.createStatement();
                    String sql = "select count(id) from counters_daq where daq_dt = '"+dateFormat.format(d1)+"' and shift="+String.valueOf(2);
                    ResultSet rs = stm.executeQuery(sql);                
                    int num = 0;
                    while (rs.next()){
                        num = rs.getInt(1);
                    }
                    if (shift==1 && num!=0){
                        stm.execute("delete from counters_daq where daq_dt = '"+dateFormat.format(d1)+"' and shift="+String.valueOf(2));
                    }
                    rs.close();
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                    getDbConnection();
                }
            
            if (shiftStarted){                
                for (int i=0; i<count; i++){
                    for (int j=0; j<plcList.getLength(); j++){
                        plcTags[i].setCurrentValue(plc[j].readDBData(tags[i].getDbNum(), tags[i].getStartAddress(), tags[i].getByteCnt()));
                        try {                            
                            Statement stm = dbData.db.createStatement();
                            String sql = "exec counterAccount '"+dateFormat.format(d1)+"',"+String.valueOf(shift)+",'"+plcTags[i].getTagName()+"',"+String.valueOf(plcTags[i].getCurrentValue().getValue());
                            stm.execute(sql);                            
                        } catch (SQLException ex) {
                            Logger.getLogger(DAQ_And_Store.class.getName()).log(Level.SEVERE, null, ex);
                        }                    
                    }                
                }
            }          
        }
        
    }
        
}
