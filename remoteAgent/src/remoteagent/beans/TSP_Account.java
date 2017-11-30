package remoteagent.beans;

import com.alexprom.libwincctags.WinCCTags;
import com.alexprom.libwincctags.iWinCCTagReader;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import static remoteagent.beans.AgentBase.dbConfig;

/**
 * Class OilAccount
 *
 * @author yura_
 */
public class TSP_Account extends AgentBase{
    
    private iWinCCTagReader tags;    
    private double oldE38, oldE39, oldE40, newE38, newE39, newE40, accountE38, accountE39, accountE40;
    private double shiftAccountE38, shiftAccountE39, shiftAccountE40;
    private boolean shiftStarted, firstCycle;
    private int shift, currentShiftID;    
    private boolean N1_1_isOn_Old, N1_1_isOn_New, N1_2_isOn_Old, N1_2_isOn_New;
    private boolean N1_4_isOn_Old, N1_4_isOn_New, N1_5_isOn_Old, N1_5_isOn_New;
    
    public TSP_Account() {
        super();
        
    }

    @Override
    public void initAgent(){        
        firstCycle = true;
        tags = iWinCCTagReader.INSTANCE;
        tags.WinCC_Connect(); 
    }    
    
    //Выполенние задания агентом
    @Override
    public void doTask(){
    
        try{           
            if (tags.ProjectStatus()==0){
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
            if (d1.after(d2) && !d1.after(d3)){
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
            {
                //Определение повторного запуска операций для текущей смены
                Statement stm = dbData.db.createStatement();
                String sql="select count(ID) from account_tsp where convert(varchar, aDate) like '"+dateFormat.format(d1)+"%' and aShift="+String.valueOf(shift);                
                System.out.println(sql);
                ResultSet rs = stm.executeQuery(sql);                
                while (rs.next()){
                    cnt = rs.getInt(1);
                }
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                System.out.println(TSP_Account.class.getName()+": "+ ex.getMessage());
                getDbConnection();
            }
            
            //Определение признака начала новой смены
            shiftStarted = false;
            if (cnt==0){shiftStarted = true;}
            
            //Чтение значений тэгов объемов
            newE38 = tags.ReadTag_Real32("Volume_E31.Value");            
            newE39 = tags.ReadTag_Real32("Volume_E32.Value");
            newE40 = tags.ReadTag_Real32("Volume_E33.Value");
            
            //Если началась новая смена - обнуляем учетные данные
            if (shiftStarted){                
                shiftAccountE38 = 0.0;
                shiftAccountE39 = 0.0;
                shiftAccountE40 = 0.0; 
                oldE38 = newE38;
                oldE39 = newE39;
                oldE40 = newE40;
            }else{//Если смена продолжается
                try {
                    //Определение повторного запуска операций для текущей смены
                    if (firstCycle){
                        oldE38 = newE38;
                        oldE39 = newE39;
                        oldE40 = newE40;
                    }
                    Statement stm = dbData.db.createStatement();
                    String sql="select * from account_tsp where ID=(select max(id) from account_tsp)";
                    ResultSet rs = stm.executeQuery(sql);                
                    while (rs.next()){
                        shiftAccountE38 = rs.getDouble("aE38");
                        shiftAccountE39 = rs.getDouble("aE39");
                        shiftAccountE40 = rs.getDouble("aE40");
                    }
                    rs.close();
                    stm.close();
                } catch (SQLException ex) {
                    System.out.println(TSP_Account.class.getName()+": "+ ex.getMessage());
                    getDbConnection();
                }
            }        
            
            //Чтение тэгов состояния насосов
            N1_1_isOn_New=tags.ReadTag_Boolean("N1_1.IsOn");
            N1_2_isOn_New=tags.ReadTag_Boolean("N1_2.IsOn");
            N1_4_isOn_New=tags.ReadTag_Boolean("N1_4.IsOn");
            N1_5_isOn_New=tags.ReadTag_Boolean("N1_5.IsOn");
                                   
            //Чтение данных о состоянии насосов Н1.1 и Н1.2
            if ((N1_1_isOn_New==true) || (N1_2_isOn_New==true)){
                //Расчет отгрузки из емкости Е38            
                if (newE38<oldE38){
                    accountE38 = accountE38 + (oldE38 - newE38);
                    shiftAccountE38 = shiftAccountE38 + (oldE38 - newE38);
                }                            
            }
                        
            //Чтение данных о состоянии насоса Н1.4
            if (N1_4_isOn_New=true){
                //Расчет отгрузки из емкости Е39
                if (newE39<oldE39){
                    accountE39 = accountE39 + (oldE39 - newE39);
                    shiftAccountE39 = shiftAccountE39 + (oldE39 - newE39);
                }                         
            }
                        
            //Чтение данных о состоянии насоса Н1.5
            if (N1_5_isOn_New=true){
                //Расчет отгрузки из емкости Е40
                if (newE40<oldE40){
                    accountE40 = accountE40 + (oldE40 - newE40);
                    shiftAccountE40 = shiftAccountE40 + (oldE40 - newE40);
                }                                                 
            }
                        
            //Запись значений в тэги
            tags.WriteTag_Real("PLC_1_E38_CurrentVolume.Value", newE38);
            tags.WriteTag_Real("PLC_1_E39_CurrentVolume.Value", newE39);
            tags.WriteTag_Real("PLC_1_E40_CurrentVolume.Value", newE40);
            
            tags.WriteTag_Real("PLC_1_E38_DischargedVolume.Value", accountE38);
            tags.WriteTag_Real("PLC_1_E39_DischargedVolume.Value", accountE39);
            tags.WriteTag_Real("PLC_1_E40_DischargedVolume.Value", accountE40);
            
            tags.WriteTag_Real("PLC_1_E38_ShiftDischargedVolume.Value", shiftAccountE38);
            tags.WriteTag_Real("PLC_1_E39_ShiftDischargedVolume.Value", shiftAccountE39);
            tags.WriteTag_Real("PLC_1_E40_ShiftDischargedVolume.Value", shiftAccountE40);
            
            System.out.println(TSP_Account.class.getName()+": Tags write complete!!!");
            
            //Если выдача из резервуара завершилась, сохраняем учетные данные по выдаче
            if (((N1_1_isOn_New==false & N1_1_isOn_Old==true) || (N1_2_isOn_New==false & N1_2_isOn_Old==true)) || (N1_4_isOn_New==false & N1_4_isOn_Old==true) || (N1_5_isOn_New==false & N1_5_isOn_Old==true)){
            Statement stm;
            try{
                stm = dbData.db.createStatement();
                String query = "exec tspArchive '"+dateFormat.format(d1)+"',"+String.valueOf(shift)+","+String.valueOf(accountE38)+","+String.valueOf(accountE39)+","+String.valueOf(accountE40);
                stm.execute(query);
                stm.close();
                //Обнуление данных по выдаче из Е38 при остановке насоса
                if ((N1_1_isOn_New==false & N1_1_isOn_Old==true) || (N1_2_isOn_New==false & N1_2_isOn_Old==true)){
                    accountE38 = 0.0;                
                } 
            //Обнуление данных по выдаче из Е39 при остановке насоса
            if (N1_4_isOn_New==false & N1_4_isOn_Old==true){
                accountE39 = 0.0;
            }
            //Обнуление данных по выдаче из Е40 при остановке насоса
            if (N1_5_isOn_New==false & N1_5_isOn_Old==true){
                accountE40 = 0.0;
            }
            }catch (SQLException ex) {
                System.out.println(TSP_Account.class.getName()+": "+ ex.getMessage());
                getDbConnection();
                getTask();
            }
            }
            
            N1_1_isOn_Old=N1_1_isOn_New;
            N1_2_isOn_Old=N1_2_isOn_New;
            N1_4_isOn_Old=N1_4_isOn_New;
            N1_5_isOn_Old=N1_5_isOn_New;
            
            //Сохранение учетных данных за смену в базу данных
            Statement stmt;
            try {
                stmt = dbData.db.createStatement();
                String query = "exec tspAccount '"+dateFormat.format(d1)+"',"+String.valueOf(shift)+","+String.valueOf(shiftAccountE38)+","+String.valueOf(shiftAccountE39)+","+String.valueOf(shiftAccountE40);
                stmt.execute(query);                                
                stmt.close();
            } catch (SQLException ex) {
                System.out.println(TSP_Account.class.getName()+": "+ ex.getMessage());
                getDbConnection();
                getTask();
            }
            
            oldE38 = newE38;
            oldE39 = newE39;
            oldE40 = newE40;
            firstCycle = false;
            }else{
               System.out.println(TSP_Account.class.getName()+": WinCC Runtime is closed. Task running is aborted");
            }
                
    }catch (java.lang.UnsatisfiedLinkError | java.lang.NoClassDefFoundError ex){
        System.out.println("WinCC connection failed!!!");        
    }     

}
}
