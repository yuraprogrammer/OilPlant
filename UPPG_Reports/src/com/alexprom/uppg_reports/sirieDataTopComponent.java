package com.alexprom.uppg_reports;

import com.alexprom.connection.settings.dbConnectionSettingsPanel;
import com.alexprom.entities.dictionary.GradView;
import com.alexprom.entities.dictionary.TankDic;
import com.alexprom.entities.dictionary.VPlotn20;
import com.alexprom.entities.process.ActCounters;
import com.alexprom.entities.process.ActDensity20;
import com.alexprom.entities.process.ActUPPG;
import com.alexprom.entities.process.OTGToTSP;
import com.alexprom.entities.process.OTGToUPPG;
import com.alexprom.entities.process.UPPGDrainTank;
import com.alexprom.entities.process.UPPGFeedWater;
import com.alexprom.entities.service.OTGToTSPJpaController;
import com.alexprom.entities.service.OTGToUPPGJpaController;
import com.alexprom.entities.service.UPPGDrainTankJpaController;
import com.alexprom.entities.service.UPPGFeedWaterJpaController;
import com.alexprom.entities.settings.GlobalEntityManager;
import java.awt.event.KeyEvent;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.prefs.PreferenceChangeEvent;
import java.util.prefs.PreferenceChangeListener;
import java.util.prefs.Preferences;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import org.netbeans.api.settings.ConvertAsProperties;
import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.util.Lookup;
import org.openide.windows.TopComponent;
import org.openide.util.NbBundle.Messages;
import org.openide.util.NbPreferences;
import org.openide.util.lookup.AbstractLookup;
import org.openide.util.lookup.InstanceContent;

@ConvertAsProperties(
        dtd = "-//com.alexprom.uppg_reports//sirieData//EN",
        autostore = false
)
@TopComponent.Description(
        preferredID = "sirieDataTopComponent",
        //iconBase="SET/PATH/TO/ICON/HERE", 
        persistenceType = TopComponent.PERSISTENCE_ALWAYS
)
@TopComponent.Registration(mode = "editor", openAtStartup = true)
@ActionID(category = "Window", id = "com.alexprom.uppg_reports.sirieDataTopComponent")
@ActionReference(path = "Menu/Window" /*, position = 333 */)
@TopComponent.OpenActionRegistration(
        displayName = "#CTL_sirieDataAction",
        preferredID = "sirieDataTopComponent"
)
@Messages({
    "CTL_sirieDataAction=Данные по переработке",
    "CTL_sirieDataTopComponent=Данные по переработке",
    "HINT_sirieDataTopComponent=Данные по переработке"
})
public final class sirieDataTopComponent extends TopComponent implements Lookup.Provider{
    //private Lookup.Result<ActUPPG> result;    
    private ActCounters actCounters;
    private ActDensity20 actDensity20;
    private UPPGFeedWater feedWater;
    private UPPGDrainTank drainTank;
    private final int complete=0;
    private final InstanceContent content;    
    private final Lookup lookup;    
    private List<ActCounters> actCnt;
    private List<ActDensity20> actDensity_20;
    private List<TankDic> listTank;
    private List<OTGToUPPG> listOtgToUppg;
    private List<OTGToTSP> listOtgToTsp;
    private List<UPPGFeedWater> listFeedWater;
    private List<UPPGDrainTank> listDrainTank;
    private TankDic tankDic;
    private OTGToUPPG otgToUppg;
    private OTGToTSP otgToTsp, otgToTsp1, otgToTsp2;
    private GradView gradView;
    private List<GradView> listGradView;
    private ActUPPG newAct, oldAct;
    
    private int old_OtgTspTank=0, new_OtgTspTank=0;
    private int old_OtgTspTank1=0, new_OtgTspTank1=0;
    private int old_OtgTspTank2=0, new_OtgTspTank2=0;
    private int old_OtgUppgTank=0, new_OtgUppgTank=0;
    private double new_OtgUppgLevelStart=0, new_OtgUppgVolumeStart=0, new_OtgUppgMassStart=0, new_OtgUppgTempStart=0, new_OtgUppgDensityStart=0, new_OtgUppgDensity20Start=0;
    private double old_OtgUppgLevelStart=0, old_OtgUppgVolumeStart=0, old_OtgUppgMassStart=0, old_OtgUppgTempStart=0, old_OtgUppgDensityStart=0, old_OtgUppgDensity20Start=0;
    private double new_OtgTspLevelStart=0, new_OtgTspVolumeStart=0, new_OtgTspMassStart=0, new_OtgTspTempStart=0, new_OtgTspDensityStart=0, new_OtgTspDensity20Start=0;
    private double old_OtgTspLevelStart=0, old_OtgTspVolumeStart=0, old_OtgTspMassStart=0, old_OtgTspTempStart=0, old_OtgTspDensityStart=0, old_OtgTspDensity20Start=0;
    private double new_OtgUppgLevelEnd=0, new_OtgUppgVolumeEnd=0, new_OtgUppgMassEnd=0, new_OtgUppgTempEnd=0, new_OtgUppgDensityEnd=0, new_OtgUppgDensity20End=0;
    private double old_OtgUppgLevelEnd=0, old_OtgUppgVolumeEnd=0, old_OtgUppgMassEnd=0, old_OtgUppgTempEnd=0, old_OtgUppgDensityEnd=0, old_OtgUppgDensity20End=0;
    private double new_OtgTspLevelEnd=0, new_OtgTspVolumeEnd=0, new_OtgTspMassEnd=0, new_OtgTspTempEnd=0, new_OtgTspDensityEnd=0, new_OtgTspDensity20End=0;
    private double old_OtgTspLevelEnd=0, old_OtgTspVolumeEnd=0, old_OtgTspMassEnd=0, old_OtgTspTempEnd=0, old_OtgTspDensityEnd=0, old_OtgTspDensity20End=0;
    private int old_DrainVolumeStart=0, new_DrainVolumeStart=0, old_DrainVolumeEnd=0, new_DrainVolumeEnd=0;
    private double old_DrainDensity=0, new_DrainDensity=0, old_LoadVolume=0, new_LoadVolume=0, old_LoadMass=0, new_LoadMass=0, old_LoadDensity=0, new_LoadDensity=0, old_LoadTemp=0, new_LoadTemp=0, old_LoadDensity20=0, new_LoadDensity20=0;
    private double old_DrainMass=0, new_DrainMass=0, old_drainedWater=0, new_drainedWater=0, old_drainedBLF=0, new_drainedBLF=0;
    private int old_FeedStart=0, new_FeedStart=0, old_FeedEnd=0, new_FeedEnd=0, old_Feed=0, new_Feed=0;      
    private double new_OtgTspLevelStart1=0, new_OtgTspVolumeStart1=0, new_OtgTspMassStart1=0, new_OtgTspTempStart1=0, new_OtgTspDensityStart1=0, new_OtgTspDensity20Start1=0;
    private double old_OtgTspLevelStart1=0, old_OtgTspVolumeStart1=0, old_OtgTspMassStart1=0, old_OtgTspTempStart1=0, old_OtgTspDensityStart1=0, old_OtgTspDensity20Start1=0;
    private double new_OtgTspLevelEnd1=0, new_OtgTspVolumeEnd1=0, new_OtgTspMassEnd1=0, new_OtgTspTempEnd1=0, new_OtgTspDensityEnd1=0, new_OtgTspDensity20End1=0;
    private double old_OtgTspLevelEnd1=0, old_OtgTspVolumeEnd1=0, old_OtgTspMassEnd1=0, old_OtgTspTempEnd1=0, old_OtgTspDensityEnd1=0, old_OtgTspDensity20End1=0;
    private double new_OtgTspLevelStart2=0, new_OtgTspVolumeStart2=0, new_OtgTspMassStart2=0, new_OtgTspTempStart2=0, new_OtgTspDensityStart2=0, new_OtgTspDensity20Start2=0;
    private double old_OtgTspLevelStart2=0, old_OtgTspVolumeStart2=0, old_OtgTspMassStart2=0, old_OtgTspTempStart2=0, old_OtgTspDensityStart2=0, old_OtgTspDensity20Start2=0;
    private double new_OtgTspLevelEnd2=0, new_OtgTspVolumeEnd2=0, new_OtgTspMassEnd2=0, new_OtgTspTempEnd2=0, new_OtgTspDensityEnd2=0, new_OtgTspDensity20End2=0;
    private double old_OtgTspLevelEnd2=0, old_OtgTspVolumeEnd2=0, old_OtgTspMassEnd2=0, old_OtgTspTempEnd2=0, old_OtgTspDensityEnd2=0, old_OtgTspDensity20End2=0;
    
    private EntityManagerFactory emf = null;
    private EntityManager em = null;
    private boolean sirieDataChanged, otgTspDataChanged, otgUppgDataChanged = false;
    private final OtgAccount otgResult = new OtgAccount();
    
    private boolean granted=false;
    private String ip, dbName, uName, uPassword;
    
    
    public sirieDataTopComponent(){
        initComponents();
        setName(Bundle.CTL_sirieDataTopComponent());
        setToolTipText(Bundle.HINT_sirieDataTopComponent());
        //this.setFont(Font.BOLD);
        putClientProperty(TopComponent.PROP_CLOSING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_DRAGGING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_MAXIMIZATION_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_SLIDING_DISABLED, Boolean.FALSE);
        putClientProperty(TopComponent.PROP_UNDOCKING_DISABLED, Boolean.TRUE);
        putClientProperty(TopComponent.PROP_KEEP_PREFERRED_SIZE_WHEN_SLIDED_IN, Boolean.TRUE);
        content = new InstanceContent();
        lookup = new AbstractLookup(content);
        associateLookup(lookup);
        otgTsp_Tank.removeAllItems();
        otgTsp_Tank1.removeAllItems();
        otgTsp_Tank2.removeAllItems();
        otgUppg_Tank.removeAllItems();
        updatePersistence();
        Preferences pref = NbPreferences.forModule(dbConnectionSettingsPanel.class);
        pref.addPreferenceChangeListener(new PreferenceChangeListener() {
        @Override
        public void preferenceChange(PreferenceChangeEvent evt) {                        
            updatePersistence();
        }
        });
        Preferences userData = NbPreferences.forModule(Installer.class);
        userData.addPreferenceChangeListener(new PreferenceChangeListener() {
            @Override
            public void preferenceChange(PreferenceChangeEvent evt) {
                getPermissive();
                if (newAct!=null){
                    fillActFields(newAct);
                }
            }
        });
        DocumentListener vol_listener = new DocumentListener(){
            @Override
            public void insertUpdate(DocumentEvent e) {
                otgLoad_VolumeChange(true);
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                otgLoad_VolumeChange(true);
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                otgLoad_VolumeChange(true);
            }
            
        };
        otgLoad_Volume.getDocument().addDocumentListener(vol_listener);
        DocumentListener den_listener = new DocumentListener(){
            @Override
            public void insertUpdate(DocumentEvent e) {
               otgLoad_DensityChange(true);
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                otgLoad_DensityChange(true);
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                otgLoad_DensityChange(true);
            }            
        };
        otgLoad_Density.getDocument().addDocumentListener(den_listener);
    }        
    
    public void updatePersistence(){                        
        GlobalEntityManager gem = new GlobalEntityManager();
        emf = gem.getEmf();
        em = gem.getEm();
        if (em!=null){
            otgTsp_Tank.removeAllItems();
            otgTsp_Tank1.removeAllItems();
            otgTsp_Tank2.removeAllItems();
            otgUppg_Tank.removeAllItems();
            Query query = em.createNamedQuery("TankDic.findAll");
            listTank = query.getResultList();
            for (TankDic t : listTank){
                otgTsp_Tank.addItem(t.getTankName());
                otgTsp_Tank1.addItem(t.getTankName());
                otgTsp_Tank2.addItem(t.getTankName());
                otgUppg_Tank.addItem(t.getTankName());
            }
        }
    }
    
    private int getPermissive(){
        int notPermit=1;
        String userName = NbPreferences.forModule(Installer.class).get("userName", "");
        String userPassword = NbPreferences.forModule(Installer.class).get("userPassword", "");
        if (userName.equals("operator") & userPassword.equals("operator")){
            notPermit = 0;
        }
        return notPermit;
    }
    
    public ActUPPG getAct(){
        return newAct;
    }
    
    public void setActParams(Date actDate, int actShift){
        oldAct = this.newAct;
        if (em!=null){            
            Query query = em.createNamedQuery("ActUPPG.findByDateShift");
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String aDate = df.format(actDate);
            query.setParameter("aDate", aDate);
            query.setParameter("aShift", actShift);
            List<ActUPPG> act = query.getResultList();            
            if (!act.isEmpty()){
                setAct(act.get(0));
                fillActFields(newAct);
            }else{
                setAct(null);
           }    
        }else{
            NotifyDescriptor d = new NotifyDescriptor.Message("Не установлена связь с базой данных. Выполните настройки соединения и повторите попытку.", NotifyDescriptor.ERROR_MESSAGE);
            Object result = DialogDisplayer.getDefault().notify(d);
        }
    }
    
    public void setAct(ActUPPG act){
        newAct = act;        
    }
    
    public void fillActFields(ActUPPG act){
        if (act!=null){
            if (newAct!=oldAct){                                        
                setDisplayName("Акт за "+newAct.getADate()+" за "+newAct.getAShift()+"-ю смену");
                if (getPermissive()==1){
                    fillCounters(newAct.getId(), 1);
                    fillOtgData(newAct.getId(), 1);
                    fillFeedData(newAct.getId(), 1);
                    fillDrainData(newAct.getId(), 1);
                }else{
                    fillCounters(newAct.getId(), newAct.getComplete());         
                    fillOtgData(newAct.getId(), newAct.getComplete());
                    fillFeedData(newAct.getId(), newAct.getComplete());
                    fillDrainData(newAct.getId(), newAct.getComplete());
                }
                setLookup();
            }else{
                NotifyDescriptor d = new NotifyDescriptor.Message
                                    ("Акт с выбранными парамерами уже открыт!!!", NotifyDescriptor.WARNING_MESSAGE);
                                    DialogDisplayer.getDefault().notify(d);
            }
        }else{
            NotifyDescriptor d = new NotifyDescriptor.Message
                                    ("Акт с выбранными парамерами не существует!!!", NotifyDescriptor.WARNING_MESSAGE);
                                    DialogDisplayer.getDefault().notify(d);            
        }        
    }
    
    public void setLookup(){
        if (newAct!=null){
            if (!newAct.equals(oldAct)){
                content.remove(newAct);                        
                content.set(Collections.singleton(newAct), null);
            }
        }                
    }
    
    public EntityManagerFactory getEntityManagerFactory(){
        return emf;
    }
    
    public EntityManager getEntityManager(){
        return em;
    }
    
    public void showNumberErroMessage(){
        NotifyDescriptor nd = new NotifyDescriptor.Message("Неверный формат введенных данных!!!", NotifyDescriptor.ERROR_MESSAGE);
        Object res = DialogDisplayer.getDefault().notify(nd);
    }
    
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel3 = new javax.swing.JPanel();
        label135 = new java.awt.Label();
        feedEnd_Volume = new javax.swing.JFormattedTextField();
        feedStart_Volume = new javax.swing.JFormattedTextField();
        label136 = new java.awt.Label();
        feed_Water = new javax.swing.JFormattedTextField();
        label137 = new java.awt.Label();
        jPanel4 = new javax.swing.JPanel();
        countersEnd1 = new javax.swing.JPanel();
        blfEnd_Volume = new javax.swing.JFormattedTextField();
        blfEnd_Mass = new javax.swing.JFormattedTextField();
        blfEnd_Temp = new javax.swing.JFormattedTextField();
        blfEnd_Density = new javax.swing.JFormattedTextField();
        blfEnd_Density20 = new javax.swing.JFormattedTextField();
        label79 = new java.awt.Label();
        label80 = new java.awt.Label();
        label81 = new java.awt.Label();
        label82 = new java.awt.Label();
        label83 = new java.awt.Label();
        countersStart1 = new javax.swing.JPanel();
        blfStart_Volume = new javax.swing.JFormattedTextField();
        blfStart_Mass = new javax.swing.JFormattedTextField();
        blfStart_Temp = new javax.swing.JFormattedTextField();
        blfStart_Density = new javax.swing.JFormattedTextField();
        blfStart_Density20 = new javax.swing.JFormattedTextField();
        label84 = new java.awt.Label();
        label85 = new java.awt.Label();
        label86 = new java.awt.Label();
        label87 = new java.awt.Label();
        label88 = new java.awt.Label();
        jPanel5 = new javax.swing.JPanel();
        countersEnd2 = new javax.swing.JPanel();
        akdgEnd_Volume = new javax.swing.JFormattedTextField();
        akdgEnd_Mass = new javax.swing.JFormattedTextField();
        akdgEnd_Temp = new javax.swing.JFormattedTextField();
        akdgEnd_Density = new javax.swing.JFormattedTextField();
        akdgEnd_Density20 = new javax.swing.JFormattedTextField();
        label89 = new java.awt.Label();
        label90 = new java.awt.Label();
        label91 = new java.awt.Label();
        label92 = new java.awt.Label();
        label93 = new java.awt.Label();
        countersStart2 = new javax.swing.JPanel();
        akdgStart_Volume = new javax.swing.JFormattedTextField();
        akdgStart_Mass = new javax.swing.JFormattedTextField();
        akdgStart_Temp = new javax.swing.JFormattedTextField();
        akdgStart_Density = new javax.swing.JFormattedTextField();
        akdgStart_Density20 = new javax.swing.JFormattedTextField();
        label94 = new java.awt.Label();
        label95 = new java.awt.Label();
        label96 = new java.awt.Label();
        label97 = new java.awt.Label();
        label98 = new java.awt.Label();
        jPanel2 = new javax.swing.JPanel();
        countersEnd = new javax.swing.JPanel();
        sirieEnd_Volume = new javax.swing.JFormattedTextField();
        sirieEnd_Mass = new javax.swing.JFormattedTextField();
        sirieEnd_Temp = new javax.swing.JFormattedTextField();
        sirieEnd_Density = new javax.swing.JFormattedTextField();
        sirieEnd_Density20 = new javax.swing.JFormattedTextField();
        label99 = new java.awt.Label();
        label100 = new java.awt.Label();
        label101 = new java.awt.Label();
        label102 = new java.awt.Label();
        label103 = new java.awt.Label();
        countersStart = new javax.swing.JPanel();
        sirieStart_Volume = new javax.swing.JFormattedTextField();
        sirieStart_Mass = new javax.swing.JFormattedTextField();
        sirieStart_Temp = new javax.swing.JFormattedTextField();
        sirieStart_Density = new javax.swing.JFormattedTextField();
        sirieStart_Density20 = new javax.swing.JFormattedTextField();
        label104 = new java.awt.Label();
        label105 = new java.awt.Label();
        label106 = new java.awt.Label();
        label107 = new java.awt.Label();
        label108 = new java.awt.Label();
        jPanel17 = new javax.swing.JPanel();
        label138 = new java.awt.Label();
        drainEnd_Volume = new javax.swing.JFormattedTextField();
        drainStart_Volume = new javax.swing.JFormattedTextField();
        label139 = new java.awt.Label();
        drain_Mass = new javax.swing.JFormattedTextField();
        label140 = new java.awt.Label();
        label141 = new java.awt.Label();
        drain_Density = new javax.swing.JFormattedTextField();
        jPanel1 = new javax.swing.JPanel();
        drained_Water = new javax.swing.JFormattedTextField();
        label142 = new java.awt.Label();
        label143 = new java.awt.Label();
        drained_BLF = new javax.swing.JFormattedTextField();
        jPanel7 = new javax.swing.JPanel();
        otgUppg_Tank = new javax.swing.JComboBox<>();
        label53 = new java.awt.Label();
        jPanel8 = new javax.swing.JPanel();
        label54 = new java.awt.Label();
        otgUppgStart_Level = new javax.swing.JFormattedTextField();
        label55 = new java.awt.Label();
        otgUppgStart_Volume = new javax.swing.JFormattedTextField();
        label56 = new java.awt.Label();
        otgUppgStart_Mass = new javax.swing.JFormattedTextField();
        label57 = new java.awt.Label();
        otgUppgStart_Temp = new javax.swing.JFormattedTextField();
        label58 = new java.awt.Label();
        otgUppgStart_Density = new javax.swing.JFormattedTextField();
        label59 = new java.awt.Label();
        otgUppgStart_Density20 = new javax.swing.JFormattedTextField();
        jPanel9 = new javax.swing.JPanel();
        label60 = new java.awt.Label();
        otgUppgEnd_Level = new javax.swing.JFormattedTextField();
        label61 = new java.awt.Label();
        otgUppgEnd_Volume = new javax.swing.JFormattedTextField();
        label62 = new java.awt.Label();
        otgUppgEnd_Mass = new javax.swing.JFormattedTextField();
        label63 = new java.awt.Label();
        otgUppgEnd_Temp = new javax.swing.JFormattedTextField();
        label64 = new java.awt.Label();
        otgUppgEnd_Density = new javax.swing.JFormattedTextField();
        label65 = new java.awt.Label();
        otgUppgEnd_Density20 = new javax.swing.JFormattedTextField();
        jPanel18 = new javax.swing.JPanel();
        label145 = new java.awt.Label();
        otgLoad_Volume = new javax.swing.JFormattedTextField();
        label146 = new java.awt.Label();
        otgLoad_Mass = new javax.swing.JFormattedTextField();
        label147 = new java.awt.Label();
        otgLoad_Temp = new javax.swing.JFormattedTextField();
        label148 = new java.awt.Label();
        otgLoad_Density = new javax.swing.JFormattedTextField();
        label149 = new java.awt.Label();
        otgLoad_Density20 = new javax.swing.JFormattedTextField();
        jPanel10 = new javax.swing.JPanel();
        otgTsp_Tank = new javax.swing.JComboBox<>();
        label66 = new java.awt.Label();
        jPanel11 = new javax.swing.JPanel();
        label67 = new java.awt.Label();
        otgTspStart_Level = new javax.swing.JFormattedTextField();
        label68 = new java.awt.Label();
        otgTspStart_Volume = new javax.swing.JFormattedTextField();
        label69 = new java.awt.Label();
        otgTspStart_Mass = new javax.swing.JFormattedTextField();
        label70 = new java.awt.Label();
        otgTspStart_Temp = new javax.swing.JFormattedTextField();
        label71 = new java.awt.Label();
        label72 = new java.awt.Label();
        otgTspStart_Density20 = new javax.swing.JFormattedTextField();
        otgTspStart_Density = new javax.swing.JFormattedTextField();
        jPanel12 = new javax.swing.JPanel();
        label73 = new java.awt.Label();
        otgTspEnd_Level = new javax.swing.JFormattedTextField();
        label74 = new java.awt.Label();
        otgTspEnd_Volume = new javax.swing.JFormattedTextField();
        label75 = new java.awt.Label();
        otgTspEnd_Mass = new javax.swing.JFormattedTextField();
        label76 = new java.awt.Label();
        otgTspEnd_Temp = new javax.swing.JFormattedTextField();
        label77 = new java.awt.Label();
        label78 = new java.awt.Label();
        otgTspEnd_Density20 = new javax.swing.JFormattedTextField();
        otgTspEnd_Density = new javax.swing.JFormattedTextField();
        label109 = new java.awt.Label();
        otgTsp_Tank1 = new javax.swing.JComboBox<>();
        jPanel13 = new javax.swing.JPanel();
        label110 = new java.awt.Label();
        otgTspEnd_Level1 = new javax.swing.JFormattedTextField();
        label111 = new java.awt.Label();
        otgTspEnd_Volume1 = new javax.swing.JFormattedTextField();
        label112 = new java.awt.Label();
        otgTspEnd_Mass1 = new javax.swing.JFormattedTextField();
        label113 = new java.awt.Label();
        otgTspEnd_Temp1 = new javax.swing.JFormattedTextField();
        label114 = new java.awt.Label();
        label115 = new java.awt.Label();
        otgTspEnd_Density21 = new javax.swing.JFormattedTextField();
        otgTspEnd_Density1 = new javax.swing.JFormattedTextField();
        jPanel14 = new javax.swing.JPanel();
        label116 = new java.awt.Label();
        otgTspStart_Level1 = new javax.swing.JFormattedTextField();
        label117 = new java.awt.Label();
        otgTspStart_Volume1 = new javax.swing.JFormattedTextField();
        label118 = new java.awt.Label();
        otgTspStart_Mass1 = new javax.swing.JFormattedTextField();
        label119 = new java.awt.Label();
        otgTspStart_Temp1 = new javax.swing.JFormattedTextField();
        label120 = new java.awt.Label();
        label121 = new java.awt.Label();
        otgTspStart_Density21 = new javax.swing.JFormattedTextField();
        otgTspStart_Density1 = new javax.swing.JFormattedTextField();
        label122 = new java.awt.Label();
        otgTsp_Tank2 = new javax.swing.JComboBox<>();
        jPanel15 = new javax.swing.JPanel();
        label123 = new java.awt.Label();
        otgTspEnd_Level2 = new javax.swing.JFormattedTextField();
        label124 = new java.awt.Label();
        otgTspEnd_Volume2 = new javax.swing.JFormattedTextField();
        label125 = new java.awt.Label();
        otgTspEnd_Mass2 = new javax.swing.JFormattedTextField();
        label126 = new java.awt.Label();
        otgTspEnd_Temp2 = new javax.swing.JFormattedTextField();
        label127 = new java.awt.Label();
        label128 = new java.awt.Label();
        otgTspEnd_Density22 = new javax.swing.JFormattedTextField();
        otgTspEnd_Density2 = new javax.swing.JFormattedTextField();
        jPanel16 = new javax.swing.JPanel();
        label129 = new java.awt.Label();
        otgTspStart_Level2 = new javax.swing.JFormattedTextField();
        label130 = new java.awt.Label();
        otgTspStart_Volume2 = new javax.swing.JFormattedTextField();
        label131 = new java.awt.Label();
        otgTspStart_Mass2 = new javax.swing.JFormattedTextField();
        label132 = new java.awt.Label();
        otgTspStart_Temp2 = new javax.swing.JFormattedTextField();
        label133 = new java.awt.Label();
        label134 = new java.awt.Label();
        otgTspStart_Density22 = new javax.swing.JFormattedTextField();
        otgTspStart_Density2 = new javax.swing.JFormattedTextField();

        setBorder(javax.swing.BorderFactory.createEtchedBorder());
        setAutoscrolls(true);
        setDoubleBuffered(true);
        setFocusable(true);
        setMaximumSize(new java.awt.Dimension(800, 600));
        setOpaque(true);

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel3.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel3.setAutoscrolls(true);
        jPanel3.setLayout(null);

        label135.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label135.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label135.text")); // NOI18N
        jPanel3.add(label135);
        label135.setBounds(20, 20, 97, 18);

        feedEnd_Volume.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("#0"))));
        feedEnd_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        feedEnd_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.feedEnd_Volume.text")); // NOI18N
        feedEnd_Volume.setEnabled(false);
        feedEnd_Volume.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                feedEnd_VolumePropertyChange(evt);
            }
        });
        jPanel3.add(feedEnd_Volume);
        feedEnd_Volume.setBounds(20, 40, 100, 20);

        feedStart_Volume.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("#0"))));
        feedStart_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        feedStart_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.feedStart_Volume.text")); // NOI18N
        feedStart_Volume.setEnabled(false);
        feedStart_Volume.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                feedStart_VolumeActionPerformed(evt);
            }
        });
        feedStart_Volume.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                feedStart_VolumePropertyChange(evt);
            }
        });
        jPanel3.add(feedStart_Volume);
        feedStart_Volume.setBounds(130, 40, 90, 20);

        label136.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label136.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label136.text")); // NOI18N
        jPanel3.add(label136);
        label136.setBounds(130, 20, 104, 18);

        feed_Water.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        feed_Water.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.feed_Water.text")); // NOI18N
        feed_Water.setEnabled(false);
        jPanel3.add(feed_Water);
        feed_Water.setBounds(230, 40, 70, 20);

        label137.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label137.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label137.text")); // NOI18N
        jPanel3.add(label137);
        label137.setBounds(230, 20, 72, 18);

        add(jPanel3);
        jPanel3.setBounds(0, 180, 310, 80);

        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel4.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel4.setLayout(null);

        countersEnd1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.countersEnd1.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        countersEnd1.setLayout(null);

        blfEnd_Volume.setEditable(false);
        blfEnd_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfEnd_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfEnd_Volume.text")); // NOI18N
        countersEnd1.add(blfEnd_Volume);
        blfEnd_Volume.setBounds(10, 40, 100, 20);

        blfEnd_Mass.setEditable(false);
        blfEnd_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfEnd_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfEnd_Mass.text")); // NOI18N
        countersEnd1.add(blfEnd_Mass);
        blfEnd_Mass.setBounds(120, 40, 90, 20);

        blfEnd_Temp.setEditable(false);
        blfEnd_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfEnd_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfEnd_Temp.text")); // NOI18N
        countersEnd1.add(blfEnd_Temp);
        blfEnd_Temp.setBounds(220, 40, 50, 20);

        blfEnd_Density.setEditable(false);
        blfEnd_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfEnd_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfEnd_Density.text")); // NOI18N
        countersEnd1.add(blfEnd_Density);
        blfEnd_Density.setBounds(280, 40, 60, 20);

        blfEnd_Density20.setEditable(false);
        blfEnd_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfEnd_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfEnd_Density20.text")); // NOI18N
        countersEnd1.add(blfEnd_Density20);
        blfEnd_Density20.setBounds(350, 40, 90, 20);

        label79.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label79.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label79.text")); // NOI18N
        countersEnd1.add(label79);
        label79.setBounds(10, 20, 40, 18);

        label80.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label80.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label80.text")); // NOI18N
        countersEnd1.add(label80);
        label80.setBounds(120, 20, 40, 18);

        label81.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label81.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label81.text")); // NOI18N
        countersEnd1.add(label81);
        label81.setBounds(220, 20, 40, 18);

        label82.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label82.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label82.text")); // NOI18N
        countersEnd1.add(label82);
        label82.setBounds(280, 20, 50, 18);

        label83.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label83.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label83.text")); // NOI18N
        countersEnd1.add(label83);
        label83.setBounds(350, 20, 80, 18);

        jPanel4.add(countersEnd1);
        countersEnd1.setBounds(10, 20, 450, 70);

        countersStart1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.countersStart1.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        countersStart1.setLayout(null);

        blfStart_Volume.setEditable(false);
        blfStart_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfStart_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfStart_Volume.text")); // NOI18N
        countersStart1.add(blfStart_Volume);
        blfStart_Volume.setBounds(10, 40, 100, 20);

        blfStart_Mass.setEditable(false);
        blfStart_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfStart_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfStart_Mass.text")); // NOI18N
        countersStart1.add(blfStart_Mass);
        blfStart_Mass.setBounds(120, 40, 90, 20);

        blfStart_Temp.setEditable(false);
        blfStart_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfStart_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfStart_Temp.text")); // NOI18N
        countersStart1.add(blfStart_Temp);
        blfStart_Temp.setBounds(220, 40, 50, 20);

        blfStart_Density.setEditable(false);
        blfStart_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfStart_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfStart_Density.text")); // NOI18N
        countersStart1.add(blfStart_Density);
        blfStart_Density.setBounds(280, 40, 60, 20);

        blfStart_Density20.setEditable(false);
        blfStart_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        blfStart_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.blfStart_Density20.text")); // NOI18N
        countersStart1.add(blfStart_Density20);
        blfStart_Density20.setBounds(350, 40, 90, 20);

        label84.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label84.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label84.text")); // NOI18N
        countersStart1.add(label84);
        label84.setBounds(10, 20, 40, 18);

        label85.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label85.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label85.text")); // NOI18N
        countersStart1.add(label85);
        label85.setBounds(120, 20, 40, 18);

        label86.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label86.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label86.text")); // NOI18N
        countersStart1.add(label86);
        label86.setBounds(220, 20, 40, 18);

        label87.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label87.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label87.text")); // NOI18N
        countersStart1.add(label87);
        label87.setBounds(280, 20, 50, 18);

        label88.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label88.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label93.text")); // NOI18N
        countersStart1.add(label88);
        label88.setBounds(350, 20, 80, 18);

        jPanel4.add(countersStart1);
        countersStart1.setBounds(10, 90, 450, 70);

        add(jPanel4);
        jPanel4.setBounds(0, 330, 470, 170);

        jPanel5.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel5.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel5.setLayout(null);

        countersEnd2.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.countersEnd2.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        countersEnd2.setLayout(null);

        akdgEnd_Volume.setEditable(false);
        akdgEnd_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgEnd_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgEnd_Volume.text")); // NOI18N
        countersEnd2.add(akdgEnd_Volume);
        akdgEnd_Volume.setBounds(10, 40, 100, 20);

        akdgEnd_Mass.setEditable(false);
        akdgEnd_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgEnd_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgEnd_Mass.text")); // NOI18N
        countersEnd2.add(akdgEnd_Mass);
        akdgEnd_Mass.setBounds(120, 40, 90, 20);

        akdgEnd_Temp.setEditable(false);
        akdgEnd_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgEnd_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgEnd_Temp.text")); // NOI18N
        countersEnd2.add(akdgEnd_Temp);
        akdgEnd_Temp.setBounds(220, 40, 50, 20);

        akdgEnd_Density.setEditable(false);
        akdgEnd_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgEnd_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgEnd_Density.text")); // NOI18N
        countersEnd2.add(akdgEnd_Density);
        akdgEnd_Density.setBounds(280, 40, 60, 20);

        akdgEnd_Density20.setEditable(false);
        akdgEnd_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgEnd_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgEnd_Density20.text")); // NOI18N
        countersEnd2.add(akdgEnd_Density20);
        akdgEnd_Density20.setBounds(350, 40, 90, 20);

        label89.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label89.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label89.text")); // NOI18N
        countersEnd2.add(label89);
        label89.setBounds(10, 20, 40, 18);

        label90.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label90.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label90.text")); // NOI18N
        countersEnd2.add(label90);
        label90.setBounds(120, 20, 40, 18);

        label91.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label91.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label91.text")); // NOI18N
        countersEnd2.add(label91);
        label91.setBounds(220, 20, 40, 18);

        label92.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label92.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label92.text")); // NOI18N
        countersEnd2.add(label92);
        label92.setBounds(280, 20, 50, 18);

        label93.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label93.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label93.text")); // NOI18N
        countersEnd2.add(label93);
        label93.setBounds(350, 20, 80, 18);

        jPanel5.add(countersEnd2);
        countersEnd2.setBounds(10, 20, 450, 70);

        countersStart2.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.countersStart2.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        countersStart2.setLayout(null);

        akdgStart_Volume.setEditable(false);
        akdgStart_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgStart_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgStart_Volume.text")); // NOI18N
        countersStart2.add(akdgStart_Volume);
        akdgStart_Volume.setBounds(10, 40, 100, 20);

        akdgStart_Mass.setEditable(false);
        akdgStart_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgStart_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgStart_Mass.text")); // NOI18N
        countersStart2.add(akdgStart_Mass);
        akdgStart_Mass.setBounds(120, 40, 90, 20);

        akdgStart_Temp.setEditable(false);
        akdgStart_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgStart_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgStart_Temp.text")); // NOI18N
        countersStart2.add(akdgStart_Temp);
        akdgStart_Temp.setBounds(220, 40, 50, 20);

        akdgStart_Density.setEditable(false);
        akdgStart_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgStart_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgStart_Density.text")); // NOI18N
        countersStart2.add(akdgStart_Density);
        akdgStart_Density.setBounds(280, 40, 60, 20);

        akdgStart_Density20.setEditable(false);
        akdgStart_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        akdgStart_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.akdgStart_Density20.text")); // NOI18N
        countersStart2.add(akdgStart_Density20);
        akdgStart_Density20.setBounds(350, 40, 90, 20);

        label94.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label94.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label94.text")); // NOI18N
        countersStart2.add(label94);
        label94.setBounds(10, 20, 40, 18);

        label95.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label95.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label95.text")); // NOI18N
        countersStart2.add(label95);
        label95.setBounds(120, 20, 40, 18);

        label96.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label96.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label96.text")); // NOI18N
        countersStart2.add(label96);
        label96.setBounds(220, 20, 40, 18);

        label97.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label97.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label97.text")); // NOI18N
        countersStart2.add(label97);
        label97.setBounds(280, 20, 50, 18);

        label98.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label98.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label93.text")); // NOI18N
        countersStart2.add(label98);
        label98.setBounds(350, 20, 80, 18);

        jPanel5.add(countersStart2);
        countersStart2.setBounds(10, 90, 450, 70);

        add(jPanel5);
        jPanel5.setBounds(0, 510, 470, 180);

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel2.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N

        countersEnd.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.countersEnd.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        countersEnd.setLayout(null);

        sirieEnd_Volume.setEditable(false);
        sirieEnd_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieEnd_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieEnd_Volume.text")); // NOI18N
        countersEnd.add(sirieEnd_Volume);
        sirieEnd_Volume.setBounds(10, 40, 90, 20);

        sirieEnd_Mass.setEditable(false);
        sirieEnd_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieEnd_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieEnd_Mass.text")); // NOI18N
        countersEnd.add(sirieEnd_Mass);
        sirieEnd_Mass.setBounds(110, 40, 90, 20);

        sirieEnd_Temp.setEditable(false);
        sirieEnd_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieEnd_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieEnd_Temp.text")); // NOI18N
        countersEnd.add(sirieEnd_Temp);
        sirieEnd_Temp.setBounds(210, 40, 50, 20);

        sirieEnd_Density.setEditable(false);
        sirieEnd_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieEnd_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieEnd_Density.text")); // NOI18N
        countersEnd.add(sirieEnd_Density);
        sirieEnd_Density.setBounds(270, 40, 60, 20);

        sirieEnd_Density20.setEditable(false);
        sirieEnd_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieEnd_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieEnd_Density20.text")); // NOI18N
        countersEnd.add(sirieEnd_Density20);
        sirieEnd_Density20.setBounds(340, 40, 90, 20);

        label99.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label99.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label99.text")); // NOI18N
        countersEnd.add(label99);
        label99.setBounds(10, 20, 40, 18);

        label100.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label100.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label100.text")); // NOI18N
        countersEnd.add(label100);
        label100.setBounds(110, 20, 40, 18);

        label101.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label101.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label101.text")); // NOI18N
        countersEnd.add(label101);
        label101.setBounds(210, 20, 40, 18);

        label102.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label102.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label102.text")); // NOI18N
        countersEnd.add(label102);
        label102.setBounds(270, 20, 50, 18);

        label103.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label103.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label103.text")); // NOI18N
        countersEnd.add(label103);
        label103.setBounds(340, 20, 80, 18);

        countersStart.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.countersStart.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        countersStart.setLayout(null);

        sirieStart_Volume.setEditable(false);
        sirieStart_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieStart_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieStart_Volume.text")); // NOI18N
        countersStart.add(sirieStart_Volume);
        sirieStart_Volume.setBounds(10, 40, 90, 20);

        sirieStart_Mass.setEditable(false);
        sirieStart_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieStart_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieStart_Mass.text")); // NOI18N
        countersStart.add(sirieStart_Mass);
        sirieStart_Mass.setBounds(110, 40, 90, 20);

        sirieStart_Temp.setEditable(false);
        sirieStart_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieStart_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieStart_Temp.text")); // NOI18N
        countersStart.add(sirieStart_Temp);
        sirieStart_Temp.setBounds(210, 40, 50, 20);

        sirieStart_Density.setEditable(false);
        sirieStart_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieStart_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieStart_Density.text")); // NOI18N
        countersStart.add(sirieStart_Density);
        sirieStart_Density.setBounds(270, 40, 60, 20);

        sirieStart_Density20.setEditable(false);
        sirieStart_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sirieStart_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.sirieStart_Density20.text")); // NOI18N
        countersStart.add(sirieStart_Density20);
        sirieStart_Density20.setBounds(340, 40, 90, 20);

        label104.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label104.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label104.text")); // NOI18N
        countersStart.add(label104);
        label104.setBounds(10, 20, 40, 18);

        label105.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label105.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label105.text")); // NOI18N
        countersStart.add(label105);
        label105.setBounds(110, 20, 40, 18);

        label106.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label106.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label106.text")); // NOI18N
        countersStart.add(label106);
        label106.setBounds(210, 20, 40, 18);

        label107.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label107.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label107.text")); // NOI18N
        countersStart.add(label107);
        label107.setBounds(270, 20, 50, 18);

        label108.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label108.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label108.text")); // NOI18N
        countersStart.add(label108);
        label108.setBounds(340, 20, 80, 18);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(10, 10, 10)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(countersStart, javax.swing.GroupLayout.DEFAULT_SIZE, 445, Short.MAX_VALUE)
                    .addComponent(countersEnd, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(73, 73, 73))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addComponent(countersEnd, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(6, 6, 6)
                .addComponent(countersStart, javax.swing.GroupLayout.PREFERRED_SIZE, 70, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        add(jPanel2);
        jPanel2.setBounds(0, 0, 470, 170);

        jPanel17.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel17.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel17.setAutoscrolls(true);
        jPanel17.setLayout(null);

        label138.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label138.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label138.text")); // NOI18N
        jPanel17.add(label138);
        label138.setBounds(20, 20, 97, 18);

        drainEnd_Volume.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("#0"))));
        drainEnd_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        drainEnd_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.drainEnd_Volume.text")); // NOI18N
        drainEnd_Volume.setEnabled(false);
        drainEnd_Volume.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                drainEnd_VolumeFocusLost(evt);
            }
        });
        drainEnd_Volume.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                drainEnd_VolumeKeyPressed(evt);
            }
        });
        jPanel17.add(drainEnd_Volume);
        drainEnd_Volume.setBounds(20, 40, 100, 20);

        drainStart_Volume.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("#0"))));
        drainStart_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        drainStart_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.drainStart_Volume.text")); // NOI18N
        drainStart_Volume.setEnabled(false);
        drainStart_Volume.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                drainStart_VolumeFocusLost(evt);
            }
        });
        drainStart_Volume.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                drainStart_VolumeKeyPressed(evt);
            }
        });
        jPanel17.add(drainStart_Volume);
        drainStart_Volume.setBounds(130, 40, 90, 20);

        label139.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label139.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label139.text")); // NOI18N
        jPanel17.add(label139);
        label139.setBounds(130, 20, 104, 18);

        drain_Mass.setEditable(false);
        drain_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        drain_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.drain_Mass.text")); // NOI18N
        jPanel17.add(drain_Mass);
        drain_Mass.setBounds(310, 40, 150, 20);

        label140.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label140.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label140.text")); // NOI18N
        jPanel17.add(label140);
        label140.setBounds(310, 20, 80, 18);

        label141.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label141.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label141.text")); // NOI18N
        jPanel17.add(label141);
        label141.setBounds(230, 20, 50, 18);

        drain_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        drain_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.drain_Density.text")); // NOI18N
        drain_Density.setEnabled(false);
        drain_Density.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                drain_DensityFocusLost(evt);
            }
        });
        drain_Density.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                drain_DensityKeyPressed(evt);
            }
        });
        jPanel17.add(drain_Density);
        drain_Density.setBounds(230, 40, 70, 20);

        add(jPanel17);
        jPanel17.setBounds(0, 260, 470, 70);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel1.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N

        drained_Water.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("#0"))));
        drained_Water.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        drained_Water.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.drained_Water.text")); // NOI18N
        drained_Water.setEnabled(false);
        drained_Water.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                drained_WaterFocusLost(evt);
            }
        });
        drained_Water.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                drained_WaterKeyPressed(evt);
            }
        });

        label142.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label142.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label142.text")); // NOI18N

        label143.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label143.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label143.text")); // NOI18N

        drained_BLF.setFormatterFactory(new javax.swing.text.DefaultFormatterFactory(new javax.swing.text.NumberFormatter(new java.text.DecimalFormat("#0"))));
        drained_BLF.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        drained_BLF.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.drained_BLF.text")); // NOI18N
        drained_BLF.setEnabled(false);
        drained_BLF.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                drained_BLFFocusLost(evt);
            }
        });
        drained_BLF.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                drained_BLFKeyPressed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(4, 4, 4)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(drained_Water)
                    .addComponent(label142, javax.swing.GroupLayout.DEFAULT_SIZE, 61, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(drained_BLF, javax.swing.GroupLayout.PREFERRED_SIZE, 61, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(label143, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(4, 4, 4)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(label143, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(2, 2, 2)
                        .addComponent(drained_BLF, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(label142, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(2, 2, 2)
                        .addComponent(drained_Water, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );

        add(jPanel1);
        jPanel1.setBounds(310, 180, 160, 80);

        jPanel7.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel7.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel7.setLayout(null);

        otgUppg_Tank.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        otgUppg_Tank.setEnabled(false);
        otgUppg_Tank.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                otgUppg_TankActionPerformed(evt);
            }
        });
        jPanel7.add(otgUppg_Tank);
        otgUppg_Tank.setBounds(10, 40, 80, 20);

        label53.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label53.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label53.text")); // NOI18N
        jPanel7.add(label53);
        label53.setBounds(10, 20, 70, 18);

        jPanel8.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel8.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel8.setLayout(null);

        label54.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label54.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label54.text")); // NOI18N
        jPanel8.add(label54);
        label54.setBounds(10, 20, 35, 18);

        otgUppgStart_Level.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgStart_Level.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgStart_Level.text")); // NOI18N
        otgUppgStart_Level.setEnabled(false);
        otgUppgStart_Level.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgUppgStart_LevelFocusLost(evt);
            }
        });
        otgUppgStart_Level.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgUppgStart_LevelKeyPressed(evt);
            }
        });
        jPanel8.add(otgUppgStart_Level);
        otgUppgStart_Level.setBounds(10, 40, 90, 20);

        label55.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label55.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label55.text")); // NOI18N
        jPanel8.add(label55);
        label55.setBounds(110, 20, 30, 18);

        otgUppgStart_Volume.setEditable(false);
        otgUppgStart_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgStart_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgStart_Volume.text")); // NOI18N
        jPanel8.add(otgUppgStart_Volume);
        otgUppgStart_Volume.setBounds(110, 40, 90, 20);

        label56.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label56.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label56.text")); // NOI18N
        jPanel8.add(label56);
        label56.setBounds(210, 20, 37, 18);

        otgUppgStart_Mass.setEditable(false);
        otgUppgStart_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgStart_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgStart_Mass.text")); // NOI18N
        jPanel8.add(otgUppgStart_Mass);
        otgUppgStart_Mass.setBounds(210, 40, 90, 20);

        label57.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label57.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label57.text")); // NOI18N
        jPanel8.add(label57);
        label57.setBounds(310, 20, 30, 18);

        otgUppgStart_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgStart_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgStart_Temp.text")); // NOI18N
        otgUppgStart_Temp.setEnabled(false);
        otgUppgStart_Temp.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgUppgStart_TempPropertyChange(evt);
            }
        });
        jPanel8.add(otgUppgStart_Temp);
        otgUppgStart_Temp.setBounds(310, 40, 50, 20);

        label58.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label58.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label58.text")); // NOI18N
        jPanel8.add(label58);
        label58.setBounds(370, 20, 40, 18);

        otgUppgStart_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgStart_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgStart_Density.text")); // NOI18N
        otgUppgStart_Density.setEnabled(false);
        otgUppgStart_Density.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgUppgStart_DensityFocusLost(evt);
            }
        });
        otgUppgStart_Density.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgUppgStart_DensityKeyPressed(evt);
            }
        });
        jPanel8.add(otgUppgStart_Density);
        otgUppgStart_Density.setBounds(370, 40, 60, 20);

        label59.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label59.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label72.text")); // NOI18N
        jPanel8.add(label59);
        label59.setBounds(440, 20, 80, 18);

        otgUppgStart_Density20.setEditable(false);
        otgUppgStart_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgStart_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgStart_Density20.text")); // NOI18N
        jPanel8.add(otgUppgStart_Density20);
        otgUppgStart_Density20.setBounds(440, 40, 90, 20);

        jPanel7.add(jPanel8);
        jPanel8.setBounds(100, 90, 540, 70);

        jPanel9.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel9.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel9.setLayout(null);

        label60.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label60.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label60.text")); // NOI18N
        jPanel9.add(label60);
        label60.setBounds(10, 20, 40, 18);

        otgUppgEnd_Level.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgEnd_Level.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgEnd_Level.text")); // NOI18N
        otgUppgEnd_Level.setEnabled(false);
        otgUppgEnd_Level.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgUppgEnd_LevelFocusLost(evt);
            }
        });
        otgUppgEnd_Level.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgUppgEnd_LevelKeyPressed(evt);
            }
        });
        jPanel9.add(otgUppgEnd_Level);
        otgUppgEnd_Level.setBounds(10, 40, 90, 20);

        label61.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label61.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label61.text")); // NOI18N
        jPanel9.add(label61);
        label61.setBounds(110, 20, 30, 18);

        otgUppgEnd_Volume.setEditable(false);
        otgUppgEnd_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgEnd_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgEnd_Volume.text")); // NOI18N
        jPanel9.add(otgUppgEnd_Volume);
        otgUppgEnd_Volume.setBounds(110, 40, 90, 20);

        label62.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label62.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label62.text")); // NOI18N
        jPanel9.add(label62);
        label62.setBounds(210, 20, 40, 18);

        otgUppgEnd_Mass.setEditable(false);
        otgUppgEnd_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgEnd_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgEnd_Mass.text")); // NOI18N
        jPanel9.add(otgUppgEnd_Mass);
        otgUppgEnd_Mass.setBounds(210, 40, 90, 20);

        label63.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label63.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label63.text")); // NOI18N
        jPanel9.add(label63);
        label63.setBounds(310, 20, 30, 18);

        otgUppgEnd_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgEnd_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgEnd_Temp.text")); // NOI18N
        otgUppgEnd_Temp.setEnabled(false);
        otgUppgEnd_Temp.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgUppgEnd_TempPropertyChange(evt);
            }
        });
        jPanel9.add(otgUppgEnd_Temp);
        otgUppgEnd_Temp.setBounds(310, 40, 50, 20);

        label64.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label64.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label64.text")); // NOI18N
        jPanel9.add(label64);
        label64.setBounds(370, 20, 40, 18);

        otgUppgEnd_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgEnd_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgEnd_Density.text")); // NOI18N
        otgUppgEnd_Density.setEnabled(false);
        otgUppgEnd_Density.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgUppgEnd_DensityFocusLost(evt);
            }
        });
        otgUppgEnd_Density.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgUppgEnd_DensityKeyPressed(evt);
            }
        });
        jPanel9.add(otgUppgEnd_Density);
        otgUppgEnd_Density.setBounds(370, 40, 60, 20);

        label65.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label65.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label72.text")); // NOI18N
        jPanel9.add(label65);
        label65.setBounds(440, 20, 80, 18);

        otgUppgEnd_Density20.setEditable(false);
        otgUppgEnd_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgUppgEnd_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgUppgEnd_Density20.text")); // NOI18N
        jPanel9.add(otgUppgEnd_Density20);
        otgUppgEnd_Density20.setBounds(440, 40, 90, 20);

        jPanel7.add(jPanel9);
        jPanel9.setBounds(100, 20, 540, 70);

        jPanel18.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel18.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel18.setLayout(null);

        label145.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label145.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label145.text")); // NOI18N
        jPanel18.add(label145);
        label145.setBounds(110, 20, 30, 18);

        otgLoad_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgLoad_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgLoad_Volume.text")); // NOI18N
        otgLoad_Volume.setEnabled(false);
        otgLoad_Volume.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgLoad_VolumeFocusLost(evt);
            }
        });
        otgLoad_Volume.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgLoad_VolumePropertyChange(evt);
            }
        });
        otgLoad_Volume.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgLoad_VolumeKeyPressed(evt);
            }
        });
        jPanel18.add(otgLoad_Volume);
        otgLoad_Volume.setBounds(110, 40, 90, 20);

        label146.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label146.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label146.text")); // NOI18N
        jPanel18.add(label146);
        label146.setBounds(210, 20, 37, 18);

        otgLoad_Mass.setEditable(false);
        otgLoad_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgLoad_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgLoad_Mass.text")); // NOI18N
        jPanel18.add(otgLoad_Mass);
        otgLoad_Mass.setBounds(210, 40, 90, 20);

        label147.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label147.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label147.text")); // NOI18N
        jPanel18.add(label147);
        label147.setBounds(310, 20, 30, 18);

        otgLoad_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgLoad_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgLoad_Temp.text")); // NOI18N
        otgLoad_Temp.setEnabled(false);
        otgLoad_Temp.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgLoad_TempFocusLost(evt);
            }
        });
        otgLoad_Temp.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgLoad_TempKeyPressed(evt);
            }
        });
        jPanel18.add(otgLoad_Temp);
        otgLoad_Temp.setBounds(310, 40, 50, 20);

        label148.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label148.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label148.text")); // NOI18N
        jPanel18.add(label148);
        label148.setBounds(370, 20, 40, 18);

        otgLoad_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgLoad_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgLoad_Density.text")); // NOI18N
        otgLoad_Density.setEnabled(false);
        otgLoad_Density.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgLoad_DensityFocusLost(evt);
            }
        });
        otgLoad_Density.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgLoad_DensityKeyPressed(evt);
            }
        });
        jPanel18.add(otgLoad_Density);
        otgLoad_Density.setBounds(370, 40, 60, 20);

        label149.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label149.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label149.text")); // NOI18N
        jPanel18.add(label149);
        label149.setBounds(440, 20, 80, 18);

        otgLoad_Density20.setEditable(false);
        otgLoad_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgLoad_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgLoad_Density20.text")); // NOI18N
        jPanel18.add(otgLoad_Density20);
        otgLoad_Density20.setBounds(440, 40, 90, 20);

        jPanel7.add(jPanel18);
        jPanel18.setBounds(100, 160, 540, 70);

        add(jPanel7);
        jPanel7.setBounds(470, 450, 650, 240);

        jPanel10.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel10.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel10.setLayout(null);

        otgTsp_Tank.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        otgTsp_Tank.setEnabled(false);
        otgTsp_Tank.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                otgTsp_TankActionPerformed(evt);
            }
        });
        jPanel10.add(otgTsp_Tank);
        otgTsp_Tank.setBounds(10, 40, 80, 20);

        label66.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label66.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label66.text")); // NOI18N
        jPanel10.add(label66);
        label66.setBounds(10, 20, 70, 18);

        jPanel11.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel11.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel11.setLayout(null);

        label67.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label67.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label67.text")); // NOI18N
        jPanel11.add(label67);
        label67.setBounds(10, 20, 30, 18);

        otgTspStart_Level.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Level.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Level.text")); // NOI18N
        otgTspStart_Level.setEnabled(false);
        otgTspStart_Level.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspStart_LevelFocusLost(evt);
            }
        });
        otgTspStart_Level.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspStart_LevelKeyPressed(evt);
            }
        });
        jPanel11.add(otgTspStart_Level);
        otgTspStart_Level.setBounds(10, 40, 90, 20);

        label68.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label68.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label68.text")); // NOI18N
        jPanel11.add(label68);
        label68.setBounds(110, 20, 30, 18);

        otgTspStart_Volume.setEditable(false);
        otgTspStart_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Volume.text")); // NOI18N
        jPanel11.add(otgTspStart_Volume);
        otgTspStart_Volume.setBounds(110, 40, 90, 20);

        label69.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label69.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label69.text")); // NOI18N
        jPanel11.add(label69);
        label69.setBounds(210, 20, 40, 18);

        otgTspStart_Mass.setEditable(false);
        otgTspStart_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Mass.text")); // NOI18N
        jPanel11.add(otgTspStart_Mass);
        otgTspStart_Mass.setBounds(210, 40, 90, 20);

        label70.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label70.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label70.text")); // NOI18N
        jPanel11.add(label70);
        label70.setBounds(310, 20, 30, 18);

        otgTspStart_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Temp.text")); // NOI18N
        otgTspStart_Temp.setEnabled(false);
        otgTspStart_Temp.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgTspStart_TempPropertyChange(evt);
            }
        });
        jPanel11.add(otgTspStart_Temp);
        otgTspStart_Temp.setBounds(310, 40, 50, 20);

        label71.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label71.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label71.text")); // NOI18N
        jPanel11.add(label71);
        label71.setBounds(370, 20, 50, 18);

        label72.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label72.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label72.text")); // NOI18N
        jPanel11.add(label72);
        label72.setBounds(440, 20, 85, 18);

        otgTspStart_Density20.setEditable(false);
        otgTspStart_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Density20.text")); // NOI18N
        jPanel11.add(otgTspStart_Density20);
        otgTspStart_Density20.setBounds(440, 40, 90, 20);

        otgTspStart_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Density.text")); // NOI18N
        otgTspStart_Density.setEnabled(false);
        otgTspStart_Density.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspStart_DensityFocusLost(evt);
            }
        });
        otgTspStart_Density.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspStart_DensityKeyPressed(evt);
            }
        });
        jPanel11.add(otgTspStart_Density);
        otgTspStart_Density.setBounds(370, 40, 60, 20);

        jPanel10.add(jPanel11);
        jPanel11.setBounds(100, 90, 540, 70);

        jPanel12.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel12.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel12.setLayout(null);

        label73.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label73.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label73.text")); // NOI18N
        jPanel12.add(label73);
        label73.setBounds(10, 20, 40, 18);

        otgTspEnd_Level.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Level.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Level.text")); // NOI18N
        otgTspEnd_Level.setEnabled(false);
        otgTspEnd_Level.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspEnd_LevelFocusLost(evt);
            }
        });
        otgTspEnd_Level.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspEnd_LevelKeyPressed(evt);
            }
        });
        jPanel12.add(otgTspEnd_Level);
        otgTspEnd_Level.setBounds(10, 40, 90, 20);

        label74.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label74.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label74.text")); // NOI18N
        jPanel12.add(label74);
        label74.setBounds(110, 20, 40, 18);

        otgTspEnd_Volume.setEditable(false);
        otgTspEnd_Volume.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Volume.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Volume.text")); // NOI18N
        jPanel12.add(otgTspEnd_Volume);
        otgTspEnd_Volume.setBounds(110, 40, 90, 20);

        label75.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label75.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label75.text")); // NOI18N
        jPanel12.add(label75);
        label75.setBounds(210, 20, 40, 18);

        otgTspEnd_Mass.setEditable(false);
        otgTspEnd_Mass.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Mass.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Mass.text")); // NOI18N
        jPanel12.add(otgTspEnd_Mass);
        otgTspEnd_Mass.setBounds(210, 40, 90, 20);

        label76.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label76.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label76.text")); // NOI18N
        jPanel12.add(label76);
        label76.setBounds(310, 20, 40, 18);

        otgTspEnd_Temp.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Temp.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Temp.text")); // NOI18N
        otgTspEnd_Temp.setEnabled(false);
        otgTspEnd_Temp.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgTspEnd_TempPropertyChange(evt);
            }
        });
        jPanel12.add(otgTspEnd_Temp);
        otgTspEnd_Temp.setBounds(310, 40, 50, 20);

        label77.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label77.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label77.text")); // NOI18N
        jPanel12.add(label77);
        label77.setBounds(370, 20, 50, 18);

        label78.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label78.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label72.text")); // NOI18N
        jPanel12.add(label78);
        label78.setBounds(440, 20, 80, 18);

        otgTspEnd_Density20.setEditable(false);
        otgTspEnd_Density20.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Density20.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Density20.text")); // NOI18N
        jPanel12.add(otgTspEnd_Density20);
        otgTspEnd_Density20.setBounds(440, 40, 90, 20);

        otgTspEnd_Density.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Density.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Density.text")); // NOI18N
        otgTspEnd_Density.setEnabled(false);
        otgTspEnd_Density.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspEnd_DensityFocusLost(evt);
            }
        });
        otgTspEnd_Density.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspEnd_DensityKeyPressed(evt);
            }
        });
        jPanel12.add(otgTspEnd_Density);
        otgTspEnd_Density.setBounds(370, 40, 60, 20);

        jPanel10.add(jPanel12);
        jPanel12.setBounds(100, 20, 540, 70);

        label109.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label109.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label109.text")); // NOI18N
        jPanel10.add(label109);
        label109.setBounds(10, 160, 69, 18);

        otgTsp_Tank1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        otgTsp_Tank1.setEnabled(false);
        otgTsp_Tank1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                otgTsp_Tank1ActionPerformed(evt);
            }
        });
        jPanel10.add(otgTsp_Tank1);
        otgTsp_Tank1.setBounds(10, 180, 80, 20);

        jPanel13.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel13.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel13.setLayout(null);

        label110.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label110.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label110.text")); // NOI18N
        jPanel13.add(label110);
        label110.setBounds(10, 20, 40, 18);

        otgTspEnd_Level1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Level1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Level1.text")); // NOI18N
        otgTspEnd_Level1.setEnabled(false);
        otgTspEnd_Level1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspEnd_Level1FocusLost(evt);
            }
        });
        otgTspEnd_Level1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspEnd_Level1KeyPressed(evt);
            }
        });
        jPanel13.add(otgTspEnd_Level1);
        otgTspEnd_Level1.setBounds(10, 40, 90, 20);

        label111.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label111.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label111.text")); // NOI18N
        jPanel13.add(label111);
        label111.setBounds(110, 20, 40, 18);

        otgTspEnd_Volume1.setEditable(false);
        otgTspEnd_Volume1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Volume1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Volume1.text")); // NOI18N
        jPanel13.add(otgTspEnd_Volume1);
        otgTspEnd_Volume1.setBounds(110, 40, 90, 20);

        label112.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label112.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label112.text")); // NOI18N
        jPanel13.add(label112);
        label112.setBounds(210, 20, 40, 18);

        otgTspEnd_Mass1.setEditable(false);
        otgTspEnd_Mass1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Mass1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Mass1.text")); // NOI18N
        jPanel13.add(otgTspEnd_Mass1);
        otgTspEnd_Mass1.setBounds(210, 40, 90, 20);

        label113.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label113.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label113.text")); // NOI18N
        jPanel13.add(label113);
        label113.setBounds(310, 20, 40, 18);

        otgTspEnd_Temp1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Temp1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Temp1.text")); // NOI18N
        otgTspEnd_Temp1.setEnabled(false);
        otgTspEnd_Temp1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgTspEnd_Temp1PropertyChange(evt);
            }
        });
        jPanel13.add(otgTspEnd_Temp1);
        otgTspEnd_Temp1.setBounds(310, 40, 50, 20);

        label114.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label114.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label114.text")); // NOI18N
        jPanel13.add(label114);
        label114.setBounds(370, 20, 50, 18);

        label115.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label115.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label72.text")); // NOI18N
        jPanel13.add(label115);
        label115.setBounds(440, 20, 80, 18);

        otgTspEnd_Density21.setEditable(false);
        otgTspEnd_Density21.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Density21.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Density21.text")); // NOI18N
        jPanel13.add(otgTspEnd_Density21);
        otgTspEnd_Density21.setBounds(440, 40, 90, 20);

        otgTspEnd_Density1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Density1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Density1.text")); // NOI18N
        otgTspEnd_Density1.setEnabled(false);
        otgTspEnd_Density1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspEnd_Density1FocusLost(evt);
            }
        });
        otgTspEnd_Density1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspEnd_Density1KeyPressed(evt);
            }
        });
        jPanel13.add(otgTspEnd_Density1);
        otgTspEnd_Density1.setBounds(370, 40, 60, 20);

        jPanel10.add(jPanel13);
        jPanel13.setBounds(100, 160, 540, 70);

        jPanel14.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel14.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel14.setLayout(null);

        label116.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label116.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label116.text")); // NOI18N
        jPanel14.add(label116);
        label116.setBounds(10, 20, 30, 18);

        otgTspStart_Level1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Level1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Level1.text")); // NOI18N
        otgTspStart_Level1.setEnabled(false);
        otgTspStart_Level1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspStart_Level1FocusLost(evt);
            }
        });
        otgTspStart_Level1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspStart_Level1KeyPressed(evt);
            }
        });
        jPanel14.add(otgTspStart_Level1);
        otgTspStart_Level1.setBounds(10, 40, 90, 20);

        label117.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label117.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label117.text")); // NOI18N
        jPanel14.add(label117);
        label117.setBounds(110, 20, 30, 18);

        otgTspStart_Volume1.setEditable(false);
        otgTspStart_Volume1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Volume1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Volume1.text")); // NOI18N
        jPanel14.add(otgTspStart_Volume1);
        otgTspStart_Volume1.setBounds(110, 40, 90, 20);

        label118.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label118.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label118.text")); // NOI18N
        jPanel14.add(label118);
        label118.setBounds(210, 20, 40, 18);

        otgTspStart_Mass1.setEditable(false);
        otgTspStart_Mass1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Mass1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Mass1.text")); // NOI18N
        jPanel14.add(otgTspStart_Mass1);
        otgTspStart_Mass1.setBounds(210, 40, 90, 20);

        label119.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label119.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label119.text")); // NOI18N
        jPanel14.add(label119);
        label119.setBounds(310, 20, 30, 18);

        otgTspStart_Temp1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Temp1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Temp1.text")); // NOI18N
        otgTspStart_Temp1.setEnabled(false);
        otgTspStart_Temp1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgTspStart_Temp1PropertyChange(evt);
            }
        });
        jPanel14.add(otgTspStart_Temp1);
        otgTspStart_Temp1.setBounds(310, 40, 50, 20);

        label120.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label120.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label120.text")); // NOI18N
        jPanel14.add(label120);
        label120.setBounds(370, 20, 40, 18);

        label121.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label121.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label72.text")); // NOI18N
        jPanel14.add(label121);
        label121.setBounds(440, 20, 85, 18);

        otgTspStart_Density21.setEditable(false);
        otgTspStart_Density21.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Density21.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Density21.text")); // NOI18N
        jPanel14.add(otgTspStart_Density21);
        otgTspStart_Density21.setBounds(440, 40, 90, 20);

        otgTspStart_Density1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Density1.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Density1.text")); // NOI18N
        otgTspStart_Density1.setEnabled(false);
        otgTspStart_Density1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspStart_Density1FocusLost(evt);
            }
        });
        otgTspStart_Density1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspStart_Density1KeyPressed(evt);
            }
        });
        jPanel14.add(otgTspStart_Density1);
        otgTspStart_Density1.setBounds(370, 40, 60, 20);

        jPanel10.add(jPanel14);
        jPanel14.setBounds(100, 230, 540, 70);

        label122.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label122.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label122.text")); // NOI18N
        jPanel10.add(label122);
        label122.setBounds(10, 300, 69, 18);

        otgTsp_Tank2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        otgTsp_Tank2.setEnabled(false);
        otgTsp_Tank2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                otgTsp_Tank2ActionPerformed(evt);
            }
        });
        jPanel10.add(otgTsp_Tank2);
        otgTsp_Tank2.setBounds(10, 320, 80, 20);

        jPanel15.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel15.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel15.setLayout(null);

        label123.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label123.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label123.text")); // NOI18N
        jPanel15.add(label123);
        label123.setBounds(10, 20, 40, 18);

        otgTspEnd_Level2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Level2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Level2.text")); // NOI18N
        otgTspEnd_Level2.setEnabled(false);
        otgTspEnd_Level2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspEnd_Level2FocusLost(evt);
            }
        });
        otgTspEnd_Level2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspEnd_Level2KeyPressed(evt);
            }
        });
        jPanel15.add(otgTspEnd_Level2);
        otgTspEnd_Level2.setBounds(10, 40, 90, 20);

        label124.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label124.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label124.text")); // NOI18N
        jPanel15.add(label124);
        label124.setBounds(110, 20, 40, 18);

        otgTspEnd_Volume2.setEditable(false);
        otgTspEnd_Volume2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Volume2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Volume2.text")); // NOI18N
        jPanel15.add(otgTspEnd_Volume2);
        otgTspEnd_Volume2.setBounds(110, 40, 90, 20);

        label125.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label125.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label125.text")); // NOI18N
        jPanel15.add(label125);
        label125.setBounds(210, 20, 40, 18);

        otgTspEnd_Mass2.setEditable(false);
        otgTspEnd_Mass2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Mass2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Mass2.text")); // NOI18N
        jPanel15.add(otgTspEnd_Mass2);
        otgTspEnd_Mass2.setBounds(210, 40, 90, 20);

        label126.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label126.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label126.text")); // NOI18N
        jPanel15.add(label126);
        label126.setBounds(310, 20, 40, 18);

        otgTspEnd_Temp2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Temp2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Temp2.text")); // NOI18N
        otgTspEnd_Temp2.setEnabled(false);
        otgTspEnd_Temp2.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgTspEnd_Temp2PropertyChange(evt);
            }
        });
        jPanel15.add(otgTspEnd_Temp2);
        otgTspEnd_Temp2.setBounds(310, 40, 50, 20);

        label127.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label127.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label127.text")); // NOI18N
        jPanel15.add(label127);
        label127.setBounds(370, 20, 50, 18);

        label128.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label128.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label72.text")); // NOI18N
        jPanel15.add(label128);
        label128.setBounds(440, 20, 80, 18);

        otgTspEnd_Density22.setEditable(false);
        otgTspEnd_Density22.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Density22.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Density22.text")); // NOI18N
        jPanel15.add(otgTspEnd_Density22);
        otgTspEnd_Density22.setBounds(440, 40, 90, 20);

        otgTspEnd_Density2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspEnd_Density2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspEnd_Density2.text")); // NOI18N
        otgTspEnd_Density2.setEnabled(false);
        otgTspEnd_Density2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspEnd_Density2FocusLost(evt);
            }
        });
        otgTspEnd_Density2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspEnd_Density2KeyPressed(evt);
            }
        });
        jPanel15.add(otgTspEnd_Density2);
        otgTspEnd_Density2.setBounds(370, 40, 60, 20);

        jPanel10.add(jPanel15);
        jPanel15.setBounds(100, 300, 540, 70);

        jPanel16.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(), org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.jPanel16.border.title"), javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel16.setLayout(null);

        label129.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label129.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label129.text")); // NOI18N
        jPanel16.add(label129);
        label129.setBounds(10, 20, 30, 18);

        otgTspStart_Level2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Level2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Level2.text")); // NOI18N
        otgTspStart_Level2.setEnabled(false);
        otgTspStart_Level2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspStart_Level2FocusLost(evt);
            }
        });
        otgTspStart_Level2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspStart_Level2KeyPressed(evt);
            }
        });
        jPanel16.add(otgTspStart_Level2);
        otgTspStart_Level2.setBounds(10, 40, 90, 20);

        label130.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label130.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label130.text")); // NOI18N
        jPanel16.add(label130);
        label130.setBounds(110, 20, 30, 18);

        otgTspStart_Volume2.setEditable(false);
        otgTspStart_Volume2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Volume2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Volume2.text")); // NOI18N
        jPanel16.add(otgTspStart_Volume2);
        otgTspStart_Volume2.setBounds(110, 40, 90, 20);

        label131.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label131.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label131.text")); // NOI18N
        jPanel16.add(label131);
        label131.setBounds(210, 20, 40, 18);

        otgTspStart_Mass2.setEditable(false);
        otgTspStart_Mass2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Mass2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Mass2.text")); // NOI18N
        jPanel16.add(otgTspStart_Mass2);
        otgTspStart_Mass2.setBounds(210, 40, 90, 20);

        label132.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label132.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label132.text")); // NOI18N
        jPanel16.add(label132);
        label132.setBounds(310, 20, 30, 18);

        otgTspStart_Temp2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Temp2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Temp2.text")); // NOI18N
        otgTspStart_Temp2.setEnabled(false);
        otgTspStart_Temp2.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
            public void propertyChange(java.beans.PropertyChangeEvent evt) {
                otgTspStart_Temp2PropertyChange(evt);
            }
        });
        jPanel16.add(otgTspStart_Temp2);
        otgTspStart_Temp2.setBounds(310, 40, 50, 20);

        label133.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label133.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label133.text")); // NOI18N
        jPanel16.add(label133);
        label133.setBounds(370, 20, 40, 18);

        label134.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        label134.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.label72.text")); // NOI18N
        jPanel16.add(label134);
        label134.setBounds(440, 20, 85, 18);

        otgTspStart_Density22.setEditable(false);
        otgTspStart_Density22.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Density22.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Density22.text")); // NOI18N
        jPanel16.add(otgTspStart_Density22);
        otgTspStart_Density22.setBounds(440, 40, 90, 20);

        otgTspStart_Density2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        otgTspStart_Density2.setText(org.openide.util.NbBundle.getMessage(sirieDataTopComponent.class, "sirieDataTopComponent.otgTspStart_Density2.text")); // NOI18N
        otgTspStart_Density2.setEnabled(false);
        otgTspStart_Density2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                otgTspStart_Density2FocusLost(evt);
            }
        });
        otgTspStart_Density2.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                otgTspStart_Density2KeyPressed(evt);
            }
        });
        jPanel16.add(otgTspStart_Density2);
        otgTspStart_Density2.setBounds(370, 40, 60, 20);

        jPanel10.add(jPanel16);
        jPanel16.setBounds(100, 370, 540, 70);

        add(jPanel10);
        jPanel10.setBounds(470, 0, 650, 450);
    }// </editor-fold>//GEN-END:initComponents
    
    private void otgTsp_TankChange(boolean edited){
        if (edited){
            if (otgTsp_Tank.getSelectedIndex()!=-1){
                old_OtgTspTank = new_OtgTspTank;            
                new_OtgTspTank = listTank.get(otgTsp_Tank.getSelectedIndex()).getTankId();
                Query query = em.createNamedQuery("GradView.findByTankIdLevel");
                query.setParameter("tankId", new_OtgTspTank);
                query.setParameter("matLevel", new_OtgTspLevelEnd);
                List<GradView> resultList = query.getResultList();
                old_OtgTspVolumeEnd = new_OtgTspVolumeEnd;                    
                if (!resultList.isEmpty()){
                    new_OtgTspVolumeEnd = resultList.get(0).getMatVolume().doubleValue();
                }else{
                    new_OtgTspVolumeEnd = 0;
                }
                query.setParameter("tankId", new_OtgTspTank);
                query.setParameter("matLevel", new_OtgTspLevelStart);
                resultList = query.getResultList();
                old_OtgTspVolumeStart = new_OtgTspVolumeStart;
                if (!resultList.isEmpty()){
                    new_OtgTspVolumeStart = resultList.get(0).getMatVolume().doubleValue();
                }else{
                    new_OtgTspVolumeStart = 0;
                }
            }else{
                new_OtgTspVolumeEnd = 0;
                new_OtgTspVolumeStart = 0;
            }
            old_OtgTspMassEnd = new_OtgTspMassEnd;
            new_OtgTspMassEnd = new_OtgTspVolumeEnd*new_OtgTspDensityEnd;
            old_OtgTspMassStart = new_OtgTspMassStart;
            new_OtgTspMassStart = new_OtgTspVolumeStart*new_OtgTspDensityStart;            
            otgTspEnd_Volume.setText(String.format("%.2f", new_OtgTspVolumeEnd));
            otgTspEnd_Mass.setText(String.format("%.2f", new_OtgTspMassEnd));
            otgTspStart_Volume.setText(String.format("%.2f", new_OtgTspVolumeStart));
            otgTspStart_Mass.setText(String.format("%.2f", new_OtgTspMassStart));
            
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                
            content.set(Collections.singleton(otgResult), null);
        }else{
            
        }
        
    }
    
    private void otgTsp_Tank1Change(boolean edited){
        if (edited){
            if (otgTsp_Tank1.getSelectedIndex()!=-1){
                old_OtgTspTank1 = new_OtgTspTank1;            
                new_OtgTspTank1 = listTank.get(otgTsp_Tank1.getSelectedIndex()).getTankId();
                Query query = em.createNamedQuery("GradView.findByTankIdLevel");
                query.setParameter("tankId", new_OtgTspTank1);
                query.setParameter("matLevel", new_OtgTspLevelEnd1);
                List<GradView> resultList = query.getResultList();
                old_OtgTspVolumeEnd1 = new_OtgTspVolumeEnd1;                    
                if (!resultList.isEmpty()){
                    new_OtgTspVolumeEnd1 = resultList.get(0).getMatVolume().doubleValue();
                }else{
                    new_OtgTspVolumeEnd1 = 0;
                }                
                query.setParameter("tankId", new_OtgTspTank1);
                query.setParameter("matLevel", new_OtgTspLevelStart1);
                resultList = query.getResultList();
                old_OtgTspVolumeStart1 = new_OtgTspVolumeStart1;                    
                if (!resultList.isEmpty()){
                    new_OtgTspVolumeStart1 = resultList.get(0).getMatVolume().doubleValue();
                }else{
                    new_OtgTspVolumeStart1 = 0;
                }                
            }else{
                new_OtgTspVolumeEnd1 = 0;
                new_OtgTspVolumeStart1 = 0;
            }
            old_OtgTspMassEnd1 = new_OtgTspMassEnd1;
            new_OtgTspMassEnd1 = new_OtgTspVolumeEnd1*new_OtgTspDensityEnd1;                    
            otgTspEnd_Volume1.setText(String.format("%.2f", new_OtgTspVolumeEnd1));
            otgTspEnd_Mass1.setText(String.format("%.2f", new_OtgTspMassEnd1));
            old_OtgTspMassStart1 = new_OtgTspMassStart1;
            new_OtgTspMassStart1 = new_OtgTspVolumeStart1*new_OtgTspDensityStart1;
            otgTspStart_Volume1.setText(String.format("%.2f", new_OtgTspVolumeStart1));
            otgTspStart_Mass1.setText(String.format("%.2f", new_OtgTspMassStart1));
            
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                
            content.set(Collections.singleton(otgResult), null);
        }else{
            
        }
        
    }
    
    private void otgTsp_Tank2Change(boolean edited){
        if (edited){
            if (otgTsp_Tank2.getSelectedIndex()!=-1){
                old_OtgTspTank2 = new_OtgTspTank2;            
                new_OtgTspTank2 = listTank.get(otgTsp_Tank2.getSelectedIndex()).getTankId();
                Query query = em.createNamedQuery("GradView.findByTankIdLevel");
                query.setParameter("tankId", new_OtgTspTank2);
                query.setParameter("matLevel", new_OtgTspLevelEnd2);
                List<GradView> resultList = query.getResultList();
                old_OtgTspVolumeEnd2 = new_OtgTspVolumeEnd2;                    
                if (!resultList.isEmpty()){
                    new_OtgTspVolumeEnd2 = resultList.get(0).getMatVolume().doubleValue();
                }else{
                    new_OtgTspVolumeEnd2 = 0;
                }
                query.setParameter("tankId", new_OtgTspTank2);
                query.setParameter("matLevel", new_OtgTspLevelStart2);
                resultList = query.getResultList();
                old_OtgTspVolumeStart2 = new_OtgTspVolumeStart2;                    
                if (!resultList.isEmpty()){
                    new_OtgTspVolumeStart2 = resultList.get(0).getMatVolume().doubleValue();
                }else{
                    new_OtgTspVolumeStart2 = 0;
                }                
            }else{
                new_OtgTspVolumeEnd2 = 0;
                new_OtgTspVolumeStart2 = 0;
            }
            old_OtgTspMassEnd2 = new_OtgTspMassEnd2;
            new_OtgTspMassEnd2 = new_OtgTspVolumeEnd2*new_OtgTspDensityEnd2;                    
            otgTspEnd_Volume2.setText(String.format("%.2f", new_OtgTspVolumeEnd2));
            otgTspEnd_Mass2.setText(String.format("%.2f", new_OtgTspMassEnd2));
            old_OtgTspMassStart2 = new_OtgTspMassStart2;
            new_OtgTspMassStart2 = new_OtgTspVolumeStart2*new_OtgTspDensityStart2;
            otgTspStart_Volume2.setText(String.format("%.2f", new_OtgTspVolumeStart2));
            otgTspStart_Mass2.setText(String.format("%.2f", new_OtgTspMassStart2));
            
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                
            content.set(Collections.singleton(otgResult), null);
        }else{
            
        }
        
    }
    
    private void otgUppg_TankChange(boolean edited) {
        if (edited){
            if (otgUppg_Tank.getSelectedIndex()!=-1){
                old_OtgUppgTank = new_OtgUppgTank;            
                new_OtgUppgTank = listTank.get(otgUppg_Tank.getSelectedIndex()).getTankId();
                Query query = em.createNamedQuery("GradView.findByTankIdLevel");
                query.setParameter("tankId", new_OtgUppgTank);
                query.setParameter("matLevel", new_OtgUppgLevelEnd);
                List<GradView> resultList = query.getResultList();
                old_OtgUppgVolumeEnd = new_OtgUppgVolumeEnd;
                if (!resultList.isEmpty()){                   
                    new_OtgUppgVolumeEnd = resultList.get(0).getMatVolume().doubleValue();
                }else{
                    new_OtgUppgVolumeEnd = 0;
                }
            }else{
                new_OtgUppgVolumeEnd = 0;
            }    
            old_OtgUppgMassEnd = new_OtgUppgMassEnd;
            new_OtgUppgMassEnd = new_OtgUppgVolumeEnd*new_OtgUppgDensityEnd;
            otgUppgEnd_Mass.setText(String.format("%.2f", new_OtgUppgMassEnd));
            otgUppgEnd_Volume.setText(String.format("%.2f", new_OtgUppgVolumeEnd));
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            otgResult.setUppgMassValue(new_OtgUppgMassStart-new_OtgUppgMassEnd+new_LoadMass);
            content.set(Collections.singleton(otgResult), null);
            otgUppgDataChanged = true;            
            }        
        }
    
    private void otgTspStart_LevelChange(boolean edited) {                                                 
        if (edited)    {
            old_OtgTspLevelStart = new_OtgTspLevelStart;
            if (!otgTspStart_Level.getText().isEmpty()){                
                try{
                    new_OtgTspLevelStart = Float.parseFloat(otgTspStart_Level.getText().replace(",", "."));
                    
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
                
            }else{
                new_OtgTspLevelStart = 0;
            }
            Query query = em.createNamedQuery("GradView.findByTankIdLevel");
            query.setParameter("tankId", new_OtgTspTank);
            query.setParameter("matLevel", new_OtgTspLevelStart);
            List<GradView> resultList = query.getResultList();
            old_OtgTspVolumeStart = new_OtgTspVolumeStart;
            if (!resultList.isEmpty()){
                new_OtgTspVolumeStart = resultList.get(0).getMatVolume().doubleValue();
            }else{
                new_OtgTspVolumeStart = 0;
            }    
            otgTspStart_Volume.setText(String.format("%.2f", new_OtgTspVolumeStart));
            old_OtgTspMassStart = new_OtgTspMassStart;
            new_OtgTspMassStart = new_OtgTspVolumeStart*new_OtgTspDensityStart;
            otgTspStart_Mass.setText(String.format("%.2f", new_OtgTspMassStart));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            content.set(Collections.singleton(otgResult), null);
        }
    }
    
    private void otgTspStart_TempPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgTspStart_TempPropertyChange
        if (!otgTspStart_Temp.getText().isEmpty()){
            old_OtgTspTempStart = new_OtgTspTempStart;
            try{
                new_OtgTspTempStart = Double.parseDouble(otgTspStart_Temp.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                        +String.valueOf(new_OtgTspDensityStart)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempStart))); 
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_OtgTspDensity20Start = new_OtgTspDensity20Start;
                    if (res.get(0).getPlotn20()!=null){
                        new_OtgTspDensity20Start = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_OtgTspDensity20Start=0;
                    }
                    otgTspStart_Density20.setText(String.format("%.4f", new_OtgTspDensity20Start));
                    otgTspDataChanged = true;
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }
            
        } 
    }//GEN-LAST:event_otgTspStart_TempPropertyChange

    private void otgUppgEnd_LevelChange(boolean edited) {
        if (edited){
            old_OtgUppgLevelEnd = new_OtgUppgLevelEnd;
            if (!otgUppgEnd_Level.getText().isEmpty()){
                try{
                    new_OtgUppgLevelEnd = Float.parseFloat(otgUppgEnd_Level.getText().replace(",", "."));                    
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }                
            }else{
                new_OtgUppgLevelEnd = 0;
            }
            Query query = em.createNamedQuery("GradView.findByTankIdLevel");
            query.setParameter("tankId", new_OtgUppgTank);
            query.setParameter("matLevel", new_OtgUppgLevelEnd);
            List<GradView> resultList = query.getResultList();
            old_OtgUppgVolumeEnd = new_OtgUppgVolumeEnd;
            if (!resultList.isEmpty()){
                new_OtgUppgVolumeEnd = resultList.get(0).getMatVolume().doubleValue();
            }else{
                new_OtgUppgVolumeEnd = 0;
            }
            otgUppgEnd_Volume.setText(String.format("%.2f", new_OtgUppgVolumeEnd));
            old_OtgUppgMassEnd = new_OtgUppgMassEnd;
            new_OtgUppgMassEnd = new_OtgUppgVolumeEnd*new_OtgUppgDensityEnd;
            otgUppgEnd_Mass.setText(String.format("%.2f", new_OtgUppgMassEnd));
            otgUppgDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            otgResult.setUppgMassValue(new_OtgUppgMassStart-new_OtgUppgMassEnd+new_LoadMass);
            content.set(Collections.singleton(otgResult), null);
        }
    }
    
    private void otgLoad_VolumeChange(boolean edited){
        if (edited){
            if (!otgLoad_Volume.getText().isEmpty()){
                old_LoadVolume = new_LoadVolume;
                try{
                    new_LoadVolume = Double.parseDouble(otgLoad_Volume.getText().replace(",", "."));
                    old_LoadMass = new_LoadMass;
                    new_LoadMass = new_LoadVolume*new_LoadDensity; 
                    otgLoad_Mass.setText(String.format("%.2f", new_LoadMass));
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
                content.remove(otgResult);
                otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
                otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
                otgResult.setMassValue(otgResult.getTspMassValue());
                otgResult.setVolumeValue(otgResult.getTspVolumeValue());
                otgResult.setUppgMassValue(new_OtgUppgMassStart-new_OtgUppgMassEnd+new_LoadMass);
                content.set(Collections.singleton(otgResult), null);
            }
        }
    }
    
    private void otgLoad_TempChange(boolean edited){
        if (edited){
            if (!otgLoad_Temp.getText().isEmpty()){
            old_LoadTemp = new_LoadTemp;
            try{
                new_LoadTemp = Double.parseDouble(otgLoad_Temp.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                        +String.valueOf(new_LoadDensity)+"%' AND v.temperName = "+String.format("%d", Math.round(new_LoadTemp))); 
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_LoadDensity20 = new_LoadDensity20;
                    if (res.get(0).getPlotn20()!=null){
                        new_LoadDensity20 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_LoadDensity20=0;
                    }
                    otgLoad_Density20.setText(String.format("%.4f", new_LoadDensity20));                    
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }
            
        } 
        }
    }
    
    private void otgLoad_DensityChange(boolean edited){
        if (edited){
            if (!otgLoad_Density.getText().isEmpty()){
            old_LoadDensity = new_LoadDensity;
            try{
                new_LoadDensity = Double.parseDouble(otgLoad_Density.getText().replace(",", "."));
                old_LoadMass = new_LoadMass;
                new_LoadMass = new_LoadVolume*new_LoadDensity; 
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                        +String.valueOf(new_LoadDensity)+"%' AND v.temperName = "+String.format("%d", Math.round(new_LoadTemp))); 
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_LoadDensity20 = new_LoadDensity20;
                    if (res.get(0).getPlotn20()!=null){
                        new_LoadDensity20 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_LoadDensity20=0;
                    }
                    otgLoad_Density20.setText(String.format("%.4f", new_LoadDensity20));                    
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                    (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                   (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            otgResult.setUppgMassValue(new_OtgUppgMassStart-new_OtgUppgMassEnd+new_LoadMass);
            content.set(Collections.singleton(otgResult), null);
        } 
        }
    }
    
    private void otgUppgEnd_TempPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgUppgEnd_TempPropertyChange
            if (!otgUppgEnd_Temp.getText().isEmpty()){
            old_OtgUppgTempEnd = new_OtgUppgTempEnd;
            try{
                new_OtgUppgTempEnd = Double.parseDouble(otgUppgEnd_Temp.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"+
                        String.valueOf(new_OtgUppgDensityEnd)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgUppgTempEnd)));
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_OtgUppgDensity20End = new_OtgUppgDensity20End;
                    if (res.get(0).getPlotn20()!=null){
                        new_OtgUppgDensity20End = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_OtgUppgDensity20End = 0;
                    }
                    otgUppgEnd_Density20.setText(String.format("%.4f", new_OtgUppgDensity20End));
                    otgUppgDataChanged = true;
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }
            
        }
    }//GEN-LAST:event_otgUppgEnd_TempPropertyChange

    private void otgUppgEnd_DensityChange(boolean edited) {                                                  
        if (edited){
            old_OtgUppgDensityEnd = new_OtgUppgDensityEnd;
            if (!otgUppgEnd_Density.getText().isEmpty()){
                try{                               
                    new_OtgUppgDensityEnd = Double.parseDouble(otgUppgEnd_Density.getText().replace(",", "."));                          
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgUppgDensityEnd=0;
            }
            Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                        +String.valueOf(new_OtgUppgDensityEnd)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgUppgTempEnd)));
            List<VPlotn20> res = query.getResultList();
            old_OtgUppgDensity20End = new_OtgUppgDensity20End;
            if (!res.isEmpty()){                
                new_OtgUppgDensity20End = Double.parseDouble(res.get(0).getPlotn20().replace(",", "."));
            }else{
                new_OtgUppgDensity20End = 0;
            }
            otgUppgEnd_Density20.setText(String.format("%.4f", new_OtgUppgDensity20End));
            old_OtgUppgMassEnd = new_OtgUppgMassEnd;
            new_OtgUppgMassEnd = new_OtgUppgVolumeEnd*new_OtgUppgDensityEnd;
            otgUppgEnd_Mass.setText(String.format("%.2f", new_OtgUppgMassEnd));
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            otgResult.setUppgMassValue(new_OtgUppgMassStart-new_OtgUppgMassEnd+new_LoadMass);
            content.set(Collections.singleton(otgResult), null);
            otgUppgDataChanged = true;            
        }
    }
    
    private void otgUppgStart_LevelChange(boolean edited) {                                                  
        if (edited){
            old_OtgUppgLevelStart = new_OtgUppgLevelStart;
            if (!otgUppgStart_Level.getText().isEmpty()){                
                try{
                    new_OtgUppgLevelStart = Float.parseFloat(otgUppgStart_Level.getText().replace(",", "."));                    
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
                Query query = em.createNamedQuery("GradView.findByTankIdLevel");
                query.setParameter("tankId", new_OtgUppgTank);
                query.setParameter("matLevel", new_OtgUppgLevelStart);
                List<GradView> resultList = query.getResultList();
                old_OtgUppgVolumeStart = new_OtgUppgVolumeStart;
                if (!resultList.isEmpty()){
                    new_OtgUppgVolumeStart = resultList.get(0).getMatVolume().doubleValue();
                }else{
                    new_OtgUppgVolumeStart = 0;
                }
                otgUppgStart_Volume.setText(String.format("%.2f", new_OtgUppgVolumeStart));
                old_OtgUppgMassStart = new_OtgUppgMassStart;
                new_OtgUppgMassStart = new_OtgUppgVolumeStart*new_OtgUppgDensityStart;
                otgUppgStart_Mass.setText(String.format("%.2f", new_OtgUppgMassStart));
                otgUppgDataChanged = true;                   
            }else{
                new_OtgUppgLevelStart = 0;
            }
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            otgResult.setUppgMassValue(new_OtgUppgMassStart-new_OtgUppgMassEnd+new_LoadMass);
            content.set(Collections.singleton(otgResult), null);
        }
    }
    
    private void otgUppgStart_DensityChange(boolean edited) {
        if (edited){
            old_OtgUppgDensityStart = new_OtgUppgDensityStart;
            if (!otgUppgStart_Density.getText().isEmpty()){
                try{
                    new_OtgUppgDensityStart = Double.parseDouble(otgUppgStart_Density.getText().replace(",", "."));                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgUppgDensityStart = 0;
            }
            Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                        +String.valueOf(new_OtgUppgDensityStart)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgUppgTempStart)));
            List<VPlotn20> res = query.getResultList();
            old_OtgUppgDensity20Start = new_OtgUppgDensity20Start;
            if (!res.isEmpty()){
                new_OtgUppgDensity20Start = Double.parseDouble(res.get(0).getPlotn20().replace(",", "."));
            }else{
                new_OtgUppgDensity20Start = 0;
            }
            otgUppgStart_Density20.setText(String.format("%.4f", new_OtgUppgDensity20Start));
            old_OtgUppgMassStart = new_OtgUppgMassStart;
            new_OtgUppgMassStart = new_OtgUppgVolumeStart*new_OtgUppgDensityStart;
            otgUppgStart_Mass.setText(String.format("%.2f", new_OtgUppgMassStart));
            otgUppgDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            otgResult.setUppgMassValue(new_OtgUppgMassStart-new_OtgUppgMassEnd+new_LoadMass);
            content.set(Collections.singleton(otgResult), null);
        }
    }
    
    private void otgTspEnd_TempPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgTspEnd_TempPropertyChange
        if (!otgTspEnd_Temp.getText().isEmpty()){
            old_OtgTspTempEnd = new_OtgTspTempEnd;
            try{
                new_OtgTspTempEnd = Double.parseDouble(otgTspEnd_Temp.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityEnd)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempEnd)));
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_OtgTspDensity20End = new_OtgTspDensity20End;
                    if (res.get(0).getPlotn20()!=null){
                        new_OtgTspDensity20End = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_OtgTspDensity20End = 0;
                    }
                    otgTspEnd_Density20.setText(String.format("%.4f", new_OtgTspDensity20End));
                    otgTspDataChanged = true;
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }

        }
    }//GEN-LAST:event_otgTspEnd_TempPropertyChange

    private void otgTspEnd_LevelChange(boolean edited) {
        if (edited){
            old_OtgTspLevelEnd = new_OtgTspLevelEnd;
            if (!otgTspEnd_Level.getText().isEmpty()){
                try{
                    new_OtgTspLevelEnd = Float.parseFloat(otgTspEnd_Level.getText().replace(",", "."));                    
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspLevelEnd = 0;
            }
            Query query = em.createNamedQuery("GradView.findByTankIdLevel");
            query.setParameter("tankId", new_OtgTspTank);
            query.setParameter("matLevel", new_OtgTspLevelEnd);
            List<GradView> resultList = query.getResultList();
            old_OtgTspVolumeEnd = new_OtgTspVolumeEnd;
            if (!resultList.isEmpty()){
                new_OtgTspVolumeEnd = resultList.get(0).getMatVolume().doubleValue();
            }else{
                new_OtgTspVolumeEnd = 0;
            }
            otgTspEnd_Volume.setText(String.format("%.2f", new_OtgTspVolumeEnd));
            old_OtgTspMassEnd = new_OtgTspMassEnd;
            new_OtgTspMassEnd = new_OtgTspVolumeEnd*new_OtgTspDensityEnd;
            otgTspEnd_Mass.setText(String.format("%.2f", new_OtgTspMassEnd));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);                                       
        }
    }
    
    private void otgTspEnd_DensityChange(boolean edited) {
        if (edited){
            old_OtgTspDensityEnd = new_OtgTspDensityEnd;
            if (!otgTspEnd_Density.getText().isEmpty()){            
                try{
                    new_OtgTspDensityEnd = Double.parseDouble(otgTspEnd_Density.getText().replace(",", "."));                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspDensityEnd = 0;
            }
            Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityEnd)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempEnd)));
            List<VPlotn20> res = query.getResultList();
            old_OtgTspDensity20End = new_OtgTspDensity20End;
            if (!res.isEmpty()){
                new_OtgTspDensity20End = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
            }else{
                new_OtgTspDensity20End = 0;
            }
            otgTspEnd_Density20.setText(String.format("%.4f", new_OtgTspDensity20End));
            old_OtgTspMassEnd = new_OtgTspMassEnd;
            new_OtgTspMassEnd = new_OtgTspVolumeEnd*new_OtgTspDensityEnd;
            otgTspEnd_Mass.setText(String.format("%.2f", new_OtgTspMassEnd));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);            
        }
    }
    
    private void otgTspStart_DensityChange(boolean edited) {
        if (edited){
            old_OtgTspDensityStart = new_OtgTspDensityStart;
            if (!otgTspStart_Density.getText().isEmpty()){
                try{
                    new_OtgTspDensityStart = Double.parseDouble(otgTspStart_Density.getText().replace(",", "."));                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspDensityStart = 0;
            }
            Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityStart)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempStart)));
            List<VPlotn20> res = query.getResultList();
            old_OtgTspDensity20Start = new_OtgTspDensity20Start;
            if (!res.isEmpty()){
                new_OtgTspDensity20Start = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
            }else{
                new_OtgTspDensity20Start = 0;
            }
            otgTspStart_Density20.setText(String.format("%.4f", new_OtgTspDensity20Start));
            old_OtgTspMassStart = new_OtgTspMassStart;
            new_OtgTspMassStart = new_OtgTspVolumeStart*new_OtgTspDensityStart;
            otgTspStart_Mass.setText(String.format("%.2f", new_OtgTspMassStart));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);                
        }
    }
    
    private void otgTspEnd_Level1Change(boolean edited) {
        if (edited){
            old_OtgTspLevelEnd1 = new_OtgTspLevelEnd1;
            if (!otgTspEnd_Level1.getText().isEmpty()){
                try{
                new_OtgTspLevelEnd1 = Float.parseFloat(otgTspEnd_Level1.getText().replace(",", "."));                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspLevelEnd1 = 0;
            }
            Query query = em.createNamedQuery("GradView.findByTankIdLevel");
            query.setParameter("tankId", new_OtgTspTank1);
            query.setParameter("matLevel", new_OtgTspLevelEnd1);
            List<GradView> resultList = query.getResultList();
            old_OtgTspVolumeEnd1 = new_OtgTspVolumeEnd1;
            if (!resultList.isEmpty()){          
                new_OtgTspVolumeEnd1 = resultList.get(0).getMatVolume().doubleValue();
            }else{
                new_OtgTspVolumeEnd1 = 0;
            }
            otgTspEnd_Volume1.setText(String.format("%.2f", new_OtgTspVolumeEnd1));
            old_OtgTspMassEnd1 = new_OtgTspMassEnd1;
            new_OtgTspMassEnd1 = new_OtgTspVolumeEnd1*new_OtgTspDensityEnd1;
            otgTspEnd_Mass1.setText(String.format("%.2f", new_OtgTspMassEnd1));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);            
        }
    }
    
    private void otgTspEnd_Temp1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgTspEnd_Temp1PropertyChange
        if (!otgTspEnd_Temp1.getText().isEmpty()){
            old_OtgTspTempEnd1 = new_OtgTspTempEnd1;
            try{
                new_OtgTspTempEnd1 = Double.parseDouble(otgTspEnd_Temp1.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityEnd1)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempEnd1)));
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_OtgTspDensity20End1 = new_OtgTspDensity20End1;
                    if (res.get(0).getPlotn20()!=null){
                        new_OtgTspDensity20End1 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_OtgTspDensity20End1 = 0;
                    }
                    otgTspEnd_Density21.setText(String.format("%.4f", new_OtgTspDensity20End1));
                    otgTspDataChanged = true;
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }

        }
    }//GEN-LAST:event_otgTspEnd_Temp1PropertyChange

    private void otgTspEnd_Density1Change(boolean edited) {
        if (edited){
            old_OtgTspDensityEnd1 = new_OtgTspDensityEnd1;
            if (!otgTspEnd_Density1.getText().isEmpty()){
                try{
                    new_OtgTspDensityEnd1 = Double.parseDouble(otgTspEnd_Density1.getText().replace(",", "."));                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspDensityEnd1 = 0;
            }
            Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityEnd1)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempEnd1)));
            List<VPlotn20> res = query.getResultList();
            old_OtgTspDensity20End1 = new_OtgTspDensity20End1;
            if (!res.isEmpty()){
                new_OtgTspDensity20End1 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
            }else{
                new_OtgTspDensity20End1 = 0;
            }
            otgTspEnd_Density21.setText(String.format("%.4f", new_OtgTspDensity20End1));
            old_OtgTspMassEnd1 = new_OtgTspMassEnd1;
            new_OtgTspMassEnd1 = new_OtgTspVolumeEnd1*new_OtgTspDensityEnd1;
            otgTspEnd_Mass1.setText(String.format("%.2f", new_OtgTspMassEnd1));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);                
        }
    }
    
    private void otgTspStart_Level1Change(boolean edited) {                                                  
        if (edited){
            if (!otgTspStart_Level1.getText().isEmpty()){
                old_OtgTspLevelStart1 = new_OtgTspLevelStart1;
                try{
                    new_OtgTspLevelStart1 = Float.parseFloat(otgTspStart_Level1.getText().replace(",", "."));                    
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
                
            }else{
                new_OtgTspLevelStart1 = 0;
            }
            Query query = em.createNamedQuery("GradView.findByTankIdLevel");
            query.setParameter("tankId", new_OtgTspTank1);
            query.setParameter("matLevel", new_OtgTspLevelStart1);
            List<GradView> resultList = query.getResultList();
            old_OtgTspVolumeStart1 = new_OtgTspVolumeStart1;
            if (!resultList.isEmpty()){                
                new_OtgTspVolumeStart1 = resultList.get(0).getMatVolume().doubleValue();
            }else{
                new_OtgTspVolumeStart1 = 0;
            }
            otgTspStart_Volume1.setText(String.format("%.2f", new_OtgTspVolumeStart1));
            old_OtgTspMassStart1 = new_OtgTspMassStart1;
            new_OtgTspMassStart1 = new_OtgTspVolumeStart1*new_OtgTspDensityStart1;
            otgTspStart_Mass1.setText(String.format("%.2f", new_OtgTspMassStart1));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            content.set(Collections.singleton(otgResult), null);            
        }
    }
    
    private void otgTspStart_Temp1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgTspStart_Temp1PropertyChange
        if (!otgTspStart_Temp1.getText().isEmpty()){
            old_OtgTspTempStart1 = new_OtgTspTempStart1;
            try{
                new_OtgTspTempStart1 = Double.parseDouble(otgTspStart_Temp1.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                        +String.valueOf(new_OtgTspDensityStart1)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempStart1))); 
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_OtgTspDensity20Start1 = new_OtgTspDensity20Start1;
                    if (res.get(0).getPlotn20()!=null){
                        new_OtgTspDensity20Start1 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_OtgTspDensity20Start1=0;
                    }
                    otgTspStart_Density21.setText(String.format("%.4f", new_OtgTspDensity20Start1));
                    otgTspDataChanged = true;
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }
            
        }
    }//GEN-LAST:event_otgTspStart_Temp1PropertyChange

    private void otgTspStart_Density1PropertyChange(boolean edited) {
        if (edited){
            old_OtgTspDensityStart1 = new_OtgTspDensityStart1;
            if (!otgTspStart_Density1.getText().isEmpty()){
                try{
                    new_OtgTspDensityStart1 = Double.parseDouble(otgTspStart_Density1.getText().replace(",", "."));
                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspDensityStart1 = 0;
            }
            Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityStart1)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempStart1)));
            List<VPlotn20> res = query.getResultList();
            old_OtgTspDensity20Start1 = new_OtgTspDensity20Start1;
            if (!res.isEmpty()){
                new_OtgTspDensity20Start1 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
            }else{
                new_OtgTspDensity20Start1 = 0;
            }
            otgTspStart_Density21.setText(String.format("%.4f", new_OtgTspDensity20Start1));
            old_OtgTspMassStart1 = new_OtgTspMassStart1;
            new_OtgTspMassStart1 = new_OtgTspVolumeStart1*new_OtgTspDensityStart1;
            otgTspStart_Mass1.setText(String.format("%.2f", new_OtgTspMassStart1));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);            
        }
    }
    
    private void otgTspEnd_Level2PropertyChange(boolean edited) {                                                
        if (edited & em!=null){
            old_OtgTspLevelEnd2 = new_OtgTspLevelEnd2;
            if (!otgTspEnd_Level2.getText().isEmpty()){                
                try{
                    new_OtgTspLevelEnd2 = Float.parseFloat(otgTspEnd_Level2.getText().replace(",", "."));                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspLevelEnd2 = 0;
            }
            Query query = em.createNamedQuery("GradView.findByTankIdLevel");
            query.setParameter("tankId", new_OtgTspTank2);
            query.setParameter("matLevel", new_OtgTspLevelEnd2);
            List<GradView> resultList = query.getResultList();
            old_OtgTspVolumeEnd2 = new_OtgTspVolumeEnd2;
            if (!resultList.isEmpty()){
                new_OtgTspVolumeEnd2 = resultList.get(0).getMatVolume().doubleValue();
            }else{
                new_OtgTspVolumeEnd2 = 0;
            }
            otgTspEnd_Volume2.setText(String.format("%.2f", new_OtgTspVolumeEnd2));
            old_OtgTspMassEnd2 = new_OtgTspMassEnd2;
            new_OtgTspMassEnd2 = new_OtgTspVolumeEnd2*new_OtgTspDensityEnd2;
            otgTspEnd_Mass2.setText(String.format("%.2f", new_OtgTspMassEnd2));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);            
        }
    }
    
    private void otgTspEnd_Temp2PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgTspEnd_Temp2PropertyChange
        if (!otgTspEnd_Temp2.getText().isEmpty()){
            old_OtgTspTempEnd2 = new_OtgTspTempEnd2;
            try{
                new_OtgTspTempEnd2 = Double.parseDouble(otgTspEnd_Temp2.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityEnd2)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempEnd2)));
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_OtgTspDensity20End2 = new_OtgTspDensity20End2;
                    if (res.get(0).getPlotn20()!=null){
                        new_OtgTspDensity20End2 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_OtgTspDensity20End2 = 0;
                    }
                    otgTspEnd_Density22.setText(String.format("%.4f", new_OtgTspDensity20End2));
                    otgTspDataChanged = true;
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }

        }
    }//GEN-LAST:event_otgTspEnd_Temp2PropertyChange

    private void otgTspEnd_Density2Change(boolean edited) {
        if (edited){
            old_OtgTspDensityEnd2 = new_OtgTspDensityEnd2;
            if (!otgTspEnd_Density2.getText().isEmpty()){
                try{
                    new_OtgTspDensityEnd2 = Double.parseDouble(otgTspEnd_Density2.getText().replace(",", "."));                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspDensityEnd2 = 0;
            }
            Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityEnd2)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempEnd2)));
            List<VPlotn20> res = query.getResultList();
            old_OtgTspDensity20End2 = new_OtgTspDensity20End2;
            if (!res.isEmpty()){
                new_OtgTspDensity20End2 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
            }else{
                new_OtgTspDensity20End2 = 0;
            }
            otgTspEnd_Density22.setText(String.format("%.4f", new_OtgTspDensity20End2));
            old_OtgTspMassEnd2 = new_OtgTspMassEnd2;
            new_OtgTspMassEnd2 = new_OtgTspVolumeEnd2*new_OtgTspDensityEnd2;
            otgTspEnd_Mass2.setText(String.format("%.2f", new_OtgTspMassEnd2));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);            
        }
    }
    
    private void otgTspStart_Level2Change(boolean edited) {
        if (edited){
            old_OtgTspLevelStart2 = new_OtgTspLevelStart2;
            if (!otgTspStart_Level2.getText().isEmpty()){
                try{
                    new_OtgTspLevelStart2 = Float.parseFloat(otgTspStart_Level2.getText().replace(",", "."));                    
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
                
            }else{
                new_OtgTspLevelStart2 = 0;
            }
            Query query = em.createNamedQuery("GradView.findByTankIdLevel");
            query.setParameter("tankId", new_OtgTspTank2);
            query.setParameter("matLevel", new_OtgTspLevelStart2);
            List<GradView> resultList = query.getResultList();
            old_OtgTspVolumeStart2 = new_OtgTspVolumeStart2;
            if (!resultList.isEmpty()){                        
                new_OtgTspVolumeStart2 = resultList.get(0).getMatVolume().doubleValue();
            }else{
                new_OtgTspVolumeStart2 = 0;
            }
            otgTspStart_Volume2.setText(String.format("%.2f", new_OtgTspVolumeStart2));
            old_OtgTspMassStart2 = new_OtgTspMassStart2;
            new_OtgTspMassStart2 = new_OtgTspVolumeStart2*new_OtgTspDensityStart2;
            otgTspStart_Mass2.setText(String.format("%.2f", new_OtgTspMassStart2));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspMassEnd-new_OtgTspMassStart)+(new_OtgTspMassEnd1-new_OtgTspMassStart1)+(new_OtgTspMassEnd2-new_OtgTspMassStart2));
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());
            content.set(Collections.singleton(otgResult), null);                    
        }
    }
    
    private void otgTspStart_Temp2PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgTspStart_Temp2PropertyChange
        if (!otgTspStart_Temp2.getText().isEmpty()){
            old_OtgTspTempStart2 = new_OtgTspTempStart2;
            try{
                new_OtgTspTempStart2 = Double.parseDouble(otgTspStart_Temp2.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                        +String.valueOf(new_OtgTspDensityStart2)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempStart2))); 
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_OtgTspDensity20Start2 = new_OtgTspDensity20Start2;
                    if (res.get(0).getPlotn20()!=null){
                        new_OtgTspDensity20Start2 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_OtgTspDensity20Start2=0;
                    }
                    otgTspStart_Density22.setText(String.format("%.4f", new_OtgTspDensity20Start2));
                    otgTspDataChanged = true;
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }
            
        }
    }//GEN-LAST:event_otgTspStart_Temp2PropertyChange

    private void otgTspStart_Density2Change(boolean edited) {
        if (edited){
            old_OtgTspDensityStart2 = new_OtgTspDensityStart2;
            if (!otgTspStart_Density2.getText().isEmpty()){
                try{
                   new_OtgTspDensityStart2 = Double.parseDouble(otgTspStart_Density2.getText().replace(",", "."));                
                }catch (java.lang.NumberFormatException e){
                    this.showNumberErroMessage();
                }
            }else{
                new_OtgTspDensityStart2 = 0;
            }
            Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"
                    +String.valueOf(new_OtgTspDensityStart2)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgTspTempStart2)));
            List<VPlotn20> res = query.getResultList();
            old_OtgTspDensity20Start2 = new_OtgTspDensity20Start2;
            if (!res.isEmpty()){
                new_OtgTspDensity20Start2 = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
            }else{
                new_OtgTspDensity20Start2 = 0;
            }
            otgTspStart_Density22.setText(String.format("%.4f", new_OtgTspDensity20Start2));
            old_OtgTspMassStart2 = new_OtgTspMassStart2;
            new_OtgTspMassStart2 = new_OtgTspVolumeStart2*new_OtgTspDensityStart2;
            otgTspStart_Mass2.setText(String.format("%.2f", new_OtgTspMassStart2));
            otgTspDataChanged = true;
            content.remove(otgResult);
            otgResult.setTspVolumeValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)+(new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)+(new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2));
            otgResult.setTspMassValue((new_OtgTspVolumeEnd-new_OtgTspVolumeStart)*new_OtgTspDensityEnd+
                                        (new_OtgTspVolumeEnd1-new_OtgTspVolumeStart1)*new_OtgTspDensityEnd1+
                                        (new_OtgTspVolumeEnd2-new_OtgTspVolumeStart2)*new_OtgTspDensityEnd2);
            otgResult.setMassValue(otgResult.getTspMassValue());
            otgResult.setVolumeValue(otgResult.getTspVolumeValue());                    
            content.set(Collections.singleton(otgResult), null);            
        }
    }
    
    private void feedEnd_VolumePropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_feedEnd_VolumePropertyChange
        old_FeedEnd = new_FeedEnd;
        if (!feedEnd_Volume.getText().isEmpty()){
            try{
                new_FeedEnd = Integer.parseInt(feedEnd_Volume.getText().trim());
                old_Feed = new_Feed;
                new_Feed = new_FeedEnd - new_FeedStart;
                feed_Water.setText(String.valueOf(new_Feed));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }
        }
    }//GEN-LAST:event_feedEnd_VolumePropertyChange

    private void feedStart_VolumePropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_feedStart_VolumePropertyChange
        old_FeedStart = new_FeedStart;
        if (!feedStart_Volume.getText().isEmpty()){
            try{
                new_FeedStart = Integer.parseInt(feedStart_Volume.getText().trim());
                old_Feed = new_Feed;
                new_Feed = new_FeedEnd - new_FeedStart;
                feed_Water.setText(String.valueOf(new_Feed));
            }catch (java.lang.NumberFormatException ex){
                this.showNumberErroMessage();
            }
        }
    }//GEN-LAST:event_feedStart_VolumePropertyChange

    private void drainEnd_VolumeChange(boolean edited) {
        if (edited){
            old_DrainVolumeEnd = new_DrainVolumeEnd;
            if (!drainEnd_Volume.getText().isEmpty()){
                try{
                    new_DrainVolumeEnd = Integer.parseInt(drainEnd_Volume.getText().trim());
                }catch (java.lang.NumberFormatException ex){
                    this.showNumberErroMessage();
                }
            }else{
                new_DrainVolumeEnd = 0;
            }
            old_DrainMass = new_DrainMass;
            new_DrainMass = (new_DrainVolumeStart-new_DrainVolumeEnd)*new_DrainDensity;
            drain_Mass.setText(String.format("%.1f", new_DrainMass));
        }
    }
    
    private void drainStart_VolumeChange(boolean edited) {
        if (edited){
            old_DrainVolumeStart = new_DrainVolumeStart;
            if (!drainStart_Volume.getText().isEmpty()){
                try{
                    new_DrainVolumeStart = Integer.parseInt(drainStart_Volume.getText().trim());                    
                }catch (java.lang.NumberFormatException ex){
                    this.showNumberErroMessage();
                }
            }else{
                new_DrainVolumeStart = 0;
            }
            old_DrainMass = new_DrainMass;
            new_DrainMass = (new_DrainVolumeStart-new_DrainVolumeEnd)*new_DrainDensity;
            drain_Mass.setText(String.format("%.1f", new_DrainMass));
        }
    }
    
    private void drain_DensityChange(boolean edited) {
        if (edited){
            old_DrainDensity = new_DrainDensity;
            if (!drain_Density.getText().isEmpty()){
                try{
                    new_DrainDensity = Double.parseDouble(drain_Density.getText().replace(",", ".").trim());                    
                }catch (java.lang.NumberFormatException ex){
                    this.showNumberErroMessage();
                }
            }else{
                new_DrainDensity = 0;
            }
            old_DrainMass = new_DrainMass;
            new_DrainMass = (new_DrainVolumeStart-new_DrainVolumeEnd)*new_DrainDensity;
            drain_Mass.setText(String.format("%.1f", new_DrainMass));
        }
    }
    
    private void feedStart_VolumeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_feedStart_VolumeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_feedStart_VolumeActionPerformed

    private void drained_WaterChange(boolean edited) {
        if (edited){
            old_drainedWater = new_drainedWater;
            if (!drained_Water.getText().isEmpty()){
                try{
                    new_drainedWater = Double.parseDouble(String.valueOf(drained_Water.getText().replace(",", ".")));            
                }catch (java.lang.NumberFormatException ex){
                    this.showNumberErroMessage();
                }
            }else{
                new_drainedWater = 0;
            }
        }
    }
                                                 
    private void drained_BLFChange(boolean edited) {
        if (edited){
            old_drainedBLF = new_drainedBLF;
            if (!drained_BLF.getText().isEmpty()){
                try{
                    new_drainedBLF = Double.parseDouble(String.valueOf(drained_BLF.getText().replace(",", ".")));
                }catch (java.lang.NumberFormatException ex){
                    this.showNumberErroMessage();
                }
            }else{
                new_drainedBLF = 0;
            }
        }
    }
    
    private void otgTsp_TankActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_otgTsp_TankActionPerformed
        otgTsp_TankChange(true);
    }//GEN-LAST:event_otgTsp_TankActionPerformed

    private void otgTsp_Tank1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_otgTsp_Tank1ActionPerformed
        otgTsp_Tank1Change(true);
    }//GEN-LAST:event_otgTsp_Tank1ActionPerformed

    private void otgTsp_Tank2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_otgTsp_Tank2ActionPerformed
        otgTsp_Tank2Change(true);
    }//GEN-LAST:event_otgTsp_Tank2ActionPerformed

    private void otgUppg_TankActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_otgUppg_TankActionPerformed
        otgUppg_TankChange(true);
    }//GEN-LAST:event_otgUppg_TankActionPerformed

    private void otgTspEnd_LevelFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspEnd_LevelFocusLost
        otgTspEnd_LevelChange(true);
    }//GEN-LAST:event_otgTspEnd_LevelFocusLost

    private void otgTspStart_LevelFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspStart_LevelFocusLost
        otgTspStart_LevelChange(true);
    }//GEN-LAST:event_otgTspStart_LevelFocusLost

    private void otgTspEnd_Level1FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspEnd_Level1FocusLost
        otgTspEnd_Level1Change(true);
    }//GEN-LAST:event_otgTspEnd_Level1FocusLost

    private void otgTspStart_Level1FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspStart_Level1FocusLost
        otgTspStart_Level1Change(true);
    }//GEN-LAST:event_otgTspStart_Level1FocusLost

    private void otgTspEnd_Level2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspEnd_Level2FocusLost
        otgTspEnd_Level2PropertyChange(true);
    }//GEN-LAST:event_otgTspEnd_Level2FocusLost

    private void otgTspStart_Level2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspStart_Level2FocusLost
        otgTspStart_Level2Change(true);
    }//GEN-LAST:event_otgTspStart_Level2FocusLost

    private void otgUppgEnd_LevelFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgUppgEnd_LevelFocusLost
        otgUppgEnd_LevelChange(true);
    }//GEN-LAST:event_otgUppgEnd_LevelFocusLost

    private void otgTspEnd_DensityFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspEnd_DensityFocusLost
        otgTspEnd_DensityChange(true);
    }//GEN-LAST:event_otgTspEnd_DensityFocusLost

    private void otgTspStart_DensityFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspStart_DensityFocusLost
        otgTspStart_DensityChange(true);
    }//GEN-LAST:event_otgTspStart_DensityFocusLost

    private void otgTspEnd_Density1FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspEnd_Density1FocusLost
        otgTspEnd_Density1Change(true);
    }//GEN-LAST:event_otgTspEnd_Density1FocusLost

    private void otgTspStart_Density1FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspStart_Density1FocusLost
        otgTspStart_Density1PropertyChange(true);
    }//GEN-LAST:event_otgTspStart_Density1FocusLost

    private void otgTspEnd_Density2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspEnd_Density2FocusLost
        otgTspEnd_Density2Change(true);
    }//GEN-LAST:event_otgTspEnd_Density2FocusLost

    private void otgTspStart_Density2FocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgTspStart_Density2FocusLost
        otgTspStart_Density2Change(true);
    }//GEN-LAST:event_otgTspStart_Density2FocusLost

    private void otgUppgEnd_DensityFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgUppgEnd_DensityFocusLost
        otgUppgEnd_DensityChange(true);
    }//GEN-LAST:event_otgUppgEnd_DensityFocusLost

    private void otgUppgEnd_DensityKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgUppgEnd_DensityKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgUppgEnd_DensityChange(true);
            otgUppgEnd_Density.transferFocus();
        }
    }//GEN-LAST:event_otgUppgEnd_DensityKeyPressed

    private void otgTspStart_Density2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspStart_Density2KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspStart_Density2Change(true);
            otgTspStart_Density.transferFocus();
        }
    }//GEN-LAST:event_otgTspStart_Density2KeyPressed

    private void otgTspEnd_Density2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspEnd_Density2KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspEnd_Density2Change(true);
        }
    }//GEN-LAST:event_otgTspEnd_Density2KeyPressed

    private void otgTspStart_Density1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspStart_Density1KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspStart_Density1PropertyChange(true);
        }
    }//GEN-LAST:event_otgTspStart_Density1KeyPressed

    private void otgTspEnd_Density1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspEnd_Density1KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspEnd_Density1Change(true);
        }
    }//GEN-LAST:event_otgTspEnd_Density1KeyPressed

    private void otgTspStart_DensityKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspStart_DensityKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspStart_DensityChange(true);
        }    
    }//GEN-LAST:event_otgTspStart_DensityKeyPressed

    private void otgTspEnd_DensityKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspEnd_DensityKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspEnd_DensityChange(true);
        }
    }//GEN-LAST:event_otgTspEnd_DensityKeyPressed

    private void otgUppgEnd_LevelKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgUppgEnd_LevelKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgUppgEnd_LevelChange(true);
        }
    }//GEN-LAST:event_otgUppgEnd_LevelKeyPressed

    private void otgTspStart_Level2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspStart_Level2KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspStart_Level2Change(true);
        }
    }//GEN-LAST:event_otgTspStart_Level2KeyPressed

    private void otgTspEnd_Level2KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspEnd_Level2KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspEnd_Level2PropertyChange(true);
        }
    }//GEN-LAST:event_otgTspEnd_Level2KeyPressed

    private void otgTspStart_Level1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspStart_Level1KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspStart_Level1Change(true);
        }
    }//GEN-LAST:event_otgTspStart_Level1KeyPressed

    private void otgTspEnd_Level1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspEnd_Level1KeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspEnd_Level1Change(true);
        }
    }//GEN-LAST:event_otgTspEnd_Level1KeyPressed

    private void otgTspStart_LevelKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspStart_LevelKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspStart_LevelChange(true);
        }
    }//GEN-LAST:event_otgTspStart_LevelKeyPressed

    private void otgTspEnd_LevelKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgTspEnd_LevelKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgTspEnd_LevelChange(true);
            otgTspEnd_Level.transferFocus();
        }
    }//GEN-LAST:event_otgTspEnd_LevelKeyPressed

    private void drained_WaterFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_drained_WaterFocusLost
        drained_WaterChange(true);
    }//GEN-LAST:event_drained_WaterFocusLost

    private void drained_WaterKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_drained_WaterKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            drained_WaterChange(true);
        }
    }//GEN-LAST:event_drained_WaterKeyPressed

    private void drained_BLFFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_drained_BLFFocusLost
        drained_BLFChange(true);
    }//GEN-LAST:event_drained_BLFFocusLost

    private void drained_BLFKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_drained_BLFKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            drained_BLFChange(true);
        }
    }//GEN-LAST:event_drained_BLFKeyPressed

    private void drainEnd_VolumeFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_drainEnd_VolumeFocusLost
        drainEnd_VolumeChange(true);
    }//GEN-LAST:event_drainEnd_VolumeFocusLost

    private void drainEnd_VolumeKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_drainEnd_VolumeKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            drainEnd_VolumeChange(true);
        }
    }//GEN-LAST:event_drainEnd_VolumeKeyPressed

    private void drainStart_VolumeFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_drainStart_VolumeFocusLost
        drainStart_VolumeChange(true);
    }//GEN-LAST:event_drainStart_VolumeFocusLost

    private void drainStart_VolumeKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_drainStart_VolumeKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            drainStart_VolumeChange(true);
        }
    }//GEN-LAST:event_drainStart_VolumeKeyPressed

    private void drain_DensityFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_drain_DensityFocusLost
        drain_DensityChange(true);
    }//GEN-LAST:event_drain_DensityFocusLost

    private void drain_DensityKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_drain_DensityKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            drain_DensityChange(true);
        }
    }//GEN-LAST:event_drain_DensityKeyPressed

    private void otgUppgStart_DensityKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgUppgStart_DensityKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgUppgStart_DensityChange(true);
            otgUppgStart_Density.transferFocus();
        }
    }//GEN-LAST:event_otgUppgStart_DensityKeyPressed

    private void otgUppgStart_DensityFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgUppgStart_DensityFocusLost
        otgUppgStart_DensityChange(true);
    }//GEN-LAST:event_otgUppgStart_DensityFocusLost

    private void otgUppgStart_TempPropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgUppgStart_TempPropertyChange
        if (!otgUppgStart_Temp.getText().isEmpty()){
            old_OtgUppgTempStart = new_OtgUppgTempStart;
            try{
                new_OtgUppgTempStart = Double.parseDouble(otgUppgStart_Temp.getText().replace(",", "."));
                Query query = em.createQuery("SELECT v FROM VPlotn20 v WHERE v.plotn like '"+
                    String.valueOf(new_OtgUppgDensityStart)+"%' AND v.temperName = "+String.format("%d", Math.round(new_OtgUppgTempStart)));
                List<VPlotn20> res = query.getResultList();
                if (!res.isEmpty()){
                    old_OtgUppgDensity20Start = new_OtgUppgDensity20Start;
                    if (res.get(0).getPlotn20()!=null){
                        new_OtgUppgDensity20Start = Float.parseFloat(res.get(0).getPlotn20().replace(",", "."));
                    }else{
                        new_OtgUppgDensity20Start = 0;
                    }
                    otgUppgStart_Density20.setText(String.format("%.4f", new_OtgUppgDensity20Start));
                    otgUppgDataChanged = true;
                }
            }catch (java.lang.NumberFormatException e){
                this.showNumberErroMessage();
            }

        }
    }//GEN-LAST:event_otgUppgStart_TempPropertyChange

    private void otgUppgStart_LevelKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgUppgStart_LevelKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgUppgStart_LevelChange(true);
        }
    }//GEN-LAST:event_otgUppgStart_LevelKeyPressed

    private void otgUppgStart_LevelFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgUppgStart_LevelFocusLost
        otgUppgStart_LevelChange(true);
    }//GEN-LAST:event_otgUppgStart_LevelFocusLost

    private void otgLoad_DensityFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgLoad_DensityFocusLost
        otgLoad_DensityChange(true);
    }//GEN-LAST:event_otgLoad_DensityFocusLost

    private void otgLoad_DensityKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgLoad_DensityKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgLoad_DensityChange(true);
        }
    }//GEN-LAST:event_otgLoad_DensityKeyPressed

    private void otgLoad_VolumeKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgLoad_VolumeKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgLoad_VolumeChange(true);
            otgLoad_Volume.transferFocus();
        }
    }//GEN-LAST:event_otgLoad_VolumeKeyPressed

    private void otgLoad_VolumeFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgLoad_VolumeFocusLost
        otgLoad_VolumeChange(true);
    }//GEN-LAST:event_otgLoad_VolumeFocusLost

    private void otgLoad_TempKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_otgLoad_TempKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            otgLoad_TempChange(true);
            otgLoad_Temp.transferFocus();
        }
    }//GEN-LAST:event_otgLoad_TempKeyPressed

    private void otgLoad_TempFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_otgLoad_TempFocusLost
        otgLoad_TempChange(true);
    }//GEN-LAST:event_otgLoad_TempFocusLost

    private void otgLoad_VolumePropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_otgLoad_VolumePropertyChange
                
    }//GEN-LAST:event_otgLoad_VolumePropertyChange

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JFormattedTextField akdgEnd_Density;
    private javax.swing.JFormattedTextField akdgEnd_Density20;
    private javax.swing.JFormattedTextField akdgEnd_Mass;
    private javax.swing.JFormattedTextField akdgEnd_Temp;
    private javax.swing.JFormattedTextField akdgEnd_Volume;
    private javax.swing.JFormattedTextField akdgStart_Density;
    private javax.swing.JFormattedTextField akdgStart_Density20;
    private javax.swing.JFormattedTextField akdgStart_Mass;
    private javax.swing.JFormattedTextField akdgStart_Temp;
    private javax.swing.JFormattedTextField akdgStart_Volume;
    private javax.swing.JFormattedTextField blfEnd_Density;
    private javax.swing.JFormattedTextField blfEnd_Density20;
    private javax.swing.JFormattedTextField blfEnd_Mass;
    private javax.swing.JFormattedTextField blfEnd_Temp;
    private javax.swing.JFormattedTextField blfEnd_Volume;
    private javax.swing.JFormattedTextField blfStart_Density;
    private javax.swing.JFormattedTextField blfStart_Density20;
    private javax.swing.JFormattedTextField blfStart_Mass;
    private javax.swing.JFormattedTextField blfStart_Temp;
    private javax.swing.JFormattedTextField blfStart_Volume;
    private javax.swing.JPanel countersEnd;
    private javax.swing.JPanel countersEnd1;
    private javax.swing.JPanel countersEnd2;
    private javax.swing.JPanel countersStart;
    private javax.swing.JPanel countersStart1;
    private javax.swing.JPanel countersStart2;
    private javax.swing.JFormattedTextField drainEnd_Volume;
    private javax.swing.JFormattedTextField drainStart_Volume;
    private javax.swing.JFormattedTextField drain_Density;
    private javax.swing.JFormattedTextField drain_Mass;
    private javax.swing.JFormattedTextField drained_BLF;
    private javax.swing.JFormattedTextField drained_Water;
    private javax.swing.JFormattedTextField feedEnd_Volume;
    private javax.swing.JFormattedTextField feedStart_Volume;
    private javax.swing.JFormattedTextField feed_Water;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel10;
    private javax.swing.JPanel jPanel11;
    private javax.swing.JPanel jPanel12;
    private javax.swing.JPanel jPanel13;
    private javax.swing.JPanel jPanel14;
    private javax.swing.JPanel jPanel15;
    private javax.swing.JPanel jPanel16;
    private javax.swing.JPanel jPanel17;
    private javax.swing.JPanel jPanel18;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JPanel jPanel9;
    private java.awt.Label label100;
    private java.awt.Label label101;
    private java.awt.Label label102;
    private java.awt.Label label103;
    private java.awt.Label label104;
    private java.awt.Label label105;
    private java.awt.Label label106;
    private java.awt.Label label107;
    private java.awt.Label label108;
    private java.awt.Label label109;
    private java.awt.Label label110;
    private java.awt.Label label111;
    private java.awt.Label label112;
    private java.awt.Label label113;
    private java.awt.Label label114;
    private java.awt.Label label115;
    private java.awt.Label label116;
    private java.awt.Label label117;
    private java.awt.Label label118;
    private java.awt.Label label119;
    private java.awt.Label label120;
    private java.awt.Label label121;
    private java.awt.Label label122;
    private java.awt.Label label123;
    private java.awt.Label label124;
    private java.awt.Label label125;
    private java.awt.Label label126;
    private java.awt.Label label127;
    private java.awt.Label label128;
    private java.awt.Label label129;
    private java.awt.Label label130;
    private java.awt.Label label131;
    private java.awt.Label label132;
    private java.awt.Label label133;
    private java.awt.Label label134;
    private java.awt.Label label135;
    private java.awt.Label label136;
    private java.awt.Label label137;
    private java.awt.Label label138;
    private java.awt.Label label139;
    private java.awt.Label label140;
    private java.awt.Label label141;
    private java.awt.Label label142;
    private java.awt.Label label143;
    private java.awt.Label label145;
    private java.awt.Label label146;
    private java.awt.Label label147;
    private java.awt.Label label148;
    private java.awt.Label label149;
    private java.awt.Label label53;
    private java.awt.Label label54;
    private java.awt.Label label55;
    private java.awt.Label label56;
    private java.awt.Label label57;
    private java.awt.Label label58;
    private java.awt.Label label59;
    private java.awt.Label label60;
    private java.awt.Label label61;
    private java.awt.Label label62;
    private java.awt.Label label63;
    private java.awt.Label label64;
    private java.awt.Label label65;
    private java.awt.Label label66;
    private java.awt.Label label67;
    private java.awt.Label label68;
    private java.awt.Label label69;
    private java.awt.Label label70;
    private java.awt.Label label71;
    private java.awt.Label label72;
    private java.awt.Label label73;
    private java.awt.Label label74;
    private java.awt.Label label75;
    private java.awt.Label label76;
    private java.awt.Label label77;
    private java.awt.Label label78;
    private java.awt.Label label79;
    private java.awt.Label label80;
    private java.awt.Label label81;
    private java.awt.Label label82;
    private java.awt.Label label83;
    private java.awt.Label label84;
    private java.awt.Label label85;
    private java.awt.Label label86;
    private java.awt.Label label87;
    private java.awt.Label label88;
    private java.awt.Label label89;
    private java.awt.Label label90;
    private java.awt.Label label91;
    private java.awt.Label label92;
    private java.awt.Label label93;
    private java.awt.Label label94;
    private java.awt.Label label95;
    private java.awt.Label label96;
    private java.awt.Label label97;
    private java.awt.Label label98;
    private java.awt.Label label99;
    private javax.swing.JFormattedTextField otgLoad_Density;
    private javax.swing.JFormattedTextField otgLoad_Density20;
    private javax.swing.JFormattedTextField otgLoad_Mass;
    private javax.swing.JFormattedTextField otgLoad_Temp;
    private javax.swing.JFormattedTextField otgLoad_Volume;
    private javax.swing.JFormattedTextField otgTspEnd_Density;
    private javax.swing.JFormattedTextField otgTspEnd_Density1;
    private javax.swing.JFormattedTextField otgTspEnd_Density2;
    private javax.swing.JFormattedTextField otgTspEnd_Density20;
    private javax.swing.JFormattedTextField otgTspEnd_Density21;
    private javax.swing.JFormattedTextField otgTspEnd_Density22;
    private javax.swing.JFormattedTextField otgTspEnd_Level;
    private javax.swing.JFormattedTextField otgTspEnd_Level1;
    private javax.swing.JFormattedTextField otgTspEnd_Level2;
    private javax.swing.JFormattedTextField otgTspEnd_Mass;
    private javax.swing.JFormattedTextField otgTspEnd_Mass1;
    private javax.swing.JFormattedTextField otgTspEnd_Mass2;
    private javax.swing.JFormattedTextField otgTspEnd_Temp;
    private javax.swing.JFormattedTextField otgTspEnd_Temp1;
    private javax.swing.JFormattedTextField otgTspEnd_Temp2;
    private javax.swing.JFormattedTextField otgTspEnd_Volume;
    private javax.swing.JFormattedTextField otgTspEnd_Volume1;
    private javax.swing.JFormattedTextField otgTspEnd_Volume2;
    private javax.swing.JFormattedTextField otgTspStart_Density;
    private javax.swing.JFormattedTextField otgTspStart_Density1;
    private javax.swing.JFormattedTextField otgTspStart_Density2;
    private javax.swing.JFormattedTextField otgTspStart_Density20;
    private javax.swing.JFormattedTextField otgTspStart_Density21;
    private javax.swing.JFormattedTextField otgTspStart_Density22;
    private javax.swing.JFormattedTextField otgTspStart_Level;
    private javax.swing.JFormattedTextField otgTspStart_Level1;
    private javax.swing.JFormattedTextField otgTspStart_Level2;
    private javax.swing.JFormattedTextField otgTspStart_Mass;
    private javax.swing.JFormattedTextField otgTspStart_Mass1;
    private javax.swing.JFormattedTextField otgTspStart_Mass2;
    private javax.swing.JFormattedTextField otgTspStart_Temp;
    private javax.swing.JFormattedTextField otgTspStart_Temp1;
    private javax.swing.JFormattedTextField otgTspStart_Temp2;
    private javax.swing.JFormattedTextField otgTspStart_Volume;
    private javax.swing.JFormattedTextField otgTspStart_Volume1;
    private javax.swing.JFormattedTextField otgTspStart_Volume2;
    private javax.swing.JComboBox<String> otgTsp_Tank;
    private javax.swing.JComboBox<String> otgTsp_Tank1;
    private javax.swing.JComboBox<String> otgTsp_Tank2;
    private javax.swing.JFormattedTextField otgUppgEnd_Density;
    private javax.swing.JFormattedTextField otgUppgEnd_Density20;
    private javax.swing.JFormattedTextField otgUppgEnd_Level;
    private javax.swing.JFormattedTextField otgUppgEnd_Mass;
    private javax.swing.JFormattedTextField otgUppgEnd_Temp;
    private javax.swing.JFormattedTextField otgUppgEnd_Volume;
    private javax.swing.JFormattedTextField otgUppgStart_Density;
    private javax.swing.JFormattedTextField otgUppgStart_Density20;
    private javax.swing.JFormattedTextField otgUppgStart_Level;
    private javax.swing.JFormattedTextField otgUppgStart_Mass;
    private javax.swing.JFormattedTextField otgUppgStart_Temp;
    private javax.swing.JFormattedTextField otgUppgStart_Volume;
    private javax.swing.JComboBox<String> otgUppg_Tank;
    private javax.swing.JFormattedTextField sirieEnd_Density;
    private javax.swing.JFormattedTextField sirieEnd_Density20;
    private javax.swing.JFormattedTextField sirieEnd_Mass;
    private javax.swing.JFormattedTextField sirieEnd_Temp;
    private javax.swing.JFormattedTextField sirieEnd_Volume;
    private javax.swing.JFormattedTextField sirieStart_Density;
    private javax.swing.JFormattedTextField sirieStart_Density20;
    private javax.swing.JFormattedTextField sirieStart_Mass;
    private javax.swing.JFormattedTextField sirieStart_Temp;
    private javax.swing.JFormattedTextField sirieStart_Volume;
    // End of variables declaration//GEN-END:variables
       
    @Override
    public void componentOpened() {
        if (em!=null){
            Query query = em.createNamedQuery("TankDic.findAll");
            listTank = query.getResultList();
            for (TankDic t : listTank){
                otgTsp_Tank.addItem(t.getTankName());
                otgTsp_Tank1.addItem(t.getTankName());
                otgTsp_Tank2.addItem(t.getTankName());
                otgUppg_Tank.addItem(t.getTankName());
            }
        }else{
            this.close();
        }
    }

    @Override
    public void componentClosed() {        

    }

    void writeProperties(java.util.Properties p) {        
        p.setProperty("version", "1.0");        
    }

    void readProperties(java.util.Properties p) {
        String version = p.getProperty("version");        
    }

    
    
    public void fillCounters(Long id, int permit){        
        if (em!=null){            
            Query query =em.createNamedQuery("ActCounters.findByActID");            
            query.setParameter("actID", id);
            actCnt = query.getResultList();
            actCounters = actCnt.get(0);
            em.refresh(actCounters);
            
            
            sirieStart_Volume.setText(String.format("%.1f", actCounters.getVolumeStartS()));
            sirieStart_Mass.setText(String.format("%.1f", actCounters.getMassStartS()));
            sirieStart_Temp.setText(String.format("%.1f", actCounters.getTempStartS()));
            sirieStart_Density.setText(String.format("%.4f", actCounters.getDensityStartS()));
            
            sirieEnd_Volume.setText(String.format("%.1f", actCounters.getVolumeEndS()));
            sirieEnd_Mass.setText(String.format("%.1f", actCounters.getMassEndS()));
            sirieEnd_Temp.setText(String.format("%.1f", actCounters.getTempEndS()));
            sirieEnd_Density.setText(String.format("%.4f", actCounters.getDensityEndS()));
            
            blfStart_Volume.setText(String.format("%.1f", actCounters.getVolumeStartB()));
            blfStart_Mass.setText(String.format("%.1f", actCounters.getMassStartB()));
            blfStart_Temp.setText(String.format("%.1f", actCounters.getTempStartB()));
            blfStart_Density.setText(String.format("%.4f", actCounters.getDensityStartB()));
            
            akdgStart_Volume.setText(String.format("%.1f", actCounters.getVolumeStartA()));
            akdgStart_Mass.setText(String.format("%.1f", actCounters.getMassStartA()));
            akdgStart_Temp.setText(String.format("%.1f", actCounters.getTempStartA()));
            akdgStart_Density.setText(String.format("%.4f", actCounters.getDensityStartA()));
            
            blfEnd_Volume.setText(String.format("%.1f", actCounters.getVolumeEndB()));
            blfEnd_Mass.setText(String.format("%.1f", actCounters.getMassEndB()));
            blfEnd_Temp.setText(String.format("%.1f", actCounters.getTempEndB()));
            blfEnd_Density.setText(String.format("%.4f", actCounters.getDensityEndB()));
            
            akdgEnd_Volume.setText(String.format("%.1f", actCounters.getVolumeEndA()));
            akdgEnd_Mass.setText(String.format("%.1f", actCounters.getMassEndA()));
            akdgEnd_Temp.setText(String.format("%.1f", actCounters.getTempEndA()));
            akdgEnd_Density.setText(String.format("%.4f", actCounters.getDensityEndA()));
            
            query = em.createNamedQuery("ActDensity20.findById");
            query.setParameter("id", id);
            actDensity_20 = query.getResultList();
            actDensity20 = actDensity_20.get(0);
            em.refresh(actDensity20);
            sirieStart_Density20.setText(String.format("%.4f", actDensity20.getSirieDensity20Start()));
            sirieEnd_Density20.setText(String.format("%.4f", actDensity20.getSirieDensity20End()));
            
            blfStart_Density20.setText(String.format("%.4f", actDensity20.getBlfDensity20Start()));
            blfEnd_Density20.setText(String.format("%.4f", actDensity20.getBlfDensity20End()));
            
            akdgStart_Density20.setText(String.format("%.4f", actDensity20.getAkdgDensity20Start()));
            akdgEnd_Density20.setText(String.format("%.4f", actDensity20.getAkdgDensity20End()));            
        }
    }        
    
    public void fillOtgData(Long id, int permit){
        if (em!=null){
            Query query = em.createNamedQuery("OTGToTSP.findByActIdOrder");
            query.setParameter("actID", id);
            query.setParameter("tankOrder", 1);
            List<OTGToTSP> listToTsp = query.getResultList();
            otgToTsp = listToTsp.get(0);
            
            old_OtgTspLevelEnd=new_OtgTspLevelEnd;
            new_OtgTspLevelEnd=otgToTsp.getFinishLevel();
            old_OtgTspVolumeEnd=new_OtgTspVolumeEnd;
            new_OtgTspVolumeEnd=otgToTsp.getEndVolume();
            old_OtgTspMassEnd=new_OtgTspMassEnd;
            new_OtgTspMassEnd=otgToTsp.getEndMass();
            old_OtgTspTempEnd=new_OtgTspTempEnd;
            new_OtgTspTempEnd=otgToTsp.getEndTemp().doubleValue();
            old_OtgTspDensityEnd=new_OtgTspDensityEnd;
            new_OtgTspDensityEnd=otgToTsp.getEndDensity().doubleValue();
            old_OtgTspDensity20End=new_OtgTspDensity20End;
            new_OtgTspDensity20End=otgToTsp.getEndDensity20().doubleValue();
            
            old_OtgTspLevelStart=new_OtgTspLevelStart;
            new_OtgTspLevelStart=otgToTsp.getStartLevel();
            old_OtgTspVolumeStart=new_OtgTspVolumeStart;
            new_OtgTspVolumeStart=otgToTsp.getStartVolume();
            old_OtgTspMassStart=new_OtgTspMassStart;
            new_OtgTspMassStart=otgToTsp.getStartMass();
            old_OtgTspTempStart=new_OtgTspTempStart;
            new_OtgTspTempStart=otgToTsp.getStartTemp().doubleValue();
            old_OtgTspDensityStart=new_OtgTspDensityStart;
            new_OtgTspDensityStart=otgToTsp.getStartDensity().doubleValue();
            old_OtgTspDensity20Start=new_OtgTspDensity20Start;
            new_OtgTspDensity20Start=otgToTsp.getStartDensity20().doubleValue();
            
            otgTspEnd_Level.setText(String.format("%.2f", new_OtgTspLevelEnd));
            otgTspEnd_Volume.setText(String.format("%.2f", new_OtgTspVolumeEnd));
            otgTspEnd_Mass.setText(String.format("%.2f", new_OtgTspMassEnd));
            otgTspEnd_Temp.setText(String.format("%.1f", new_OtgTspTempEnd));
            otgTspEnd_Density.setText(String.format("%.4f", new_OtgTspDensityEnd));
            otgTspEnd_Density20.setText(String.format("%.4f", new_OtgTspDensity20End));
            otgTspStart_Level.setText(String.format("%.2f", new_OtgTspLevelStart));
            otgTspStart_Volume.setText(String.format("%.2f", new_OtgTspVolumeStart));
            otgTspStart_Mass.setText(String.format("%.2f", new_OtgTspMassStart));
            otgTspStart_Temp.setText(String.format("%.1f", new_OtgTspTempStart));
            otgTspStart_Density.setText(String.format("%.4f", new_OtgTspDensityStart));
            otgTspStart_Density20.setText(String.format("%.4f", new_OtgTspDensity20Start));
            
            otgTspEnd_Level.setEnabled(permit==0);
            otgTspEnd_Temp.setEnabled(permit==0);
            otgTspEnd_Density.setEnabled(permit==0);
            otgTspStart_Level.setEnabled(permit==0);
            otgTspStart_Temp.setEnabled(permit==0);
            otgTspStart_Density.setEnabled(permit==0);
            otgTsp_Tank.setEnabled(permit==0);
            
            for (int i=0; i<listTank.size(); i++){
                if (otgToTsp.getTankID()==listTank.get(i).getTankId()){
                    old_OtgTspTank = new_OtgTspTank;
                    new_OtgTspTank = i;
                    otgTsp_Tank.setSelectedIndex(new_OtgTspTank);
                }
            }
            
            query.setParameter("actID", id);
            query.setParameter("tankOrder", 2);
            listToTsp = query.getResultList();
            otgToTsp1 = listToTsp.get(0);
            
            old_OtgTspLevelEnd1=new_OtgTspLevelEnd1;
            new_OtgTspLevelEnd1=otgToTsp1.getFinishLevel();
            old_OtgTspVolumeEnd1=new_OtgTspVolumeEnd1;
            new_OtgTspVolumeEnd1=otgToTsp1.getEndVolume();
            old_OtgTspMassEnd1=new_OtgTspMassEnd1;
            new_OtgTspMassEnd1=otgToTsp1.getEndMass();
            old_OtgTspTempEnd1=new_OtgTspTempEnd1;
            new_OtgTspTempEnd1=otgToTsp1.getEndTemp().doubleValue();
            old_OtgTspDensityEnd1=new_OtgTspDensityEnd1;
            new_OtgTspDensityEnd1=otgToTsp1.getEndDensity().doubleValue();
            old_OtgTspDensity20End1=new_OtgTspDensity20End1;
            new_OtgTspDensity20End1=otgToTsp1.getEndDensity20().doubleValue();
            
            old_OtgTspLevelStart1=new_OtgTspLevelStart1;
            new_OtgTspLevelStart1=otgToTsp1.getStartLevel();
            old_OtgTspVolumeStart1=new_OtgTspVolumeStart1;
            new_OtgTspVolumeStart1=otgToTsp1.getStartVolume();
            old_OtgTspMassStart1=new_OtgTspMassStart1;
            new_OtgTspMassStart1=otgToTsp1.getStartMass();
            old_OtgTspTempStart1=new_OtgTspTempStart1;
            new_OtgTspTempStart1=otgToTsp1.getStartTemp().doubleValue();
            old_OtgTspDensityStart1=new_OtgTspDensityStart1;
            new_OtgTspDensityStart1=otgToTsp1.getStartDensity().doubleValue();
            old_OtgTspDensity20Start1=new_OtgTspDensity20Start1;
            new_OtgTspDensity20Start1=otgToTsp1.getStartDensity20().doubleValue();
            
            otgTspEnd_Level1.setText(String.format("%.2f", new_OtgTspLevelEnd1));
            otgTspEnd_Volume1.setText(String.format("%.2f", new_OtgTspVolumeEnd1));
            otgTspEnd_Mass1.setText(String.format("%.2f", new_OtgTspMassEnd1));
            otgTspEnd_Temp1.setText(String.format("%.1f", new_OtgTspTempEnd1));
            otgTspEnd_Density1.setText(String.format("%.4f", new_OtgTspDensityEnd1));
            otgTspEnd_Density21.setText(String.format("%.4f", new_OtgTspDensity20End1));
            otgTspStart_Level1.setText(String.format("%.2f", new_OtgTspLevelStart1));
            otgTspStart_Volume1.setText(String.format("%.2f", new_OtgTspVolumeStart1));
            otgTspStart_Mass1.setText(String.format("%.2f", new_OtgTspMassStart1));
            otgTspStart_Temp1.setText(String.format("%.1f", new_OtgTspTempStart1));
            otgTspStart_Density1.setText(String.format("%.4f", new_OtgTspDensityStart1));
            otgTspStart_Density21.setText(String.format("%.4f", new_OtgTspDensity20Start1));
            
            otgTspEnd_Level1.setEnabled(permit==0);
            otgTspEnd_Temp1.setEnabled(permit==0);
            otgTspEnd_Density1.setEnabled(permit==0);
            otgTspStart_Level1.setEnabled(permit==0);
            otgTspStart_Temp1.setEnabled(permit==0);
            otgTspStart_Density1.setEnabled(permit==0);
            otgTsp_Tank1.setEnabled(permit==0);
            
            for (int i=0; i<listTank.size(); i++){
                if (otgToTsp1.getTankID()==listTank.get(i).getTankId()){
                    old_OtgTspTank1 = new_OtgTspTank1;
                    new_OtgTspTank1 = i;
                    otgTsp_Tank1.setSelectedIndex(new_OtgTspTank1);
                }
            }
            
            query.setParameter("actID", id);
            query.setParameter("tankOrder", 3);
            listToTsp = query.getResultList();
            otgToTsp2 = listToTsp.get(0);
            
            old_OtgTspLevelEnd2=new_OtgTspLevelEnd2;
            new_OtgTspLevelEnd2=otgToTsp2.getFinishLevel();
            old_OtgTspVolumeEnd2=new_OtgTspVolumeEnd2;
            new_OtgTspVolumeEnd2=otgToTsp2.getEndVolume();
            old_OtgTspMassEnd2=new_OtgTspMassEnd2;
            new_OtgTspMassEnd2=otgToTsp2.getEndMass();
            old_OtgTspTempEnd2=new_OtgTspTempEnd2;
            new_OtgTspTempEnd2=otgToTsp2.getEndTemp().doubleValue();
            old_OtgTspDensityEnd2=new_OtgTspDensityEnd2;
            new_OtgTspDensityEnd2=otgToTsp2.getEndDensity().doubleValue();
            old_OtgTspDensity20End2=new_OtgTspDensity20End2;
            new_OtgTspDensity20End2=otgToTsp2.getEndDensity20().doubleValue();
            
            old_OtgTspLevelStart2=new_OtgTspLevelStart2;
            new_OtgTspLevelStart2=otgToTsp2.getStartLevel();
            old_OtgTspVolumeStart2=new_OtgTspVolumeStart2;
            new_OtgTspVolumeStart2=otgToTsp2.getStartVolume();
            old_OtgTspMassStart2=new_OtgTspMassStart2;
            new_OtgTspMassStart2=otgToTsp2.getStartMass();
            old_OtgTspTempStart2=new_OtgTspTempStart2;
            new_OtgTspTempStart2=otgToTsp2.getStartTemp().doubleValue();
            old_OtgTspDensityStart2=new_OtgTspDensityStart2;
            new_OtgTspDensityStart2=otgToTsp2.getStartDensity().doubleValue();
            old_OtgTspDensity20Start2=new_OtgTspDensity20Start2;
            new_OtgTspDensity20Start2=otgToTsp2.getStartDensity20().doubleValue();
            
            otgTspEnd_Level2.setText(String.format("%.2f", new_OtgTspLevelEnd2));
            otgTspEnd_Volume2.setText(String.format("%.2f", new_OtgTspVolumeEnd2));
            otgTspEnd_Mass2.setText(String.format("%.2f", new_OtgTspMassEnd2));
            otgTspEnd_Temp2.setText(String.format("%.1f", new_OtgTspTempEnd2));
            otgTspEnd_Density2.setText(String.format("%.4f", new_OtgTspDensityEnd2));
            otgTspEnd_Density22.setText(String.format("%.4f", new_OtgTspDensity20End2));
            otgTspStart_Level2.setText(String.format("%.2f", new_OtgTspLevelStart2));
            otgTspStart_Volume2.setText(String.format("%.2f", new_OtgTspVolumeStart2));
            otgTspStart_Mass2.setText(String.format("%.2f", new_OtgTspMassStart2));
            otgTspStart_Temp2.setText(String.format("%.1f", new_OtgTspTempStart2));
            otgTspStart_Density2.setText(String.format("%.4f", new_OtgTspDensityStart2));
            otgTspStart_Density22.setText(String.format("%.4f", new_OtgTspDensity20Start2));
            
            otgTspEnd_Level2.setEnabled(permit==0);
            otgTspEnd_Temp2.setEnabled(permit==0);
            otgTspEnd_Density2.setEnabled(permit==0);
            otgTspStart_Level2.setEnabled(permit==0);
            otgTspStart_Temp2.setEnabled(permit==0);
            otgTspStart_Density2.setEnabled(permit==0);
            otgTsp_Tank2.setEnabled(permit==0);
            
            for (int i=0; i<listTank.size(); i++){
                if (otgToTsp2.getTankID()==listTank.get(i).getTankId()){
                    old_OtgTspTank2 = new_OtgTspTank1;
                    new_OtgTspTank2 = i;
                    otgTsp_Tank2.setSelectedIndex(new_OtgTspTank2);
                }
            }
            
            query = em.createNamedQuery("OTGToUPPG.findByActID");
            query.setParameter("actID", id);
            List<OTGToUPPG> listToUppg = query.getResultList();
            otgToUppg = listToUppg.get(0);
            old_OtgUppgLevelEnd=new_OtgUppgLevelEnd;
            new_OtgUppgLevelEnd=otgToUppg.getFinishLevel();
            old_OtgUppgVolumeEnd=new_OtgUppgVolumeEnd;
            new_OtgUppgVolumeEnd=otgToUppg.getEndVolume();
            old_OtgUppgMassEnd=new_OtgUppgMassEnd;
            new_OtgUppgMassEnd=otgToUppg.getEndMass();
            old_OtgUppgTempEnd=new_OtgUppgTempEnd;
            new_OtgUppgTempEnd=otgToUppg.getEndTemp().doubleValue();
            old_OtgUppgDensityEnd=new_OtgUppgDensityEnd;
            new_OtgUppgDensityEnd=otgToUppg.getEndDensity().doubleValue();
            old_OtgUppgDensity20End=new_OtgUppgDensity20End;
            new_OtgUppgDensity20End=otgToUppg.getEndDensity20().doubleValue();
            
            old_OtgUppgLevelStart=new_OtgUppgLevelStart;
            new_OtgUppgLevelStart=otgToUppg.getStartLevel();
            old_OtgUppgVolumeStart=new_OtgUppgVolumeStart;
            new_OtgUppgVolumeStart=otgToUppg.getStartVolume();
            old_OtgUppgMassStart=new_OtgUppgMassStart;
            new_OtgUppgMassStart=otgToUppg.getStartMass();
            old_OtgUppgTempStart=new_OtgUppgTempStart;
            new_OtgUppgTempStart=otgToUppg.getStartTemp().doubleValue();
            old_OtgUppgDensityStart=new_OtgUppgDensityStart;
            new_OtgUppgDensityStart=otgToUppg.getStartDensity().doubleValue();
            old_OtgUppgDensity20Start=new_OtgUppgDensity20Start;
            new_OtgUppgDensity20Start=otgToUppg.getStartDensity20().doubleValue();
            
            otgUppgEnd_Level.setText(String.format("%.2f", new_OtgUppgLevelEnd));
            otgUppgEnd_Volume.setText(String.format("%.2f", new_OtgUppgVolumeEnd));
            otgUppgEnd_Mass.setText(String.format("%.2f", new_OtgUppgMassEnd));
            otgUppgEnd_Temp.setText(String.format("%.2f", new_OtgUppgTempEnd));
            otgUppgEnd_Density.setText(String.format("%.4f", new_OtgUppgDensityEnd));
            otgUppgEnd_Density20.setText(String.format("%.4f", new_OtgUppgDensity20End));
            otgUppgStart_Level.setText(String.format("%.2f", new_OtgUppgLevelStart));
            otgUppgStart_Volume.setText(String.format("%.2f", new_OtgUppgVolumeStart));
            otgUppgStart_Mass.setText(String.format("%.2f", new_OtgUppgMassStart));
            otgUppgStart_Temp.setText(String.format("%.2f", new_OtgUppgTempStart));
            otgUppgStart_Density.setText(String.format("%.4f", new_OtgUppgDensityStart));
            otgUppgStart_Density20.setText(String.format("%.4f", new_OtgUppgDensity20Start));
            for (int i=0; i<listTank.size(); i++){
                if (otgToUppg.getTankID()==listTank.get(i).getTankId()){
                    old_OtgUppgTank = new_OtgUppgTank;
                    new_OtgUppgTank = i;
                    otgUppg_Tank.setSelectedIndex(new_OtgUppgTank);
                }
            }
            
            old_LoadVolume = new_LoadVolume;
            new_LoadVolume = otgToUppg.getLoadVolume();
            old_LoadMass = new_LoadMass;
            new_LoadMass = otgToUppg.getLoadMass()!=null ? otgToUppg.getLoadMass().doubleValue() : 0;
            old_LoadDensity = new_LoadDensity;
            new_LoadDensity = otgToUppg.getLoadDensity().doubleValue();
            old_LoadTemp = new_LoadTemp;
            new_LoadTemp = otgToUppg.getLoadTemp().doubleValue();
            old_LoadDensity20 = new_LoadDensity20;
            new_LoadDensity20 = otgToUppg.getLoadDensity20().doubleValue();
            
            otgLoad_Volume.setText(String.format("%.2f", new_LoadVolume));
            otgLoad_Mass.setText(String.format("%.2f", new_LoadMass));
            otgLoad_Density.setText(String.format("%.4f", new_LoadDensity));
            otgLoad_Temp.setText(String.format("%.2f", new_LoadTemp));
            otgLoad_Density20.setText(String.format("%.4f", new_LoadDensity20));
            
            otgUppgEnd_Level.setEnabled(permit==0);
            otgUppgEnd_Temp.setEnabled(permit==0);
            otgUppgEnd_Density.setEnabled(permit==0);
            otgUppgStart_Level.setEnabled(permit==0);
            otgUppgStart_Temp.setEnabled(permit==0);
            otgUppgStart_Density.setEnabled(permit==0);
            otgUppg_Tank.setEnabled(false);
            
            otgLoad_Volume.setEnabled(permit==0);
            otgLoad_Density.setEnabled(permit==0);
            otgLoad_Temp.setEnabled(permit==0);
        }
    }
    
    public void fillFeedData(Long id, int permit){
        Query query = em.createNamedQuery("UPPGFeedWater.findByActID");
        query.setParameter("actID", id);
        listFeedWater = query.getResultList();
        feedWater = listFeedWater.get(0);
        em.refresh(feedWater);
        old_FeedStart = new_FeedStart;
        new_FeedStart = feedWater.getStartData();
        old_FeedEnd = new_FeedEnd;
        new_FeedEnd = feedWater.getFinishData();
        old_Feed = new_Feed;
        new_Feed = feedWater.getShiftTotal();
        feedEnd_Volume.setEnabled(permit==0);
        feedStart_Volume.setEnabled(permit==0);
        feedEnd_Volume.setText(String.format("%d", new_FeedEnd));
        feedStart_Volume.setText(String.format("%d", new_FeedStart));
        feed_Water.setText(String.format("%d", new_Feed));
    }
    
    public void fillDrainData(Long id, int permit){
        Query query = em.createNamedQuery("UPPGDrainTank.findByActID");
        query.setParameter("actID", id);
        listDrainTank = query.getResultList();
        drainTank = listDrainTank.get(0);
        em.refresh(drainTank);
        old_DrainVolumeEnd = new_DrainVolumeEnd;
        new_DrainVolumeEnd = drainTank.getFinishLevel();
        drainEnd_Volume.setText(String.format("%d", new_DrainVolumeEnd));
        old_DrainVolumeStart = new_DrainVolumeStart;
        new_DrainVolumeStart = drainTank.getStartLevel();
        drainStart_Volume.setText(String.format("%d", new_DrainVolumeStart));
        old_DrainDensity = new_DrainDensity;
        new_DrainDensity = drainTank.getDensity().doubleValue();
        drain_Density.setText(String.format("%.4f", new_DrainDensity));
        old_DrainMass = new_DrainMass;
        new_DrainMass = drainTank.getMass().doubleValue();
        drain_Mass.setText(String.format("%.1f", new_DrainMass));
        old_Feed = new_Feed;
        drained_Water.setText(String.valueOf(new_Feed));
        drainEnd_Volume.setEnabled(permit==0);
        drainStart_Volume.setEnabled(permit==0);
        drain_Density.setEnabled(permit==0);
        old_drainedWater = new_drainedWater;
        new_drainedWater = drainTank.getDrained().doubleValue();
        drained_Water.setText(String.format("%.1f", new_drainedWater));
        drained_Water.setEnabled(permit==0);
        old_drainedBLF = new_drainedBLF;
        new_drainedBLF = drainTank.getDrainedBLF().doubleValue();
        drained_BLF.setText(String.format("%.1f", new_drainedBLF));
        drained_BLF.setEnabled(permit==0);
    }
    
    public void save() throws Exception{
        if (otgToUppg!=null && otgUppgDataChanged){
            OTGToUPPGJpaController otgUppgJpa = new OTGToUPPGJpaController(emf);
            //otgToUppg.setTankID(new_OtgUppgTank);
            otgToUppg.setStartLevel((long) new_OtgUppgLevelStart);
            otgToUppg.setStartVolume((long) new_OtgUppgVolumeStart);
            otgToUppg.setStartMass((long) new_OtgUppgMassStart);
            otgToUppg.setStartTemp(BigDecimal.valueOf(new_OtgUppgTempStart));
            otgToUppg.setStartDensity(BigDecimal.valueOf(new_OtgUppgDensityStart));
            otgToUppg.setStartDensity20(BigDecimal.valueOf(new_OtgUppgDensity20Start));
            otgToUppg.setFinishLevel((long) new_OtgUppgLevelEnd);
            otgToUppg.setEndVolume((long) new_OtgUppgVolumeEnd);
            otgToUppg.setEndMass((long) new_OtgUppgMassEnd);
            otgToUppg.setEndTemp(BigDecimal.valueOf(new_OtgUppgTempEnd));
            otgToUppg.setEndDensity(BigDecimal.valueOf(new_OtgUppgDensityEnd));
            otgToUppg.setEndDensity20(BigDecimal.valueOf(new_OtgUppgDensity20End));
            otgToUppg.setLoadVolume((long)new_LoadVolume);
            //otgToUppg.setLoadMass(BigDecimal.valueOf(new_LoadMass));
            otgToUppg.setLoadDensity(BigDecimal.valueOf(new_LoadDensity));
            otgToUppg.setLoadTemp(BigDecimal.valueOf(new_LoadTemp));
            otgToUppg.setLoadDensity20(BigDecimal.valueOf(new_LoadDensity20));
            otgUppgJpa.edit(otgToUppg);
        }
        if (otgTspDataChanged){
            OTGToTSPJpaController otgTspJpa = new OTGToTSPJpaController(emf);
            otgToTsp.setTankID(new_OtgTspTank);
            otgToTsp.setStartLevel((long) new_OtgTspLevelStart);
            otgToTsp.setStartVolume((long) new_OtgTspVolumeStart);
            otgToTsp.setStartMass((long) new_OtgTspMassStart);
            otgToTsp.setStartTemp(BigDecimal.valueOf(new_OtgTspTempStart));
            otgToTsp.setStartDensity(BigDecimal.valueOf(new_OtgTspDensityStart));
            otgToTsp.setStartDensity20(BigDecimal.valueOf(new_OtgTspDensity20Start));
            otgToTsp.setFinishLevel((long) new_OtgTspLevelEnd);
            otgToTsp.setEndVolume((long) new_OtgTspVolumeEnd);
            otgToTsp.setEndMass((long) new_OtgTspMassEnd);
            otgToTsp.setEndTemp(BigDecimal.valueOf(new_OtgTspTempEnd));
            otgToTsp.setEndDensity(BigDecimal.valueOf(new_OtgTspDensityEnd));
            otgToTsp.setEndDensity20(BigDecimal.valueOf(new_OtgTspDensity20End));
            otgToTsp.setTankOrder(1);
            otgTspJpa.edit(otgToTsp);
            otgToTsp1.setTankID(new_OtgTspTank1);
            otgToTsp1.setStartLevel((long) new_OtgTspLevelStart1);
            otgToTsp1.setStartVolume((long) new_OtgTspVolumeStart1);
            otgToTsp1.setStartMass((long) new_OtgTspMassStart1);
            otgToTsp1.setStartTemp(BigDecimal.valueOf(new_OtgTspTempStart1));
            otgToTsp1.setStartDensity(BigDecimal.valueOf(new_OtgTspDensityStart1));
            otgToTsp1.setStartDensity20(BigDecimal.valueOf(new_OtgTspDensity20Start1));
            otgToTsp1.setFinishLevel((long) new_OtgTspLevelEnd1);
            otgToTsp1.setEndVolume((long) new_OtgTspVolumeEnd1);
            otgToTsp1.setEndMass((long) new_OtgTspMassEnd1);
            otgToTsp1.setEndTemp(BigDecimal.valueOf(new_OtgTspTempEnd1));
            otgToTsp1.setEndDensity(BigDecimal.valueOf(new_OtgTspDensityEnd1));
            otgToTsp1.setEndDensity20(BigDecimal.valueOf(new_OtgTspDensity20End1));
            otgToTsp1.setTankOrder(2);
            otgTspJpa.edit(otgToTsp1);
            otgToTsp2.setTankID(new_OtgTspTank2);
            otgToTsp2.setStartLevel((long) new_OtgTspLevelStart2);
            otgToTsp2.setStartVolume((long) new_OtgTspVolumeStart2);
            otgToTsp2.setStartMass((long) new_OtgTspMassStart2);
            otgToTsp2.setStartTemp(BigDecimal.valueOf(new_OtgTspTempStart2));
            otgToTsp2.setStartDensity(BigDecimal.valueOf(new_OtgTspDensityStart2));
            otgToTsp2.setStartDensity20(BigDecimal.valueOf(new_OtgTspDensity20Start2));
            otgToTsp2.setFinishLevel((long) new_OtgTspLevelEnd2);
            otgToTsp2.setEndVolume((long) new_OtgTspVolumeEnd2);
            otgToTsp2.setEndMass((long) new_OtgTspMassEnd2);
            otgToTsp2.setEndTemp(BigDecimal.valueOf(new_OtgTspTempEnd2));
            otgToTsp2.setEndDensity(BigDecimal.valueOf(new_OtgTspDensityEnd2));
            otgToTsp2.setEndDensity20(BigDecimal.valueOf(new_OtgTspDensity20End2));
            otgToTsp2.setTankOrder(3);
            otgTspJpa.edit(otgToTsp2);
        }
        if (feedWater!=null){
            UPPGFeedWaterJpaController feedJpa = new UPPGFeedWaterJpaController(emf);
            feedWater.setFinishData(new_FeedEnd);
            feedWater.setStartData(new_FeedStart);
            feedJpa.edit(feedWater);
        }
        if (drainTank!=null){
            UPPGDrainTankJpaController drainJpa = new UPPGDrainTankJpaController(emf);
            drainTank.setFinishLevel(new_DrainVolumeEnd);
            drainTank.setStartLevel(new_DrainVolumeStart);
            drainTank.setDensity(BigDecimal.valueOf(old_DrainDensity));
            drainTank.setDrained(BigDecimal.valueOf(new_drainedWater));
            drainTank.setDrainedBLF(BigDecimal.valueOf(new_drainedBLF));
            drainJpa.edit(drainTank);
        }
    }            
    
    @Override
    public Lookup getLookup(){
        return this.lookup;
    }        
    
}
