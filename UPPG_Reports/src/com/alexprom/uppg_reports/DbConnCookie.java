/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.uppg_reports;

import com.alexprom.connection.settings.dbConnectionSettingsPanel;
import com.alexprom.entities.settings.GlobalEntityManager;
import java.util.prefs.PreferenceChangeEvent;
import java.util.prefs.PreferenceChangeListener;
import java.util.prefs.Preferences;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import org.openide.nodes.Node;
import org.openide.util.HelpCtx;
import org.openide.util.NbPreferences;
import org.openide.util.actions.CookieAction;

/**
 *
 * @author yura_
 */
public class DbConnCookie extends CookieAction{

    private EntityManagerFactory emf;
    private EntityManager em;        
    
    public void updatePersistence(){        
        GlobalEntityManager gem = new GlobalEntityManager();
        emf = gem.getEmf();
        em = gem.getEm();        
    }
    
    @Override
    protected int mode() {
        if (em!=null){
            return CookieAction.MODE_ALL;
        }else{
            return -1;
        }
    }

    @Override
    protected Class<?>[] cookieClasses() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void performAction(Node[] nodes) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getName() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public HelpCtx getHelpCtx() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    protected void initialize() {
        super.initialize();
        // see org.openide.util.actions.SystemAction.iconResource() Javadoc for more details
        Preferences pref = NbPreferences.forModule(dbConnectionSettingsPanel.class);
        updatePersistence();
        pref.addPreferenceChangeListener(new PreferenceChangeListener() {
        @Override
        public void preferenceChange(PreferenceChangeEvent evt) {            
            updatePersistence();
        }
    }); 
    } 
    
}
