/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.dictionary;

import java.io.Serializable;
import java.math.BigInteger;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author yura_
 */
@Entity
@Table(name = "tank_dic", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TankDic.findAll", query = "SELECT t FROM TankDic t"),
    @NamedQuery(name = "TankDic.findByTankId", query = "SELECT t FROM TankDic t WHERE t.tankId = :tankId"),
    @NamedQuery(name = "TankDic.findByTankName", query = "SELECT t FROM TankDic t WHERE t.tankName = :tankName"),
    @NamedQuery(name = "TankDic.findByInsideDiameter", query = "SELECT t FROM TankDic t WHERE t.insideDiameter = :insideDiameter"),
    @NamedQuery(name = "TankDic.findByCylinderLength", query = "SELECT t FROM TankDic t WHERE t.cylinderLength = :cylinderLength"),
    @NamedQuery(name = "TankDic.findByConusHeight", query = "SELECT t FROM TankDic t WHERE t.conusHeight = :conusHeight"),
    @NamedQuery(name = "TankDic.findByBandCount", query = "SELECT t FROM TankDic t WHERE t.bandCount = :bandCount"),
    @NamedQuery(name = "TankDic.findByDownType", query = "SELECT t FROM TankDic t WHERE t.downType = :downType"),
    @NamedQuery(name = "TankDic.findByNaklon", query = "SELECT t FROM TankDic t WHERE t.naklon = :naklon"),
    @NamedQuery(name = "TankDic.findByMatLevel", query = "SELECT t FROM TankDic t WHERE t.matLevel = :matLevel"),
    @NamedQuery(name = "TankDic.findByMatVolume", query = "SELECT t FROM TankDic t WHERE t.matVolume = :matVolume"),
    @NamedQuery(name = "TankDic.findBySirieId", query = "SELECT t FROM TankDic t WHERE t.sirieId = :sirieId"),
    @NamedQuery(name = "TankDic.findByMatTemp", query = "SELECT t FROM TankDic t WHERE t.matTemp = :matTemp"),
    @NamedQuery(name = "TankDic.findByMatPlotnost", query = "SELECT t FROM TankDic t WHERE t.matPlotnost = :matPlotnost"),
    @NamedQuery(name = "TankDic.findByDontTouch", query = "SELECT t FROM TankDic t WHERE t.dontTouch = :dontTouch"),
    @NamedQuery(name = "TankDic.findByToOut", query = "SELECT t FROM TankDic t WHERE t.toOut = :toOut"),
    @NamedQuery(name = "TankDic.findByAdditional", query = "SELECT t FROM TankDic t WHERE t.additional = :additional"),
    @NamedQuery(name = "TankDic.findByAddTmc", query = "SELECT t FROM TankDic t WHERE t.addTmc = :addTmc"),
    @NamedQuery(name = "TankDic.findBySortFactor", query = "SELECT t FROM TankDic t WHERE t.sortFactor = :sortFactor")})
public class TankDic implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "Tank_Id", nullable = false)
    private Short tankId;
    @Basic(optional = false)
    @Column(name = "Tank_Name", nullable = false, length = 10)
    private String tankName;
    @Basic(optional = false)
    @Column(name = "Inside_Diameter", nullable = false)
    private int insideDiameter;
    @Basic(optional = false)
    @Column(name = "Cylinder_Length", nullable = false)
    private int cylinderLength;
    @Basic(optional = false)
    @Column(name = "Conus_Height", nullable = false)
    private int conusHeight;
    @Column(name = "Band_Count")
    private Short bandCount;
    @Column(name = "Down_Type")
    private Short downType;
    private Boolean naklon;
    private Integer matLevel;
    private BigInteger matVolume;
    @Column(name = "sirie_id")
    private Integer sirieId;
    @Column(name = "mat_temp")
    private Integer matTemp;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "mat_plotnost", precision = 24)
    private Float matPlotnost;
    @Column(name = "dont_touch")
    private BigInteger dontTouch;
    @Column(name = "to_out")
    private BigInteger toOut;
    private BigInteger additional;
    @Column(name = "add_tmc")
    private BigInteger addTmc;
    @Column(name = "sort_factor")
    private Integer sortFactor;

    public TankDic() {
    }

    public TankDic(Short tankId) {
        this.tankId = tankId;
    }

    public TankDic(Short tankId, String tankName, int insideDiameter, int cylinderLength, int conusHeight) {
        this.tankId = tankId;
        this.tankName = tankName;
        this.insideDiameter = insideDiameter;
        this.cylinderLength = cylinderLength;
        this.conusHeight = conusHeight;
    }

    public Short getTankId() {
        return tankId;
    }

    public void setTankId(Short tankId) {
        this.tankId = tankId;
    }

    public String getTankName() {
        return tankName;
    }

    public void setTankName(String tankName) {
        this.tankName = tankName;
    }

    public int getInsideDiameter() {
        return insideDiameter;
    }

    public void setInsideDiameter(int insideDiameter) {
        this.insideDiameter = insideDiameter;
    }

    public int getCylinderLength() {
        return cylinderLength;
    }

    public void setCylinderLength(int cylinderLength) {
        this.cylinderLength = cylinderLength;
    }

    public int getConusHeight() {
        return conusHeight;
    }

    public void setConusHeight(int conusHeight) {
        this.conusHeight = conusHeight;
    }

    public Short getBandCount() {
        return bandCount;
    }

    public void setBandCount(Short bandCount) {
        this.bandCount = bandCount;
    }

    public Short getDownType() {
        return downType;
    }

    public void setDownType(Short downType) {
        this.downType = downType;
    }

    public Boolean getNaklon() {
        return naklon;
    }

    public void setNaklon(Boolean naklon) {
        this.naklon = naklon;
    }

    public Integer getMatLevel() {
        return matLevel;
    }

    public void setMatLevel(Integer matLevel) {
        this.matLevel = matLevel;
    }

    public BigInteger getMatVolume() {
        return matVolume;
    }

    public void setMatVolume(BigInteger matVolume) {
        this.matVolume = matVolume;
    }

    public Integer getSirieId() {
        return sirieId;
    }

    public void setSirieId(Integer sirieId) {
        this.sirieId = sirieId;
    }

    public Integer getMatTemp() {
        return matTemp;
    }

    public void setMatTemp(Integer matTemp) {
        this.matTemp = matTemp;
    }

    public Float getMatPlotnost() {
        return matPlotnost;
    }

    public void setMatPlotnost(Float matPlotnost) {
        this.matPlotnost = matPlotnost;
    }

    public BigInteger getDontTouch() {
        return dontTouch;
    }

    public void setDontTouch(BigInteger dontTouch) {
        this.dontTouch = dontTouch;
    }

    public BigInteger getToOut() {
        return toOut;
    }

    public void setToOut(BigInteger toOut) {
        this.toOut = toOut;
    }

    public BigInteger getAdditional() {
        return additional;
    }

    public void setAdditional(BigInteger additional) {
        this.additional = additional;
    }

    public BigInteger getAddTmc() {
        return addTmc;
    }

    public void setAddTmc(BigInteger addTmc) {
        this.addTmc = addTmc;
    }

    public Integer getSortFactor() {
        return sortFactor;
    }

    public void setSortFactor(Integer sortFactor) {
        this.sortFactor = sortFactor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (tankId != null ? tankId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TankDic)) {
            return false;
        }
        TankDic other = (TankDic) object;
        if ((this.tankId == null && other.tankId != null) || (this.tankId != null && !this.tankId.equals(other.tankId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.dictionary.TankDic[ tankId=" + tankId + " ]";
    }
    
}
