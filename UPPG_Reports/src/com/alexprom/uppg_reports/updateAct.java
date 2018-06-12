package com.alexprom.uppg_reports;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionReferences;
import org.openide.awt.ActionRegistration;
import org.openide.util.NbBundle.Messages;
import org.openide.windows.WindowManager;

@ActionID(
        category = "Edit",
        id = "com.alexprom.uppg_reports.updateAct"
)
@ActionRegistration(
        iconBase = "com/alexprom/uppg_reports/update.gif",
        displayName = "#CTL_updateAct"
)
@ActionReferences({
    @ActionReference(path = "Menu/Edit", position = 1100),
    @ActionReference(path = "Toolbars/Edit", position = 100)
})
@Messages("CTL_updateAct=Обновить акт")
public final class updateAct implements ActionListener {

    @Override
    public void actionPerformed(ActionEvent e) {
        sirieDataTopComponent tc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
        tc.setLookup();
    }
}
