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
 * @author Lenovo
 */
@Entity
@Table(name = "v_otgTspDetail")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VotgTspDetail.findAll", query = "SELECT v FROM VotgTspDetail v"),
    @NamedQuery(name = "VotgTspDetail.findByTankName", query = "SELECT v FROM VotgTspDetail v WHERE v.tankName = :tankName"),
    @NamedQuery(name = "VotgTspDetail.findByStartLevel", query = "SELECT v FROM VotgTspDetail v WHERE v.startLevel = :startLevel"),
    @NamedQuery(name = "VotgTspDetail.findByFinishLevel", query = "SELECT v FROM VotgTspDetail v WHERE v.finishLevel = :finishLevel"),
    @NamedQuery(name = "VotgTspDetail.findByActID", query = "SELECT v FROM VotgTspDetail v WHERE v.actID = :actID"),
    @NamedQuery(name = "VotgTspDetail.findByStartVolume", query = "SELECT v FROM VotgTspDetail v WHERE v.startVolume = :startVolume"),
    @NamedQuery(name = "VotgTspDetail.findByEndVolume", query = "SELECT v FROM VotgTspDetail v WHERE v.endVolume = :endVolume"),
    @NamedQuery(name = "VotgTspDetail.findByStartMass", query = "SELECT v FROM VotgTspDetail v WHERE v.startMass = :startMass"),
    @NamedQuery(name = "VotgTspDetail.findByStartDensity", query = "SELECT v FROM VotgTspDetail v WHERE v.startDensity = :startDensity"),
    @NamedQuery(name = "VotgTspDetail.findByEndDensity", query = "SELECT v FROM VotgTspDetail v WHERE v.endDensity = :endDensity"),
    @NamedQuery(name = "VotgTspDetail.findByStartDensity20", query = "SELECT v FROM VotgTspDetail v WHERE v.startDensity20 = :startDensity20"),
    @NamedQuery(name = "VotgTspDetail.findByEndDensity20", query = "SELECT v FROM VotgTspDetail v WHERE v.endDensity20 = :endDensity20"),
    @NamedQuery(name = "VotgTspDetail.findByOtgToTspVolume", query = "SELECT v FROM VotgTspDetail v WHERE v.otgToTspVolume = :otgToTspVolume"),
    @NamedQuery(name = "VotgTspDetail.findByOtgToTspMass", query = "SELECT v FROM VotgTspDetail v WHERE v.otgToTspMass = :otgToTspMass"),
    @NamedQuery(name = "VotgTspDetail.findByStartTemp", query = "SELECT v FROM VotgTspDetail v WHERE v.startTemp = :startTemp"),
    @NamedQuery(name = "VotgTspDetail.findByEndTemp", query = "SELECT v FROM VotgTspDetail v WHERE v.endTemp = :endTemp"),
    @NamedQuery(name = "VotgTspDetail.findByEndMass", query = "SELECT v FROM VotgTspDetail v WHERE v.endMass = :endMass"),
    @NamedQuery(name = "VotgTspDetail.findById", query = "SELECT v FROM VotgTspDetail v WHERE v.id = :id")})
public class VotgTspDetail implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "Tank_Name")
    private String tankName;
    @Basic(optional = false)
    @Column(name = "startLevel")
    private long startLevel;
    @Basic(optional = false)
    @Column(name = "finishLevel")
    private long finishLevel;
    @Basic(optional = false)
    @Column(name = "actID")
    private long actID;
    @Basic(optional = false)
    @Column(name = "startVolume")
    private long startVolume;
    @Basic(optional = false)
    @Column(name = "endVolume")
    private long endVolume;
    @Basic(optional = false)
    @Column(name = "startMass")
    private long startMass;
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
    @Column(name = "otgToTspVolume")
    private BigInteger otgToTspVolume;
    @Column(name = "otgToTspMass")
    private BigInteger otgToTspMass;
    @Basic(optional = false)
    @Column(name = "startTemp")
    private BigDecimal startTemp;
    @Basic(optional = false)
    @Column(name = "endTemp")
    private BigDecimal endTemp;
    @Basic(optional = false)
    @Column(name = "endMass")
    private long endMass;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private long id;

    public VotgTspDetail() {
    }

    public String getTankName() {
        return tankName;
    }

    public void setTankName(String tankName) {
        this.tankName = tankName;
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

    public long getActID() {
        return actID;
    }

    public void setActID(long actID) {
        this.actID = actID;
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

    public long getEndMass() {
        return endMass;
    }

    public void setEndMass(long endMass) {
        this.endMass = endMass;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
    
}
