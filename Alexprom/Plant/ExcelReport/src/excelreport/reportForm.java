package excelreport;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Exchanger;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author yura_
 */
public class reportForm extends javax.swing.JFrame implements Runnable{
    private ExcelReport er;
    private static List<ServerNode> servers;    
    private Thread erThread;
    private Exchanger<String> ex;
    String message;     
    private String newMessage, oldMessage;
    private Thread mainThread;
    private boolean alarmReport = false;
    
    public reportForm() {
        initComponents();
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        int sizeWidth = this.getWidth();
        int sizeHeight = this.getHeight();
        int locationX = (screenSize.width - sizeWidth) / 2;
        int locationY = (screenSize.height - sizeHeight) / 2;
        this.setLocation(locationX, locationY);
        jDateChooser1.setDate(new Date());                     
        ex = new Exchanger();                
    }                        
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jDialog1 = new javax.swing.JDialog();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jProgressBar1 = new javax.swing.JProgressBar();
        jLabel3 = new javax.swing.JLabel();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jSeparator1 = new javax.swing.JSeparator();
        jPanel1 = new javax.swing.JPanel();
        jMainReport = new javax.swing.JRadioButton();
        jAlarmReport = new javax.swing.JRadioButton();

        jDialog1.setModal(true);

        javax.swing.GroupLayout jDialog1Layout = new javax.swing.GroupLayout(jDialog1.getContentPane());
        jDialog1.getContentPane().setLayout(jDialog1Layout);
        jDialog1Layout.setHorizontalGroup(
            jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        jDialog1Layout.setVerticalGroup(
            jDialog1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Отчеты УППГ-20");
        setResizable(false);

        jLabel1.setText("Выберите дату:");

        jLabel2.setText("Выберите смену:");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "08:00", "20:00" }));

        jProgressBar1.setForeground(new java.awt.Color(51, 102, 255));
        jProgressBar1.setFocusCycleRoot(true);
        jProgressBar1.setStringPainted(true);

        jLabel3.setText("Ход построения:");

        jButton1.setText("Выполнить");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setText("Отмена");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Тип отчета:"));

        jMainReport.setSelected(true);
        jMainReport.setText("Общий отчет");
        jMainReport.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jMainReportActionPerformed(evt);
            }
        });

        jAlarmReport.setText("Аварийные значения");
        jAlarmReport.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jAlarmReportActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jMainReport, javax.swing.GroupLayout.PREFERRED_SIZE, 155, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jAlarmReport))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jMainReport)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jAlarmReport))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(jSeparator1)
                        .addGap(12, 12, 12))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(74, 74, 74)
                                .addComponent(jLabel2))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jDateChooser1, javax.swing.GroupLayout.PREFERRED_SIZE, 155, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 135, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addContainerGap(16, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jProgressBar1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addContainerGap())))
            .addGroup(layout.createSequentialGroup()
                .addGap(106, 106, 106)
                .addComponent(jButton1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jComboBox1)
                    .addComponent(jDateChooser1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jProgressBar1, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton1)
                    .addComponent(jButton2))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed

        jButton1.setEnabled(false);
        //jButton2.setEnabled(false);
        jDateChooser1.setEnabled(false);
        jComboBox1.setEnabled(false);        
        er = new ExcelReport(ex);
        erThread = new Thread(er);
        erThread.setPriority(Thread.MIN_PRIORITY);
        mainThread = new Thread(this);
        mainThread.setPriority(Thread.MIN_PRIORITY);
        try {                                                        
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); 
            DocumentBuilder db = null;
            try {
                db = dbf.newDocumentBuilder();
            } catch (ParserConfigurationException err) {
                System.out.println("Unable create document!!!");
            }
            Document doc = null;
            File xmlFile = new File(System.getProperty("user.dir")+File.separator+"agents.xml");            
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
            
            servers = getServers(serverList);                    
                
            for (int j=0; j<servers.size(); j++){
                switch (servers.get(j).getName()){
                case "ConfigServer":{
                    er.setConfigDriver(servers.get(j).getDriver());
                    er.setConfigURL(servers.get(j).getSource());
                    er.setConfigServerName(servers.get(j).getURL());
                    er.setConfigUsername(servers.get(j).getUsername());
                    er.setConfigPassword(servers.get(j).getPassword());                        
                    break;
                }
                case "DataServer":{
                    er.setDataDriver(servers.get(j).getDriver());
                    er.setDataURL(servers.get(j).getSource());
                    er.setDataServerName(servers.get(j).getURL());
                    er.setDataUsername(servers.get(j).getUsername());
                    er.setDataPassword(servers.get(j).getPassword());                        
                    break;
                }            
            }}
            er.setShift(jComboBox1.getSelectedIndex()+1);
            er.setReportDate(jDateChooser1.getDate());
            er.setReportType(alarmReport);
            er.getDbConnection();
            er.getTask();            
            erThread.start();
            mainThread.start();            
        } catch (SAXException | IOException ex) {
            JOptionPane.showConfirmDialog(this, ex.getLocalizedMessage(), "ExcelReport", JOptionPane.ERROR_MESSAGE);
        }
        
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        if (mainThread!=null){
            erThread.stop();
            mainThread.stop();
            jProgressBar1.setValue(0);
            jProgressBar1.setString("0%");
            jButton1.setEnabled(true);
            jDateChooser1.setEnabled(true);
            jComboBox1.setEnabled(true);
        }else{    
            System.exit(0);
        }    
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jMainReportActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jMainReportActionPerformed
        alarmReport = false;
        jAlarmReport.setSelected(false);
        jMainReport.setSelected(true);
    }//GEN-LAST:event_jMainReportActionPerformed

    private void jAlarmReportActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jAlarmReportActionPerformed
        alarmReport = true;
        jAlarmReport.setSelected(true);
        jMainReport.setSelected(false);
    }//GEN-LAST:event_jAlarmReportActionPerformed
   
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

    @Override
    public void run() {        
        while(true){
            synchronized(this){                   
                try {
                    message = ex.exchange(message); 
                    newMessage = message;
                    if(Integer.parseInt(newMessage)>=100){
                        jButton1.setEnabled(true);
                        jDateChooser1.setEnabled(true);
                        jComboBox1.setEnabled(true);
                    }
                    if (!newMessage.equals(oldMessage)){                        
                        jProgressBar1.setString(newMessage+"%");
                        jProgressBar1.setValue(Integer.parseInt(newMessage));
                    }
                    oldMessage = newMessage;
                    Thread.sleep(1000);                    
                }   catch (InterruptedException | NumberFormatException exx) {
                    Logger.getLogger(reportForm.class.getName()).log(Level.SEVERE, null, exx);
                }
            }    
        }        
    }
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JRadioButton jAlarmReport;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JComboBox<String> jComboBox1;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private javax.swing.JDialog jDialog1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JRadioButton jMainReport;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JProgressBar jProgressBar1;
    private javax.swing.JSeparator jSeparator1;
    // End of variables declaration//GEN-END:variables
}

    
