/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.uppg_reports;

import com.alexprom.entities.process.ActUPPG;
import org.openide.DialogDescriptor;
import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.modules.ModuleInstall;
import org.openide.util.Exceptions;
import org.openide.util.NbPreferences;
import org.openide.windows.WindowManager;

public class Installer extends ModuleInstall {

    @Override
    public void restored() {
        loginForm login = new loginForm();
        DialogDescriptor dd = new DialogDescriptor(login, "Введите имя пользователя и пароль", true,
                        DialogDescriptor.OK_CANCEL_OPTION, DialogDescriptor.OK_OPTION, null);
        dd.setModal(true);        
        Object result = DialogDisplayer.getDefault().notify(dd);
        if (null != result && DialogDescriptor.OK_OPTION == result) {
            String userName = login.getuName();
            String userPassword = login.getuPassword();
            NbPreferences.forModule(Installer.class).put("userName", userName);
            NbPreferences.forModule(Installer.class).put("userPassword", userPassword);
            if (userName.isEmpty() && userPassword.isEmpty()){
                NotifyDescriptor s = new NotifyDescriptor.Message("Поля имени пользователя и пароля не могут быть пустыми", 0);
                Object close = DialogDisplayer.getDefault().notify(s);
                System.exit(0);
            }
        }else{
            System.exit(0);
        }
    }
    
    @Override
    public boolean closing(){
        sirieDataTopComponent stc = (sirieDataTopComponent)WindowManager.getDefault().findTopComponent("sirieDataTopComponent");
        ActUPPG act = stc.getAct();
        if (act!=null){
            stc.getEntityManager().refresh(stc.getAct());
            if (stc.getAct().getComplete()==0){
                NotifyDescriptor s = new NotifyDescriptor.Confirmation("Сохранить изменения перед завершением работы?", "Завершение работы");
                Object close = DialogDisplayer.getDefault().notify(s);
                if (close!=null && close==NotifyDescriptor.YES_OPTION){
                    try {
                        commonDataTopComponent ctc = (commonDataTopComponent)WindowManager.getDefault().findTopComponent("commonDataTopComponent");
                        additionalDataTopComponent atc = (additionalDataTopComponent)WindowManager.getDefault().findTopComponent("additionalDataTopComponent");
                        stc.save();
                        ctc.save(stc.getAct().getComplete());
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
        }
        NotifyDescriptor d = new NotifyDescriptor.Confirmation("Вы действительно хотите завершить работу с приложением?", "Завершение работы");
        Object result = DialogDisplayer.getDefault().notify(d);
        return result==NotifyDescriptor.YES_OPTION;
    }

}
