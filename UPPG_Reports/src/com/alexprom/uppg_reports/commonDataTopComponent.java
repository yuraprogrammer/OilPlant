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
import javax.persistence.Query;
import org.netbeans.api.settings.ConvertAsProperties;
import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.windows.TopComponent;
import org.openide.util.NbBundle.Messages;
import org.openide.util.NbPreferences;

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
    private int old_1, new_1=0;
    private float oldContent_1=0, newContent_1=0;
    private int old_2, new_2=0;
    private float oldContent_2=0, newContent_2=0;
    private int old_3, new_3=0;
    private float oldContent_3=0, newContent_3=0;
    private int old_4, new_4=0;
    private float oldContent_4=0, newContent_4=0;
    private int old_5, new_5=0;
    private float oldContent_5=0, newContent_5=0;
    private int old_6, new_6=0;
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
        sirieType1.removeAllItems();
        sirieType2.removeAllItems();
        sirieType3.removeAllItems();
        sirieType4.removeAllItems();
        sirieType5.removeAllItems();
        sirieType6.removeAllItems();
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
        GlobalEntityManager gem = new GlobalEntityManager();
        emf = gem.getEmf();
        em = gem.getEm();
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
        sirieType1 = new javax.swing.JComboBox<>();
        label14 = new java.awt.Label();
        sirieContent1 = new javax.swing.JFormattedTextField();
        label15 = new java.awt.Label();
        label16 = new java.awt.Label();
        sirieType2 = new javax.swing.JComboBox<>();
        sirieContent2 = new javax.swing.JFormattedTextField();
        label17 = new java.awt.Label();
        label18 = new java.awt.Label();
        sirieType3 = new javax.swing.JComboBox<>();
        sirieContent3 = new javax.swing.JFormattedTextField();
        label19 = new java.awt.Label();
        label20 = new java.awt.Label();
        sirieType4 = new javax.swing.JComboBox<>();
        sirieContent4 = new javax.swing.JFormattedTextField();
        label21 = new java.awt.Label();
        label22 = new java.awt.Label();
        sirieType5 = new javax.swing.JComboBox<>();
        sirieContent5 = new javax.swing.JFormattedTextField();
        label23 = new java.awt.Label();
        sirieType6 = new javax.swing.JComboBox<>();
        label24 = new java.awt.Label();
        sirieContent6 = new javax.swing.JFormattedTextField();
        jPanel2 = new javax.swing.JPanel();
        label1 = new java.awt.Label();
        sirieMixing_Volume = new javax.swing.JFormattedTextField();
        label5 = new java.awt.Label();
        sirieMixing_Density = new javax.swing.JFormattedTextField();
        label80 = new java.awt.Label();
        sirieMixing_Mass = new javax.swing.JFormattedTextField();

        jPanel13.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.jPanel13.border.title"))); // NOI18N
        jPanel13.setLayout(null);

        label2.setBackground(javax.swing.UIManager.getDefaults().getColor("Button.background"));
        label2.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label2.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label2.text")); // NOI18N
        jPanel13.add(label2);
        label2.setBounds(16, 26, 76, 18);

        jComboBox2.setEnabled(false);
        jComboBox2.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                jComboBox2PropertyChange(evt);
            }
        });
        jPanel13.add(jComboBox2);
        jComboBox2.setBounds(16, 46, 300, 20);

        label3.setBackground(java.awt.SystemColor.control);
        label3.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label3.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label3.text")); // NOI18N
        jPanel13.add(label3);
        label3.setBounds(16, 76, 58, 18);

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

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.jPanel1.border.title"))); // NOI18N
        jPanel1.setDoubleBuffered(false);
        jPanel1.setLayout(null);

        label13.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label13.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label13.text")); // NOI18N
        jPanel1.add(label13);
        label13.setBounds(10, 20, 72, 18);

        sirieType1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        sirieType1.setEnabled(false);
        sirieType1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieType1PropertyChange(evt);
            }
        });
        jPanel1.add(sirieType1);
        sirieType1.setBounds(10, 40, 250, 20);

        label14.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label14.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label14.text")); // NOI18N
        jPanel1.add(label14);
        label14.setBounds(270, 20, 19, 18);

        sirieContent1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent1.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent1.text")); // NOI18N
        sirieContent1.setEnabled(false);
        sirieContent1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieContent1PropertyChange(evt);
            }
        });
        jPanel1.add(sirieContent1);
        sirieContent1.setBounds(270, 40, 50, 20);

        label15.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label15.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label15.text")); // NOI18N
        jPanel1.add(label15);
        label15.setBounds(10, 70, 72, 18);

        label16.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label16.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label16.text")); // NOI18N
        jPanel1.add(label16);
        label16.setBounds(270, 70, 20, 18);

        sirieType2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        sirieType2.setEnabled(false);
        sirieType2.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieType2PropertyChange(evt);
            }
        });
        jPanel1.add(sirieType2);
        sirieType2.setBounds(10, 90, 250, 20);

        sirieContent2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent2.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent2.text")); // NOI18N
        sirieContent2.setEnabled(false);
        sirieContent2.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieContent2PropertyChange(evt);
            }
        });
        jPanel1.add(sirieContent2);
        sirieContent2.setBounds(270, 90, 50, 20);

        label17.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label17.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label17.text")); // NOI18N
        jPanel1.add(label17);
        label17.setBounds(10, 120, 72, 18);

        label18.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label18.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label18.text")); // NOI18N
        jPanel1.add(label18);
        label18.setBounds(270, 120, 19, 18);

        sirieType3.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        sirieType3.setEnabled(false);
        sirieType3.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieType3PropertyChange(evt);
            }
        });
        jPanel1.add(sirieType3);
        sirieType3.setBounds(10, 140, 250, 20);

        sirieContent3.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent3.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent3.text")); // NOI18N
        sirieContent3.setEnabled(false);
        sirieContent3.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieContent3PropertyChange(evt);
            }
        });
        jPanel1.add(sirieContent3);
        sirieContent3.setBounds(270, 140, 50, 20);

        label19.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label19.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label19.text")); // NOI18N
        jPanel1.add(label19);
        label19.setBounds(10, 170, 72, 20);

        label20.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label20.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label20.text")); // NOI18N
        jPanel1.add(label20);
        label20.setBounds(270, 170, 20, 20);

        sirieType4.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        sirieType4.setEnabled(false);
        sirieType4.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieType4PropertyChange(evt);
            }
        });
        jPanel1.add(sirieType4);
        sirieType4.setBounds(10, 190, 250, 20);

        sirieContent4.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent4.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent4.text")); // NOI18N
        sirieContent4.setEnabled(false);
        sirieContent4.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieContent4PropertyChange(evt);
            }
        });
        jPanel1.add(sirieContent4);
        sirieContent4.setBounds(270, 190, 50, 20);

        label21.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label21.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label21.text")); // NOI18N
        jPanel1.add(label21);
        label21.setBounds(10, 220, 72, 20);

        label22.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label22.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label22.text")); // NOI18N
        jPanel1.add(label22);
        label22.setBounds(270, 220, 50, 20);

        sirieType5.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        sirieType5.setEnabled(false);
        sirieType5.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieType5PropertyChange(evt);
            }
        });
        jPanel1.add(sirieType5);
        sirieType5.setBounds(10, 240, 250, 20);

        sirieContent5.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent5.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent5.text")); // NOI18N
        sirieContent5.setEnabled(false);
        sirieContent5.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieContent5PropertyChange(evt);
            }
        });
        jPanel1.add(sirieContent5);
        sirieContent5.setBounds(270, 240, 50, 20);

        label23.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label23.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label23.text")); // NOI18N
        jPanel1.add(label23);
        label23.setBounds(10, 270, 72, 20);

        sirieType6.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        sirieType6.setEnabled(false);
        sirieType6.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieType6PropertyChange(evt);
            }
        });
        jPanel1.add(sirieType6);
        sirieType6.setBounds(10, 290, 250, 20);

        label24.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label24.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label24.text")); // NOI18N
        jPanel1.add(label24);
        label24.setBounds(270, 270, 50, 20);

        sirieContent6.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieContent6.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieContent6.text")); // NOI18N
        sirieContent6.setEnabled(false);
        sirieContent6.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieContent6PropertyChange(evt);
            }
        });
        jPanel1.add(sirieContent6);
        sirieContent6.setBounds(270, 290, 50, 20);

        add(jPanel1);
        jPanel1.setBounds(0, 138, 330, 330);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.jPanel2.border.title"))); // NOI18N
        jPanel2.setLayout(null);

        label1.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label1.text")); // NOI18N
        jPanel2.add(label1);
        label1.setBounds(10, 20, 40, 20);

        sirieMixing_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieMixing_Volume.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieMixing_Volume.text")); // NOI18N
        sirieMixing_Volume.setEnabled(false);
        sirieMixing_Volume.setFocusCycleRoot(true);
        sirieMixing_Volume.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieMixing_VolumePropertyChange(evt);
            }
        });
        jPanel2.add(sirieMixing_Volume);
        sirieMixing_Volume.setBounds(10, 40, 90, 20);

        label5.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.label5.text")); // NOI18N
        jPanel2.add(label5);
        label5.setBounds(110, 20, 50, 20);

        sirieMixing_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieMixing_Density.setText(org.openide.util.NbBundle.getMessage(commonDataTopComponent.class, "commonDataTopComponent.sirieMixing_Density.text")); // NOI18N
        sirieMixing_Density.setEnabled(false);
        sirieMixing_Density.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sirieMixing_DensityActionPerformed(evt);
            }
        });
        sirieMixing_Density.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                sirieMixing_DensityPropertyChange(evt);
            }
        });
        jPanel2.add(sirieMixing_Density);
        sirieMixing_Density.setBounds(110, 40, 90, 20);

        label80.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
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
                            jComboBox2.setEnabled(true);
                        }
                    }
                    for (int i=0; i<opList.size(); i++){
                        if (actSlaveOper==opList.get(i).getId()){
                            oldSlave = slaveOper;
                            slaveOper = i;
                            jComboBox3.setSelectedIndex(slaveOper);
                            jComboBox3.setEnabled(true);
                        }
                    }
                }
            }
        }else{
            NotifyDescriptor d = new NotifyDescriptor.Message("Не установлена связь с базой данных. Выполните настройки соединения и повторите попытку.", NotifyDescriptor.ERROR_MESSAGE);
            Object result = DialogDisplayer.getDefault().notify(d);
        }
    }
    private void sirieType1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieType1PropertyChange
        if (sirieType1.getSelectedIndex()!=-1){
            old_1=new_1;
            new_1=sirieList.get(sirieType1.getSelectedIndex()).getId();
            sirieDataChanged = true;
        }
    }//GEN-LAST:event_sirieType1PropertyChange

    private void sirieContent1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieContent1PropertyChange
        oldContent_1=newContent_1;
        newContent_1=0;
        if (!sirieContent1.getText().isEmpty()){
            try{
                newContent_1=Float.parseFloat(sirieContent1.getText().replace(",", "."));
            }catch (java.lang.NumberFormatException ex){
                showNumberErroMessage();                
            }
        }
        sirieDataChanged = true;
    }//GEN-LAST:event_sirieContent1PropertyChange

    private void sirieType2PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieType2PropertyChange
        if (sirieType2.getSelectedIndex()!=-1){
            old_2=new_2;
            new_2=sirieList.get(sirieType2.getSelectedIndex()).getId();
            sirieDataChanged = true;
        }
    }//GEN-LAST:event_sirieType2PropertyChange

    private void sirieContent2PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieContent2PropertyChange
        oldContent_2=newContent_2;
        newContent_2=0;
        if (!sirieContent2.getText().isEmpty()){
            try{
                newContent_2=Float.parseFloat(sirieContent2.getText().replace(",", "."));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }
        }
        sirieDataChanged = true;
    }//GEN-LAST:event_sirieContent2PropertyChange

    private void sirieType3PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieType3PropertyChange
        if (sirieType3.getSelectedIndex()!=-1){
            old_3=new_3;
            new_3=sirieList.get(sirieType3.getSelectedIndex()).getId();
            sirieDataChanged = true;
        }
    }//GEN-LAST:event_sirieType3PropertyChange

    private void sirieContent3PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieContent3PropertyChange
        oldContent_3=newContent_3;
        newContent_3=0;
        if (!sirieContent3.getText().isEmpty()){
            try{
                newContent_3=Float.parseFloat(sirieContent3.getText().replace(",", "."));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }
        }
        sirieDataChanged = true;
    }//GEN-LAST:event_sirieContent3PropertyChange

    private void sirieType4PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieType4PropertyChange
        if (sirieType4.getSelectedIndex()!=-1){
            old_4=new_4;
            new_4=sirieList.get(sirieType4.getSelectedIndex()).getId();
            sirieDataChanged = true;
        }
    }//GEN-LAST:event_sirieType4PropertyChange

    private void sirieContent4PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieContent4PropertyChange
        oldContent_4=newContent_4;
        newContent_4=0;
        if (!sirieContent3.getText().isEmpty()){
            try{
                newContent_4=Float.parseFloat(sirieContent4.getText().replace(",", "."));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }
        }
        sirieDataChanged = true;
    }//GEN-LAST:event_sirieContent4PropertyChange

    private void sirieType5PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieType5PropertyChange
        if (sirieType5.getSelectedIndex()!=-1){
            old_5=new_5;
            new_5=sirieList.get(sirieType5.getSelectedIndex()).getId();
            sirieDataChanged = true;
        }
    }//GEN-LAST:event_sirieType5PropertyChange

    private void sirieContent5PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieContent5PropertyChange
        oldContent_5=newContent_5;
        newContent_5=0;
        if (!sirieContent5.getText().isEmpty()){
            try{
                newContent_5=Float.parseFloat(sirieContent5.getText().replace(",", "."));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }
        }
        sirieDataChanged = true;
    }//GEN-LAST:event_sirieContent5PropertyChange

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

    private void sirieType6PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieType6PropertyChange
        if (sirieType6.getSelectedIndex()!=-1){
            old_6=new_6;
            new_6=sirieList.get(sirieType6.getSelectedIndex()).getId();
            sirieDataChanged = true;
        }
    }//GEN-LAST:event_sirieType6PropertyChange

    private void sirieContent6PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieContent6PropertyChange
        oldContent_6=newContent_6;
        newContent_6=0;
        if (!sirieContent6.getText().isEmpty()){
            try{
                newContent_6=Float.parseFloat(sirieContent6.getText().replace(",", "."));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }
        }
        sirieDataChanged = true;
    }//GEN-LAST:event_sirieContent6PropertyChange

    private void sirieMixing_VolumePropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieMixing_VolumePropertyChange
        if (!sirieMixing_Volume.getText().isEmpty()){
            old_mixingVolume = new_mixingVolume;
            try{
                new_mixingVolume = Float.parseFloat(sirieMixing_Volume.getText().replace(",", ".").trim());
                old_mixingMass = new_mixingMass;
                new_mixingMass = new_mixingVolume*new_mixingDensity;
                sirieMixing_Mass.setText(String.format("%.1f", new_mixingMass));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }    
        }
    }//GEN-LAST:event_sirieMixing_VolumePropertyChange

    private void sirieMixing_DensityActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sirieMixing_DensityActionPerformed

    }//GEN-LAST:event_sirieMixing_DensityActionPerformed

    private void sirieMixing_DensityPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_sirieMixing_DensityPropertyChange
        if (!sirieMixing_Density.getText().isEmpty()){
            old_mixingDensity = new_mixingDensity;
            try{
                new_mixingDensity = Float.parseFloat(sirieMixing_Density.getText().replace(",", ".").trim());
                old_mixingMass = new_mixingMass;
                new_mixingMass = new_mixingVolume*new_mixingDensity;
                sirieMixing_Mass.setText(String.format("%.1f", new_mixingMass));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }
        }        
    }//GEN-LAST:event_sirieMixing_DensityPropertyChange

    public void fillSirie(Long id, int permit){        
        if (em!=null){            
            Query query = em.createNamedQuery("ActSirie.findByActID");
            query.setParameter("actID", id);
            act_Sirie = query.getResultList();
            actSirie = act_Sirie.get(0);
            em.refresh(actSirie);
            for (int i=0; i<sirieList.size(); i++){
                if (actSirie.getComponent1()==sirieList.get(i).getId()){
                    old_1 = new_1;
                    new_1 = i;
                    sirieType1.setSelectedIndex(new_1);
                }
            }
            sirieContent1.setText(String.format("%.1f", actSirie.getPercent1()));
            for (int i=0; i<sirieList.size(); i++){
                if (actSirie.getComponent2()==sirieList.get(i).getId()){
                    old_2 = new_2;
                    new_2 = i;
                    sirieType2.setSelectedIndex(new_2);
                }
            }
            sirieContent2.setText(String.format("%.1f", actSirie.getPercent2()));
            for (int i=0; i<sirieList.size(); i++){
                if (actSirie.getComponent3()==sirieList.get(i).getId()){
                    old_3 = new_3;
                    new_3 = i;
                    sirieType3.setSelectedIndex(new_3);
                }
            }
            sirieContent3.setText(String.format("%.1f", actSirie.getPercent3()));
            for (int i=0; i<sirieList.size(); i++){
                if (actSirie.getComponent4()==sirieList.get(i).getId()){
                    old_4 = new_4;
                    new_4 = i;
                    sirieType4.setSelectedIndex(new_4);
                }
            }
            sirieContent4.setText(String.format("%.1f", actSirie.getPercent4()));
            for (int i=0; i<sirieList.size(); i++){
                if (actSirie.getComponent5()==sirieList.get(i).getId()){
                    old_5 = new_5;
                    new_5 = i;
                    sirieType5.setSelectedIndex(new_5);
                }
            }
            sirieContent5.setText(String.format("%.1f", actSirie.getPercent5()));
            for (int i=0; i<sirieList.size(); i++){
                if (actSirie.getComponent6()==sirieList.get(i).getId()){
                    old_6 = new_6;
                    new_6 = i;
                    sirieType5.setSelectedIndex(new_6);
                }
            }
            sirieContent6.setText(String.format("%.1f", actSirie.getPercent6()));
            
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
            sirieMixing_Volume.setText(String.format("%.1f", actSirieMixing.getSirieVolume()));
            sirieMixing_Density.setText(String.format("%.4f", actSirieMixing.getSirieDensity()));
            sirieMixing_Mass.setText(String.format("%.1f", actSirieMixing.getSirieMass()));
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
    private javax.swing.JComboBox<String> sirieType1;
    private javax.swing.JComboBox<String> sirieType2;
    private javax.swing.JComboBox<String> sirieType3;
    private javax.swing.JComboBox<String> sirieType4;
    private javax.swing.JComboBox<String> sirieType5;
    private javax.swing.JComboBox<String> sirieType6;
    // End of variables declaration//GEN-END:variables
    @Override
    public void componentOpened() {
        if (em!=null){
            Query query = em.createNamedQuery("SirieDic.findAll");
            sirieList = query.getResultList();
            for (SirieDic s : sirieList){
                sirieType1.addItem(s.getName());
                sirieType2.addItem(s.getName());
                sirieType3.addItem(s.getName());
                sirieType4.addItem(s.getName());
                sirieType5.addItem(s.getName());
                sirieType6.addItem(s.getName());
            }
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
