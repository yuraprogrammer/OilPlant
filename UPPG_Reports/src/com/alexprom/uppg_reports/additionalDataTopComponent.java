package com.alexprom.uppg_reports;

import com.alexprom.connection.settings.dbConnectionSettingsPanel;
import com.alexprom.entities.process.ActCounters;
import com.alexprom.entities.process.ActUPPG;
import com.alexprom.entities.process.OTGToTSP;
import com.alexprom.entities.process.OTGToUPPG;
import com.alexprom.entities.service.ActCountersJpaController;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.prefs.PreferenceChangeEvent;
import java.util.prefs.PreferenceChangeListener;
import java.util.prefs.Preferences;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import org.netbeans.api.settings.ConvertAsProperties;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.util.Lookup;
import org.openide.util.LookupEvent;
import org.openide.util.LookupListener;
import org.openide.windows.TopComponent;
import org.openide.util.NbBundle.Messages;
import org.openide.util.NbPreferences;
import org.openide.util.Utilities;
import org.openide.windows.WindowManager;

/**
 * Top component which displays something.
 */
@ConvertAsProperties(
        dtd = "-//com.alexprom.uppg_reports//additionalData//EN",
        autostore = false
)
@TopComponent.Description(
        preferredID = "additionalDataTopComponent",
        //iconBase="SET/PATH/TO/ICON/HERE", 
        persistenceType = TopComponent.PERSISTENCE_ALWAYS
)
@TopComponent.Registration(mode = "properties", openAtStartup = true)
@ActionID(category = "Window", id = "com.alexprom.uppg_reports.additionalDataTopComponent")
@ActionReference(path = "Menu/Window" /*, position = 333 */)
@TopComponent.OpenActionRegistration(
        displayName = "#CTL_additionalDataAction",
        preferredID = "additionalDataTopComponent"
)
@Messages({
    "CTL_additionalDataAction=Итого за смену",
    "CTL_additionalDataTopComponent=Итого за смену",
    "HINT_additionalDataTopComponent=Итого за смену"
})
public final class additionalDataTopComponent extends TopComponent implements LookupListener{
    
    private Lookup.Result<OtgAccount> otgResult;
    //private ActUPPG currAct;
    private ActCounters actCounters;
    private OTGToUPPG otgToUPPG;
    private OTGToTSP otgToTsp;
    private final long newActId=0, oldActId=0;    
    private EntityManagerFactory emf = null;
    private EntityManager em = null;
    private List<ActCounters> actCnt;
    private double blfMass, akdgMass, otgMass, sirieMass;
    private double blfDensity, akdgDensity, otgDensity, sirieDensity;
    private double blfVolume, akdgVolume, otgVolume, sirieVolume;
    private double blfPercent, akdgPercent, otgPercent, blf_akdgPercent, blf_akdg_otgPercent;
    private ActUPPG newAct, oldAct;
    private final Long curActId=Long.valueOf(0);
    
    public additionalDataTopComponent() {
        initComponents();
        setName(Bundle.CTL_additionalDataTopComponent());
        setToolTipText(Bundle.HINT_additionalDataTopComponent());
        putClientProperty(TopComponent.PROP_CLOSING_DISABLED, Boolean.FALSE);
        putClientProperty(TopComponent.PROP_DRAGGING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_MAXIMIZATION_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_SLIDING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_UNDOCKING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_KEEP_PREFERRED_SIZE_WHEN_SLIDED_IN, Boolean.TRUE);
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
               
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel2 = new javax.swing.JPanel();
        processing_Volume = new javax.swing.JFormattedTextField();
        processing_Density = new javax.swing.JFormattedTextField();
        label100 = new java.awt.Label();
        label101 = new java.awt.Label();
        label77 = new java.awt.Label();
        processing_Mass = new javax.swing.JFormattedTextField();
        jPanel12 = new javax.swing.JPanel();
        blf_Volume = new javax.swing.JFormattedTextField();
        blf_Mass = new javax.swing.JFormattedTextField();
        label53 = new java.awt.Label();
        blf_Percent = new javax.swing.JFormattedTextField();
        label98 = new java.awt.Label();
        label99 = new java.awt.Label();
        label78 = new java.awt.Label();
        blf_Density = new javax.swing.JFormattedTextField();
        jPanel11 = new javax.swing.JPanel();
        akdg_Volume = new javax.swing.JFormattedTextField();
        akdg_Mass = new javax.swing.JFormattedTextField();
        akdg_Percent = new javax.swing.JFormattedTextField();
        label54 = new java.awt.Label();
        label96 = new java.awt.Label();
        label97 = new java.awt.Label();
        label79 = new java.awt.Label();
        akdg_Density = new javax.swing.JFormattedTextField();
        jPanel10 = new javax.swing.JPanel();
        otg_Volume = new javax.swing.JFormattedTextField();
        otg_Mass = new javax.swing.JFormattedTextField();
        otg_Percent = new javax.swing.JFormattedTextField();
        label55 = new java.awt.Label();
        label94 = new java.awt.Label();
        label95 = new java.awt.Label();
        label80 = new java.awt.Label();
        otg_Density = new javax.swing.JFormattedTextField();
        jPanel13 = new javax.swing.JPanel();
        label56 = new java.awt.Label();
        blf_akdg_otg_Percent = new javax.swing.JFormattedTextField();
        blf_akdg_Percent = new javax.swing.JFormattedTextField();
        label57 = new java.awt.Label();

        setBackground(new java.awt.Color(204, 255, 204));
        setBorder(javax.swing.BorderFactory.createEtchedBorder());

        jPanel2.setBackground(new java.awt.Color(204, 255, 204));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.jPanel2.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel2.setLayout(null);

        processing_Volume.setEditable(false);
        processing_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        processing_Volume.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.processing_Volume.text")); // NOI18N
        jPanel2.add(processing_Volume);
        processing_Volume.setBounds(10, 40, 120, 20);

        processing_Density.setEditable(false);
        processing_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        processing_Density.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.processing_Density.text")); // NOI18N
        jPanel2.add(processing_Density);
        processing_Density.setBounds(280, 40, 90, 20);

        label100.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label100.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label100.text")); // NOI18N
        jPanel2.add(label100);
        label100.setBounds(10, 20, 40, 18);

        label101.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label101.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label101.text")); // NOI18N
        jPanel2.add(label101);
        label101.setBounds(140, 20, 40, 18);

        label77.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label77.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label77.text")); // NOI18N
        jPanel2.add(label77);
        label77.setBounds(280, 20, 50, 18);

        processing_Mass.setEditable(false);
        processing_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        processing_Mass.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.processing_Mass.text")); // NOI18N
        jPanel2.add(processing_Mass);
        processing_Mass.setBounds(140, 40, 130, 20);

        jPanel12.setBackground(new java.awt.Color(204, 255, 204));
        jPanel12.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.jPanel12.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel12.setLayout(null);

        blf_Volume.setEditable(false);
        blf_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blf_Volume.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.blf_Volume.text")); // NOI18N
        jPanel12.add(blf_Volume);
        blf_Volume.setBounds(14, 40, 80, 20);

        blf_Mass.setEditable(false);
        blf_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blf_Mass.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.blf_Mass.text")); // NOI18N
        jPanel12.add(blf_Mass);
        blf_Mass.setBounds(110, 40, 90, 20);

        label53.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label53.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label53.text")); // NOI18N
        jPanel12.add(label53);
        label53.setBounds(310, 20, 30, 18);

        blf_Percent.setEditable(false);
        blf_Percent.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blf_Percent.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.blf_Percent.text")); // NOI18N
        jPanel12.add(blf_Percent);
        blf_Percent.setBounds(310, 40, 60, 20);

        label98.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label98.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label98.text")); // NOI18N
        jPanel12.add(label98);
        label98.setBounds(20, 20, 40, 18);

        label99.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label99.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label99.text")); // NOI18N
        jPanel12.add(label99);
        label99.setBounds(110, 20, 40, 18);

        label78.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label78.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label78.text")); // NOI18N
        jPanel12.add(label78);
        label78.setBounds(210, 20, 50, 18);

        blf_Density.setEditable(false);
        blf_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blf_Density.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.blf_Density.text")); // NOI18N
        jPanel12.add(blf_Density);
        blf_Density.setBounds(210, 40, 90, 20);

        jPanel11.setBackground(new java.awt.Color(204, 255, 204));
        jPanel11.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.jPanel11.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel11.setLayout(null);

        akdg_Volume.setEditable(false);
        akdg_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdg_Volume.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.akdg_Volume.text")); // NOI18N
        jPanel11.add(akdg_Volume);
        akdg_Volume.setBounds(14, 40, 80, 20);

        akdg_Mass.setEditable(false);
        akdg_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdg_Mass.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.akdg_Mass.text")); // NOI18N
        jPanel11.add(akdg_Mass);
        akdg_Mass.setBounds(110, 40, 90, 20);

        akdg_Percent.setEditable(false);
        akdg_Percent.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdg_Percent.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.akdg_Percent.text")); // NOI18N
        jPanel11.add(akdg_Percent);
        akdg_Percent.setBounds(310, 40, 60, 20);

        label54.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label54.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label54.text")); // NOI18N
        jPanel11.add(label54);
        label54.setBounds(310, 20, 30, 18);

        label96.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label96.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label96.text")); // NOI18N
        jPanel11.add(label96);
        label96.setBounds(20, 20, 40, 18);

        label97.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label97.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label97.text")); // NOI18N
        jPanel11.add(label97);
        label97.setBounds(110, 20, 40, 18);

        label79.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label79.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label79.text")); // NOI18N
        jPanel11.add(label79);
        label79.setBounds(210, 20, 50, 18);

        akdg_Density.setEditable(false);
        akdg_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdg_Density.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.akdg_Density.text")); // NOI18N
        jPanel11.add(akdg_Density);
        akdg_Density.setBounds(210, 40, 90, 20);

        jPanel10.setBackground(new java.awt.Color(204, 255, 204));
        jPanel10.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.jPanel10.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel10.setLayout(null);

        otg_Volume.setEditable(false);
        otg_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otg_Volume.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.otg_Volume.text")); // NOI18N
        jPanel10.add(otg_Volume);
        otg_Volume.setBounds(14, 40, 80, 20);

        otg_Mass.setEditable(false);
        otg_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otg_Mass.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.otg_Mass.text")); // NOI18N
        jPanel10.add(otg_Mass);
        otg_Mass.setBounds(110, 40, 90, 20);

        otg_Percent.setEditable(false);
        otg_Percent.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otg_Percent.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.otg_Percent.text")); // NOI18N
        jPanel10.add(otg_Percent);
        otg_Percent.setBounds(310, 40, 60, 20);

        label55.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label55.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label55.text")); // NOI18N
        jPanel10.add(label55);
        label55.setBounds(310, 20, 30, 18);

        label94.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label94.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label94.text")); // NOI18N
        jPanel10.add(label94);
        label94.setBounds(20, 20, 40, 18);

        label95.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label95.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label95.text")); // NOI18N
        jPanel10.add(label95);
        label95.setBounds(110, 20, 40, 18);

        label80.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label80.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label80.text")); // NOI18N
        jPanel10.add(label80);
        label80.setBounds(210, 20, 50, 18);

        otg_Density.setEditable(false);
        otg_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otg_Density.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.otg_Density.text")); // NOI18N
        jPanel10.add(otg_Density);
        otg_Density.setBounds(210, 40, 90, 20);

        jPanel13.setBackground(new java.awt.Color(204, 255, 204));
        jPanel13.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.jPanel13.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel13.setLayout(null);

        label56.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label56.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label56.text")); // NOI18N
        jPanel13.add(label56);
        label56.setBounds(190, 20, 120, 18);

        blf_akdg_otg_Percent.setEditable(false);
        blf_akdg_otg_Percent.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blf_akdg_otg_Percent.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.blf_akdg_otg_Percent.text")); // NOI18N
        jPanel13.add(blf_akdg_otg_Percent);
        blf_akdg_otg_Percent.setBounds(190, 40, 180, 20);

        blf_akdg_Percent.setEditable(false);
        blf_akdg_Percent.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blf_akdg_Percent.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.blf_akdg_Percent.text")); // NOI18N
        jPanel13.add(blf_akdg_Percent);
        blf_akdg_Percent.setBounds(10, 40, 170, 20);

        label57.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label57.setText(org.openide.util.NbBundle.getMessage(additionalDataTopComponent.class, "additionalDataTopComponent.label57.text")); // NOI18N
        jPanel13.add(label57);
        label57.setBounds(10, 20, 90, 18);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel12, javax.swing.GroupLayout.DEFAULT_SIZE, 383, Short.MAX_VALUE)
            .addComponent(jPanel11, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel10, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addComponent(jPanel13, javax.swing.GroupLayout.DEFAULT_SIZE, 383, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(1, 1, 1)
                .addComponent(jPanel12, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(1, 1, 1)
                .addComponent(jPanel11, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(1, 1, 1)
                .addComponent(jPanel10, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(1, 1, 1)
                .addComponent(jPanel13, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JFormattedTextField akdg_Density;
    private javax.swing.JFormattedTextField akdg_Mass;
    private javax.swing.JFormattedTextField akdg_Percent;
    private javax.swing.JFormattedTextField akdg_Volume;
    private javax.swing.JFormattedTextField blf_Density;
    private javax.swing.JFormattedTextField blf_Mass;
    private javax.swing.JFormattedTextField blf_Percent;
    private javax.swing.JFormattedTextField blf_Volume;
    private javax.swing.JFormattedTextField blf_akdg_Percent;
    private javax.swing.JFormattedTextField blf_akdg_otg_Percent;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel12;
    private javax.swing.JPanel jPanel13;
    private javax.swing.JPanel jPanel2;
    private java.awt.Label label100;
    private java.awt.Label label101;
    private java.awt.Label label53;
    private java.awt.Label label54;
    private java.awt.Label label55;
    private java.awt.Label label56;
    private java.awt.Label label57;
    private java.awt.Label label77;
    private java.awt.Label label78;
    private java.awt.Label label79;
    private java.awt.Label label80;
    private java.awt.Label label94;
    private java.awt.Label label95;
    private java.awt.Label label96;
    private java.awt.Label label97;
    private java.awt.Label label98;
    private java.awt.Label label99;
    private javax.swing.JFormattedTextField otg_Density;
    private javax.swing.JFormattedTextField otg_Mass;
    private javax.swing.JFormattedTextField otg_Percent;
    private javax.swing.JFormattedTextField otg_Volume;
    private javax.swing.JFormattedTextField processing_Density;
    private javax.swing.JFormattedTextField processing_Mass;
    private javax.swing.JFormattedTextField processing_Volume;
    // End of variables declaration//GEN-END:variables
    @Override
    public void componentOpened() {
        if (em!=null){
            this.otgResult = Utilities.actionsGlobalContext().lookupResult(OtgAccount.class);
            this.otgResult.addLookupListener(this);
        }else{
            
            this.close();
        }
    }

    @Override
    public void componentClosed() {
        this.otgResult.removeLookupListener(this);
        
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

    private void fillCounters(Long id, int type){
        if (em!=null){            
            Query query =em.createNamedQuery("ActCounters.findByActID");            
            query.setParameter("actID", id);
            actCnt = query.getResultList();
            actCounters = actCnt.get(0);
            em.refresh(actCounters);
            sirieVolume = actCounters.getProcessingVolume().doubleValue();
            processing_Volume.setText(String.format("%.1f", sirieVolume));
            sirieMass = actCounters.getProcessingMass().doubleValue();
            processing_Mass.setText(String.format("%.1f", sirieMass));
            blfVolume = actCounters.getBLFVolume().doubleValue();
            blf_Volume.setText(String.format("%.1f", blfVolume));
            blfMass = actCounters.getBLFMass().doubleValue();
            blf_Mass.setText(String.format("%.1f", blfMass));
            akdgVolume = actCounters.getAKDFVolume().doubleValue();
            akdg_Volume.setText(String.format("%.1f", akdgVolume));
            akdgMass = actCounters.getAKDGMass().doubleValue();
            akdg_Mass.setText(String.format("%.1f", akdgMass));
            if (type==1){
                if (sirieMass!=0){
                    blfPercent = blfMass*100/sirieMass;
                    akdgPercent = akdgMass*100/sirieMass;
                    otgPercent = otgMass*100/sirieMass;
                }else{
                    blfPercent = 0;
                    akdgPercent = 0;
                    otgPercent = 0;
                }
            }else{
                blfPercent = actCounters.getBLFPercent().doubleValue();
                akdgPercent = actCounters.getAKDGPercent().doubleValue();
                otgPercent = actCounters.getOTGPercent().doubleValue();
            }
            blf_akdgPercent = blfPercent+akdgPercent;
            blf_akdg_otgPercent = blfPercent+akdgPercent+otgPercent;
            blf_Percent.setText(String.format("%.1f", blfPercent));                       
            akdg_Percent.setText(String.format("%.1f", akdgPercent));
            otg_Percent.setText(String.format("%.1f", otgPercent));
            blf_akdg_Percent.setText(String.format("%.1f", blf_akdgPercent));
            blf_akdg_otg_Percent.setText(String.format("%.1f", blf_akdg_otgPercent));
            if (type==1){
                if (sirieVolume!=0){
                    sirieDensity = sirieMass/sirieVolume;
                }else{
                    sirieDensity = 0;
                }
                if (blfVolume!=0){
                    blfDensity = blfMass/blfVolume;
                }else{
                    blfDensity = 0;
                }
                if (akdgVolume!=0){
                    akdgDensity = akdgMass/akdgVolume;
                }else{
                    akdgDensity = 0;
                }
                if (otgVolume!=0){
                    otgDensity = otgMass/otgVolume;
                }else{
                    otgDensity = 0;
                }
            }else{
                sirieDensity = actCounters.getProcessingDinsity().doubleValue();
                blfDensity = actCounters.getBLFDensity().doubleValue();
                akdgDensity = actCounters.getAKDGDensity().doubleValue();
                otgDensity = actCounters.getOTGDensity().doubleValue();
            }
            processing_Density.setText(String.format("%.4f", sirieDensity));
            blf_Density.setText(String.format("%.4f", blfDensity));
            akdg_Density.setText(String.format("%.4f", akdgDensity));
            otg_Density.setText(String.format("%.4f", otgDensity));
        }
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
                    fillCounters(newAct.getId(),0);
                }
            }
        }
    }
            
    @Override
    public void resultChanged(LookupEvent le) {
        
        Collection<? extends Lookup.Item<OtgAccount>> otg = otgResult.allItems();
        if (otg.iterator().hasNext()){
            otgMass = otg.iterator().next().getInstance().getMassValue();
            otgVolume = otg.iterator().next().getInstance().getVolumeValue();
            if (sirieMass!=0){
                otgPercent = otgMass*100/sirieMass;
            }else{
                otgPercent=0;
            }
            otg_Mass.setText(String.format("%.1f", otgMass));
            otg_Volume.setText(String.format("%.1f", otgVolume));
            otg_Percent.setText(String.format("%.1f", otgPercent));
            if (newAct!=null){
                fillCounters(newAct.getId(),1);
            }
            
        }
    }
    
    public void save() throws Exception{
        if (actCounters!=null){
            ActCountersJpaController countersJpa = new ActCountersJpaController(emf);
            actCounters.setBLFPercent(BigDecimal.valueOf(blfPercent));
            actCounters.setAKDGPercent(BigDecimal.valueOf(akdgPercent));
            actCounters.setOTGPercent(BigDecimal.valueOf(otgPercent));
            countersJpa.edit(actCounters);
        }
        
    }   
}
