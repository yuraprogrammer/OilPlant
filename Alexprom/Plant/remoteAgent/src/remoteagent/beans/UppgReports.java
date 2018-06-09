/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package remoteagent.beans;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static remoteagent.beans.AgentBase.dbData;

/**
 *
 * @author yura_
 */
public class UppgReports extends AgentBase{
    private boolean shiftStarted;
    private int shift, prevShift;
    private Date prevActDate = new Date();
    
    @Override
    public void doTask(){
        //Определение начала новой смены
            Date d1 = new Date();       //Текущие дата и время
            Date d2 = new Date();       //Дата и время первой смены сегодня
            Date d3 = new Date();       //Дата и время второй смены сегодня
            d2.setHours(8);             
            d2.setMinutes(0);
            d2.setSeconds(0);
            d3.setHours(20);
            d3.setMinutes(0);
            d3.setSeconds(0); 
            int cnt = 0;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");                                 
            
            //Определение номера смены    
            if (d1.after(d2) && d1.before(d3)){
                shift=1;
            }else{
                shift=2;
            }            
            
            int currentHour = d1.getHours();
            if (currentHour>=0 && currentHour<=7){
                int curDay = d1.getDate();
                int yesterday = curDay-1;
                d1.setDate(yesterday);                        
            }
            try 
            ( //Определение повторного запуска операций для текущей смены
                    Statement stm = dbData.db.createStatement()) {
                String sql="select count(id) from dbo.Act_UPPG where aDate = '"+dateFormat.format(d1)+"' and shift="+String.valueOf(shift);                
                try (ResultSet rs = stm.executeQuery(sql)) {
                    while (rs.next()){
                        cnt = rs.getInt(1);
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                getDbConnection();
                getTask();
            }
            //Определение признака начала новой смены              
            shiftStarted = cnt==0;
            //Если началась новая смена - заполняем данные на конец предыдущей смены и используем их на начало новой смены
            if (shiftStarted){                                                                   
                if (shift==1){
                    int curDay = d1.getDate();
                    int yesterday = curDay-1;
                    prevActDate.setDate(yesterday);
                    prevShift=2;
                }else{
                    prevActDate=d1;
                    prevShift=1;
                }
                try {
                    //Находим id акта за предыдущую смену
                    Statement stm = dbData.db.createStatement();
                    //Берем данные счетчиков на конец предыдущей смены
                    String sql = "select id from dbo.Act_UPPG where aDate='"+dateFormat.format(prevActDate)+"' and aShift="+String.valueOf(prevShift);
                    ResultSet rs = stm.executeQuery(sql);
                    long prevActId=0;
                    if (rs.next()){
                        prevActId = rs.getLong("id");
                    }
                    if (prevActId!=0){
                        sql = "select * from dbo.counters_daq where daq_dt='"+dateFormat.format(prevActDate)+"' and shift="+String.valueOf(prevShift)+" order by id";
                        rs = stm.executeQuery(sql);
                        ArrayList<BigDecimal> values;
                        values = new ArrayList();
                        while (rs.next()){
                            values.add(rs.getBigDecimal("tag_value"));
                        }
                        if (!values.isEmpty()){
                            //Сохраняем данные счетчиков на конец предыдущей смены и начало новой
                            String updateCounters = "update dbo.Act_Counters set MassEnd_S="+String.valueOf(values.get(0))+
                                                    ",VolumeEnd_S="+String.valueOf(values.get(1))+
                                                    ",DensityEnd_S="+String.valueOf(values.get(2))+
                                                    ",TempEnd_S="+String.valueOf(values.get(3))+
                                                    ",MassEnd_B="+String.valueOf(values.get(4))+
                                                    ",VolumeEnd_B="+String.valueOf(values.get(5))+
                                                    ",DensityEnd_B="+String.valueOf(values.get(6))+
                                                    ",TempEnd_B="+String.valueOf(values.get(7))+
                                                    ",MassEnd_A="+String.valueOf(values.get(8))+
                                                    ",VolumeEnd_A="+String.valueOf(values.get(9))+
                                                    ",DensityEnd_A="+String.valueOf(values.get(10))+
                                                    "TempEnd_A="+String.valueOf(values.get(11))+
                                                    " where actID="+String.valueOf(prevActId);
                            stm.executeUpdate(updateCounters);
                            //Создаем новый акт и используем в нем все данные на конец предыдущей смены
                            long newActId=0;
                            String newAct = "select MAX(id) from Act_UPPG";
                            rs = stm.executeQuery(newAct);
                            if (rs.next()){
                                newActId = rs.getLong(1)+1;
                            }
                            if (newActId!=0){
                                newAct = "insert into Act_UPPG (id, aDate, aShift, mainOper, slaveOper, Complete, aCode) values ("+
                                        String.valueOf(newActId)+",'"+dateFormat.format(d1)+"',"+String.valueOf(shift)+","+String.valueOf(100)+","+
                                        String.valueOf(100)+","+String.valueOf(0)+","+String.valueOf(0)+")";
                                stm.executeUpdate(newAct);
                                newAct = "insert into Act_Counters (id, actID, MassStart_S, VolumeStart_S, DensityStart_S, TempStart_S,"
                                          + "MassStart_B, VolumeStart_B, DensityStart_B, TempStart_B, MassStart_A, VolumeStart_A, DensityStart_A, TempStart_A,"
                                          + "MassEnd_S, VolumeEnd_S, DensityEnd_S, TempEnd_S, MassEnd_B, VolumeEnd_B, DensityEnd_B, TempEnd_B,"
                                          + "MassEnd_A, VolumeEnd_A, DensityEnd_A, TempEnd_A) values ("
                                          + ")";
                            }
                        }
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UppgReports.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
    }
}
