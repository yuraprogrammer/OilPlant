/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.dictionary;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "ExcelReport_Data", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ExcelReportData.findAll", query = "SELECT e FROM ExcelReportData e"),
    @NamedQuery(name = "ExcelReportData.findByADate", query = "SELECT e FROM ExcelReportData e WHERE e.aDate = :aDate"),
    @NamedQuery(name = "ExcelReportData.findByAShift", query = "SELECT e FROM ExcelReportData e WHERE e.aShift = :aShift"),
    @NamedQuery(name = "ExcelReportData.findByATag", query = "SELECT e FROM ExcelReportData e WHERE e.aTag = :aTag"),
    @NamedQuery(name = "ExcelReportData.findByMaxValue", query = "SELECT e FROM ExcelReportData e WHERE e.maxValue = :maxValue"),
    @NamedQuery(name = "ExcelReportData.findByMinValue", query = "SELECT e FROM ExcelReportData e WHERE e.minValue = :minValue"),
    @NamedQuery(name = "ExcelReportData.findByAvgValue", query = "SELECT e FROM ExcelReportData e WHERE e.avgValue = :avgValue")})
public class ExcelReportData implements Serializable {

    private static final long serialVersionUID = 1L;
    @Temporal(TemporalType.DATE)
    private Date aDate;
    private Integer aShift;
    @Column(length = 2147483647)
    private String aTag;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(precision = 18, scale = 2)
    private BigDecimal maxValue;
    @Column(precision = 18, scale = 2)
    private BigDecimal minValue;
    @Column(precision = 38, scale = 6)
    private BigDecimal avgValue;
    @EmbeddedId
    private reportId id;

    public reportId getId() {
        return id;
    }

    public void setId(reportId id) {
        this.id = id;
    }
    
    public ExcelReportData() {
    }

    public Date getADate() {
        return aDate;
    }

    public void setADate(Date aDate) {
        this.aDate = aDate;
    }

    public Integer getAShift() {
        return aShift;
    }

    public void setAShift(Integer aShift) {
        this.aShift = aShift;
    }

    public String getATag() {
        return aTag;
    }

    public void setATag(String aTag) {
        this.aTag = aTag;
    }

    public BigDecimal getMaxValue() {
        return maxValue;
    }

    public void setMaxValue(BigDecimal maxValue) {
        this.maxValue = maxValue;
    }

    public BigDecimal getMinValue() {
        return minValue;
    }

    public void setMinValue(BigDecimal minValue) {
        this.minValue = minValue;
    }

    public BigDecimal getAvgValue() {
        return avgValue;
    }

    public void setAvgValue(BigDecimal avgValue) {
        this.avgValue = avgValue;
    }
    
}

@Embeddable
class reportId{
    @Column(name = "aDate")
    @Temporal(TemporalType.DATE)
    private Date aDate;
    @Column(name = "aShift")
    private int aShift;
    @Column(name = "aTag")
    private String aTag;
}