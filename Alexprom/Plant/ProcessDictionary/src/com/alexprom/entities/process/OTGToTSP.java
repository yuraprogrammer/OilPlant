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
@Table(name = "OTG_To_TSP", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OTGToTSP.findAll", query = "SELECT o FROM OTGToTSP o"),
    @NamedQuery(name = "OTGToTSP.findById", query = "SELECT o FROM OTGToTSP o WHERE o.id = :id"),
    @NamedQuery(name = "OTGToTSP.findByActID", query = "SELECT o FROM OTGToTSP o WHERE o.actID = :actID"),
    @NamedQuery(name = "OTGToTSP.findByActIdOrder", query = "SELECT o FROM OTGToTSP o WHERE o.actID = :actID AND o.tankOrder = :tankOrder"),
    @NamedQuery(name = "OTGToTSP.findByStartLevel", query = "SELECT o FROM OTGToTSP o WHERE o.startLevel = :startLevel"),
    @NamedQuery(name = "OTGToTSP.findByFinishLevel", query = "SELECT o FROM OTGToTSP o WHERE o.finishLevel = :finishLevel"),
    @NamedQuery(name = "OTGToTSP.findByTankID", query = "SELECT o FROM OTGToTSP o WHERE o.tankID = :tankID"),
    @NamedQuery(name = "OTGToTSP.findByStartVolume", query = "SELECT o FROM OTGToTSP o WHERE o.startVolume = :startVolume"),
    @NamedQuery(name = "OTGToTSP.findByEndVolume", query = "SELECT o FROM OTGToTSP o WHERE o.endVolume = :endVolume"),
    @NamedQuery(name = "OTGToTSP.findByStartMass", query = "SELECT o FROM OTGToTSP o WHERE o.startMass = :startMass"),
    @NamedQuery(name = "OTGToTSP.findByEndMass", query = "SELECT o FROM OTGToTSP o WHERE o.endMass = :endMass"),
    @NamedQuery(name = "OTGToTSP.findByStartDensity", query = "SELECT o FROM OTGToTSP o WHERE o.startDensity = :startDensity"),
    @NamedQuery(name = "OTGToTSP.findByEndDensity", query = "SELECT o FROM OTGToTSP o WHERE o.endDensity = :endDensity"),
    @NamedQuery(name = "OTGToTSP.findByStartDensity20", query = "SELECT o FROM OTGToTSP o WHERE o.startDensity20 = :startDensity20"),
    @NamedQuery(name = "OTGToTSP.findByEndDensity20", query = "SELECT o FROM OTGToTSP o WHERE o.endDensity20 = :endDensity20"),
    @NamedQuery(name = "OTGToTSP.findByOtgToTspVolume", query = "SELECT o FROM OTGToTSP o WHERE o.otgToTspVolume = :otgToTspVolume"),
    @NamedQuery(name = "OTGToTSP.findByOtgToTspMass", query = "SELECT o FROM OTGToTSP o WHERE o.otgToTspMass = :otgToTspMass")})
public class OTGToTSP implements Serializable {

    @Basic(optional = false)
    @Column(name = "tankOrder")
    private int tankOrder;

    @Id
    @Basic(optional = false)
    @Column(name = "ID", nullable = false)
    private Long id;
    @Basic(optional = false)
    @Column(name = "actID", nullable = false)
    private long actID;
    @Basic(optional = false)
    @Column(name = "startLevel", nullable = false)
    private long startLevel;
    @Basic(optional = false)
    @Column(name = "finishLevel", nullable = false)
    private long finishLevel;
    @Basic(optional = false)
    @Column(name = "tankID", nullable = false)
    private long tankID;
    @Basic(optional = false)
    @Column(name = "startVolume", nullable = false)
    private long startVolume;
    @Basic(optional = false)
    @Column(name = "endVolume", nullable = false)
    private long endVolume;
    @Basic(optional = false)
    @Column(name = "startMass", nullable = false)
    private long startMass;
    @Basic(optional = false)
    @Column(name = "endMass", nullable = false)
    private long endMass;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "startDensity", nullable = false, precision = 18, scale = 4)
    private BigDecimal startDensity;
    @Basic(optional = false)
    @Column(name = "endDensity", nullable = false, precision = 18, scale = 4)
    private BigDecimal endDensity;
    @Basic(optional = false)
    @Column(name = "startDensity20", nullable = false, precision = 18, scale = 4)
    private BigDecimal startDensity20;
    @Basic(optional = false)
    @Column(name = "endDensity20", nullable = false, precision = 18, scale = 4)
    private BigDecimal endDensity20;
    @Column(name = "otgToTspVolume", insertable = false, updatable = false)
    private BigInteger otgToTspVolume;
    @Column(name = "otgToTspMass", insertable = false, updatable = false)
    private BigInteger otgToTspMass;
    @Basic(optional = false)
    @Column(name = "startTemp", nullable = false, precision = 18, scale = 4)
    private BigDecimal startTemp;
    @Basic(optional = false)
    @Column(name = "endTemp", nullable = false, precision = 18, scale = 4)
    private BigDecimal endTemp;    

    public OTGToTSP() {
    }

    public OTGToTSP(Long id) {
        this.id = id;
    }

    public OTGToTSP(Long id, long actID, long startLevel, long finishLevel, long tankID, long startVolume, long endVolume, long startMass, long endMass, BigDecimal startDensity, BigDecimal endDensity, BigDecimal startDensity20, BigDecimal endDensity20) {
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

    public BigInteger getOtgToTspVolume() {
        return otgToTspVolume;
    }

    public void setOtgToTspVolume(BigInteger otgToTspVolume) {
        this.otgToTspVolume = otgToTspVolume;
    }

    public BigInteger getOtgToTspMass() {
        return otgToTspMass;
    }

    public void setOtgToTspMass(BigInteger otgToTspMass) {
        this.otgToTspMass = otgToTspMass;
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
        if (!(object instanceof OTGToTSP)) {
            return false;
        }
        OTGToTSP other = (OTGToTSP) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.OTGToTSP[ id=" + id + " ]";
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

    public int getTankOrder() {
        return tankOrder;
    }

    public void setTankOrder(int tankOrder) {
        this.tankOrder = tankOrder;
    }
    
}
