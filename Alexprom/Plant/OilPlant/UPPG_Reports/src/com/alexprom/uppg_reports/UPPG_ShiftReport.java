/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.uppg_reports;

import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author yura_
 */
public class UPPG_ShiftReport {

    private String reportSource = "./report_templates/simple.jrxml";
    private String reportDest = "./report_results/simple.html";
    private Map<String, Object> params;
    
    public UPPG_ShiftReport(){
        this.params = new HashMap<>();
        try{
            JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, new JREmptyDataSource());

            JasperExportManager.exportReportToHtmlFile(jasperPrint, reportDest);

            JasperViewer.viewReport(jasperPrint);
        }catch (JRException ex){
            ex.printStackTrace();
        }
    }
}
