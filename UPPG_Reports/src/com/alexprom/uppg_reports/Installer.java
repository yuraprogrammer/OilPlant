/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.uppg_reports;

import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.modules.ModuleInstall;
import org.openide.util.Exceptions;
import org.openide.windows.WindowManager;

public class Installer extends ModuleInstall {

    @Override
    public void restored() {
        // TODO
    }
    
    @Override
    public boolean closing(){
        sirieDataTopComponent stc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
        if (stc.getAct()!=null){
            NotifyDescriptor s = new NotifyDescriptor.Confirmation("Сохранить изменения перед завершением работы?", "Завершение работы");
            Object close = DialogDisplayer.getDefault().notify(s);
            if (close!=null && close==NotifyDescriptor.YES_OPTION){
                try {
                    commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
                    additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");
                    stc.save();
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
        }
        NotifyDescriptor d = new NotifyDescriptor.Confirmation("Вы действительно хотите завершить работу с приложением?", "Завершение работы");
        Object result = DialogDisplayer.getDefault().notify(d);
        return result==NotifyDescriptor.YES_OPTION;
    }

}
