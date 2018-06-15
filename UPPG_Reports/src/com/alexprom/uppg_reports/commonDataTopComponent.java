package com.alexprom.uppg_reports;

import com.alexprom.connection.settings.dbConnectionSettingsPanel;
import com.alexprom.entities.process.ActSirieMixing;
import com.alexprom.entities.dictionary.SirieDic;
import com.alexprom.entities.dictionary.WorkersUppg;
import com.alexprom.entities.process.ActSirie;
import com.alexprom.entities.process.ActUPPG;
import com.alexprom.entities.service.ActSirieJpaController;
import com.alexprom.entities.service.ActSirieMixingJpaController;
import com.alexprom.entities.service.ActUPPGJpaController;
import com.alexprom.entities.settings.GlobalEntityManager;
import com.sun.glass.events.KeyEvent;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.prefs.PreferenceChangeEvent;
import java.util.prefs.PreferenceChangeListener;
import java.util.prefs.Preferences;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import org.netbeans.api.settings.ConvertAsProperties;
import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.windows.TopComponent;
import org.openide.util.NbBundle.Messages;
import org.openide.util.NbPreferences;
import org.openide.windows.WindowManager;

/**
 * Top component which displays something.
 */
@ConvertAsProperties(
        dtd = "-//com.alexprom.uppg_reports//commonData//EN",
        autostore = false
)
@TopComponent.Description(
        preferredID = "commonDataTopComponent",
        //iconBase="SET/PATH/TO/ICON/HERE", 
        persistenceType = TopComponent.PERSISTENCE_ALWAYS
)
@TopComponent.Registration(mode = "explorer", openAtStartup = true)
@ActionID(category = "Window", id = "com.alexprom.uppg_reports.commonDataTopComponent")
@ActionReference(path = "Menu/Window" /*, position = 333 */)
@TopComponent.OpenActionRegistration(
        displayName = "#CTL_commonDataAction",
        preferredID = "commonDataTopComponent"
)
@Messages({
    "CTL_commonDataAction=Основные данные",
    "CTL_commonDataTopComponent=Основные данные",
    "HINT_commonDataTopComponent=Основные данные"
})
public final class commonDataTopComponent extends TopComponent {
    private String old_1="", new_1="";
    private float oldContent_1=0, newContent_1=0;
    private String old_2="", new_2="";
    private float oldContent_2=0, newContent_2=0;
    private String old_3="", new_3="";
    private float oldContent_3=0, newContent_3=0;
    private String old_4="", new_4="";
    private float oldContent_4=0, newContent_4=0;
    private String old_5="", new_5="";
    private float oldContent_5=0, newContent_5=0;
    private String old_6="", new_6="";
    private float oldContent_6=0, newContent_6=0;
    private float old_mixingDensity = 0, new_mixingDensity=0;
    private float old_mixingVolume = 0, new_mixingVolume=0;
    private float old_mixingMass = 0, new_mixingMass=0;
    private ActSirie actSirie;
    private List<ActSirie> act_Sirie;
    private SirieDic sirieDic;
    private List<SirieDic> sirieList;
    private EntityManagerFactory emf = null;
    private EntityManager em = null;
    private boolean sirieDataChanged=false;
    private ActUPPG newAct, oldAct;
    private ActSirieMixing actSirieMixing;
    List<ActSirieMixing> listSirieMixing;
    private List<WorkersUppg> mainOpList;
    private List<WorkersUppg> opList;
    private int mainOper=100, oldMain=100;
    private int slaveOper=100, oldSlave=100;
    
    public commonDataTopComponent() {
        initComponents();
        setName(Bundle.CTL_commonDataTopComponent());
        setToolTipText(Bundle.HINT_commonDataTopComponent());
        putClientProperty(TopComponent.PROP_CLOSING_DISABLED, Boolean.FALSE);
        putClientProperty(TopComponent.PROP_DRAGGING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_MAXIMIZATION_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_SLIDING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_UNDOCKING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_KEEP_PREFERRED_SIZE_WHEN_SLIDED_IN, Boolean.TRUE);
        sirieType1.setText("");
        sirieType2.setText("");
        sirieType3.setText("");
        sirieType4.setText("");
        sirieType5.setText("");
        sirieType6.setText("");
        updatePersistence();
        Preferences pref = NbPreferences.forModule(dbConnectionSettingsPanel.class);
        pref.addPreferenceChangeListener(new PreferenceChangeListener() {
        @Override
        public void preferenceChange(PreferenceChangeEvent evt) {                        
            updatePersistence();
    }
});          
    }

    public void updatePersistence(){                
        sirieDataTopComponent tc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
        if (tc!=null){
            emf = tc.getEntityManagerFactory();
            em = tc.getEntityManager();
        }
        if (em!=null){
            jComboBox2.removeAllItems();
            jComboBox3.removeAllItems();
            Query opQuery = em.createNamedQuery("WorkersUppg.findAll");
            mainOpList = opQuery.getResultList();
            opList = mainOpList;
            for (WorkersUppg o : mainOpList){
                jComboBox2.addItem(o.getFio());
                jComboBox3.addItem(o.getFio());
            }            
            jComboBox2.setEnabled(false);
            jComboBox3.setEnabled(false);

        }else{
                
        }
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel13 = new javax.swing.JPanel();
        label2 = new java.awt.Label();
        jComboBox2 = new javax.swing.JComboBox<>();
        label3 = new java.awt.Label();
        jComboBox3 = new javax.swing.JComboBox<>();
        jPanel1 = new javax.swing.JPanel();
        label13 = new java.awt.Label();
        label14 = new java.awt.Label();
        sirieContent1 = new javax.swing.JFormattedTextField();
        label15 = new java.awt.Label();
        label16 = new java.awt.Label();
        sirieContent2 = new javax.swing.JFormattedTextField();
        label17 = new java.awt.Label();
        label18 = new java.awt.Label();
        sirieContent3 = new javax.swing.JFormattedTextField();
        label19 = new java.awt.Label();
        label20 = new java.awt.Label();
        sirieContent4 = new javax.swing.JFormattedTextField();
        label21 = new java.awt.Label();
        label22 = new java.awt.Label();
        sirieContent5 = new javax.swing.JFormattedTextField();
        label23 = new java.awt.Label();
        label24 = new java.awt.Label();
        sirieContent6 = new javax.swing.JFormattedTextField();
        sirieType1 = new javax.swing.JTextField();
        sirieType2 = new javax.swing.JTextField();
        sirieType3 = new javax.swing.JTextField();
        sirieType4 = new javax.swing.JTextField();
        sirieType5 = new javax.swing.JTextField();
        sirieType6 = new javax.swing.JTextField();
        jPanel2 = new javax.swing.JPanel();
        label1 = new java.awt.Label();
        sirieMixing_Volume = new javax.swing.JFormattedTextField();
        label5 = new java.awt.Label();
        sirieMixing_Density = new javax.swing.JFormattedTextField();
        label80 = new java.awt.Label();
        sirieMixing_Mass = new javax.swing.JFormattedTextField();

        jPanel13.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.jPanel13.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel13.setLayout(null);

        label2.setBackground(javax.swing.UIManager.getDefaults().getColor("Button.background"));
        label2.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label2.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label2.text")); // NOI18N
        jPanel13.add(label2);
        label2.setBounds(16, 26, 83, 18);

        jComboBox2.setEnabled(false);
        jComboBox2.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                jComboBox2PropertyChange(evt);
            }
        });
        jPanel13.add(jComboBox2);
        jComboBox2.setBounds(16, 46, 300, 20);

        label3.setBackground(java.awt.SystemColor.control);
        label3.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label3.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label3.text")); // NOI18N
        jPanel13.add(label3);
        label3.setBounds(16, 76, 64, 18);

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " " }));
        jComboBox3.setEnabled(false);
        jComboBox3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox3ActionPerformed(evt);
            }
        });
        jComboBox3.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                jComboBox3PropertyChange(evt);
            }
        });
        jPanel13.add(jComboBox3);
        jComboBox3.setBounds(16, 95, 300, 20);

        add(jPanel13);
        jPanel13.setBounds(0, 0, 330, 130);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.jPanel1.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel1.setDoubleBuffered(false);
        jPanel1.setLayout(null);

        label13.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label13.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label13.text")); // NOI18N
        jPanel1.add(label13);
        label13.setBounds(10, 20, 81, 18);

        label14.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label14.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label14.text")); // NOI18N
        jPanel1.add(label14);
        label14.setBounds(270, 20, 20, 18);

        sirieContent1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent1.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent1.text")); // NOI18N
        sirieContent1.setEnabled(false);
        sirieContent1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieContent1FocusLost(evt);
            }
        });
        sirieContent1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieContent1KeyPressed(evt);
            }
        });
        jPanel1.add(sirieContent1);
        sirieContent1.setBounds(270, 40, 50, 20);

        label15.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label15.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label15.text")); // NOI18N
        jPanel1.add(label15);
        label15.setBounds(10, 70, 81, 18);

        label16.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label16.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label16.text")); // NOI18N
        jPanel1.add(label16);
        label16.setBounds(270, 70, 20, 18);

        sirieContent2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent2.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent2.text")); // NOI18N
        sirieContent2.setEnabled(false);
        sirieContent2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieContent2FocusLost(evt);
            }
        });
        sirieContent2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieContent2KeyPressed(evt);
            }
        });
        jPanel1.add(sirieContent2);
        sirieContent2.setBounds(270, 90, 50, 20);

        label17.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label17.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label17.text")); // NOI18N
        jPanel1.add(label17);
        label17.setBounds(10, 120, 81, 18);

        label18.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label18.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label18.text")); // NOI18N
        jPanel1.add(label18);
        label18.setBounds(270, 120, 20, 18);

        sirieContent3.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent3.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent3.text")); // NOI18N
        sirieContent3.setEnabled(false);
        sirieContent3.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieContent3FocusLost(evt);
            }
        });
        sirieContent3.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieContent3KeyPressed(evt);
            }
        });
        jPanel1.add(sirieContent3);
        sirieContent3.setBounds(270, 140, 50, 20);

        label19.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label19.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label19.text")); // NOI18N
        jPanel1.add(label19);
        label19.setBounds(10, 170, 81, 20);

        label20.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label20.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label20.text")); // NOI18N
        jPanel1.add(label20);
        label20.setBounds(270, 170, 20, 20);

        sirieContent4.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent4.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent4.text")); // NOI18N
        sirieContent4.setEnabled(false);
        sirieContent4.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieContent4FocusLost(evt);
            }
        });
        sirieContent4.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieContent4KeyPressed(evt);
            }
        });
        jPanel1.add(sirieContent4);
        sirieContent4.setBounds(270, 190, 50, 20);

        label21.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label21.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label21.text")); // NOI18N
        jPanel1.add(label21);
        label21.setBounds(10, 220, 81, 20);

        label22.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label22.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label22.text")); // NOI18N
        jPanel1.add(label22);
        label22.setBounds(270, 220, 50, 20);

        sirieContent5.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent5.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent5.text")); // NOI18N
        sirieContent5.setEnabled(false);
        sirieContent5.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieContent5FocusLost(evt);
            }
        });
        sirieContent5.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieContent5KeyPressed(evt);
            }
        });
        jPanel1.add(sirieContent5);
        sirieContent5.setBounds(270, 240, 50, 20);

        label23.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label23.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label23.text")); // NOI18N
        jPanel1.add(label23);
        label23.setBounds(10, 270, 81, 20);

        label24.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label24.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label24.text")); // NOI18N
        jPanel1.add(label24);
        label24.setBounds(270, 270, 50, 20);

        sirieContent6.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent6.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent6.text")); // NOI18N
        sirieContent6.setEnabled(false);
        sirieContent6.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieContent6FocusLost(evt);
            }
        });
        sirieContent6.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieContent6KeyPressed(evt);
            }
        });
        jPanel1.add(sirieContent6);
        sirieContent6.setBounds(270, 290, 50, 20);

        sirieType1.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieType1.text")); // NOI18N
        sirieType1.setEnabled(false);
        sirieType1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieType1FocusLost(evt);
            }
        });
        sirieType1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieType1KeyPressed(evt);
            }
        });
        jPanel1.add(sirieType1);
        sirieType1.setBounds(10, 40, 250, 20);

        sirieType2.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieType2.text")); // NOI18N
        sirieType2.setEnabled(false);
        sirieType2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieType2FocusLost(evt);
            }
        });
        sirieType2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieType2KeyPressed(evt);
            }
        });
        jPanel1.add(sirieType2);
        sirieType2.setBounds(10, 90, 250, 20);

        sirieType3.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieType3.text")); // NOI18N
        sirieType3.setEnabled(false);
        sirieType3.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieType3FocusLost(evt);
            }
        });
        sirieType3.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieType3KeyPressed(evt);
            }
        });
        jPanel1.add(sirieType3);
        sirieType3.setBounds(10, 140, 250, 20);

        sirieType4.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieType4.text")); // NOI18N
        sirieType4.setEnabled(false);
        sirieType4.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieType4FocusLost(evt);
            }
        });
        sirieType4.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieType4KeyPressed(evt);
            }
        });
        jPanel1.add(sirieType4);
        sirieType4.setBounds(10, 190, 250, 20);

        sirieType5.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieType5.text")); // NOI18N
        sirieType5.setEnabled(false);
        sirieType5.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieType5FocusLost(evt);
            }
        });
        sirieType5.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieType5KeyPressed(evt);
            }
        });
        jPanel1.add(sirieType5);
        sirieType5.setBounds(10, 240, 250, 20);

        sirieType6.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieType6.text")); // NOI18N
        sirieType6.setEnabled(false);
        sirieType6.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieType6FocusLost(evt);
            }
        });
        sirieType6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sirieType6ActionPerformed(evt);
            }
        });
        sirieType6.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieType6KeyPressed(evt);
            }
        });
        jPanel1.add(sirieType6);
        sirieType6.setBounds(10, 290, 250, 20);

        add(jPanel1);
        jPanel1.setBounds(0, 138, 330, 330);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.jPanel2.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel2.setLayout(null);

        label1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label1.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label1.text")); // NOI18N
        jPanel2.add(label1);
        label1.setBounds(10, 20, 40, 18);

        sirieMixing_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieMixing_Volume.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieMixing_Volume.text")); // NOI18N
        sirieMixing_Volume.setEnabled(false);
        sirieMixing_Volume.setFocusCycleRoot(true);
        sirieMixing_Volume.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieMixing_VolumeFocusLost(evt);
            }
        });
        sirieMixing_Volume.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieMixing_VolumeKeyPressed(evt);
            }
        });
        jPanel2.add(sirieMixing_Volume);
        sirieMixing_Volume.setBounds(10, 40, 90, 20);

        label5.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label5.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label5.text")); // NOI18N
        jPanel2.add(label5);
        label5.setBounds(110, 20, 50, 18);

        sirieMixing_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieMixing_Density.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieMixing_Density.text")); // NOI18N
        sirieMixing_Density.setEnabled(false);
        sirieMixing_Density.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                sirieMixing_DensityFocusLost(evt);
            }
        });
        sirieMixing_Density.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                sirieMixing_DensityKeyPressed(evt);
            }
        });
        jPanel2.add(sirieMixing_Density);
        sirieMixing_Density.setBounds(110, 40, 90, 20);

        label80.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label80.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label80.text")); // NOI18N
        jPanel2.add(label80);
        label80.setBounds(210, 20, 40, 18);

        sirieMixing_Mass.setEditable(false);
        sirieMixing_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieMixing_Mass.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieMixing_Mass.text")); // NOI18N
        jPanel2.add(sirieMixing_Mass);
        sirieMixing_Mass.setBounds(210, 40, 110, 20);

        add(jPanel2);
        jPanel2.setBounds(0, 470, 330, 80);
    }// </editor-fold>//GEN-END:initComponents
    
    public void showNumberErroMessage(){
        NotifyDescriptor nd = new NotifyDescriptor.Message("Неверный формат введенных данных!!!", NotifyDescriptor.ERROR_MESSAGE);
        Object res = DialogDisplayer.getDefault().notify(nd);
    }
    
    public void setAct(Date actDate, int actShift){
        oldAct = this.newAct;
        if (em!=null){
            Query query = em.createNamedQuery("ActUPPG.findByDateShift");
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String aDate = df.format(actDate);
            query.setParameter("aDate", aDate);
            query.setParameter("aShift", actShift);
            List<ActUPPG> act = query.getResultList();            
            if (!act.isEmpty()){
                this.newAct = act.get(0);
                if (newAct!=oldAct){                                        
                    fillSirie(newAct.getId(), newAct.getComplete());
                    fillMixingSirie(newAct.getId(), newAct.getComplete());
                    int actMainOper = newAct.getMainOper();
                    int actSlaveOper = newAct.getSlaveOper();                
                    for (int i=0; i<mainOpList.size(); i++){
                        if (actMainOper==mainOpList.get(i).getId()){                    
                            oldMain = mainOper;
                            mainOper = i;
                            jComboBox2.setSelectedIndex(mainOper);
                            jComboBox2.setEnabled(newAct.getComplete()==0);
                        }
                    }
                    for (int i=0; i<opList.size(); i++){
                        if (actSlaveOper==opList.get(i).getId()){
                            oldSlave = slaveOper;
                            slaveOper = i;
                            jComboBox3.setSelectedIndex(slaveOper);
                            jComboBox3.setEnabled(newAct.getComplete()==0);
                        }
                    }
                }
            }
        }
    }
    private void jComboBox2PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jComboBox2PropertyChange
        if (jComboBox2.getSelectedIndex()!=-1 && newAct!=null){
            oldMain = mainOper;
            mainOper = mainOpList.get(jComboBox2.getSelectedIndex()).getId();
        }
    }//GEN-LAST:event_jComboBox2PropertyChange

    private void jComboBox3PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jComboBox3PropertyChange
        if (jComboBox3.getSelectedIndex()!=-1 && newAct!=null){
            oldSlave = slaveOper;
            slaveOper = opList.get(jComboBox3.getSelectedIndex()).getId();
        }
    }//GEN-LAST:event_jComboBox3PropertyChange

    private void jComboBox3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox3ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jComboBox3ActionPerformed

    private void setSirieContent1(boolean edited){
        oldContent_1=newContent_1;
            newContent_1=0;
            if (!sirieContent1.getText().isEmpty()){
                try{
                    newContent_1=Float.parseFloat(sirieContent1.getText().replace(",", "."));
                }catch (java.lang.NumberFormatException ex){
                    showNumberErroMessage();                
                }
            }        
        sirieDataChanged = edited;
    }
    
    private void setSirieContent2(boolean edited){
        oldContent_2=newContent_2;
            newContent_2=0;
            if (!sirieContent2.getText().isEmpty()){
                try{
                    newContent_2=Float.parseFloat(sirieContent2.getText().replace(",", "."));
                }catch (java.lang.NumberFormatException ex){
                    showNumberErroMessage();                
                }
            }        
        sirieDataChanged = edited;
    }
    
    private void setSirieContent3(boolean edited){
        oldContent_3=newContent_3;
            newContent_3=0;
            if (!sirieContent3.getText().isEmpty()){
                try{
                    newContent_3=Float.parseFloat(sirieContent3.getText().replace(",", "."));
                }catch (java.lang.NumberFormatException ex){
                    showNumberErroMessage();                
                }
            }        
        sirieDataChanged = edited;
    }
    
    private void setSirieContent4(boolean edited){
        oldContent_4=newContent_4;
            newContent_4=0;
            if (!sirieContent4.getText().isEmpty()){
                try{
                    newContent_4=Float.parseFloat(sirieContent4.getText().replace(",", "."));
                }catch (java.lang.NumberFormatException ex){
                    showNumberErroMessage();                
                }
            }        
        sirieDataChanged = edited;
    }
    
    private void setSirieContent5(boolean edited){
        oldContent_5=newContent_5;
            newContent_5=0;
            if (!sirieContent5.getText().isEmpty()){
                try{
                    newContent_5=Float.parseFloat(sirieContent5.getText().replace(",", "."));
                }catch (java.lang.NumberFormatException ex){
                    showNumberErroMessage();                
                }
            }        
        sirieDataChanged = edited;
    }
    
    private void setSirieContent6(boolean edited){
        oldContent_6=newContent_6;
            newContent_6=0;
            if (!sirieContent6.getText().isEmpty()){
                try{
                    newContent_6=Float.parseFloat(sirieContent6.getText().replace(",", "."));
                }catch (java.lang.NumberFormatException ex){
                    showNumberErroMessage();                
                }
            }        
        sirieDataChanged = edited;
    }
    
    private void setSirieMixingVolume(boolean edited){
        old_mixingVolume = new_mixingVolume;
        if (edited){
            if (!sirieMixing_Volume.getText().isEmpty()){                
                try{
                    new_mixingVolume = Float.parseFloat(sirieMixing_Volume.getText().replace(",", ".").trim());                    
                }catch (java.lang.NumberFormatException ex){
                    this.showNumberErroMessage();
                }    
            }else{
                new_mixingVolume = 0;
            }
            old_mixingMass = new_mixingMass;
            new_mixingMass = new_mixingVolume*new_mixingDensity;
            sirieMixing_Mass.setText(String.format("%.1f", new_mixingMass));
        }else{
            new_mixingVolume = Float.parseFloat(sirieMixing_Volume.getText().replace(",", ".").trim());
        }    
    }
    
    private void setSirieMixingDensity(boolean edited){
        old_mixingDensity = new_mixingDensity;
        if (edited){
            if (!sirieMixing_Density.getText().isEmpty()){
                try{
                    new_mixingDensity = Float.parseFloat(sirieMixing_Density.getText().replace(",", ".").trim());
                    old_mixingMass = new_mixingMass;
                    new_mixingMass = new_mixingVolume*new_mixingDensity;
                    sirieMixing_Mass.setText(String.format("%.1f", new_mixingMass));
                }catch (java.lang.NumberFormatException ex){
                    this.showNumberErroMessage();
                }
            }else{
                
            }
        }else{
            new_mixingDensity = Float.parseFloat(sirieMixing_Density.getText().replace(",", ".").trim());
        } 
    }
    
    private void sirieContent1FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieContent1FocusLost
        setSirieContent1(true);
    }//GEN-LAST:event_sirieContent1FocusLost

    private void sirieContent2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieContent2FocusLost
        setSirieContent2(true);
    }//GEN-LAST:event_sirieContent2FocusLost

    private void sirieContent3FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieContent3FocusLost
        setSirieContent3(true);
    }//GEN-LAST:event_sirieContent3FocusLost

    private void sirieContent4FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieContent4FocusLost
        setSirieContent4(true);
    }//GEN-LAST:event_sirieContent4FocusLost

    private void sirieContent5FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieContent5FocusLost
        setSirieContent5(true);
    }//GEN-LAST:event_sirieContent5FocusLost

    private void sirieContent6FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieContent6FocusLost
        setSirieContent6(true);
    }//GEN-LAST:event_sirieContent6FocusLost

    private void sirieMixing_VolumeFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieMixing_VolumeFocusLost
        setSirieMixingVolume(true);
    }//GEN-LAST:event_sirieMixing_VolumeFocusLost

    private void sirieMixing_DensityFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieMixing_DensityFocusLost
        setSirieMixingDensity(true);
    }//GEN-LAST:event_sirieMixing_DensityFocusLost

    private void sirieContent1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieContent1KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setSirieContent1(true);
            sirieContent1.transferFocus();
        }
    }//GEN-LAST:event_sirieContent1KeyPressed

    private void sirieContent2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieContent2KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setSirieContent2(true);
            sirieContent2.transferFocus();
        }
    }//GEN-LAST:event_sirieContent2KeyPressed

    private void sirieContent3KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieContent3KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setSirieContent3(true);
            sirieContent3.transferFocus();
        }
    }//GEN-LAST:event_sirieContent3KeyPressed

    private void sirieContent4KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieContent4KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setSirieContent4(true);
            sirieContent4.transferFocus();
        }
    }//GEN-LAST:event_sirieContent4KeyPressed

    private void sirieContent5KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieContent5KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setSirieContent5(true);
            sirieContent5.transferFocus();
        }
    }//GEN-LAST:event_sirieContent5KeyPressed

    private void sirieContent6KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieContent6KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setSirieContent6(true);
            sirieContent6.transferFocus();
        }
    }//GEN-LAST:event_sirieContent6KeyPressed

    private void sirieMixing_VolumeKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieMixing_VolumeKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setSirieMixingVolume(true);
            sirieMixing_Volume.transferFocus();
        }
    }//GEN-LAST:event_sirieMixing_VolumeKeyPressed

    private void sirieMixing_DensityKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieMixing_DensityKeyPressed
         if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setSirieMixingDensity(true);
            sirieMixing_Density.transferFocus();
        }
    }//GEN-LAST:event_sirieMixing_DensityKeyPressed

    private void sirieType6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sirieType6ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_sirieType6ActionPerformed

    private void setComponent1(String value){
        old_1 = new_1;
        new_1 = value;
    }
    
    private void setComponent2(String value){
        old_2 = new_2;
        new_2 = value;
    }
    
    private void setComponent3(String value){
        old_3 = new_3;
        new_3 = value;
    }
    
    private void setComponent4(String value){
        old_4 = new_4;
        new_4 = value;
    }
    
    private void setComponent5(String value){
        old_5 = new_5;
        new_5 = value;
    }
    
    private void setComponent6(String value){
        old_6 = new_6;
        new_6 = value;
    }
    
    private void sirieType1FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieType1FocusLost
        setComponent1(sirieType1.getText());
    }//GEN-LAST:event_sirieType1FocusLost

    private void sirieType1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieType1KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setComponent1(sirieType1.getText());
            sirieType1.transferFocus();
        }
    }//GEN-LAST:event_sirieType1KeyPressed

    private void sirieType2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieType2FocusLost
        setComponent2(sirieType2.getText());
    }//GEN-LAST:event_sirieType2FocusLost

    private void sirieType3KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieType3KeyPressed
         if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setComponent3(sirieType3.getText());
            sirieType3.transferFocus();
        }
    }//GEN-LAST:event_sirieType3KeyPressed

    private void sirieType2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieType2KeyPressed
         if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setComponent2(sirieType2.getText());
            sirieType2.transferFocus();
        }
    }//GEN-LAST:event_sirieType2KeyPressed

    private void sirieType4KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieType4KeyPressed
         if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setComponent4(sirieType4.getText());
            sirieType4.transferFocus();
        }
    }//GEN-LAST:event_sirieType4KeyPressed

    private void sirieType5KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieType5KeyPressed
         if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setComponent5(sirieType5.getText());
            sirieType5.transferFocus();
        }
    }//GEN-LAST:event_sirieType5KeyPressed

    private void sirieType6KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sirieType6KeyPressed
         if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setComponent6(sirieType6.getText());
            sirieType6.transferFocus();
        }
    }//GEN-LAST:event_sirieType6KeyPressed

    private void sirieType3FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieType3FocusLost
        setComponent3(sirieType3.getText());
    }//GEN-LAST:event_sirieType3FocusLost

    private void sirieType4FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieType4FocusLost
        setComponent4(sirieType4.getText());
    }//GEN-LAST:event_sirieType4FocusLost

    private void sirieType5FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieType5FocusLost
        setComponent5(sirieType5.getText());
    }//GEN-LAST:event_sirieType5FocusLost

    private void sirieType6FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_sirieType6FocusLost
        setComponent6(sirieType6.getText());
    }//GEN-LAST:event_sirieType6FocusLost

    public void fillSirie(Long id, int permit){        
        if (em!=null){            
            Query query = em.createNamedQuery("ActSirie.findByActID");
            query.setParameter("actID", id);
            act_Sirie = query.getResultList();
            actSirie = act_Sirie.get(0);
            em.refresh(actSirie);
            old_1 = new_1;
            new_1 = actSirie.getComponent1();
            sirieType1.setText(new_1);
            oldContent_1 = newContent_1;
            newContent_1 = (float) actSirie.getPercent1();
            sirieContent1.setText(String.format("%.1f", newContent_1));
            old_2 = new_2;
            new_2 = actSirie.getComponent2();
            sirieType2.setText(new_2);
            oldContent_2 = newContent_2;
            newContent_2 = (float) actSirie.getPercent2();
            sirieContent2.setText(String.format("%.1f", newContent_2));            
            old_3 = new_3;
            new_3 = actSirie.getComponent3();
            sirieType3.setText(new_3);
            oldContent_3 = newContent_3;
            newContent_3 = (float) actSirie.getPercent3();
            sirieContent3.setText(String.format("%.1f", newContent_3));
            old_4 = new_4;
            new_4 = actSirie.getComponent4();
            sirieType4.setText(new_4);
            oldContent_4 = newContent_4;
            newContent_4 = (float) actSirie.getPercent4();
            sirieContent4.setText(String.format("%.1f", newContent_4));
            old_5 = new_5;
            new_5 = actSirie.getComponent5();
            sirieType5.setText(new_5);
            oldContent_5 = newContent_5;
            newContent_5 = (float) actSirie.getPercent5();
            sirieContent5.setText(String.format("%.1f", newContent_5));
            old_6 = new_6;
            new_6 = actSirie.getComponent6();
            sirieType5.setText(new_6);
            oldContent_6 = newContent_6;
            newContent_6 = (float) actSirie.getPercent6();
            sirieContent6.setText(String.format("%.1f", newContent_6));
            
            sirieContent1.setEnabled(permit==0);
            sirieContent2.setEnabled(permit==0);
            sirieContent3.setEnabled(permit==0);
            sirieContent4.setEnabled(permit==0);
            sirieContent5.setEnabled(permit==0);
            sirieContent6.setEnabled(permit==0);
            sirieType1.setEnabled(permit==0);
            sirieType2.setEnabled(permit==0);
            sirieType3.setEnabled(permit==0);
            sirieType4.setEnabled(permit==0);
            sirieType5.setEnabled(permit==0);
            sirieType6.setEnabled(permit==0);
        }
    }
    
    public void fillMixingSirie(Long id, int permit){
        if (em!=null){            
            Query query = em.createNamedQuery("ActSirieMixing.findByActID");
            query.setParameter("actID", id);
            listSirieMixing = query.getResultList();
            actSirieMixing = listSirieMixing.get(0);
            em.refresh(actSirieMixing);
            old_mixingVolume = new_mixingVolume;
            new_mixingVolume = actSirieMixing.getSirieVolume().floatValue();
            old_mixingDensity = new_mixingDensity;
            new_mixingDensity = actSirieMixing.getSirieDensity().floatValue();
            old_mixingMass = new_mixingMass;
            new_mixingMass = actSirieMixing.getSirieMass().floatValue();
            sirieMixing_Volume.setText(String.format("%.1f", new_mixingVolume));
            sirieMixing_Density.setText(String.format("%.4f", new_mixingDensity));
            sirieMixing_Mass.setText(String.format("%.1f", new_mixingMass));
            sirieMixing_Volume.setEnabled(permit==0);
            sirieMixing_Density.setEnabled(permit==0);
            sirieMixing_Mass.setEnabled(false);
        }
    }
    
    public void save(int permit) throws Exception{
        if (actSirie!=null && sirieDataChanged){
            ActSirieJpaController sirieJpa = new ActSirieJpaController(emf);
            actSirie.setComponent1(new_1);
            actSirie.setComponent2(new_2);
            actSirie.setComponent3(new_3);
            actSirie.setComponent4(new_4);
            actSirie.setComponent5(new_5);
            actSirie.setComponent6(new_6);
            actSirie.setPercent1(newContent_1);
            actSirie.setPercent2(newContent_2);
            actSirie.setPercent3(newContent_3);
            actSirie.setPercent4(newContent_4);
            actSirie.setPercent5(newContent_5);
            actSirie.setPercent6(newContent_6);
            sirieJpa.edit(actSirie);
            sirieDataChanged = false;
        }
        if (newAct!=null){
            ActUPPGJpaController actJpa = new ActUPPGJpaController(emf);
            newAct.setMainOper(mainOper);
            newAct.setSlaveOper(slaveOper);
            newAct.setComplete(permit);
            actJpa.edit(newAct);
        }
        if (actSirieMixing!=null){
            ActSirieMixingJpaController sirieMixingJpa = new ActSirieMixingJpaController(emf);
            actSirieMixing.setSirieVolume(BigDecimal.valueOf(new_mixingVolume));
            actSirieMixing.setSirieDensity(BigDecimal.valueOf(new_mixingDensity));
            sirieMixingJpa.edit(actSirieMixing);
            sirieDataChanged = false;
        }
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JComboBox<String> jComboBox3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel13;
    private javax.swing.JPanel jPanel2;
    private java.awt.Label label1;
    private java.awt.Label label13;
    private java.awt.Label label14;
    private java.awt.Label label15;
    private java.awt.Label label16;
    private java.awt.Label label17;
    private java.awt.Label label18;
    private java.awt.Label label19;
    private java.awt.Label label2;
    private java.awt.Label label20;
    private java.awt.Label label21;
    private java.awt.Label label22;
    private java.awt.Label label23;
    private java.awt.Label label24;
    private java.awt.Label label3;
    private java.awt.Label label5;
    private java.awt.Label label80;
    private javax.swing.JFormattedTextField sirieContent1;
    private javax.swing.JFormattedTextField sirieContent2;
    private javax.swing.JFormattedTextField sirieContent3;
    private javax.swing.JFormattedTextField sirieContent4;
    private javax.swing.JFormattedTextField sirieContent5;
    private javax.swing.JFormattedTextField sirieContent6;
    private javax.swing.JFormattedTextField sirieMixing_Density;
    private javax.swing.JFormattedTextField sirieMixing_Mass;
    private javax.swing.JFormattedTextField sirieMixing_Volume;
    private javax.swing.JTextField sirieType1;
    private javax.swing.JTextField sirieType2;
    private javax.swing.JTextField sirieType3;
    private javax.swing.JTextField sirieType4;
    private javax.swing.JTextField sirieType5;
    private javax.swing.JTextField sirieType6;
    // End of variables declaration//GEN-END:variables
    @Override
    public void componentOpened() {
        if (em!=null){
            jComboBox2.removeAllItems();
            jComboBox3.removeAllItems();
            Query opQuery = em.createNamedQuery("WorkersUppg.findAll");
            mainOpList = opQuery.getResultList();
            opList = mainOpList;
            for (WorkersUppg o : mainOpList){
                jComboBox2.addItem(o.getFio());
                jComboBox3.addItem(o.getFio());
            }            
            jComboBox2.setEnabled(false);
            jComboBox3.setEnabled(false);

        }else{
            this.close();
        }
    }

    @Override
    public void componentClosed() {
        NotifyDescriptor d = new NotifyDescriptor.Confirmation("Открыть окна отображения данных акта", "Открыть акт");
        Object open = DialogDisplayer.getDefault().notify(d);
    }

    void writeProperties(java.util.Properties p) {
        // better to version settings since initial version as advocated at
        // http://wiki.apidesign.org/wiki/PropertyFiles
        p.setProperty("version", "1.0");
        // TODO store your settings
    }

    void readProperties(java.util.Properties p) {
        String version = p.getProperty("version");
        // TODO read your settings according to their version
    }
}
