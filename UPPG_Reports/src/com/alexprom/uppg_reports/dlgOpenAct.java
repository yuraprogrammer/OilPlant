package com.alexprom.uppg_reports;

import com.alexprom.entities.process.VactUPPG;
import com.alexprom.entities.settings.GlobalEntityManager;
import datechooser.model.multiple.PeriodSet;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.swing.table.DefaultTableModel;
import org.openide.util.Exceptions;

public class dlgOpenAct extends javax.swing.JPanel {
    private Date actDate;

    public void setActDate(Date actDate) {
        this.actDate = actDate;
    }

    public void setActShift(int actShift) {
        this.actShift = actShift;
    }
    private int actShift;
    private EntityManager em=null;
    private int actID, selectedRow;

    public int getActID() {
        return actID;
    }

    public void setActID(int actID) {
        this.actID = actID;
    }
    
    public dlgOpenAct() {
        initComponents();        
        actDate=dateChooserCombo2.getCurrent().getTime();
        actShift=jComboBox1.getSelectedIndex()+1;
        fillActTable();
    }
    
    private void fillActTable(){
        GlobalEntityManager gem = new GlobalEntityManager();
        em = gem.getEm();        
        if (em!=null){
            try {
                VactUPPG act = new VactUPPG();
                PeriodSet period = dateChooserCombo2.getSelectedPeriodSet();
                Calendar calendar = period.getFirstDate();
                Date date = calendar.getTime();
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String datePattern = df.format(date).substring(0, 7);
                em.getTransaction().begin();
                Connection connection = em.unwrap(Connection.class);
                em.getTransaction().commit();
                Statement stmt = connection.createStatement();
                String query = "select * from dbo.V_actUPPG where aDate like '"+datePattern+"%'";
                ResultSet rs = stmt.executeQuery(query);                
                int i=0;
                DefaultTableModel model = new DefaultTableModel();
                model.addColumn("Код");
                model.addColumn("Дата");
                model.addColumn("Смена");
                model.addColumn("Ст. оператор");
                while (rs.next()){
                    String shiftTime;
                    if (rs.getInt("aShift")==1){   
                        shiftTime = "08:00";
                    }else{
                        shiftTime = "20:00";
                    }                    
                    model.addRow(new Object[]{
                        rs.getString("ID"),
                        rs.getString("aDate"),
                        shiftTime,
                        rs.getString("mainOper")
                    });                    
                    i++;
                }                
                jTable1.setModel(model);                
            } catch (SQLException ex) {
                Exceptions.printStackTrace(ex);
            }
        }
    }

    public Date getActDate(){
        return this.actDate;
    }
    
    public int getActShift(){
        return this.actShift;
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        dateChooserCombo2 = new datechooser.beans.DateChooserCombo();
        jComboBox1 = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        label1 = new java.awt.Label();
        label2 = new java.awt.Label();

        dateChooserCombo2.setCurrentView(new datechooser.view.appearance.AppearancesList("Bordered",
            new datechooser.view.appearance.ViewAppearance("custom",
                new datechooser.view.appearance.swing.SwingCellAppearance(new java.awt.Font("Tahoma", java.awt.Font.PLAIN, 11),
                    new java.awt.Color(0, 0, 0),
                    new java.awt.Color(0, 0, 255),
                    false,
                    true,
                    new datechooser.view.appearance.swing.ButtonPainter()),
                new datechooser.view.appearance.swing.SwingCellAppearance(new java.awt.Font("Tahoma", java.awt.Font.PLAIN, 11),
                    new java.awt.Color(0, 0, 0),
                    new java.awt.Color(0, 0, 255),
                    true,
                    true,
                    new datechooser.view.appearance.swing.ButtonPainter()),
                new datechooser.view.appearance.swing.SwingCellAppearance(new java.awt.Font("Tahoma", java.awt.Font.PLAIN, 11),
                    new java.awt.Color(0, 0, 255),
                    new java.awt.Color(0, 0, 255),
                    false,
                    true,
                    new datechooser.view.appearance.swing.ButtonPainter()),
                new datechooser.view.appearance.swing.SwingCellAppearance(new java.awt.Font("Tahoma", java.awt.Font.PLAIN, 11),
                    new java.awt.Color(128, 128, 128),
                    new java.awt.Color(0, 0, 255),
                    false,
                    true,
                    new datechooser.view.appearance.swing.LabelPainter()),
                new datechooser.view.appearance.swing.SwingCellAppearance(new java.awt.Font("Tahoma", java.awt.Font.PLAIN, 11),
                    new java.awt.Color(0, 0, 0),
                    new java.awt.Color(0, 0, 255),
                    false,
                    true,
                    new datechooser.view.appearance.swing.LabelPainter()),
                new datechooser.view.appearance.swing.SwingCellAppearance(new java.awt.Font("Tahoma", java.awt.Font.PLAIN, 11),
                    new java.awt.Color(0, 0, 0),
                    new java.awt.Color(255, 0, 0),
                    false,
                    false,
                    new datechooser.view.appearance.swing.ButtonPainter()),
                (datechooser.view.BackRenderer)null,
                false,
                true)));
    dateChooserCombo2.setShowOneMonth(true);
    dateChooserCombo2.setCurrentNavigateIndex(0);
    dateChooserCombo2.setNavigateFont(new java.awt.Font("Tahoma", java.awt.Font.PLAIN, 11));
    dateChooserCombo2.addSelectionChangedListener(new datechooser.events.SelectionChangedListener() {
        public void onSelectionChange(datechooser.events.SelectionChangedEvent evt) {
            dateChooserCombo2OnSelectionChange(evt);
        }
    });
    dateChooserCombo2.addCommitListener(new datechooser.events.CommitListener() {
        public void onCommit(datechooser.events.CommitEvent evt) {
            dateChooserCombo2OnCommit(evt);
        }
    });

    jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "08:00", "20:00" }));
    jComboBox1.addPropertyChangeListener(new java.beans.PropertyChangeListener() {
        public void propertyChange(java.beans.PropertyChangeEvent evt) {
            jComboBox1PropertyChange(evt);
        }
    });

    jTable1.setModel(new javax.swing.table.DefaultTableModel(
        new Object [][] {

        },
        new String [] {
            "Код", "Дата", "Смена", "Ст. оператор"
        }
    ) {
        boolean[] canEdit = new boolean [] {
            false, false, false, false
        };

        public boolean isCellEditable(int rowIndex, int columnIndex) {
            return canEdit [columnIndex];
        }
    });
    jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
        public void mouseClicked(java.awt.event.MouseEvent evt) {
            jTable1MouseClicked(evt);
        }
    });
    jScrollPane1.setViewportView(jTable1);

    label1.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
    label1.setText(org.openide.util.NbBundle.getMessage(dlgOpenAct.class, "dlgOpenAct.label1.text")); // NOI18N

    label2.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
    label2.setText(org.openide.util.NbBundle.getMessage(dlgOpenAct.class, "dlgOpenAct.label2.text")); // NOI18N

    javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
    this.setLayout(layout);
    layout.setHorizontalGroup(
        layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
        .addGroup(layout.createSequentialGroup()
            .addGap(10, 10, 10)
            .addComponent(label2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addGap(2, 2, 2)
            .addComponent(dateChooserCombo2, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addGap(20, 20, 20)
            .addComponent(label1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addGap(7, 7, 7)
            .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 79, javax.swing.GroupLayout.PREFERRED_SIZE))
        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 391, javax.swing.GroupLayout.PREFERRED_SIZE)
    );
    layout.setVerticalGroup(
        layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
        .addGroup(layout.createSequentialGroup()
            .addGap(10, 10, 10)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(label2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addComponent(dateChooserCombo2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addComponent(label1, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addGap(14, 14, 14)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
    );
    }// </editor-fold>//GEN-END:initComponents

    private void dateChooserCombo2OnCommit(datechooser.events.CommitEvent evt) {//GEN-FIRST:event_dateChooserCombo2OnCommit
        actDate=dateChooserCombo2.getCurrent().getTime();        
    }//GEN-LAST:event_dateChooserCombo2OnCommit

    private void jComboBox1PropertyChange(java.beans.PropertyChangeEvent evt) {//GEN-FIRST:event_jComboBox1PropertyChange
        actShift=jComboBox1.getSelectedIndex()+1;
    }//GEN-LAST:event_jComboBox1PropertyChange

    private void dateChooserCombo2OnSelectionChange(datechooser.events.SelectionChangedEvent evt) {//GEN-FIRST:event_dateChooserCombo2OnSelectionChange
        actDate=dateChooserCombo2.getCurrent().getTime();
        fillActTable();
    }//GEN-LAST:event_dateChooserCombo2OnSelectionChange

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        if (em!=null){
            selectedRow = jTable1.getSelectedRow();
            long id = Long.parseLong(jTable1.getModel().getValueAt(selectedRow, 0).toString());
            Query query = em.createNamedQuery("VactUPPG.findById");
            query.setParameter("id", id);
            List<VactUPPG> list = query.getResultList();
            if (!list.isEmpty()){                
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date selDate = df.parse(list.get(0).getADate());
                    Calendar calendar = dateChooserCombo2.getCurrent();
                    calendar.setTime(selDate);
                    dateChooserCombo2.setSelectedDate(calendar);
                    int selShift = list.get(0).getAShift();
                    jComboBox1.setSelectedIndex(selShift-1);
                    setActDate(selDate);
                    setActShift(selShift);
                } catch (ParseException ex) {
                    Exceptions.printStackTrace(ex);
                }
                
            }
        }        
    }//GEN-LAST:event_jTable1MouseClicked


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private datechooser.beans.DateChooserCombo dateChooserCombo2;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private java.awt.Label label1;
    private java.awt.Label label2;
    // End of variables declaration//GEN-END:variables
}
