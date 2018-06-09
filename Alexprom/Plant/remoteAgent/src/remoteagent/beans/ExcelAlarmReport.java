package remoteagent.beans;

import java.awt.Desktop;
import java.io.File;
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
import static remoteagent.beans.AgentBase.dbData;

public class ExcelAlarmReport extends AgentBase{
    private final List<String> archieveTags = new ArrayList<>();
    private final List<String> archieveTagsDesc = new ArrayList<>();
    private final List<String> archieveTagsMin = new ArrayList<>();
    private final List<String> archieveTagsMax = new ArrayList<>();
    private boolean shiftStarted;
    private int shift, currentShiftID;
    private boolean reportDone = false;
    private int oldShift;
    
    public ExcelAlarmReport(){
        super();
    }
    
    //Получение задания агентом
    @Override
    public void getTask(){
        try {
            Statement stmt = dbConfig.db.createStatement();
            ResultSet rs;
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=0 and name=4 and VAR_TYPE=4");
            while (rs.next()){
                archieveTags.add(rs.getString(1));                
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where VAR_CLASS=7 and name=4 and VAR_TYPE=4");
            while (rs.next()){
                archieveTagsDesc.add(rs.getString(1));                
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where var_class=3 and name=4 and VAR_TYPE=4");
            while (rs.next()){
                archieveTagsMin.add(rs.getString(1));                
            }
            rs.close();
            rs = stmt.executeQuery("select PROP_VALUE from viewLevelTags where var_class=4 and name=4 and VAR_TYPE=4");
            while (rs.next()){
                archieveTagsMax.add(rs.getString(1));                
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
            //System.out.println("Date: "+dateFormat.format(d1)+", Shift:"+String.valueOf(newShift));
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
                String sql="select count(aDate) from dbo.ExcelReport_Data where aDate = '"+dateFormat.format(d1)+"' and aShift="+String.valueOf(shift);
                //System.out.println(sql);
                ResultSet rs = stm.executeQuery(sql);                
                while (rs.next()){
                    cnt = rs.getInt(1);
                }                
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OilAccount.class.getName()).log(Level.SEVERE, ex.getMessage());
                System.out.println(ex);
                getDbConnection();
                getTask();
            }
            //Определение признака начала новой смены
            shiftStarted = cnt==0;
            //System.out.println("Shift started:"+String.valueOf(shiftStarted));
            //Если началась новая смена - создаем файл отчета для предыдущей смены
            //shiftStarted = true;
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
                //System.out.println("Date: "+dateFormat.format(reportDate)+", Shift:"+String.valueOf(preShift));
                try (FileOutputStream fileOut = new FileOutputStream("reports\\"+fileName+"_Alarm.xls")) {
                    HSSFSheet sheet = wb.createSheet(fileName);
                    HSSFRow title = sheet.createRow(0);
                    HSSFCell titleCell = title.createCell(0);
                    titleCell.setCellValue(fileName);
                    
                    HSSFCell operator = title.createCell(1);
                    operator.setCellValue("Старший оператор:");
                    HSSFCell operatorName = title.createCell(2);
                    Statement opStm = dbData.db.createStatement();
                    ResultSet opRS = opStm.executeQuery("SELECT TOP 1 aDesc, id FROM dbo.ProcessArchieve where aDate = '"+
                            dateFormat.format(reportDate)+
                            "' and aShift="+String.valueOf(preShift)+" order by id desc");
                    while (opRS.next()){
                        operatorName.setCellValue(opRS.getString(1));
                    }
                    opRS.close();
                    opStm.close();
                    int newRow=2;
                    //Узнаем, нужен ли отчет вообще
                        int alarmCnt=0;
                        for (int i=0; i<archieveTagsDesc.size(); i++){
                            //Заполнение заголовка                                                        
                            try (Statement stmt = dbData.db.createStatement()) {
                                String query = "SELECT TOP 3 MAX(aValue) as aValue, aTag "+
                                                "FROM dbo.ProcessArchieve where aDate = '"+
                                                dateFormat.format(reportDate)+"' and aShift="+String.valueOf(preShift)+
                                                " and aTag='"+archieveTags.get(i)+"' and aValue>"+String.valueOf(archieveTagsMax.get(i))+
                                                " group by aTag, aValue";
                                //System.out.println(query);
                                ResultSet rs;
                                rs = stmt.executeQuery(query);                                
                                
                                if (rs.next()){
                                    //rs.first();
                                    HSSFRow headerRow = sheet.createRow(newRow);
                                    HSSFCell headerCell = headerRow.createCell(0);
                                    headerCell.setCellStyle(headerCellStyle);
                                    headerCell.setCellValue(archieveTagsDesc.get(i));                            
                                    sheet.addMergedRegion(new CellRangeAddress(newRow, newRow, 0, 1));
                                    sheet.autoSizeColumn(0);
                                    sheet.autoSizeColumn(1);
                                    newRow++;
                                    HSSFRow extRow = sheet.createRow(newRow);
                                    HSSFCell extCell = extRow.createCell(0);
                                    extCell.setCellStyle(headerCellStyle);
                                    extCell.setCellValue("Макс. значение");
                                    extCell = extRow.createCell(1);
                                    extCell.setCellStyle(headerCellStyle);
                                    extCell.setCellValue("Авар. значение");                                    
                                    newRow++;
                                    HSSFRow maxDataRow = sheet.createRow(newRow);
                                    HSSFCell maxDataCell = maxDataRow.createCell(0);
                                    maxDataCell.setCellStyle(dataCellStyle);
                                    maxDataCell.setCellValue(archieveTagsMax.get(i));
                                    maxDataCell = maxDataRow.createCell(1);
                                    maxDataCell.setCellStyle(headerCellStyle);
                                    maxDataCell.setCellValue(rs.getString(1));
                                    while (rs.next()){
                                        newRow++;
                                        maxDataRow = sheet.createRow(newRow);
                                        maxDataCell = maxDataRow.createCell(0);
                                        maxDataCell.setCellStyle(headerCellStyle);
                                        maxDataCell.setCellValue(archieveTagsMax.get(i));
                                        maxDataCell = maxDataRow.createCell(1);
                                        maxDataCell.setCellStyle(headerCellStyle);
                                        maxDataCell.setCellValue(rs.getString(1));
                                    }
                                    
                                } else {
                                }
                                rs.close();
                                query = "SELECT TOP 3 MIN(aValue) as aValue, aTag "+
                                                "FROM dbo.ProcessArchieve where aDate = '"+
                                                dateFormat.format(reportDate)+"' and aShift="+String.valueOf(preShift)+
                                                " and aTag='"+archieveTags.get(i)+"' and aValue<"+String.valueOf(archieveTagsMin.get(i))+
                                                " group by aTag, aValue";
                                //System.out.println(query);
                                rs = stmt.executeQuery(query);
                                
                                if (rs.next()){                                    
                                    HSSFRow headerRow = sheet.createRow(newRow);
                                    HSSFCell headerCell = headerRow.createCell(0);
                                    headerCell.setCellStyle(headerCellStyle);
                                    headerCell.setCellValue(archieveTagsDesc.get(i));                            
                                    sheet.addMergedRegion(new CellRangeAddress(newRow, newRow, 0, 1));
                                    sheet.autoSizeColumn(0);
                                    sheet.autoSizeColumn(1);
                                    newRow++;
                                    HSSFRow minRow = sheet.createRow(newRow);
                                    HSSFCell minCell = minRow.createCell(0);
                                    minCell.setCellStyle(headerCellStyle);
                                    minCell.setCellValue("Мин. значение");
                                    minCell = minRow.createCell(1);
                                    minCell.setCellStyle(headerCellStyle);
                                    minCell.setCellValue("Авар. значение");
                                    newRow++;
                                    HSSFRow minDataRow = sheet.createRow(newRow);
                                    HSSFCell minDataCell = minDataRow.createCell(0);
                                    minDataCell.setCellStyle(headerCellStyle);
                                    minDataCell.setCellValue(archieveTagsMin.get(i));
                                    minDataCell = minDataRow.createCell(1);
                                    minDataCell.setCellStyle(headerCellStyle);
                                    minDataCell.setCellValue(rs.getString(1));
                                    while (rs.next()){
                                        newRow++;
                                        minDataRow = sheet.createRow(newRow);
                                        minDataCell = minDataRow.createCell(0);
                                        minDataCell.setCellStyle(headerCellStyle);
                                        minDataCell.setCellValue(archieveTagsMin.get(i));
                                        minDataCell = minDataRow.createCell(1);
                                        minDataCell.setCellStyle(headerCellStyle);
                                        minDataCell.setCellValue(rs.getString(1));
                                    }
                                    newRow++;    
                                    newRow++;
                                    newRow++;
                                    HSSFRow blankRow = sheet.createRow(newRow);
                                }
                                rs.close();
                            }catch (SQLException sqlEX){
                                System.out.println(sqlEX);
                            }      
                            
                        }
                        sheet.autoSizeColumn(0);
                        sheet.autoSizeColumn(1);
                        wb.write(fileOut);
                        Desktop d = Desktop.getDesktop();
                        File f = new File(System.getProperty("user.dir")+"\\reports\\"+fileName+"_Alarm.xls");
                        d.print(f);
                        reportDone = true;
                        System.out.println("Making report file "+fileName+".xls complete");
                }   catch (IOException | SQLException ex) {
                    Logger.getLogger(ExcelAlarmReport.class.getName()).log(Level.SEVERE, null, ex);
                    System.out.println(ex);
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
                    Thread.sleep(100);
                } catch (InterruptedException ex) {
                    Logger.getLogger(LevelToVolume.class.getName()).log(Level.SEVERE, null, ex);
                }
            }    
        }    
    }
}
