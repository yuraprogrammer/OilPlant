package com.alexprom.uppg_reports;


import com.alexprom.entities.dictionary.VPlotn20;
import com.alexprom.entities.process.ActCounters;
import com.alexprom.entities.process.ActDensity20;
import com.alexprom.entities.process.ActSirie;
import com.alexprom.entities.process.ActUPPG;
import com.alexprom.entities.process.CountersDaq;
import com.alexprom.entities.process.OTGToTSP;
import com.alexprom.entities.process.OTGToUPPG;
import com.alexprom.entities.process.UPPGDrainTank;
import com.alexprom.entities.process.UPPGFeedWater;
import com.alexprom.entities.service.ActCountersJpaController;
import com.alexprom.entities.service.ActDensity20JpaController;
import com.alexprom.entities.service.ActSirieJpaController;
import com.alexprom.entities.service.ActUPPGJpaController;
import com.alexprom.entities.service.OTGToTSPJpaController;
import com.alexprom.entities.service.OTGToUPPGJpaController;
import com.alexprom.entities.service.UPPGDrainTankJpaController;
import com.alexprom.entities.service.UPPGFeedWaterJpaController;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
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
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProcessDictionaryPU");
    private EntityManager em = emf.createEntityManager();
    private Date repAct;
    private String dateStr;
    private int shift;
    private Long newActId, newActSirieId, newActDensity20Id, newActCountersId, newActOtgToTspId, newActOtgToUppgId, newActDrainTankId, newActFeedWaterId;
    private double new_SirieTempStart=0, new_SirieDensityStart=0, new_SirieDensity20Start=0;
    private double new_SirieTempEnd=0, new_SirieDensityEnd=0, new_SirieDensity20End=0;
    private double new_BlfTempStart=0, new_BlfDensityStart=0, new_BlfDensity20Start=0;
    private double new_BlfTempEnd=0, new_BlfDensityEnd=0, new_BlfDensity20End=0; 
    private double new_AkdgTempStart=0, new_AkdgDensityStart=0, new_AkdgDensity20Start=0;
    private double new_AkdgTempEnd=0, new_AkdgDensityEnd=0, new_AkdgDensity20End=0; 
    
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
    
    private void createActUPPG() throws Exception{
        ActUPPG newAct = new ActUPPG();
        ActUPPGJpaController newActJpa = new ActUPPGJpaController(emf);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");        
        newAct.setId(newActId);
        newAct.setADate(dateFormat.format(repAct));
        newAct.setAShift(shift);
        newActJpa.create(newAct);        
    }
    
    private void createActSirie() throws Exception{
        ActSirie newActSirie = new ActSirie();
        ActSirieJpaController newActSirieJpa = new ActSirieJpaController(emf);
        newActSirie.setId(newActSirieId);
        newActSirie.setActID(newActId);        
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
        newActCounters.setVolumeStartS(getTagValue(dateStr, shift, "Volume_Total_1.Value"));
        newActCounters.setVolumeStartB(getTagValue(dateStr, shift, "Volume_Total_2.Value"));
        newActCounters.setVolumeStartA(getTagValue(dateStr, shift, "Volume_Total_3.Value"));
        newActCounters.setMassStartS(getTagValue(dateStr, shift, "Mass_Total_1.Value"));
        newActCounters.setMassStartB(getTagValue(dateStr, shift, "Mass_Total_2.Value"));
        newActCounters.setMassStartA(getTagValue(dateStr, shift, "Mass_Total_3.Value"));
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
            newActCounters.setVolumeEndS(getTagValue(dateStr, 2, "Volume_Total_1.Value"));
            newActCounters.setVolumeEndB(getTagValue(dateStr, 2, "Volume_Total_2.Value"));
            newActCounters.setVolumeEndA(getTagValue(dateStr, 2, "Volume_Total_3.Value"));
            newActCounters.setMassEndS(getTagValue(dateStr, 2, "Mass_Total_1.Value"));
            newActCounters.setMassEndB(getTagValue(dateStr, 2, "Mass_Total_2.Value"));
            newActCounters.setMassEndA(getTagValue(dateStr, 2, "Mass_Total_3.Value"));            
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
            newActCounters.setVolumeEndS(getTagValue(nextDate, 1, "Volume_Total_1.Value"));
            newActCounters.setVolumeEndB(getTagValue(nextDate, 1, "Volume_Total_2.Value"));
            newActCounters.setVolumeEndA(getTagValue(nextDate, 1, "Volume_Total_3.Value"));
            newActCounters.setMassEndS(getTagValue(nextDate, 1, "Mass_Total_1.Value"));
            newActCounters.setMassEndB(getTagValue(nextDate, 1, "Mass_Total_2.Value"));
            newActCounters.setMassEndA(getTagValue(nextDate, 1, "Mass_Total_3.Value"));
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
        newUPPGDrainTankJpa.create(newActDrainTank);
    }
    
    private void createUppgFeedWater() throws Exception{
        UPPGFeedWater newActFeedWater = new UPPGFeedWater();
        UPPGFeedWaterJpaController newFeedWaterJpa = new UPPGFeedWaterJpaController(emf);
        newActFeedWater.setId(newActFeedWaterId);
        newActFeedWater.setActID(newActId);        
        newFeedWaterJpa.create(newActFeedWater);
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        //Проверка, открыт ли акт на редактирование
        if (!checkExist()){
            NotifyDescriptor create = new NotifyDescriptor.Confirmation("Акт за предыдущую смену не существует!!! Создать?");
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
                    createActUPPG();
                    createActSirie();
                    createActCounters();
                    createActDensity20();
                    createActOtgToTsp();
                    createActOtgToUppg();
                    createUppgDrainTank();
                    createUppgFeedWater();                    
                    NotifyDescriptor done = new NotifyDescriptor.Confirmation("Акт за предыдущую смену с идентификатором "+String.valueOf(newActId)+"создан успешно!!! Открыть для редактирвоания?");
                    Object resultDone = DialogDisplayer.getDefault().notify(done);  
                    if (resultDone==NotifyDescriptor.YES_OPTION){
                        sirieDataTopComponent rtc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
                        rtc.setAct(repAct, shift);
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
    }
}
