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
        category = "File",
        id = "com.alexprom.uppg_reports.OpenAct"
)
@ActionRegistration(
        iconBase = "com/alexprom/uppg_reports/open.gif",
        displayName = "#CTL_OpenAct"
)
@ActionReferences({
    @ActionReference(path = "Menu/File", position = 1300),
    @ActionReference(path = "Toolbars/File", position = 300)
})
@Messages("CTL_OpenAct=Открыть акт")

public final class OpenAct implements ActionListener {
   
    
    @Override
    public void actionPerformed(ActionEvent e) {
        dlgOpenAct frm = new dlgOpenAct();
        DialogDescriptor dd = new DialogDescriptor(frm, "Выберите дату и смену", true,
                        DialogDescriptor.OK_CANCEL_OPTION, DialogDescriptor.OK_OPTION, null);
        dd.setModal(true);        
        Object result = DialogDisplayer.getDefault().notify(dd);
        if (null != result && DialogDescriptor.OK_OPTION == result) {            
            sirieDataTopComponent tc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
            if (tc==null){
                sirieDataTopComponent sdtc = new sirieDataTopComponent();
                tc = sdtc;
            }
            if (tc.getEntityManager()!=null){
                tc.setActParams(frm.getActDate(), frm.getActShift());
                commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
                if (ctc==null){
                    commonDataTopComponent cdtc = new commonDataTopComponent();
                    ctc = cdtc;
                }
                ctc.setAct(frm.getActDate(), frm.getActShift());
                additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");            
                if (atc==null){
                    additionalDataTopComponent adtc = new additionalDataTopComponent();
                    atc = adtc;
                }
                atc.setAct(frm.getActDate(), frm.getActShift());
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
        }
    }
}
