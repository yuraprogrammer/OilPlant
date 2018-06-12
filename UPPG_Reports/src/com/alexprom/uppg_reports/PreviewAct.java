/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.uppg_reports;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import org.openide.DialogDescriptor;
import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionReferences;
import org.openide.awt.ActionRegistration;
import org.openide.util.Exceptions;
import org.openide.util.NbBundle.Messages;
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

    @Override
    public void actionPerformed(ActionEvent e) {
        sirieDataTopComponent tc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
        if (tc.getAct()!=null){
            NotifyDescriptor s = new NotifyDescriptor.Confirmation("Сохранить изменения перед выводом на печать?", "Печать акта");
            Object close = DialogDisplayer.getDefault().notify(s);
            if (close!=null && close==NotifyDescriptor.YES_OPTION){
                try {
                    commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
                    additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");
                    tc.save();
                    ctc.save();
                    atc.save();
                    NotifyDescriptor ok = new NotifyDescriptor.Message("Сохранение выполнено успешно!!!", NotifyDescriptor.INFORMATION_MESSAGE);
                    Object okResult = DialogDisplayer.getDefault().notify(ok);
                } catch (Exception ex) {
                    Exceptions.printStackTrace(ex);
                    NotifyDescriptor err = new NotifyDescriptor.Message("Сохранение не выполнено!!!", NotifyDescriptor.ERROR_MESSAGE);
                    Object errResult = DialogDisplayer.getDefault().notify(err);
                }
            }
            UPPG_ShiftReport frm = new UPPG_ShiftReport(tc.getEntityManager(), tc.getAct().getId());            
        }else{
            NotifyDescriptor d = new NotifyDescriptor.Message("Для просмотра отчета, должен быть открыт акт!!! Открыть акт для печати?" , NotifyDescriptor.OK_CANCEL_OPTION);
            Object result = DialogDisplayer.getDefault().notify(d);
            if (result!=null && result==NotifyDescriptor.OK_OPTION){
                dlgOpenAct frm = new dlgOpenAct();
                DialogDescriptor dd = new DialogDescriptor(frm, "Выберите дату и смену", true,
                DialogDescriptor.OK_CANCEL_OPTION, DialogDescriptor.OK_OPTION, null);
                Object res = DialogDisplayer.getDefault().notify(dd);
                if (null != res && DialogDescriptor.OK_OPTION == res) {
                    tc.setAct(frm.getActDate(), frm.getActShift());
                    commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
                    ctc.setAct(frm.getActDate(), frm.getActShift());
                    additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");
                    atc.setAct(frm.getActDate(), frm.getActShift());
                    UPPG_ShiftReport frm2;
                    frm2 = new UPPG_ShiftReport(tc.getEntityManager(), tc.getAct().getId());
                }
            }
        }
    }
}
