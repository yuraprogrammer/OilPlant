/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.uppg_reports;

import org.openide.DialogDisplayer;
import org.openide.NotifyDescriptor;
import org.openide.modules.ModuleInstall;

public class Installer extends ModuleInstall {

    @Override
    public void restored() {
        // TODO
    }
    
    @Override
    public boolean closing(){
        NotifyDescriptor d = new NotifyDescriptor.Confirmation("Вы действительно хотите завершить работу с приложением?");
        Object result = DialogDisplayer.getDefault().notify(d);
        return result==NotifyDescriptor.YES_OPTION;
    }

}
