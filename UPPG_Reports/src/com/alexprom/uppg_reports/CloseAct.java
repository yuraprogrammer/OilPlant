/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.uppg_reports;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionRegistration;
import org.openide.util.Exceptions;
import org.openide.util.NbBundle.Messages;
import org.openide.windows.WindowManager;

@ActionID(
        category = "File",
        id = "com.alexprom.uppg_reports.CloseAct"
)
@ActionRegistration(
        iconBase = "com/alexprom/uppg_reports/exit.png",
        displayName = "#CTL_CloseAct"
)
@ActionReference(path = "Menu/File", position = 1450)
@Messages("CTL_CloseAct=Закрыть акт")
public final class CloseAct implements ActionListener {

    @Override
    public void actionPerformed(ActionEvent e) {        
        sirieDataTopComponent tc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");            
        commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
        additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");
        if (tc.getAct()!=null & tc.getEntityManager()!=null){
            NotifyDescriptor d = new NotifyDescriptor.Confirmation("Сохранить данные акта перед закрытием?", "Закрыть акт");
            Object open = DialogDisplayer.getDefault().notify(d);
            if (open==NotifyDescriptor.YES_OPTION){
                try {
                    tc.save();
                    ctc.save(tc.getAct().getComplete());
                    atc.save();
                } catch (Exception ex) {
                    Exceptions.printStackTrace(ex);
                }
            }
            //tc.setAct(frm.getActDate(), frm.getActShift());
            //atc.setAct(frm.getActDate(), frm.getActShift());
            if (tc.isOpened()){
                tc.close();
            }
            if (ctc.isOpened()){
                ctc.close();
            }
            //ctc.setAct(frm.getActDate(), frm.getActShift());
            if (atc.isOpened()){
                atc.close();
            }
        }    
    }
}
