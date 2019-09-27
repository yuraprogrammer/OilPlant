/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.uppg_reports;

import com.alexprom.entities.process.ActUPPG;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.persistence.EntityManager;
import org.openide.DialogDescriptor;
import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionReferences;
import org.openide.awt.ActionRegistration;
import org.openide.util.Exceptions;
import org.openide.util.NbBundle.Messages;
import org.openide.util.NbPreferences;
import org.openide.windows.WindowManager;

@ActionID(
        category = "Help",
        id = "com.alexprom.uppg_reports.PreviewAct"
)
@ActionRegistration(
        iconBase = "com/alexprom/uppg_reports/printer.png",
        displayName = "#CTL_PreviewAct"
)
@ActionReferences({
    @ActionReference(path = "Menu/File", position = 1750),
    @ActionReference(path = "Toolbars/File", position = 500)
})
@Messages("CTL_PreviewAct=Печатать акт...")
public final class PreviewAct implements ActionListener {

    private int getPermissive(){
        int notPermit=1;
        String userName = NbPreferences.forModule(Installer.class).get("userName", "");
        String userPassword = NbPreferences.forModule(Installer.class).get("userPassword", "");
        if (userName.equals("operator") & userPassword.equals("operator")){
            notPermit = 0;
        }
        return notPermit;
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        sirieDataTopComponent tc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
        commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
        additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");
        ActUPPG act = tc.getAct();
        EntityManager em = tc.getEntityManager();
        if (em!=null){
        if (act!=null){
//            em.refresh(act);
            int permit = act.getComplete();
            if (getPermissive()==0){
            if (permit==0){
                NotifyDescriptor s = new NotifyDescriptor.Confirmation("После вывода на печать, акт станет доступен только для просмотра. "
                                                                    + "Убедитесь, что все данные введены корректно. Печатать?", "Финализация акта");
                Object finalizationConfirm = DialogDisplayer.getDefault().notify(s);
                if (finalizationConfirm==NotifyDescriptor.YES_OPTION){
                    try {
                        tc.save();
                        ctc.save(1);
                        atc.save();
                        NotifyDescriptor ok = new NotifyDescriptor.Message("Финализация выполнена успешно!!!", NotifyDescriptor.INFORMATION_MESSAGE);
                        Object okResult = DialogDisplayer.getDefault().notify(ok);                    
                        
                    } catch (Exception ex) {                        
                        NotifyDescriptor err = new NotifyDescriptor.Message("Финализация не выполнена!!!", NotifyDescriptor.ERROR_MESSAGE);
                        Object errResult = DialogDisplayer.getDefault().notify(err);                    
                    }
                }
            }}
            ctc.fillSirie(act.getId(), 1);
            ctc.fillMixingSirie(act.getId(), 1);
            tc.fillCounters(act.getId(), 1);
            tc.fillDrainData(act.getId(), 1);
            tc.fillFeedData(act.getId(), 1);
            tc.fillOtgData(act.getId(), 1);                    
            UPPG_ShiftReport frm = new UPPG_ShiftReport(tc.getEntityManager(), act.getId());            
        }else{
            NotifyDescriptor d = new NotifyDescriptor.Message("Для просмотра отчета, должен быть открыт акт!!! Открыть акт для печати?" , NotifyDescriptor.OK_CANCEL_OPTION);
            Object result = DialogDisplayer.getDefault().notify(d);
            if (result!=null && result==NotifyDescriptor.OK_OPTION){
                dlgOpenAct frm = new dlgOpenAct();
                DialogDescriptor dd = new DialogDescriptor(frm, "Выберите дату и смену", true,
                DialogDescriptor.OK_CANCEL_OPTION, DialogDescriptor.OK_OPTION, null);
                Object res = DialogDisplayer.getDefault().notify(dd);
                if (null != res && DialogDescriptor.OK_OPTION == res) {
                    tc.setActParams(frm.getActDate(), frm.getActShift());
                    ctc.setAct(frm.getActDate(), frm.getActShift());
                    atc.setAct(frm.getActDate(), frm.getActShift());                    
                    act = tc.getAct();
                    em.refresh(act);
                    if (act.getComplete()==0){
                        NotifyDescriptor s = new NotifyDescriptor.Confirmation("Выбранный акт сохранен, но не финализирован."
                                                                             + "После вывода на печать, акт станет доступен только для просмотра. "
                                                                             + "Печатать?", "Финализация акта");
                        Object finalizationConfirm = DialogDisplayer.getDefault().notify(s);
                        if (finalizationConfirm==NotifyDescriptor.YES_OPTION){
                            try {
                                ctc.save(1);
                                ctc.fillSirie(act.getId(), 1);
                                ctc.fillMixingSirie(act.getId(), 1);
                                tc.fillCounters(act.getId(), 1);
                                tc.fillDrainData(act.getId(), 1);
                                tc.fillFeedData(act.getId(), 1);
                                tc.fillOtgData(act.getId(), 1);
                                tc.save();
                                atc.save();
                                NotifyDescriptor ok = new NotifyDescriptor.Message("Финализация выполнена успешно!!!", NotifyDescriptor.INFORMATION_MESSAGE);
                                Object okResult = DialogDisplayer.getDefault().notify(ok);
                            } catch (Exception ex) {
                                Exceptions.printStackTrace(ex);
                                NotifyDescriptor err = new NotifyDescriptor.Message("Финализация не выполнена!!!", NotifyDescriptor.ERROR_MESSAGE);
                                Object errResult = DialogDisplayer.getDefault().notify(err);
                                return;
                            }
                        } 
                    }
                    UPPG_ShiftReport frm2;
                    frm2 = new UPPG_ShiftReport(tc.getEntityManager(), act.getId());
                }
            }
        }
        }else{
            NotifyDescriptor d = new NotifyDescriptor.Message("Не установлена связь с базой данных. Выполните настройки соединения и повторите попытку.", NotifyDescriptor.ERROR_MESSAGE);
            Object result = DialogDisplayer.getDefault().notify(d);
        }
    }
}
