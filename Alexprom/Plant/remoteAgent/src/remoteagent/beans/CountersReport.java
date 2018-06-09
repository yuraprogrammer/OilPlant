package remoteagent.beans;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.CellRangeAddress;
import static remoteagent.beans.AgentBase.dbData;

/**
 *
 * @author yura_
 */
public class CountersReport extends AgentBase{
    
    private boolean shiftStarted;
    private int shift;
    private int shiftStartedCounter=0;
    
    public CountersReport(){
        super();
    }          
    
    //Получение задания агентом
    @Override
    public void getTask(){              
        /*try {
            Statement stmt = dbConfig.db.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=0 and name=4");
            while (rs.next()){
                archieveTags.add(rs.getString(1));                
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=7 and name=4");
            while (rs.next()){
                archieveTagsDesc.add(rs.getString(1));                
            }
            rs.close();
            stmt.close();                                    
        } catch (SQLException ex) {
            Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
            getDbConnection();
            getTask();
        }*/
    }
    @Override
    public void doTask(){
        //int count = archieveTags.size();        
        //if (count!=0){
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
            //int newShift = shift;
            
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
                String sql="select count(daq_dt) from dbo.counters_daq where daq_dt = '"+dateFormat.format(d1)+"' and shift="+String.valueOf(1);
                //System.out.println(sql);
                ResultSet rs = stm.executeQuery(sql);                
                while (rs.next()){
                    cnt = rs.getInt(1);
                }                
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                getDbConnection();
                getTask();
            }
            //Определение признака начала новой смены
            if (cnt!=12){
                shiftStartedCounter = 0;
                shiftStarted = false;
            }else{
                shiftStarted = true;
            }
            
            //Если начались новые сутки - создаем файл отчета для предыдущих суток
            if (shiftStarted=shiftStartedCounter==0 && true){
                
                Date reportDate = new Date();
                int reportDay = reportDate.getDate();
                reportDate.setDate(reportDay - 1);
                
                HSSFWorkbook wb = new HSSFWorkbook();
                HSSFCellStyle headerCellStyle = wb.createCellStyle();
                HSSFFont headerFont = wb.createFont();
                headerFont.setBold(true);                
                headerCellStyle.setBorderBottom(CellStyle.BORDER_MEDIUM);
                headerCellStyle.setBottomBorderColor(IndexedColors.BLACK.getIndex());
                headerCellStyle.setBorderLeft(CellStyle.BORDER_MEDIUM);
                headerCellStyle.setLeftBorderColor(IndexedColors.BLACK.getIndex());
                headerCellStyle.setBorderRight(CellStyle.BORDER_MEDIUM);
                headerCellStyle.setRightBorderColor(IndexedColors.BLACK.getIndex());
                headerCellStyle.setBorderTop(CellStyle.BORDER_MEDIUM);
                headerCellStyle.setTopBorderColor(IndexedColors.BLACK.getIndex());
                headerCellStyle.setFont(headerFont);                
                headerCellStyle.setAlignment(HorizontalAlignment.CENTER_SELECTION);
                
                String fileName = "Counters_"+dateFormat.format(reportDate);
                
                try {
                    FileOutputStream fileOut = new FileOutputStream("reports\\"+fileName+".xls");
                    HSSFSheet sheet = wb.createSheet(fileName);
                    HSSFRow title = sheet.createRow(0);
                    HSSFCell titleCell = title.createCell(0);
                    titleCell.setCellValue(fileName);
                                        
                    int newRow=2;
                    
                    //Заполнение заголовка параметров и данных
                    
                        //Заполнение заголовка
                        HSSFRow headerRow = sheet.createRow(newRow);
                        HSSFCell headerDateCell = headerRow.createCell(0);                                                
                        HSSFCell headerProcessingCell = headerRow.createCell(1);                                                
                        HSSFCell headerBlfCell = headerRow.createCell(5);                                                
                        HSSFCell headerAkdgCell = headerRow.createCell(9);                        
                                                
                        sheet.addMergedRegion(new CellRangeAddress(newRow, newRow+1, 0, 0));
                        sheet.addMergedRegion(new CellRangeAddress(newRow, newRow, 1, 4));
                        sheet.addMergedRegion(new CellRangeAddress(newRow, newRow, 5, 8));
                        sheet.addMergedRegion(new CellRangeAddress(newRow, newRow, 9, 12));
                        
                        headerDateCell.setCellStyle(headerCellStyle);
                        headerDateCell.setCellValue(dateFormat.format(reportDate));
                        headerProcessingCell.setCellStyle(headerCellStyle);
                        headerProcessingCell.setCellValue("Сырье");
                        headerBlfCell.setCellStyle(headerCellStyle);
                        headerBlfCell.setCellValue("БЛФ");
                        headerAkdgCell.setCellStyle(headerCellStyle);
                        headerAkdgCell.setCellValue("АкДГ");
                        
                        newRow++;
                        HSSFRow headerDetailRow = sheet.createRow(newRow);
                        for (int i=0;i<3; i++){
                            HSSFCell headerCounterCell_1_1 = headerDetailRow.createCell(i*4+1);
                            headerCounterCell_1_1.setCellValue("кг");
                            headerCounterCell_1_1.setCellStyle(headerCellStyle);
                            HSSFCell headerCounterCell_1_2 = headerDetailRow.createCell(i*4+2);                            
                            headerCounterCell_1_2.setCellValue("л");
                            headerCounterCell_1_2.setCellStyle(headerCellStyle);
                            HSSFCell headerCounterCell_1_3 = headerDetailRow.createCell(i*4+3);                            
                            headerCounterCell_1_3.setCellValue("°С");
                            headerCounterCell_1_3.setCellStyle(headerCellStyle);
                            HSSFCell headerCounterCell_1_4 = headerDetailRow.createCell(i*4+4);                            
                            headerCounterCell_1_4.setCellValue("кг/л");
                            headerCounterCell_1_4.setCellStyle(headerCellStyle);
                        }
                        newRow++;                        
                        
                        //Заполнение столбца смен
                        HSSFRow[] detailShiftRow = new HSSFRow[4];
                        for (int r=0; r<4; r++ ){
                            detailShiftRow[r] = sheet.createRow(newRow);
                            HSSFCell detailTimeCell = detailShiftRow[r].createCell(0);
                            if (r==0){
                                detailTimeCell.setCellValue("08-00");
                                detailTimeCell.setCellStyle(headerCellStyle);
                            }
                            if (r==2){
                                detailTimeCell.setCellValue("20-00");
                                detailTimeCell.setCellStyle(headerCellStyle);
                            }
                            if (r==1 || r==3){
                                detailTimeCell.setCellValue("");
                                detailTimeCell.setCellStyle(headerCellStyle);
                            }
                            newRow++;
                        }    
                        sheet.addMergedRegion(new CellRangeAddress(4, 5, 0, 0));
                        sheet.addMergedRegion(new CellRangeAddress(6, 7, 0, 0));                                                                    
                        
                        String[] values = new String[3];                        
                        Date nextDate = new Date();
                        nextDate.setDate(reportDate.getDate()+1);
                        String[] dates = {dateFormat.format(reportDate), dateFormat.format(reportDate), dateFormat.format(nextDate)};
                        int [] shifts = {1,2,1};
                        
                        for (int j=0; j<3; j++){
                            try{                          
                                Statement stmt = dbData.db.createStatement();
                                //Данные счетчиков масс
                                String query_mass = "SELECT tag_value FROM dbo.counters_daq where daq_dt = '"+
                                        dates[j]+"' and tag_name like 'Mass_Total_%' and shift="+String.valueOf(shifts[j]);
                                //Данные счетчиков объемов
                                String query_volume = "SELECT tag_value FROM dbo.counters_daq where daq_dt = '"+
                                        dates[j]+"' and tag_name like 'Volume_Total_%' and shift="+String.valueOf(shifts[j]);
                                //Данные счетчиков температур
                                String query_temp = "SELECT tag_value FROM dbo.counters_daq where daq_dt = '"+
                                        dates[j]+"' and tag_name like 'Temperature_%' and shift="+String.valueOf(shifts[j]);
                                //Данные счетчиков плотностей
                                String query_density = "SELECT tag_value FROM dbo.counters_daq where daq_dt = '"+
                                        dates[j]+"' and tag_name like 'Density_%' and shift="+String.valueOf(shifts[j]);
                                ResultSet rs;
                                String[] query = {query_mass, query_volume, query_temp, query_density};
                                
                                for (int q=0; q<4; q++) {
                                    rs = stmt.executeQuery(query[q]);
                                    int k=0;
                                    HSSFCell[] valueCell = new HSSFCell[3];
                                    while (rs.next()){
                                        values[k] = rs.getString(1);                                    
                                        k++;
                                    }
                                    rs.close();
                                    for (int w=0; w<3; w++){
                                        if (shifts[j]==1){
                                            if (j==0){
                                                valueCell[w] = detailShiftRow[0].createCell(w*4+q+1);
                                                valueCell[w].setCellValue(values[w]);
                                                valueCell[w].setCellStyle(headerCellStyle);
                                            }
                                            if (j==2){
                                                valueCell[w] = detailShiftRow[3].createCell(w*4+q+1);
                                                valueCell[w].setCellValue(values[w]);
                                                valueCell[w].setCellStyle(headerCellStyle);
                                            }
                                        }else{
                                            for (int e=1; e<3; e++){
                                                valueCell[w] = detailShiftRow[e].createCell(w*4+q+1);
                                                valueCell[w].setCellValue(values[w]);
                                                valueCell[w].setCellStyle(headerCellStyle);
                                            }
                                        }
                                    }    
                                }    
                            }catch (SQLException ex){
                                Logger.getLogger(CountersReport.class.getName()).log(Level.SEVERE, null, ex);
                            }                                                                             
                        }
                                                                                                                                                      
                    
                    
                    for (int s=0; s<13; s++){
                        sheet.autoSizeColumn(s);
                    }
                
                    wb.write(fileOut);
                    System.out.println("Making report file "+fileName+".xls complete");                    
                    wb.close();
                    fileOut.close();
                } catch (IOException ex) {
                    Logger.getLogger(CountersReport.class.getName()).log(Level.SEVERE, null, ex);
                    getDbConnection();
                    getTask();
                }
                shiftStartedCounter=1;
            }
    }
    
    @Override
    @SuppressWarnings("empty-statement")
    public void run() {
        while (true){
            synchronized(this){                
                doTask();   
                try {
                    Thread.sleep(100);
                } catch (InterruptedException ex) {
                    Logger.getLogger(LevelToVolume.class.getName()).log(Level.SEVERE, null, ex);
                }
            }    
        }    
    }
}

