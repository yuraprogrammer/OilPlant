package remoteagent.ui;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.io.File;
import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.util.ArrayList;
import java.util.Date;
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
import static javax.management.QueryEval.getMBeanServer;
import javax.management.ReflectionException;
import javax.swing.JOptionPane;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import remoteagent.agent.AgentNode;
import remoteagent.agent.RemoteAgent;
import remoteagent.agent.RemoteMethodRunner;
import remoteagent.agent.ServerNode;
import remoteagent.beans.CountersReport;
import remoteagent.beans.ExcelAlarmReport;
import remoteagent.beans.ExcelReport;

/**
 *
 * @author yura_
 */
public class MainForm extends javax.swing.JFrame implements Runnable{
    private static int reportType=0;    
    private static ExcelReport er;
    private static ExcelAlarmReport ear;
    private static CountersReport cr;
    private static RemoteAgent singleton;
    private static Thread erThread;
    private static Thread earThread;
    private static Thread crThread;
    private static List<ServerNode> servers;
    private ObjectName[] objName;    
    private Thread mainThread;
    private RemoteMethodRunner[] agent;
    private String[] modules;    
    
    public MainForm() {
            initComponents();                           
            Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
            int sizeWidth = this.getWidth();
            int sizeHeight = this.getHeight();
            int locationX = (screenSize.width - sizeWidth) / 2;
            int locationY = (screenSize.height - sizeHeight) / 2;
            this.setLocation(locationX, locationY);
            jDateChooser1.setDate(new Date());
            setTitle("ООО Алекспром. Отчеты.");
            
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
                mainThread = new Thread(this);
                mainThread.setPriority(Thread.MIN_PRIORITY);
                mainThread.start();
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
                    
                    
                    modules = new String[agents.size()];
                    for (int i=0; i<agents.size(); i++){
                        modules[i] = agents.get(i).getName();
                    }
                    
                    NodeList serverList = doc.getElementsByTagName("Server");
                    
                    servers = getServers(serverList);
                    agent = new RemoteMethodRunner[modules.length];
                    objName = new ObjectName[modules.length];
                    
                    for (int i=0; i<modules.length; i++){
                        
                        agent[i] = RemoteMethodRunner.getDefault("localhost");
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
                    
                } catch (SAXException | IOException ex) {
                    JOptionPane.showConfirmDialog(this, ex.getLocalizedMessage(), "ExcelReport", JOptionPane.ERROR_MESSAGE);
                } catch (Exception ex) {
                    Logger.getLogger(MainForm.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            } catch (MalformedObjectNameException ex) {
                Logger.getLogger(MainForm.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InstanceAlreadyExistsException ex) {
            Logger.getLogger(MainForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MBeanRegistrationException ex) {
            Logger.getLogger(MainForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NotCompliantMBeanException ex) {
            Logger.getLogger(MainForm.class.getName()).log(Level.SEVERE, null, ex);
        }
        erThread.start();
        earThread.start();
        crThread.start();
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        label1 = new java.awt.Label();
        jPanel1 = new javax.swing.JPanel();
        excelReport = new javax.swing.JRadioButton();
        excelAlarmReport = new javax.swing.JRadioButton();
        counterReport = new javax.swing.JRadioButton();
        label2 = new java.awt.Label();
        jComboBox1 = new javax.swing.JComboBox<>();
        btnStart = new javax.swing.JButton();
        btnExit = new javax.swing.JButton();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();

        setDefaultCloseOperation(javax.swing.WindowConstants.DO_NOTHING_ON_CLOSE);
        setResizable(false);
        setType(java.awt.Window.Type.POPUP);

        label1.setText("Выберите дату:");

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder("Выберите тип отчета:"));

        buttonGroup1.add(excelReport);
        excelReport.setSelected(true);
        excelReport.setText("Отчет об основных параметрах");
        excelReport.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                excelReportActionPerformed(evt);
            }
        });

        buttonGroup1.add(excelAlarmReport);
        excelAlarmReport.setText("Отчет об аварийных параметрах");
        excelAlarmReport.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                excelAlarmReportActionPerformed(evt);
            }
        });

        buttonGroup1.add(counterReport);
        counterReport.setText("Отчет по счетчикам");
        counterReport.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                counterReportActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(excelReport, javax.swing.GroupLayout.PREFERRED_SIZE, 225, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(excelAlarmReport)
                    .addComponent(counterReport, javax.swing.GroupLayout.PREFERRED_SIZE, 195, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(45, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(excelReport)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(excelAlarmReport)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(counterReport)
                .addContainerGap())
        );

        label2.setText("Выберите смену:");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "08:00", "20:00" }));

        btnStart.setText("Строить");
        btnStart.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnStartActionPerformed(evt);
            }
        });

        btnExit.setText("Выход");
        btnExit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnExitActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(label1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(87, 87, 87)
                                .addComponent(label2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(0, 4, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jDateChooser1, javax.swing.GroupLayout.PREFERRED_SIZE, 164, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jComboBox1, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(btnStart)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnExit)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(label1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(label2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jDateChooser1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnStart)
                    .addComponent(btnExit))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void excelAlarmReportActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_excelAlarmReportActionPerformed
        reportType=1;
    }//GEN-LAST:event_excelAlarmReportActionPerformed

    private void excelReportActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_excelReportActionPerformed
        reportType=0;
    }//GEN-LAST:event_excelReportActionPerformed

    private void counterReportActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_counterReportActionPerformed
        reportType=2;
    }//GEN-LAST:event_counterReportActionPerformed

    private void btnExitActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnExitActionPerformed
        System.exit(0);
    }//GEN-LAST:event_btnExitActionPerformed

    private void btnStartActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnStartActionPerformed
            btnStart.setEnabled(false);
            jDateChooser1.setEnabled(false);
            btnExit.setEnabled(false);
            jComboBox1.setEnabled(false);
            jPanel1.setEnabled(false);
            excelReport.setEnabled(false);
            excelAlarmReport.setEnabled(false);
            counterReport.setEnabled(false);
            switch (reportType) {
                case 0:{
                for (String module : modules) {
                    if (module.equals("ExcelReport")) {
                        er.setShift(jComboBox1.getSelectedIndex()+1);
                        er.setSelectedDate(jDateChooser1.getDate());
                        er.setBuild(true);
                    }
                }
                    break;
                }
                case 1:{
                for (String module : modules) {
                    if (module.equals("ExcelAlarmReport")) {
                        ear.setShift(jComboBox1.getSelectedIndex()+1);
                        ear.setSelectedDate(jDateChooser1.getDate());
                        ear.setBuild(true);
                    }
                }
                    break;
                }
                case 2:{
                for (String module : modules) {
                    if (module.equals("CountersReport")) {
                        cr.setSelectedDate(jDateChooser1.getDate());
                        cr.setBuild(true);
                    }
                }
                    break;
                }
            }
        
    }//GEN-LAST:event_btnStartActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainForm().setVisible(true);
            }
        });
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
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnExit;
    private javax.swing.JButton btnStart;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JRadioButton counterReport;
    private javax.swing.JRadioButton excelAlarmReport;
    private javax.swing.JRadioButton excelReport;
    private javax.swing.JComboBox<String> jComboBox1;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private javax.swing.JPanel jPanel1;
    private java.awt.Label label1;
    private java.awt.Label label2;
    // End of variables declaration//GEN-END:variables

    public MBeanServer getMBeanServer() {
        return mbs;
    }
    
    @Override
    public void run() {
        while(true){
            synchronized(this){
                if (!er.isBuild() && !ear.isBuild() && !cr.isBuild()){
                    btnStart.setEnabled(true);
                    jDateChooser1.setEnabled(true);
                    btnExit.setEnabled(true);
                    jComboBox1.setEnabled(true);
                    jPanel1.setEnabled(true);
                    excelReport.setEnabled(true);
                    excelAlarmReport.setEnabled(true);
                    counterReport.setEnabled(true);
                }
                try {
                    Thread.sleep(100);
                } catch (InterruptedException ex) {
                    Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    private final MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
}
