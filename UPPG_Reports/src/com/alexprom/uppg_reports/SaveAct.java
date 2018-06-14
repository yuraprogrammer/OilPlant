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
        id = "com.alexprom.uppg_reports.SaveAct"
)
@ActionRegistration(
        iconBase = "com/alexprom/uppg_reports/save.png",
        displayName = "#CTL_SaveAct"
)
@ActionReferences({
    @ActionReference(path = "Menu/File", position = 1550),
    @ActionReference(path = "Toolbars/File", position = 350)
})
@Messages("CTL_SaveAct=Сохранить акт...")
public final class SaveAct implements ActionListener {
   

    @Override
    public void actionPerformed(ActionEvent ev) {
        sirieDataTopComponent stc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");        
        additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");
        commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
        if (stc.getAct()!=null){
        NotifyDescriptor saveConfirm = new NotifyDescriptor.Confirmation("Вы желаете сохранить изменения в акте?", NotifyDescriptor.OK_CANCEL_OPTION);
            Object result = DialogDisplayer.getDefault().notify(saveConfirm);
            if (null!=result && NotifyDescriptor.OK_OPTION==result){
            try {                
                stc.save();
                atc.save();
                ctc.save(stc.getAct().getComplete());
                NotifyDescriptor ok = new NotifyDescriptor.Message("Сохранение выполнено успешно!!!", NotifyDescriptor.INFORMATION_MESSAGE);
                Object okResult = DialogDisplayer.getDefault().notify(ok);
            } catch (Exception ex) {                
                NotifyDescriptor err = new NotifyDescriptor.Message("Сохранение не выполнено!!!", NotifyDescriptor.ERROR_MESSAGE);
                Object errResult = DialogDisplayer.getDefault().notify(err);
            }
            }
        }else{
            NotifyDescriptor err = new NotifyDescriptor.Message("Нет открытого акта для сохранения!!! Открыть?", NotifyDescriptor.ERROR_MESSAGE);
            Object errResult = DialogDisplayer.getDefault().notify(err);
            if (errResult==NotifyDescriptor.YES_OPTION){
                dlgOpenAct frm = new dlgOpenAct();
                DialogDescriptor dd = new DialogDescriptor(frm, "Выберите дату и смену", true,
                        DialogDescriptor.OK_CANCEL_OPTION, DialogDescriptor.OK_OPTION, null);
                Object result = DialogDisplayer.getDefault().notify(dd);
                if (null != result && DialogDescriptor.OK_OPTION == result) {            
                    stc.setAct(frm.getActDate(), frm.getActShift());                    
                    ctc.setAct(frm.getActDate(), frm.getActShift());
                    atc.setAct(frm.getActDate(), frm.getActShift());
                    if (!ctc.isOpened() || !ctc.isOpened() || !atc.isOpened()){
                        NotifyDescriptor d = new NotifyDescriptor.Confirmation("Открыть окна отображения данных акта?", "Открыть акт");
                        Object open = DialogDisplayer.getDefault().notify(d);
                        if (open==NotifyDescriptor.YES_OPTION){
                            if (!ctc.isOpened()){
                                ctc.open();
                            }
                            if (!stc.isOpened()){
                                stc.open();
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
}
