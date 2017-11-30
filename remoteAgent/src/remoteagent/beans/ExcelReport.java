package remoteagent.beans;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import static remoteagent.beans.AgentBase.dbConfig;
import static remoteagent.beans.AgentBase.dbData;

/**
 *
 * @author yura_
 */
public class ExcelReport extends AgentBase{
    private final List<String> archieveTags = new ArrayList<>();
    private final List<String> archieveTagsDesc = new ArrayList<>();
    private boolean shiftStarted;
    private int shift, currentShiftID;
    private boolean reportDone = false;
    private int oldShift;
    
    public ExcelReport(){
        super();
    }          
    
    //Получение задания агентом
    @Override
    public void getTask(){              
        try {
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
        }
    }
    @Override
    public void doTask(){
        int count = archieveTags.size();        
        if (count!=0){
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
            int newShift = shift;
            
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
                String sql="select count(aDate) from dbo.ExcelReport_Data where convert(varchar, aDate) like '"+dateFormat.format(d1)+"%' and aShift="+String.valueOf(shift);
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
            shiftStarted = cnt==0;
            //System.out.println("Shift started:"+String.valueOf(shiftStarted));
            //Если началась новая смена - создаем файл отчета для предыдущей смены
            if ((shiftStarted)){                
                //Определяем дату предыдущей смены
                int preShift;
                if (shift==2){
                    preShift = 1;
                }else{
                    preShift = 2;
                }
                Date reportDate = new Date();
                if (preShift==2){
                    int reportDay = reportDate.getDate();
                    reportDate.setDate(reportDay - 1);
                }
                
                //preShift = 1;                
                HSSFWorkbook wb = new HSSFWorkbook();
                HSSFCellStyle headerCellStyle = wb.createCellStyle();
                HSSFFont headerFont = wb.createFont();
                headerFont.setBold(true);
                headerCellStyle.setAlignment(HorizontalAlignment.CENTER_SELECTION);
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
                
                HSSFCellStyle dataCellStyle = wb.createCellStyle();
                //dataCellStyle.setAlignment(HorizontalAlignment.CENTER_SELECTION);
                dataCellStyle.setBorderBottom(CellStyle.BORDER_THIN);
                dataCellStyle.setBottomBorderColor(IndexedColors.BLACK.getIndex());
                dataCellStyle.setBorderLeft(CellStyle.BORDER_THIN);
                dataCellStyle.setLeftBorderColor(IndexedColors.BLACK.getIndex());
                dataCellStyle.setBorderRight(CellStyle.BORDER_THIN);
                dataCellStyle.setRightBorderColor(IndexedColors.BLACK.getIndex());
                dataCellStyle.setBorderTop(CellStyle.BORDER_THIN);
                dataCellStyle.setTopBorderColor(IndexedColors.BLACK.getIndex());
                String fileName = dateFormat.format(reportDate);
                if (preShift==1){
                    fileName = fileName+"_08-00";
                }else{
                    fileName = fileName+"_20-00";
                }
                try (FileOutputStream fileOut = new FileOutputStream("reports\\"+fileName+".xls")) {
                    HSSFSheet sheet = wb.createSheet(fileName);
                    HSSFRow title = sheet.createRow(0);
                    HSSFCell titleCell = title.createCell(0);
                    titleCell.setCellValue(fileName);
                    
                    HSSFCell operator = title.createCell(1);
                    operator.setCellValue("Старший оператор:");
                    HSSFCell operatorName = title.createCell(2);
                    Statement opStm = dbData.db.createStatement();
                    ResultSet opRS = opStm.executeQuery("SELECT TOP 1 aDesc, id FROM dbo.ProcessArchieve where convert(varchar, aDate) like '"+
                                       dateFormat.format(reportDate)+
                                       "%' and aShift="+String.valueOf(preShift)+" order by id desc");
                    while (opRS.next()){
                        operatorName.setCellValue(opRS.getString(1));
                    }
                    opRS.close();
                    opStm.close();
                    int newRow=2;
                    
                    //Заполнение заголовка параметров и данных
                    for (int i=0; i<archieveTagsDesc.size(); i++){
                        //Заполнение заголовка
                        HSSFRow headerRow = sheet.createRow(newRow);
                        HSSFCell headerCell = headerRow.createCell(0);
                        headerCell.setCellStyle(headerCellStyle);
                        headerCell.setCellValue(archieveTagsDesc.get(i));                        
                        sheet.addMergedRegion(new CellRangeAddress(newRow, newRow, 0, 1));
                        sheet.autoSizeColumn(0);
                        sheet.autoSizeColumn(1);
                        newRow++;
                        HSSFRow detailMinRow = sheet.createRow(newRow);
                        HSSFCell detailCellMin = detailMinRow.createCell(0);
                        detailCellMin.setCellValue("Мин. значение");
                        detailCellMin.setCellStyle(dataCellStyle);
                        String maxValue = null;
                        String minValue = null;
                        String avgValue = null;
                        try (Statement stmt = dbData.db.createStatement()) {
                            String query = "SELECT aTag, MaxValue, MinValue, AvgValue FROM dbo.ExcelReport_Data where convert(varchar, aDate) like '"+
                                    dateFormat.format(reportDate)+
                                    "%' and aShift="+String.valueOf(preShift)+
                                    " and aTag='"+archieveTags.get(i)+"'";
                            ResultSet rs;
                            rs = stmt.executeQuery(query);
                            while (rs.next()){
                                maxValue = rs.getString(2);
                                minValue = rs.getString(3);
                                avgValue = rs.getString(4);
                            }
                            HSSFCell valueCellMin = detailMinRow.createCell(1);
                            valueCellMin.setCellValue(minValue);
                            detailCellMin.setCellStyle(dataCellStyle);
                            newRow++;
                            HSSFRow detailMaxRow = sheet.createRow(newRow);
                            HSSFCell detailCellMax = detailMaxRow.createCell(0);
                            detailCellMax.setCellValue("Макс. значение");
                            detailCellMax.setCellStyle(dataCellStyle);
                            HSSFCell valueCellMax = detailMaxRow.createCell(1);
                            valueCellMax.setCellValue(maxValue);
                            detailCellMin.setCellStyle(dataCellStyle);
                            newRow++;
                            HSSFRow detailAvgRow = sheet.createRow(newRow);
                            HSSFCell detailCellAvg = detailAvgRow.createCell(0);
                            detailCellAvg.setCellValue("Средн. значение");
                            detailCellAvg.setCellStyle(dataCellStyle);
                            HSSFCell valueCellAvg = detailAvgRow.createCell(1);
                            valueCellAvg.setCellValue(avgValue);
                            detailCellAvg.setCellStyle(dataCellStyle);
                            rs.close();
                        }
                        newRow++;
                        newRow++;
                        HSSFRow blankRow = sheet.createRow(newRow);                        
                    } 
                    sheet.autoSizeColumn(0);
                    sheet.autoSizeColumn(1);
                    wb.write(fileOut);
                    System.out.println("Making report file "+fileName+".xls complete");
                    Logger.getLogger(ExcelReport.class.getName()).log(Level.INFO, "Making report file "+fileName+".xls complete");
                    reportDone = true;
                } catch (FileNotFoundException ex) {
                    Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException | SQLException ex) {
                    Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
                    getDbConnection();
                    getTask();
                }
            }            
        }
    }
    
    @Override
    @SuppressWarnings("empty-statement")
    public void run() {
        while (true){
            synchronized(this){                
                doTask();   
                try {
                    Thread.sleep(10000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(LevelToVolume.class.getName()).log(Level.SEVERE, null, ex);
                }
            }    
        }    
    }
}
