/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.process;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "OTG_To_UPPG", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OTGToUPPG.findAll", query = "SELECT o FROM OTGToUPPG o"),
    @NamedQuery(name = "OTGToUPPG.findById", query = "SELECT o FROM OTGToUPPG o WHERE o.id = :id"),
    @NamedQuery(name = "OTGToUPPG.findByActID", query = "SELECT o FROM OTGToUPPG o WHERE o.actID = :actID"),
    @NamedQuery(name = "OTGToUPPG.findByStartLevel", query = "SELECT o FROM OTGToUPPG o WHERE o.startLevel = :startLevel"),
    @NamedQuery(name = "OTGToUPPG.findByFinishLevel", query = "SELECT o FROM OTGToUPPG o WHERE o.finishLevel = :finishLevel"),
    @NamedQuery(name = "OTGToUPPG.findByTankID", query = "SELECT o FROM OTGToUPPG o WHERE o.tankID = :tankID"),
    @NamedQuery(name = "OTGToUPPG.findByStartVolume", query = "SELECT o FROM OTGToUPPG o WHERE o.startVolume = :startVolume"),
    @NamedQuery(name = "OTGToUPPG.findByEndVolume", query = "SELECT o FROM OTGToUPPG o WHERE o.endVolume = :endVolume"),
    @NamedQuery(name = "OTGToUPPG.findByStartMass", query = "SELECT o FROM OTGToUPPG o WHERE o.startMass = :startMass"),
    @NamedQuery(name = "OTGToUPPG.findByEndMass", query = "SELECT o FROM OTGToUPPG o WHERE o.endMass = :endMass"),
    @NamedQuery(name = "OTGToUPPG.findByStartDensity", query = "SELECT o FROM OTGToUPPG o WHERE o.startDensity = :startDensity"),
    @NamedQuery(name = "OTGToUPPG.findByEndDensity", query = "SELECT o FROM OTGToUPPG o WHERE o.endDensity = :endDensity"),
    @NamedQuery(name = "OTGToUPPG.findByStartDensity20", query = "SELECT o FROM OTGToUPPG o WHERE o.startDensity20 = :startDensity20"),
    @NamedQuery(name = "OTGToUPPG.findByEndDensity20", query = "SELECT o FROM OTGToUPPG o WHERE o.endDensity20 = :endDensity20"),
    @NamedQuery(name = "OTGToUPPG.findByOtgToUppgVolume", query = "SELECT o FROM OTGToUPPG o WHERE o.otgToUppgVolume = :otgToUppgVolume"),
    @NamedQuery(name = "OTGToUPPG.findByOtgToUppgMass", query = "SELECT o FROM OTGToUPPG o WHERE o.otgToUppgMass = :otgToUppgMass")})
public class OTGToUPPG implements Serializable {

    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Long id;
    @Basic(optional = false)
    @Column(name = "actID")
    private long actID;
    @Basic(optional = false)
    @Column(name = "startLevel")
    private long startLevel;
    @Basic(optional = false)
    @Column(name = "finishLevel")
    private long finishLevel;
    @Basic(optional = false)
    @Column(name = "tankID")
    private long tankID;
    @Basic(optional = false)
    @Column(name = "startVolume")
    private long startVolume;
    @Basic(optional = false)
    @Column(name = "endVolume")
    private long endVolume;
    @Basic(optional = false)
    @Column(name = "startMass")
    private long startMass;
    @Basic(optional = false)
    @Column(name = "endMass")
    private long endMass;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "startDensity")
    private BigDecimal startDensity;
    @Basic(optional = false)
    @Column(name = "endDensity")
    private BigDecimal endDensity;
    @Basic(optional = false)
    @Column(name = "startDensity20")
    private BigDecimal startDensity20;
    @Basic(optional = false)
    @Column(name = "endDensity20")
    private BigDecimal endDensity20;
    @Column(name = "otgToUppgVolume")
    private BigInteger otgToUppgVolume;
    @Column(name = "otgToUppgMass")
    private BigInteger otgToUppgMass;
    @Basic(optional = false)
    @Column(name = "startTemp")
    private BigDecimal startTemp;
    @Basic(optional = false)
    @Column(name = "endTemp")
    private BigDecimal endTemp;    

    public OTGToUPPG() {
    }

    public OTGToUPPG(Long id) {
        this.id = id;
    }

    public OTGToUPPG(Long id, long actID, long startLevel, long finishLevel, long tankID, long startVolume, long endVolume, long startMass, long endMass, BigDecimal startDensity, BigDecimal endDensity, BigDecimal startDensity20, BigDecimal endDensity20) {
        this.id = id;
        this.actID = actID;
        this.startLevel = startLevel;
        this.finishLevel = finishLevel;
        this.tankID = tankID;
        this.startVolume = startVolume;
        this.endVolume = endVolume;
        this.startMass = startMass;
        this.endMass = endMass;
        this.startDensity = startDensity;
        this.endDensity = endDensity;
        this.startDensity20 = startDensity20;
        this.endDensity20 = endDensity20;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public long getActID() {
        return actID;
    }

    public void setActID(long actID) {
        this.actID = actID;
    }

    public long getStartLevel() {
        return startLevel;
    }

    public void setStartLevel(long startLevel) {
        this.startLevel = startLevel;
    }

    public long getFinishLevel() {
        return finishLevel;
    }

    public void setFinishLevel(long finishLevel) {
        this.finishLevel = finishLevel;
    }

    public long getTankID() {
        return tankID;
    }

    public void setTankID(long tankID) {
        this.tankID = tankID;
    }

    public long getStartVolume() {
        return startVolume;
    }

    public void setStartVolume(long startVolume) {
        this.startVolume = startVolume;
    }

    public long getEndVolume() {
        return endVolume;
    }

    public void setEndVolume(long endVolume) {
        this.endVolume = endVolume;
    }

    public long getStartMass() {
        return startMass;
    }

    public void setStartMass(long startMass) {
        this.startMass = startMass;
    }

    public long getEndMass() {
        return endMass;
    }

    public void setEndMass(long endMass) {
        this.endMass = endMass;
    }

    public BigDecimal getStartDensity() {
        return startDensity;
    }

    public void setStartDensity(BigDecimal startDensity) {
        this.startDensity = startDensity;
    }

    public BigDecimal getEndDensity() {
        return endDensity;
    }

    public void setEndDensity(BigDecimal endDensity) {
        this.endDensity = endDensity;
    }

    public BigDecimal getStartDensity20() {
        return startDensity20;
    }

    public void setStartDensity20(BigDecimal startDensity20) {
        this.startDensity20 = startDensity20;
    }

    public BigDecimal getEndDensity20() {
        return endDensity20;
    }

    public void setEndDensity20(BigDecimal endDensity20) {
        this.endDensity20 = endDensity20;
    }

    public BigInteger getOtgToUppgVolume() {
        return otgToUppgVolume;
    }

    public void setOtgToUppgVolume(BigInteger otgToUppgVolume) {
        this.otgToUppgVolume = otgToUppgVolume;
    }

    public BigInteger getOtgToUppgMass() {
        return otgToUppgMass;
    }

    public void setOtgToUppgMass(BigInteger otgToUppgMass) {
        this.otgToUppgMass = otgToUppgMass;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OTGToUPPG)) {
            return false;
        }
        OTGToUPPG other = (OTGToUPPG) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.OTGToUPPG[ id=" + id + " ]";
    }
    

    public OTGToUPPG(Long id, long actID, long startLevel, long finishLevel, long tankID, long startVolume, long endVolume, long startMass, long endMass, BigDecimal startDensity, BigDecimal endDensity, BigDecimal startDensity20, BigDecimal endDensity20, BigDecimal startTemp, BigDecimal endTemp) {
        this.id = id;
        this.actID = actID;
        this.startLevel = startLevel;
        this.finishLevel = finishLevel;
        this.tankID = tankID;
        this.startVolume = startVolume;
        this.endVolume = endVolume;
        this.startMass = startMass;
        this.endMass = endMass;
        this.startDensity = startDensity;
        this.endDensity = endDensity;
        this.startDensity20 = startDensity20;
        this.endDensity20 = endDensity20;
        this.startTemp = startTemp;
        this.endTemp = endTemp;
    }    

    public BigDecimal getStartTemp() {
        return startTemp;
    }

    public void setStartTemp(BigDecimal startTemp) {
        this.startTemp = startTemp;
    }

    public BigDecimal getEndTemp() {
        return endTemp;
    }

    public void setEndTemp(BigDecimal endTemp) {
        this.endTemp = endTemp;
    }    
    
}
