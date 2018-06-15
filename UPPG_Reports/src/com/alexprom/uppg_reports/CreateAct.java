package com.alexprom.uppg_reports;


import com.alexprom.entities.dictionary.VPlotn20;
import com.alexprom.entities.process.ActCounters;
import com.alexprom.entities.process.ActDensity20;
import com.alexprom.entities.process.ActSirie;
import com.alexprom.entities.process.ActSirieMixing;
import com.alexprom.entities.process.ActUPPG;
import com.alexprom.entities.process.CountersDaq;
import com.alexprom.entities.process.OTGToTSP;
import com.alexprom.entities.process.OTGToUPPG;
import com.alexprom.entities.process.UPPGDrainTank;
import com.alexprom.entities.process.UPPGFeedWater;
import com.alexprom.entities.process.WasteGasesMax;
import com.alexprom.entities.service.ActCountersJpaController;
import com.alexprom.entities.service.ActDensity20JpaController;
import com.alexprom.entities.service.ActSirieJpaController;
import com.alexprom.entities.service.ActSirieMixingJpaController;
import com.alexprom.entities.service.ActUPPGJpaController;
import com.alexprom.entities.service.OTGToTSPJpaController;
import com.alexprom.entities.service.OTGToUPPGJpaController;
import com.alexprom.entities.service.UPPGDrainTankJpaController;
import com.alexprom.entities.service.UPPGFeedWaterJpaController;
import com.alexprom.entities.settings.GlobalEntityManager;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionReferences;
import org.openide.awt.ActionRegistration;
import org.openide.util.NbBundle.Messages;
import org.openide.windows.WindowManager;

@ActionID(
        category = "File",
        id = "com.alexprom.uppg_reports.CreateAct"
)
@ActionRegistration(
        iconBase = "com/alexprom/uppg_reports/new.gif",
        displayName = "#CTL_CreateAct"
)
@ActionReferences({
    @ActionReference(path = "Menu/File", position = 1200),
    @ActionReference(path = "Toolbars/File", position = 200)
})
@Messages("CTL_CreateAct=Создать акт")
public final class CreateAct implements ActionListener {
    private EntityManagerFactory emf = null;
    private EntityManager em = null;
    private Date repAct;
    private String dateStr;
    private int shift;
    private Long newActId, newActSirieId, newActDensity20Id, newActCountersId, newActOtgToTspId, newActOtgToUppgId, newActDrainTankId, newActFeedWaterId, newActSirieMixingId;
    private double new_SirieTempStart=0, new_SirieDensityStart=0, new_SirieDensity20Start=0;
    private double new_SirieVolumeStart=0, new_SirieMassStart=0;
    private double new_SirieVolumeEnd=0, new_SirieMassEnd=0;
    private double new_AkdgVolumeStart=0, new_AkdgMassStart=0;
    private double new_AkdgVolumeEnd=0, new_AkdgMassEnd=0;
    private double new_BlfVolumeStart=0, new_BlfMassStart=0;
    private double new_BlfVolumeEnd=0, new_BlfMassEnd=0;
    private double new_SirieTempEnd=0, new_SirieDensityEnd=0, new_SirieDensity20End=0;
    private double new_BlfTempStart=0, new_BlfDensityStart=0, new_BlfDensity20Start=0;
    private double new_BlfTempEnd=0, new_BlfDensityEnd=0, new_BlfDensity20End=0; 
    private double new_AkdgTempStart=0, new_AkdgDensityStart=0, new_AkdgDensity20Start=0;
    private double new_AkdgTempEnd=0, new_AkdgDensityEnd=0, new_AkdgDensity20End=0; 
    private double new_AkdgDensity=0, new_BLFDensity=0, new_OTGDensity=0, new_ProcessingDensity=0;
    private double new_SirieVolume=0, new_SirieMass=0;
    private double new_AkdgVolume=0, new_AkdgMass=0;
    private double new_BlfVolume=0, new_BlfMass=0;
    
    private boolean checkExist(){
        boolean exist;        
        int rep2 = 0;        
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
        //Определение номера отчетной смены    
        if (d1.after(d2) && !d1.after(d3)){
            shift=2;
            int curDay = d1.getDate();
            int yesterday = curDay-1;
            d1.setDate(yesterday);
        }else{
            shift=1;
        }
        dateStr = dateFormat.format(d1);
        Query query = em.createNamedQuery("ActUPPG.findByDateShift");
        query.setParameter("aDate", dateStr);
        query.setParameter("aShift", shift);
        List<ActUPPG> list = query.getResultList();
        exist = !list.isEmpty();
        if (!exist){
            repAct = d1;            
        }
        return exist;
    }
    
    private Long getNewActId() {        
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM ActUPPG a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id=null;
        }
        return id;
    }
    
    private Long getNewActSirieId() {        
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM ActSirie a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id=null;
        }
        return id;
    }
    
    private Long getNewActCountersId() {        
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM ActCounters a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id=null;
        }
        return id;
    }
    
    private Long getNewActDensity20Id() {        
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM ActDensity20 a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id=null;
        }
        return id;
    }
    
    private Long getNewActOtgToTspId() {        
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM OTGToTSP a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id=null;
        }
        return id;
    }
    
    private Long getNewActOtgToUppgId() {        
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM OTGToUPPG a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id=null;
        }
        return id;
    }
    
    private Long getNewActDrainTankId() {        
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM UPPGDrainTank a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id=null;
        }
        return id;
    }
    
    private Long getNewActFeedWaterId() {        
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM UPPGFeedWater a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id=null;
        }
        return id;
    }
    
    private Long getNewActSirieMixing(){
        Long id;
        Query query = em.createQuery("SELECT MAX(a.id) FROM ActSirieMixing a");
        Object maxId = query.getSingleResult();
        if (maxId!=null){
            id = (Long)maxId+1;
        }else{
            id = null;
        }
        return id;
    }
    
    private void createActUPPG() throws Exception{
        ActUPPG newAct = new ActUPPG();
        ActUPPGJpaController newActJpa = new ActUPPGJpaController(emf);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");        
        newAct.setId(newActId);
        newAct.setADate(dateFormat.format(repAct));
        newAct.setAShift(shift);
        Query query = em.createQuery("select v from WasteGasesMax v where v.aDate = '"+dateFormat.format(repAct)+"' AND v.aShift = "+String.valueOf(shift));
        List<WasteGasesMax> list = query.getResultList();
        if (!list.isEmpty()){
            newAct.setMaxValue(list.get(0).getMaxValue());
        }else{
            newAct.setMaxValue(BigDecimal.ZERO);
        }
        newActJpa.create(newAct);        
    }
    
    private void createActSirie() throws Exception{
        ActSirie newActSirie = new ActSirie();
        ActSirieJpaController newActSirieJpa = new ActSirieJpaController(emf);
        newActSirie.setId(newActSirieId);
        newActSirie.setActID(newActId);
        newActSirie.setComponent1("");
        newActSirie.setComponent2("");
        newActSirie.setComponent3("");
        newActSirie.setComponent4("");
        newActSirie.setComponent5("");
        newActSirie.setComponent6("");
        newActSirieJpa.create(newActSirie);
    }
    
    private BigDecimal getTagValue(String date, int shift, String tag_name){        
        Query query = em.createQuery("SELECT c FROM CountersDaq c WHERE c.daqDt = :daqDt AND c.shift = :shift AND c.tagName = :tagName");
        query.setParameter("daqDt", date);
        query.setParameter("shift", shift);
        query.setParameter("tagName", tag_name);
        List<CountersDaq> tag_value = query.getResultList();
        if (!tag_value.isEmpty()){
            return tag_value.get(0).getTagValue();
        }else{
            return BigDecimal.valueOf(0);
        }
        
    }
    
    private void createActCounters() throws Exception{
        ActCounters newActCounters = new ActCounters();
        ActCountersJpaController newActCountersJpa = new ActCountersJpaController(emf);                
        newActCounters.setId(newActSirieId);
        newActCounters.setActID(newActId);
        new_SirieVolumeStart = getTagValue(dateStr, shift, "Volume_Total_1.Value").doubleValue();
        newActCounters.setVolumeStartS(BigDecimal.valueOf(new_SirieVolumeStart));
        new_BlfVolumeStart = getTagValue(dateStr, shift, "Volume_Total_2.Value").doubleValue();
        newActCounters.setVolumeStartB(BigDecimal.valueOf(new_BlfVolumeStart));
        new_AkdgVolumeStart = getTagValue(dateStr, shift, "Volume_Total_3.Value").doubleValue();
        newActCounters.setVolumeStartA(BigDecimal.valueOf(new_AkdgVolumeStart));
        new_SirieMassStart = getTagValue(dateStr, shift, "Mass_Total_1.Value").doubleValue();
        newActCounters.setMassStartS(BigDecimal.valueOf(new_SirieMassStart));
        new_BlfMassStart = getTagValue(dateStr, shift, "Mass_Total_2.Value").doubleValue();
        newActCounters.setMassStartB(BigDecimal.valueOf(new_BlfMassStart));
        new_AkdgMassStart = getTagValue(dateStr, shift, "Mass_Total_3.Value").doubleValue();
        newActCounters.setMassStartA(BigDecimal.valueOf(new_AkdgMassStart));
        new_SirieTempStart = getTagValue(dateStr, shift, "Temperature_1.Value").doubleValue();
        newActCounters.setTempStartS(BigDecimal.valueOf(new_SirieTempStart));
        new_BlfTempStart = getTagValue(dateStr, shift, "Temperature_2.Value").doubleValue();
        newActCounters.setTempStartB(BigDecimal.valueOf(new_BlfTempStart));
        new_AkdgTempStart = getTagValue(dateStr, shift, "Temperature_3.Value").doubleValue();
        newActCounters.setTempStartA(BigDecimal.valueOf(new_AkdgTempStart));
        new_SirieDensityStart = getTagValue(dateStr, shift, "Density_1.Value").doubleValue();
        newActCounters.setDensityStartS(BigDecimal.valueOf(new_SirieDensityStart));        
        new_BlfDensityStart = getTagValue(dateStr, shift, "Density_2.Value").doubleValue();
        newActCounters.setDensityStartB(BigDecimal.valueOf(new_BlfDensityStart));        
        new_AkdgDensityStart = getTagValue(dateStr, shift, "Density_3.Value").doubleValue();
        newActCounters.setDensityStartA(BigDecimal.valueOf(new_AkdgDensityStart));
        newActCounters.setAKDGPercent(BigDecimal.ZERO);
        newActCounters.setBLFPercent(BigDecimal.ZERO);
        newActCounters.setOTGPercent(BigDecimal.ZERO);
        if (shift==1){
            new_SirieVolumeEnd = getTagValue(dateStr, 2, "Volume_Total_1.Value").doubleValue();
            newActCounters.setVolumeEndS(BigDecimal.valueOf(new_SirieVolumeEnd));
            new_BlfVolumeEnd = getTagValue(dateStr, 2, "Volume_Total_2.Value").doubleValue();
            newActCounters.setVolumeEndB(BigDecimal.valueOf(new_BlfVolumeEnd));
            new_AkdgVolumeEnd = getTagValue(dateStr, 2, "Volume_Total_3.Value").doubleValue();
            newActCounters.setVolumeEndA(BigDecimal.valueOf(new_AkdgVolumeEnd));
            new_SirieMassEnd = getTagValue(dateStr, 2, "Mass_Total_1.Value").doubleValue();
            newActCounters.setMassEndS(BigDecimal.valueOf(new_SirieMassEnd));
            new_BlfMassEnd = getTagValue(dateStr, 2, "Mass_Total_2.Value").doubleValue();
            newActCounters.setMassEndB(BigDecimal.valueOf(new_BlfMassEnd));
            new_AkdgMassEnd = getTagValue(dateStr, 2, "Mass_Total_3.Value").doubleValue();
            newActCounters.setMassEndA(BigDecimal.valueOf(new_AkdgMassEnd));
            new_SirieTempEnd = getTagValue(dateStr, 2, "Temperature_1.Value").doubleValue();
            newActCounters.setTempEndS(BigDecimal.valueOf(new_SirieTempEnd));
            new_BlfTempEnd = getTagValue(dateStr, 2, "Temperature_2.Value").doubleValue();
            newActCounters.setTempEndB(BigDecimal.valueOf(new_BlfTempEnd));
            new_AkdgTempEnd = getTagValue(dateStr, 2, "Temperature_3.Value").doubleValue();
            newActCounters.setTempEndA(BigDecimal.valueOf(new_AkdgTempEnd));
            new_SirieDensityEnd = getTagValue(dateStr, 2, "Density_1.Value").doubleValue();
            newActCounters.setDensityEndS(BigDecimal.valueOf(new_SirieDensityEnd));        
            new_BlfDensityEnd = getTagValue(dateStr, 2, "Density_2.Value").doubleValue();
            newActCounters.setDensityEndB(BigDecimal.valueOf(new_BlfDensityEnd));        
            new_AkdgDensityEnd = getTagValue(dateStr, 2, "Density_3.Value").doubleValue();
            newActCounters.setDensityEndA(BigDecimal.valueOf(new_AkdgDensityEnd));
        }else{
            Date next = new Date();
            next.setDate(repAct.getDate()+1);
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String nextDate = df.format(next);
            new_SirieVolumeEnd = getTagValue(nextDate, 1, "Volume_Total_1.Value").doubleValue();            
            newActCounters.setVolumeEndS(BigDecimal.valueOf(new_SirieVolumeEnd));
            new_BlfVolumeEnd = getTagValue(nextDate, 1, "Volume_Total_2.Value").doubleValue();
            newActCounters.setVolumeEndB(BigDecimal.valueOf(new_BlfVolumeEnd));
            new_AkdgVolumeEnd = getTagValue(nextDate, 1, "Volume_Total_3.Value").doubleValue();
            newActCounters.setVolumeEndA(BigDecimal.valueOf(new_AkdgVolumeEnd));
            new_SirieMassEnd = getTagValue(nextDate, 1, "Mass_Total_1.Value").doubleValue();
            newActCounters.setMassEndS(BigDecimal.valueOf(new_SirieMassEnd));
            new_BlfMassEnd = getTagValue(nextDate, 1, "Mass_Total_2.Value").doubleValue();
            newActCounters.setMassEndB(BigDecimal.valueOf(new_BlfMassEnd));
            new_AkdgMassEnd = getTagValue(nextDate, 1, "Mass_Total_3.Value").doubleValue();
            newActCounters.setMassEndA(BigDecimal.valueOf(new_AkdgMassEnd));
            new_SirieTempEnd = getTagValue(nextDate, 1, "Temperature_1.Value").doubleValue();
            newActCounters.setTempEndS(BigDecimal.valueOf(new_SirieTempEnd));
            new_BlfTempEnd = getTagValue(nextDate, 1, "Temperature_2.Value").doubleValue();
            newActCounters.setTempEndB(BigDecimal.valueOf(new_BlfTempEnd));
            new_AkdgTempEnd = getTagValue(nextDate, 1, "Temperature_3.Value").doubleValue();
            newActCounters.setTempEndA(BigDecimal.valueOf(new_AkdgTempEnd));
            new_SirieDensityEnd = getTagValue(nextDate, 1, "Density_1.Value").doubleValue();
            newActCounters.setDensityEndS(BigDecimal.valueOf(new_SirieDensityEnd));        
            new_BlfDensityEnd = getTagValue(nextDate, 1, "Density_2.Value").doubleValue();
            newActCounters.setDensityEndB(BigDecimal.valueOf(new_BlfDensityEnd));        
            new_AkdgDensityEnd = getTagValue(nextDate, 1, "Density_3.Value").doubleValue();
            newActCounters.setDensityEndA(BigDecimal.valueOf(new_AkdgDensityEnd));
        }
        new_SirieVolume = new_SirieVolumeEnd-new_SirieVolumeStart;
        new_BlfVolume = new_BlfVolumeEnd-new_BlfVolumeStart;
        new_AkdgVolume = new_AkdgVolumeEnd-new_AkdgVolumeStart;
        
        new_SirieMass = new_SirieMassEnd-new_SirieMassStart;
        new_BlfMass = new_BlfMassEnd-new_BlfMassStart;
        new_AkdgMass = new_AkdgMassEnd-new_AkdgMassStart;
        
        if (new_SirieVolume!=0){
            new_ProcessingDensity = new_SirieMass/new_SirieVolume;
        }
        newActCounters.setProcessingDinsity(BigDecimal.valueOf(new_ProcessingDensity));
        if (new_BlfVolume!=0){
            new_BLFDensity = new_BlfMass/new_BlfVolume;
        }
        newActCounters.setBLFDensity(BigDecimal.valueOf(new_BLFDensity));
        if (new_AkdgVolume!=0){
            new_AkdgDensity = new_AkdgMass/new_AkdgVolume;
        }
        newActCounters.setAKDGDensity(BigDecimal.valueOf(new_AkdgDensity));
        newActCounters.setOTGDensity(BigDecimal.ZERO);
        
        newActCountersJpa.create(newActCounters);
    }
        
    private BigDecimal getDensity20(Double density, Double temperature){
        BigDecimal density20;
        String str = "SELECT v FROM VPlotn20 v WHERE v.plotn like '"+String.format("%.3f", density).replace(",", ".")+"%' AND v.temperName = "+String.format("%d", Math.round(temperature));
        Query query = em.createQuery(str);
        List<VPlotn20> list = query.getResultList();                
        if (!list.isEmpty()){
            density20 = BigDecimal.valueOf(Double.parseDouble(list.get(0).getPlotn20().replace(",", ".")));
        }else{
            density20 = BigDecimal.valueOf(0);
        }
        return density20;
    }
    
    private void createActDensity20() throws Exception{
        ActDensity20 newActDensity20 = new ActDensity20();
        ActDensity20JpaController newActDensity20Jpa = new ActDensity20JpaController(emf);                
        newActDensity20.setId(newActDensity20Id);
        newActDensity20.setActID(newActId);
        new_SirieDensity20Start = getDensity20(new_SirieDensityStart, new_SirieTempStart).doubleValue();
        newActDensity20.setSirieDensity20Start(BigDecimal.valueOf(new_SirieDensity20Start));
        new_BlfDensity20Start = getDensity20(new_BlfDensityStart, new_BlfTempStart).doubleValue();
        newActDensity20.setBlfDensity20Start(BigDecimal.valueOf(new_BlfDensity20Start));
        new_AkdgDensity20Start = getDensity20(new_AkdgDensityStart, new_AkdgTempStart).doubleValue();
        newActDensity20.setAkdgDensity20Start(BigDecimal.valueOf(new_AkdgDensity20Start));        
        new_SirieDensity20End = getDensity20(new_SirieDensityEnd, new_SirieTempEnd).doubleValue();
        newActDensity20.setSirieDensity20End(BigDecimal.valueOf(new_SirieDensity20End));
        new_BlfDensity20End = getDensity20(new_BlfDensityEnd, new_BlfTempEnd).doubleValue();
        newActDensity20.setBlfDensity20End(BigDecimal.valueOf(new_BlfDensity20End));
        new_AkdgDensity20End = getDensity20(new_AkdgDensityEnd, new_AkdgTempEnd).doubleValue();
        newActDensity20.setAkdgDensity20End(BigDecimal.valueOf(new_AkdgDensity20End));        
        newActDensity20Jpa.create(newActDensity20);
    }
    
    private void createActOtgToTsp() throws Exception{
        
        OTGToTSPJpaController newOTGToTSPJpa = new OTGToTSPJpaController(emf);
        for (int i=0; i<3; i++){
            OTGToTSP newActOtgToTsp = new OTGToTSP();
            newActOtgToTsp.setId(getNewActOtgToTspId());
            newActOtgToTsp.setActID(newActId);
            newActOtgToTsp.setTankID(0);
            newActOtgToTsp.setStartLevel(0);
            newActOtgToTsp.setStartVolume(0);
            newActOtgToTsp.setStartMass(0);
            newActOtgToTsp.setStartTemp(BigDecimal.ZERO);
            newActOtgToTsp.setStartDensity(BigDecimal.ZERO);
            newActOtgToTsp.setStartDensity20(BigDecimal.ZERO);
            newActOtgToTsp.setFinishLevel(0);
            newActOtgToTsp.setEndVolume(0);
            newActOtgToTsp.setEndMass(0);
            newActOtgToTsp.setEndTemp(BigDecimal.ZERO);
            newActOtgToTsp.setEndDensity(BigDecimal.ZERO);
            newActOtgToTsp.setEndDensity20(BigDecimal.ZERO);
            newActOtgToTsp.setTankOrder(i+1);
            newOTGToTSPJpa.create(newActOtgToTsp);
        }
    }
    
    private void createActOtgToUppg() throws Exception{
        OTGToUPPG newActOtgToUppg = new OTGToUPPG();
        OTGToUPPGJpaController newOTGToUPPGJpa = new OTGToUPPGJpaController(emf);
        newActOtgToUppg.setId(newActOtgToUppgId);
        newActOtgToUppg.setActID(newActId);
        newActOtgToUppg.setTankID(78);
        newActOtgToUppg.setStartLevel(0);
        newActOtgToUppg.setStartVolume(0);
        newActOtgToUppg.setStartMass(0);
        newActOtgToUppg.setStartTemp(BigDecimal.ZERO);
        newActOtgToUppg.setStartDensity(BigDecimal.ZERO);
        newActOtgToUppg.setStartDensity20(BigDecimal.ZERO);
        newActOtgToUppg.setFinishLevel(0);
        newActOtgToUppg.setEndVolume(0);
        newActOtgToUppg.setEndMass(0);
        newActOtgToUppg.setEndTemp(BigDecimal.ZERO);
        newActOtgToUppg.setEndDensity(BigDecimal.ZERO);
        newActOtgToUppg.setEndDensity20(BigDecimal.ZERO);
        newOTGToUPPGJpa.create(newActOtgToUppg);
    }
    
    private void createUppgDrainTank() throws Exception{
        UPPGDrainTank newActDrainTank = new UPPGDrainTank();
        UPPGDrainTankJpaController newUPPGDrainTankJpa = new UPPGDrainTankJpaController(emf);
        newActDrainTank.setId(newActDrainTankId);
        newActDrainTank.setActID(newActId);
        //Получение данных на конец предыдущей смены и запись их на начало текущей
        UPPGDrainTank prevActDrainTank = new UPPGDrainTank();
        Query query = em.createNamedQuery("UPPGDrainTank.findByActID");
        query.setParameter("actID", newActId-1);
        List<UPPGDrainTank> list = query.getResultList();
        prevActDrainTank = list.get(0);
        if (prevActDrainTank!=null){
            newActDrainTank.setStartLevel(prevActDrainTank.getFinishLevel());
            newActDrainTank.setFinishLevel(prevActDrainTank.getFinishLevel());            
        }else{
            newActDrainTank.setStartLevel(0);
            newActDrainTank.setFinishLevel(0);
        }
        newActDrainTank.setDensity(BigDecimal.ZERO);
        newActDrainTank.setDrained(BigDecimal.ZERO);
        newActDrainTank.setDrainedBLF(BigDecimal.ZERO);
        newUPPGDrainTankJpa.create(newActDrainTank);
    }
    
    private void createUppgFeedWater() throws Exception{
        UPPGFeedWater newActFeedWater = new UPPGFeedWater();
        UPPGFeedWaterJpaController newFeedWaterJpa = new UPPGFeedWaterJpaController(emf);
        newActFeedWater.setId(newActFeedWaterId);
        newActFeedWater.setActID(newActId);
        //Получение данных на конец предыдущей смены и запись их на начало текущей
        UPPGFeedWater prevActFeedWater = new UPPGFeedWater();
        Query query = em.createNamedQuery("UPPGFeedWater.findByActID");
        query.setParameter("actID", newActId-1);
        List<UPPGFeedWater> list = query.getResultList();
        prevActFeedWater = list.get(0);
        if (prevActFeedWater!=null){
            newActFeedWater.setStartData(prevActFeedWater.getFinishData());
            newActFeedWater.setFinishData(prevActFeedWater.getFinishData());
        }else{
            newActFeedWater.setStartData(0);
            newActFeedWater.setFinishData(0);
        }
        newFeedWaterJpa.create(newActFeedWater);
    }
    
    private void createActSirieMixing() throws Exception{
        ActSirieMixing newActSirieMixing = new ActSirieMixing();
        ActSirieMixingJpaController newSirieMixingJpa = new ActSirieMixingJpaController(emf);
        newActSirieMixing.setId(newActSirieMixingId);
        newActSirieMixing.setActID(newActId);
        newActSirieMixing.setSirieVolume(BigDecimal.ZERO);
        newActSirieMixing.setSirieDensity(BigDecimal.ZERO);
        newSirieMixingJpa.create(newActSirieMixing);        
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        updatePersistence();
        if (em!=null){
        //Проверка, открыт ли акт на редактирование
        if (!checkExist()){
            NotifyDescriptor create = new NotifyDescriptor.Confirmation("Акт за предыдущую смену не существует!!! Создать?", "Новый акт");
            Object result = DialogDisplayer.getDefault().notify(create);
            if (result==NotifyDescriptor.YES_OPTION){
                try{                    
                    newActId = getNewActId();
                    newActSirieId = getNewActSirieId();
                    newActCountersId = getNewActCountersId();
                    newActDensity20Id = getNewActDensity20Id();                    
                    newActOtgToUppgId = getNewActOtgToUppgId();
                    newActDrainTankId = getNewActDrainTankId();
                    newActFeedWaterId = getNewActFeedWaterId();
                    newActSirieMixingId = getNewActSirieMixing();
                    createActUPPG();
                    createActSirie();
                    createActCounters();
                    createActDensity20();
                    createActOtgToTsp();
                    createActOtgToUppg();
                    createUppgDrainTank();
                    createUppgFeedWater();
                    createActSirieMixing();
                    NotifyDescriptor done = new NotifyDescriptor.Confirmation("Акт за предыдущую смену создан успешно!!! Открыть для редактирвоания?");
                    Object resultDone = DialogDisplayer.getDefault().notify(done);  
                    if (resultDone==NotifyDescriptor.YES_OPTION){
                        sirieDataTopComponent tc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
                        tc.setActParams(repAct, shift);
                        commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
                        ctc.setAct(repAct, shift);
                        additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");
                        atc.setAct(repAct, shift);
                        if (!tc.isOpened() || !ctc.isOpened() || !atc.isOpened()){
                            NotifyDescriptor d = new NotifyDescriptor.Confirmation("Открыть окна отображения данных акта?", "Открыть акт");
                            Object open = DialogDisplayer.getDefault().notify(d);
                            if (open==NotifyDescriptor.YES_OPTION){
                                if (!tc.isOpened()){
                                    tc.open();
                                }
                                if (!ctc.isOpened()){
                                    ctc.open();
                                }
                                if (!atc.isOpened()){
                                    atc.open();
                                }
                            }
                        }
                    }
                }catch (Exception ex){
                    NotifyDescriptor error = new NotifyDescriptor.Confirmation(ex.getLocalizedMessage());
                    Object resultDone = DialogDisplayer.getDefault().notify(error);  
                }
            }
        }else{
            NotifyDescriptor already = new NotifyDescriptor.Message("Акт за предыдущую смену уже существует!!!", NotifyDescriptor.WARNING_MESSAGE);
            Object result = DialogDisplayer.getDefault().notify(already);
        }
        }else{
            NotifyDescriptor d = new NotifyDescriptor.Message("Не установлена связь с базой данных. Выполните настройки соединения и повторите попытку.", NotifyDescriptor.ERROR_MESSAGE);
            Object result = DialogDisplayer.getDefault().notify(d);
        }
    }
    
    public void updatePersistence(){        
        GlobalEntityManager gem = new GlobalEntityManager();
        emf = gem.getEmf();
        em = gem.getEm();
    }
}
