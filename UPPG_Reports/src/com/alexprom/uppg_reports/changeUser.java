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
import org.openide.awt.ActionID;
import org.openide.awt.ActionReference;
import org.openide.awt.ActionRegistration;
import org.openide.util.NbBundle.Messages;
import org.openide.util.NbPreferences;

@ActionID(
        category = "File",
        id = "com.alexprom.uppg_reports.changeUser"
)
@ActionRegistration(
        iconBase = "com/alexprom/uppg_reports/user.png",
        displayName = "#CTL_changeUser"
)
@ActionReference(path = "Menu/File", position = 2550)
@Messages("CTL_changeUser=Сменить пользователя...")
public final class changeUser implements ActionListener {

    @Override
    public void actionPerformed(ActionEvent e) {
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
        }
    }
}
