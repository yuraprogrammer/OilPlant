package com.alexprom.entities.process;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "Act_Counters", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ActCounters.findAll", query = "SELECT a FROM ActCounters a"),
    @NamedQuery(name = "ActCounters.findById", query = "SELECT a FROM ActCounters a WHERE a.id = :id"),
    @NamedQuery(name = "ActCounters.findByActID", query = "SELECT a FROM ActCounters a WHERE a.actID = :actID"),
    @NamedQuery(name = "ActCounters.findByMassStartS", query = "SELECT a FROM ActCounters a WHERE a.massStartS = :massStartS"),
    @NamedQuery(name = "ActCounters.findByVolumeStartS", query = "SELECT a FROM ActCounters a WHERE a.volumeStartS = :volumeStartS"),
    @NamedQuery(name = "ActCounters.findByTempStartS", query = "SELECT a FROM ActCounters a WHERE a.tempStartS = :tempStartS"),
    @NamedQuery(name = "ActCounters.findByDensityStartS", query = "SELECT a FROM ActCounters a WHERE a.densityStartS = :densityStartS"),
    @NamedQuery(name = "ActCounters.findByMassStartB", query = "SELECT a FROM ActCounters a WHERE a.massStartB = :massStartB"),
    @NamedQuery(name = "ActCounters.findByVolumeStartB", query = "SELECT a FROM ActCounters a WHERE a.volumeStartB = :volumeStartB"),
    @NamedQuery(name = "ActCounters.findByTempStartB", query = "SELECT a FROM ActCounters a WHERE a.tempStartB = :tempStartB"),
    @NamedQuery(name = "ActCounters.findByDensityStartB", query = "SELECT a FROM ActCounters a WHERE a.densityStartB = :densityStartB"),
    @NamedQuery(name = "ActCounters.findByMassStartA", query = "SELECT a FROM ActCounters a WHERE a.massStartA = :massStartA"),
    @NamedQuery(name = "ActCounters.findByVolumeStartA", query = "SELECT a FROM ActCounters a WHERE a.volumeStartA = :volumeStartA"),
    @NamedQuery(name = "ActCounters.findByTempStartA", query = "SELECT a FROM ActCounters a WHERE a.tempStartA = :tempStartA"),
    @NamedQuery(name = "ActCounters.findByDensityStartA", query = "SELECT a FROM ActCounters a WHERE a.densityStartA = :densityStartA"),
    @NamedQuery(name = "ActCounters.findByMassEndS", query = "SELECT a FROM ActCounters a WHERE a.massEndS = :massEndS"),
    @NamedQuery(name = "ActCounters.findByVolumeEndS", query = "SELECT a FROM ActCounters a WHERE a.volumeEndS = :volumeEndS"),
    @NamedQuery(name = "ActCounters.findByTempEndS", query = "SELECT a FROM ActCounters a WHERE a.tempEndS = :tempEndS"),
    @NamedQuery(name = "ActCounters.findByDensityEndS", query = "SELECT a FROM ActCounters a WHERE a.densityEndS = :densityEndS"),
    @NamedQuery(name = "ActCounters.findByMassEndB", query = "SELECT a FROM ActCounters a WHERE a.massEndB = :massEndB"),
    @NamedQuery(name = "ActCounters.findByVolumeEndB", query = "SELECT a FROM ActCounters a WHERE a.volumeEndB = :volumeEndB"),
    @NamedQuery(name = "ActCounters.findByTempEndB", query = "SELECT a FROM ActCounters a WHERE a.tempEndB = :tempEndB"),
    @NamedQuery(name = "ActCounters.findByDensityEndB", query = "SELECT a FROM ActCounters a WHERE a.densityEndB = :densityEndB"),
    @NamedQuery(name = "ActCounters.findByMassEndA", query = "SELECT a FROM ActCounters a WHERE a.massEndA = :massEndA"),
    @NamedQuery(name = "ActCounters.findByVolumeEndA", query = "SELECT a FROM ActCounters a WHERE a.volumeEndA = :volumeEndA"),
    @NamedQuery(name = "ActCounters.findByTempEndA", query = "SELECT a FROM ActCounters a WHERE a.tempEndA = :tempEndA"),
    @NamedQuery(name = "ActCounters.findByDensityEndA", query = "SELECT a FROM ActCounters a WHERE a.densityEndA = :densityEndA"),
    @NamedQuery(name = "ActCounters.findByProcessingMass", query = "SELECT a FROM ActCounters a WHERE a.processingMass = :processingMass"),
    @NamedQuery(name = "ActCounters.findByProcessingVolume", query = "SELECT a FROM ActCounters a WHERE a.processingVolume = :processingVolume"),
    @NamedQuery(name = "ActCounters.findByBLFMass", query = "SELECT a FROM ActCounters a WHERE a.bLFMass = :bLFMass"),
    @NamedQuery(name = "ActCounters.findByBLFVolume", query = "SELECT a FROM ActCounters a WHERE a.bLFVolume = :bLFVolume"),
    @NamedQuery(name = "ActCounters.findByAKDGMass", query = "SELECT a FROM ActCounters a WHERE a.aKDGMass = :aKDGMass"),
    @NamedQuery(name = "ActCounters.findByAKDFVolume", query = "SELECT a FROM ActCounters a WHERE a.aKDFVolume = :aKDFVolume")})
public class ActCounters implements Serializable {

    
    @Column(name = "BLF_AKDG_Percent", precision = 19, scale = 4, insertable = false, updatable = false)
    private BigDecimal bLFAKDGPercent;
    @Column(name = "BLF_AKDG_OTG_Percent", precision = 20, scale = 4, insertable = false, updatable = false)
    private BigDecimal bLFAKDGOTGPercent;

    @Column(name = "BLF_Percent", precision = 18, scale = 4)
    private BigDecimal bLFPercent;
    @Column(name = "AKDG_Percent", precision = 18, scale = 4)
    private BigDecimal aKDGPercent;
    @Column(name = "OTG_Percent", precision = 18, scale = 4)
    private BigDecimal oTGPercent;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(nullable = false)
    private Long id;
    @Basic(optional = false)
    @Column(nullable = false)
    private long actID;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "MassStart_S", nullable = false, precision = 18, scale = 4)
    private BigDecimal massStartS;
    @Basic(optional = false)
    @Column(name = "VolumeStart_S", nullable = false, precision = 18, scale = 4)
    private BigDecimal volumeStartS;
    @Basic(optional = false)
    @Column(name = "TempStart_S", nullable = false, precision = 18, scale = 4)
    private BigDecimal tempStartS;
    @Basic(optional = false)
    @Column(name = "DensityStart_S", nullable = false, precision = 18, scale = 4)
    private BigDecimal densityStartS;
    @Basic(optional = false)
    @Column(name = "MassStart_B", nullable = false, precision = 18, scale = 4)
    private BigDecimal massStartB;
    @Basic(optional = false)
    @Column(name = "VolumeStart_B", nullable = false, precision = 18, scale = 4)
    private BigDecimal volumeStartB;
    @Basic(optional = false)
    @Column(name = "TempStart_B", nullable = false, precision = 18, scale = 4)
    private BigDecimal tempStartB;
    @Basic(optional = false)
    @Column(name = "DensityStart_B", nullable = false, precision = 18, scale = 4)
    private BigDecimal densityStartB;
    @Basic(optional = false)
    @Column(name = "MassStart_A", nullable = false, precision = 18, scale = 4)
    private BigDecimal massStartA;
    @Basic(optional = false)
    @Column(name = "VolumeStart_A", nullable = false, precision = 18, scale = 4)
    private BigDecimal volumeStartA;
    @Basic(optional = false)
    @Column(name = "TempStart_A", nullable = false, precision = 18, scale = 4)
    private BigDecimal tempStartA;
    @Basic(optional = false)
    @Column(name = "DensityStart_A", nullable = false, precision = 18, scale = 4)
    private BigDecimal densityStartA;
    @Basic(optional = false)
    @Column(name = "MassEnd_S", nullable = false, precision = 18, scale = 4)
    private BigDecimal massEndS;
    @Basic(optional = false)
    @Column(name = "VolumeEnd_S", nullable = false, precision = 18, scale = 4)
    private BigDecimal volumeEndS;
    @Basic(optional = false)
    @Column(name = "TempEnd_S", nullable = false, precision = 18, scale = 4)
    private BigDecimal tempEndS;
    @Basic(optional = false)
    @Column(name = "DensityEnd_S", nullable = false, precision = 18, scale = 4)
    private BigDecimal densityEndS;
    @Basic(optional = false)
    @Column(name = "MassEnd_B", nullable = false, precision = 18, scale = 4)
    private BigDecimal massEndB;
    @Basic(optional = false)
    @Column(name = "VolumeEnd_B", nullable = false, precision = 18, scale = 4)
    private BigDecimal volumeEndB;
    @Basic(optional = false)
    @Column(name = "TempEnd_B", nullable = false, precision = 18, scale = 4)
    private BigDecimal tempEndB;
    @Basic(optional = false)
    @Column(name = "DensityEnd_B", nullable = false, precision = 18, scale = 4)
    private BigDecimal densityEndB;
    @Basic(optional = false)
    @Column(name = "MassEnd_A", nullable = false, precision = 18, scale = 4)
    private BigDecimal massEndA;
    @Basic(optional = false)
    @Column(name = "VolumeEnd_A", nullable = false, precision = 18, scale = 4)
    private BigDecimal volumeEndA;
    @Basic(optional = false)
    @Column(name = "TempEnd_A", nullable = false, precision = 18, scale = 4)
    private BigDecimal tempEndA;
    @Basic(optional = false)
    @Column(name = "DensityEnd_A", nullable = false, precision = 18, scale = 4)
    private BigDecimal densityEndA;
    @Column(name = "Processing_Mass", precision = 19, scale = 4)
    private BigDecimal processingMass;
    @Column(name = "Processing_Volume", precision = 19, scale = 4)
    private BigDecimal processingVolume;
    @Column(name = "BLF_Mass", precision = 19, scale = 4)
    private BigDecimal bLFMass;
    @Column(name = "BLF_Volume", precision = 19, scale = 4)
    private BigDecimal bLFVolume;
    @Column(name = "AKDG_Mass", precision = 19, scale = 4)
    private BigDecimal aKDGMass;
    @Column(name = "AKDF_Volume", precision = 19, scale = 4)
    private BigDecimal aKDFVolume;

    public ActCounters() {
    }

    public ActCounters(Long id) {
        this.id = id;
    }

    public ActCounters(Long id, long actID, BigDecimal massStartS, BigDecimal volumeStartS, BigDecimal tempStartS, BigDecimal densityStartS, BigDecimal massStartB, BigDecimal volumeStartB, BigDecimal tempStartB, BigDecimal densityStartB, BigDecimal massStartA, BigDecimal volumeStartA, BigDecimal tempStartA, BigDecimal densityStartA, BigDecimal massEndS, BigDecimal volumeEndS, BigDecimal tempEndS, BigDecimal densityEndS, BigDecimal massEndB, BigDecimal volumeEndB, BigDecimal tempEndB, BigDecimal densityEndB, BigDecimal massEndA, BigDecimal volumeEndA, BigDecimal tempEndA, BigDecimal densityEndA) {
        this.id = id;
        this.actID = actID;
        this.massStartS = massStartS;
        this.volumeStartS = volumeStartS;
        this.tempStartS = tempStartS;
        this.densityStartS = densityStartS;
        this.massStartB = massStartB;
        this.volumeStartB = volumeStartB;
        this.tempStartB = tempStartB;
        this.densityStartB = densityStartB;
        this.massStartA = massStartA;
        this.volumeStartA = volumeStartA;
        this.tempStartA = tempStartA;
        this.densityStartA = densityStartA;
        this.massEndS = massEndS;
        this.volumeEndS = volumeEndS;
        this.tempEndS = tempEndS;
        this.densityEndS = densityEndS;
        this.massEndB = massEndB;
        this.volumeEndB = volumeEndB;
        this.tempEndB = tempEndB;
        this.densityEndB = densityEndB;
        this.massEndA = massEndA;
        this.volumeEndA = volumeEndA;
        this.tempEndA = tempEndA;
        this.densityEndA = densityEndA;
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

    public BigDecimal getMassStartS() {
        return massStartS;
    }

    public void setMassStartS(BigDecimal massStartS) {
        this.massStartS = massStartS;
    }

    public BigDecimal getVolumeStartS() {
        return volumeStartS;
    }

    public void setVolumeStartS(BigDecimal volumeStartS) {
        this.volumeStartS = volumeStartS;
    }

    public BigDecimal getTempStartS() {
        return tempStartS;
    }

    public void setTempStartS(BigDecimal tempStartS) {
        this.tempStartS = tempStartS;
    }

    public BigDecimal getDensityStartS() {
        return densityStartS;
    }

    public void setDensityStartS(BigDecimal densityStartS) {
        this.densityStartS = densityStartS;
    }

    public BigDecimal getMassStartB() {
        return massStartB;
    }

    public void setMassStartB(BigDecimal massStartB) {
        this.massStartB = massStartB;
    }

    public BigDecimal getVolumeStartB() {
        return volumeStartB;
    }

    public void setVolumeStartB(BigDecimal volumeStartB) {
        this.volumeStartB = volumeStartB;
    }

    public BigDecimal getTempStartB() {
        return tempStartB;
    }

    public void setTempStartB(BigDecimal tempStartB) {
        this.tempStartB = tempStartB;
    }

    public BigDecimal getDensityStartB() {
        return densityStartB;
    }

    public void setDensityStartB(BigDecimal densityStartB) {
        this.densityStartB = densityStartB;
    }

    public BigDecimal getMassStartA() {
        return massStartA;
    }

    public void setMassStartA(BigDecimal massStartA) {
        this.massStartA = massStartA;
    }

    public BigDecimal getVolumeStartA() {
        return volumeStartA;
    }

    public void setVolumeStartA(BigDecimal volumeStartA) {
        this.volumeStartA = volumeStartA;
    }

    public BigDecimal getTempStartA() {
        return tempStartA;
    }

    public void setTempStartA(BigDecimal tempStartA) {
        this.tempStartA = tempStartA;
    }

    public BigDecimal getDensityStartA() {
        return densityStartA;
    }

    public void setDensityStartA(BigDecimal densityStartA) {
        this.densityStartA = densityStartA;
    }

    public BigDecimal getMassEndS() {
        return massEndS;
    }

    public void setMassEndS(BigDecimal massEndS) {
        this.massEndS = massEndS;
    }

    public BigDecimal getVolumeEndS() {
        return volumeEndS;
    }

    public void setVolumeEndS(BigDecimal volumeEndS) {
        this.volumeEndS = volumeEndS;
    }

    public BigDecimal getTempEndS() {
        return tempEndS;
    }

    public void setTempEndS(BigDecimal tempEndS) {
        this.tempEndS = tempEndS;
    }

    public BigDecimal getDensityEndS() {
        return densityEndS;
    }

    public void setDensityEndS(BigDecimal densityEndS) {
        this.densityEndS = densityEndS;
    }

    public BigDecimal getMassEndB() {
        return massEndB;
    }

    public void setMassEndB(BigDecimal massEndB) {
        this.massEndB = massEndB;
    }

    public BigDecimal getVolumeEndB() {
        return volumeEndB;
    }

    public void setVolumeEndB(BigDecimal volumeEndB) {
        this.volumeEndB = volumeEndB;
    }

    public BigDecimal getTempEndB() {
        return tempEndB;
    }

    public void setTempEndB(BigDecimal tempEndB) {
        this.tempEndB = tempEndB;
    }

    public BigDecimal getDensityEndB() {
        return densityEndB;
    }

    public void setDensityEndB(BigDecimal densityEndB) {
        this.densityEndB = densityEndB;
    }

    public BigDecimal getMassEndA() {
        return massEndA;
    }

    public void setMassEndA(BigDecimal massEndA) {
        this.massEndA = massEndA;
    }

    public BigDecimal getVolumeEndA() {
        return volumeEndA;
    }

    public void setVolumeEndA(BigDecimal volumeEndA) {
        this.volumeEndA = volumeEndA;
    }

    public BigDecimal getTempEndA() {
        return tempEndA;
    }

    public void setTempEndA(BigDecimal tempEndA) {
        this.tempEndA = tempEndA;
    }

    public BigDecimal getDensityEndA() {
        return densityEndA;
    }

    public void setDensityEndA(BigDecimal densityEndA) {
        this.densityEndA = densityEndA;
    }

    public BigDecimal getProcessingMass() {
        return processingMass;
    }

    public void setProcessingMass(BigDecimal processingMass) {
        this.processingMass = processingMass;
    }

    public BigDecimal getProcessingVolume() {
        return processingVolume;
    }

    public void setProcessingVolume(BigDecimal processingVolume) {
        this.processingVolume = processingVolume;
    }

    public BigDecimal getBLFMass() {
        return bLFMass;
    }

    public void setBLFMass(BigDecimal bLFMass) {
        this.bLFMass = bLFMass;
    }

    public BigDecimal getBLFVolume() {
        return bLFVolume;
    }

    public void setBLFVolume(BigDecimal bLFVolume) {
        this.bLFVolume = bLFVolume;
    }

    public BigDecimal getAKDGMass() {
        return aKDGMass;
    }

    public void setAKDGMass(BigDecimal aKDGMass) {
        this.aKDGMass = aKDGMass;
    }

    public BigDecimal getAKDFVolume() {
        return aKDFVolume;
    }

    public void setAKDFVolume(BigDecimal aKDFVolume) {
        this.aKDFVolume = aKDFVolume;
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
        if (!(object instanceof ActCounters)) {
            return false;
        }
        ActCounters other = (ActCounters) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.ActCounters[ id=" + id + " ]";
    }

    public ActCounters(Long id, long actID) {
        this.id = id;
        this.actID = actID;
    }   

    public BigDecimal getBLFPercent() {
        return bLFPercent;
    }

    public void setBLFPercent(BigDecimal bLFPercent) {
        this.bLFPercent = bLFPercent;
    }

    public BigDecimal getAKDGPercent() {
        return aKDGPercent;
    }

    public void setAKDGPercent(BigDecimal aKDGPercent) {
        this.aKDGPercent = aKDGPercent;
    }

    public BigDecimal getOTGPercent() {
        return oTGPercent;
    }

    public void setOTGPercent(BigDecimal oTGPercent) {
        this.oTGPercent = oTGPercent;
    }

    public BigDecimal getBLFAKDGPercent() {
        return bLFAKDGPercent;
    }

    public void setBLFAKDGPercent(BigDecimal bLFAKDGPercent) {
        this.bLFAKDGPercent = bLFAKDGPercent;
    }

    public BigDecimal getBLFAKDGOTGPercent() {
        return bLFAKDGOTGPercent;
    }

    public void setBLFAKDGOTGPercent(BigDecimal bLFAKDGOTGPercent) {
        this.bLFAKDGOTGPercent = bLFAKDGOTGPercent;
    }

        
}
