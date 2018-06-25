package com.alexprom.uppg_reports;

import java.awt.event.KeyEvent;
import org.openide.util.NbPreferences;

public class loginForm extends javax.swing.JPanel {
    
    private String uName;
    private String uPassword;

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }
    
    public loginForm() {
        initComponents();
        uName=NbPreferences.forModule(Installer.class).get("userName", "");
        uPassword="";
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        eLogin = new javax.swing.JTextField();
        label1 = new java.awt.Label();
        label2 = new java.awt.Label();
        ePassword = new javax.swing.JPasswordField();

        eLogin.setText(org.openide.util.NbBundle.getMessage(loginForm.class, "loginForm.eLogin.text")); // NOI18N
        eLogin.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        eLogin.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                eLoginFocusLost(evt);
            }
        });
        eLogin.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                eLoginKeyPressed(evt);
            }
        });

        label1.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label1.setText(org.openide.util.NbBundle.getMessage(loginForm.class, "loginForm.label1.text")); // NOI18N

        label2.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        label2.setText(org.openide.util.NbBundle.getMessage(loginForm.class, "loginForm.label2.text")); // NOI18N

        ePassword.setText(org.openide.util.NbBundle.getMessage(loginForm.class, "loginForm.ePassword.text")); // NOI18N
        ePassword.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        ePassword.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                ePasswordFocusLost(evt);
            }
        });
        ePassword.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                ePasswordKeyPressed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(eLogin)
                    .addComponent(label1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(label2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(ePassword, javax.swing.GroupLayout.DEFAULT_SIZE, 261, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(label1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(7, 7, 7)
                .addComponent(eLogin, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(label2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(ePassword, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void eLoginFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_eLoginFocusLost
       setuName(eLogin.getText());       
    }//GEN-LAST:event_eLoginFocusLost

    private void ePasswordFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_ePasswordFocusLost
        setuPassword(String.valueOf(ePassword.getPassword()));
    }//GEN-LAST:event_ePasswordFocusLost

    private void eLoginKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_eLoginKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setuName(eLogin.getText());
        }
    }//GEN-LAST:event_eLoginKeyPressed

    private void ePasswordKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_ePasswordKeyPressed
        if (evt.getKeyCode()==KeyEvent.VK_ENTER){
            setuPassword(String.valueOf(ePassword.getPassword()));
        }
    }//GEN-LAST:event_ePasswordKeyPressed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField eLogin;
    private javax.swing.JPasswordField ePassword;
    private java.awt.Label label1;
    private java.awt.Label label2;
    // End of variables declaration//GEN-END:variables
}
