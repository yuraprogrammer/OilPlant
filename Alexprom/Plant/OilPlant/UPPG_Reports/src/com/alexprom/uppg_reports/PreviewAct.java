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
import org.openide.util.NbBundle.Messages;
import org.openide.windows.WindowManager;

@ActionID(
        category = "Help",
        id = "com.alexprom.uppg_reports.PreviewAct"
)
@ActionRegistration(
        iconBase = "com/alexprom/uppg_reports/preview.png",
        displayName = "#CTL_PreviewAct"
)
@ActionReferences({
    @ActionReference(path = "Menu/File", position = 1750),
    @ActionReference(path = "Toolbars/File", position = 500)
})
@Messages("CTL_PreviewAct=Печать...")
public final class PreviewAct implements ActionListener {

    @Override
    public void actionPerformed(ActionEvent e) {
        sirieDataTopComponent tc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
        if (tc.getAct()!=null){
            UPPG_ShiftReport frm = new UPPG_ShiftReport(tc.getEntityManager());            
        }else{
            NotifyDescriptor d = new NotifyDescriptor.Message("Для просмотра отчета, должен быть открыт акт!!!", NotifyDescriptor.ERROR_MESSAGE);
            Object result = DialogDisplayer.getDefault().notify(d);
        }
    }
}
