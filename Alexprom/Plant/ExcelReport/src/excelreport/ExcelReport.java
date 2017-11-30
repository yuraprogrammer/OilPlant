package excelreport;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Exchanger;
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

/**
 *
 * @author yura_
 */
public class ExcelReport extends AgentBase implements Runnable{
    private final List<String> archieveTags = new ArrayList<>();
    private final List<String> archieveTagsDesc = new ArrayList<>();
    private final List<String> archieveTagsMin = new ArrayList<>();
    private final List<String> archieveTagsMax = new ArrayList<>();
    private int completeProgress=0;    
    String message=null;
    public boolean reportDone;
    
    public ExcelReport(Exchanger<String> ex){
        super(ex);
    }          
    
    //Получение задания агентом
    @Override
    public void getTask(){              
    if (!getReportType()){    
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
    }else{
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
    }
    
    @Override
    public void doTask(){
        int count = archieveTags.size();
        int cnt=0;        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (count!=0){
            reportDone = false;
            try {                
                Statement cntStm = dbData.db.createStatement();
                ResultSet cntRS = cntStm.executeQuery("SELECT count(id) FROM dbo.ProcessArchieve where convert(varchar, aDate) like '"+
                        dateFormat.format(getReportDate())+
                        "%' and aShift="+String.valueOf(getShift()));
                while (cntRS.next()){
                    cnt = cntRS.getInt(1);
                }
                cntRS.close();
                cntStm.close();
            } catch (SQLException ex) {
                    Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
            }                
            if (cnt!=0){
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
                String fileName = dateFormat.format(getReportDate());
                if (getShift()==1){
                    fileName = fileName+"_08-00";
                }else{
                    fileName = fileName+"_20-00";
                }
                try (FileOutputStream fileOut = new FileOutputStream("reports\\"+fileName+"_"+getReportType()+".xls")) {
                    HSSFSheet sheet = wb.createSheet(fileName);
                    HSSFRow title = sheet.createRow(0);
                    HSSFCell titleCell = title.createCell(0);
                    titleCell.setCellValue(fileName);
                    
                    HSSFCell operator = title.createCell(1);
                    operator.setCellValue("Старший оператор:");
                    HSSFCell operatorName = title.createCell(2);
                    Statement opStm = dbData.db.createStatement();
                    ResultSet opRS = opStm.executeQuery("SELECT TOP 1 aDesc, id FROM dbo.ProcessArchieve where convert(varchar, aDate) like '"+
                            dateFormat.format(getReportDate())+
                            "%' and aShift="+String.valueOf(getShift())+" order by id desc");
                    while (opRS.next()){
                        operatorName.setCellValue(opRS.getString(1));
                    }
                    opRS.close();
                    opStm.close();
                    int newRow=2;
                    
                    if (!getReportType()){
                        //Заполнение заголовка параметров и данных
                        for (int i=0; i<archieveTagsDesc.size(); i++){
                            //Заполнение заголовка
                            completeProgress = (int)100*(i+1)/archieveTagsDesc.size();
                            setProgress(completeProgress);                    
                            message = String.valueOf(completeProgress);
                            try { 
                                message = this.exchanger.exchange(message);
                            } catch (InterruptedException ex) {
                                Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
                            }                        
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
                                        dateFormat.format(getReportDate())+
                                        "%' and aShift="+String.valueOf(getShift())+
                                        " and aTag='"+archieveTags.get(i)+"'";
                                //System.out.println(query);
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
                            } catch (SQLException ex) {
                                Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            newRow++;
                            newRow++;
                            HSSFRow blankRow = sheet.createRow(newRow);
                        }
                    
                        sheet.autoSizeColumn(0);
                        sheet.autoSizeColumn(1);
                        wb.write(fileOut);
                        reportDone = true;
                    }else{
                        //Узнаем, нужен ли отчет вообще
                        int alarmCnt=0;
                        for (int i=0; i<archieveTagsDesc.size(); i++){
                            //Заполнение заголовка
                            completeProgress = (int)100*(i+1)/archieveTagsDesc.size();
                            setProgress(completeProgress);                    
                            message = String.valueOf(completeProgress);
                            try { 
                                message = this.exchanger.exchange(message);
                            } catch (InterruptedException ex) {
                                Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
                            }
                            
                            try (Statement stmt = dbData.db.createStatement()) {
                                String query = "SELECT TOP 3 MAX(aValue) as aValue, aTag "+
                                                "FROM dbo.ProcessArchieve where convert(varchar, aDate) like '"+
                                                dateFormat.format(getReportDate())+"%' and aShift="+String.valueOf(getShift())+
                                                " and aTag='"+archieveTags.get(i)+"' and aValue>"+String.valueOf(archieveTagsMax.get(i))+
                                                " group by aTag, aValue";
                                System.out.println(query);
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
                                    extCell.setCellStyle(dataCellStyle);
                                    extCell.setCellValue("Макс. значение");
                                    extCell = extRow.createCell(1);
                                    extCell.setCellStyle(dataCellStyle);
                                    extCell.setCellValue("Авар. значение");                                    
                                    newRow++;
                                    HSSFRow maxDataRow = sheet.createRow(newRow);
                                    HSSFCell maxDataCell = maxDataRow.createCell(0);
                                    maxDataCell.setCellStyle(dataCellStyle);
                                    maxDataCell.setCellValue(archieveTagsMax.get(i));
                                    maxDataCell = maxDataRow.createCell(1);
                                    maxDataCell.setCellStyle(dataCellStyle);
                                    maxDataCell.setCellValue(rs.getString(1));
                                    while (rs.next()){
                                        newRow++;
                                        maxDataRow = sheet.createRow(newRow);
                                        maxDataCell = maxDataRow.createCell(0);
                                        maxDataCell.setCellStyle(dataCellStyle);
                                        maxDataCell.setCellValue(archieveTagsMax.get(i));
                                        maxDataCell = maxDataRow.createCell(1);
                                        maxDataCell.setCellStyle(dataCellStyle);
                                        maxDataCell.setCellValue(rs.getString(1));
                                    }
                                    
                                } else {
                                }
                                rs.close();
                                query = "SELECT TOP 3 MIN(aValue) as aValue, aTag "+
                                                "FROM dbo.ProcessArchieve where convert(varchar, aDate) like '"+
                                                dateFormat.format(getReportDate())+"%' and aShift="+String.valueOf(getShift())+
                                                " and aTag='"+archieveTags.get(i)+"' and aValue<"+String.valueOf(archieveTagsMin.get(i))+
                                                " group by aTag, aValue";
                                System.out.println(query);
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
                                    minCell.setCellStyle(dataCellStyle);
                                    minCell.setCellValue("Мин. значение");
                                    minCell = minRow.createCell(1);
                                    minCell.setCellStyle(dataCellStyle);
                                    minCell.setCellValue("Авар. значение");
                                    newRow++;
                                    HSSFRow minDataRow = sheet.createRow(newRow);
                                    HSSFCell minDataCell = minDataRow.createCell(0);
                                    minDataCell.setCellStyle(dataCellStyle);
                                    minDataCell.setCellValue(archieveTagsMin.get(i));
                                    minDataCell = minDataRow.createCell(1);
                                    minDataCell.setCellStyle(dataCellStyle);
                                    minDataCell.setCellValue(rs.getString(1));
                                    while (rs.next()){
                                        newRow++;
                                        minDataRow = sheet.createRow(newRow);
                                        minDataCell = minDataRow.createCell(0);
                                        minDataCell.setCellStyle(dataCellStyle);
                                        minDataCell.setCellValue(archieveTagsMin.get(i));
                                        minDataCell = minDataRow.createCell(1);
                                        minDataCell.setCellStyle(dataCellStyle);
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
                        File f = new File(System.getProperty("user.dir")+"\\reports\\"+fileName+"_"+getReportType()+".xls");
                        d.print(f);
/*                        String filePath = "\""+System.getProperty("user.dir")+"\\reports\\"+fileName+"_"+getReportType()+".xls\"";
                        URI email = URI.create("mailto:alexprom5@gmail.com?subject=report&Attach="+filePath+"&send-now=yes");
                        System.out.println(email);
                                                 
                        d.mail(email);*/
                        reportDone = true;    
        }}      catch (IOException ex) {
                    Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(ExcelReport.class.getName()).log(Level.SEVERE, null, ex);
                }}}
    }
    
    @Override
    @SuppressWarnings("empty-statement")
    public void run() {
        while (!reportDone){
            synchronized(this){
                doTask();                
            }    
        }    
    }
}
