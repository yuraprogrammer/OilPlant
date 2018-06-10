package remoteagent.beans;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
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
import static remoteagent.beans.AgentBase.dbData;

public class ProcessingReport extends AgentBase{
    
    private boolean shiftStarted;
    private int shift;
    private boolean reportDone = false;    
    private Date selectedDate;
    private boolean build = false;

    public int getShift() {
        return shift;
    }

    public void setShift(int shift) {
        this.shift = shift;
    }

    public Date getSelectedDate() {
        return selectedDate;
    }

    public void setSelectedDate(Date selectedDate) {
        this.selectedDate = selectedDate;
    }

    public boolean isBuild() {
        return build;
    }

    public void setBuild(boolean build) {
        this.build = build;
    }
    
    public ProcessingReport(){
        
    }
    
    @Override
    public void doTask(){
        if (isBuild()){
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");                                 
                        
            //Если началась новая смена - создаем файл отчета для предыдущей смены                            
            Date reportDate = getSelectedDate();
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
            
            String fileName = "ProcessingReport_"+dateFormat.format(reportDate);
            if (getShift()==1){
                fileName = fileName+"_08-00";
            }else{
                fileName = fileName+"_20-00";
            }
            
            try {
                FileOutputStream fileOut = new FileOutputStream("reports\\"+fileName+".xls");
                HSSFSheet sheet = wb.createSheet(fileName);
                HSSFRow title = sheet.createRow(0);
                HSSFCell titleCell = title.createCell(0);
                HSSFCell operator = title.createCell(1);
                    operator.setCellValue("Старший оператор:");
                    HSSFCell operatorName = title.createCell(2);
                    Statement opStm = dbData.db.createStatement();
                    ResultSet opRS = opStm.executeQuery("SELECT TOP 1 aDesc, id FROM dbo.ProcessArchieve where aDate = '"+
                                       dateFormat.format(reportDate)+
                                       "' and aShift="+String.valueOf(getShift())+" order by id desc");
                    while (opRS.next()){
                        operatorName.setCellValue(opRS.getString(1));
                    }
                    opRS.close();
                    opStm.close();
                    int newRow=2;
                
                
                
            } catch (FileNotFoundException | SQLException ex) {
                Logger.getLogger(ProcessingReport.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }    
    
}
