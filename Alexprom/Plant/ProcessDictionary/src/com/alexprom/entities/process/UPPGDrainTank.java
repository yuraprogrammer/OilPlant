/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@Table(name = "UPPG_Drain_Tank", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UPPGDrainTank.findAll", query = "SELECT u FROM UPPGDrainTank u"),
    @NamedQuery(name = "UPPGDrainTank.findById", query = "SELECT u FROM UPPGDrainTank u WHERE u.id = :id"),
    @NamedQuery(name = "UPPGDrainTank.findByActID", query = "SELECT u FROM UPPGDrainTank u WHERE u.actID = :actID"),
    @NamedQuery(name = "UPPGDrainTank.findByStartLevel", query = "SELECT u FROM UPPGDrainTank u WHERE u.startLevel = :startLevel"),
    @NamedQuery(name = "UPPGDrainTank.findByFinishLevel", query = "SELECT u FROM UPPGDrainTank u WHERE u.finishLevel = :finishLevel"),
    @NamedQuery(name = "UPPGDrainTank.findByTankID", query = "SELECT u FROM UPPGDrainTank u WHERE u.tankID = :tankID")})
public class UPPGDrainTank implements Serializable {

    @Basic(optional = false)
    @Column(name = "drained")
    private BigDecimal drained;

    @Basic(optional = false)
    @Column(name="drained_BLF", nullable = false, precision = 18, scale = 1)
    private BigDecimal drainedBLF;

    public BigDecimal getDrainedBLF() {
        return drainedBLF;
    }

    public void setDrainedBLF(BigDecimal drainedBLF) {
        this.drainedBLF = drainedBLF;
    }

    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Long id;
    @Basic(optional = false)
    @Column(name = "actID")
    private long actID;
    @Basic(optional = false)
    @Column(name = "startLevel")
    private int startLevel;
    @Basic(optional = false)
    @Column(name = "finishLevel")
    private int finishLevel;
    @Basic(optional = false)
    @Column(name = "tankID")
    private int tankID;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "density")
    private BigDecimal density;
    @Column(name = "volume", insertable = false, updatable = false)
    private Integer volume;
    @Column(name = "mass", insertable = false, updatable = false)
    private BigDecimal mass;

    public UPPGDrainTank() {
    }

    public UPPGDrainTank(Long id) {
        this.id = id;
    }

    public UPPGDrainTank(Long id, long actID, int startLevel, int finishLevel, int tankID) {
        this.id = id;
        this.actID = actID;
        this.startLevel = startLevel;
        this.finishLevel = finishLevel;
        this.tankID = tankID;
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

    public int getStartLevel() {
        return startLevel;
    }

    public void setStartLevel(int startLevel) {
        this.startLevel = startLevel;
    }

    public int getFinishLevel() {
        return finishLevel;
    }

    public void setFinishLevel(int finishLevel) {
        this.finishLevel = finishLevel;
    }

    public int getTankID() {
        return tankID;
    }

    public void setTankID(int tankID) {
        this.tankID = tankID;
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
        if (!(object instanceof UPPGDrainTank)) {
            return false;
        }
        UPPGDrainTank other = (UPPGDrainTank) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.UPPGDrainTank[ id=" + id + " ]";
    }

    public BigDecimal getDensity() {
        return density;
    }

    public void setDensity(BigDecimal density) {
        this.density = density;
    }

    public Integer getVolume() {
        return volume;
    }

    public void setVolume(Integer volume) {
        this.volume = volume;
    }

    public BigDecimal getMass() {
        return mass;
    }

    public void setMass(BigDecimal mass) {
        this.mass = mass;
    }

    public BigDecimal getDrained() {
        return drained;
    }

    public void setDrained(BigDecimal drained) {
        this.drained = drained;
    }

    
}
