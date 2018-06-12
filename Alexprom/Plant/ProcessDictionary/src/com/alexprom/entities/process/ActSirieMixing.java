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
@Table(name = "Act_SirieMixing")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ActSirieMixing.findAll", query = "SELECT a FROM ActSirieMixing a"),
    @NamedQuery(name = "ActSirieMixing.findById", query = "SELECT a FROM ActSirieMixing a WHERE a.id = :id"),
    @NamedQuery(name = "ActSirieMixing.findByActID", query = "SELECT a FROM ActSirieMixing a WHERE a.actID = :actID"),
    @NamedQuery(name = "ActSirieMixing.findBySirieVolume", query = "SELECT a FROM ActSirieMixing a WHERE a.sirieVolume = :sirieVolume"),
    @NamedQuery(name = "ActSirieMixing.findBySirieDensity", query = "SELECT a FROM ActSirieMixing a WHERE a.sirieDensity = :sirieDensity"),
    @NamedQuery(name = "ActSirieMixing.findBySirieMass", query = "SELECT a FROM ActSirieMixing a WHERE a.sirieMass = :sirieMass")})
public class ActSirieMixing implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @Column(name = "actID")
    private long actID;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @Column(name = "sirieVolume")
    private BigDecimal sirieVolume;
    @Basic(optional = false)
    @Column(name = "sirieDensity")
    private BigDecimal sirieDensity;
    @Column(name = "sirieMass")
    private BigDecimal sirieMass;

    public ActSirieMixing() {
    }

    public ActSirieMixing(Long id) {
        this.id = id;
    }

    public ActSirieMixing(Long id, long actID, BigDecimal sirieVolume, BigDecimal sirieDensity) {
        this.id = id;
        this.actID = actID;
        this.sirieVolume = sirieVolume;
        this.sirieDensity = sirieDensity;
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

    public BigDecimal getSirieVolume() {
        return sirieVolume;
    }

    public void setSirieVolume(BigDecimal sirieVolume) {
        this.sirieVolume = sirieVolume;
    }

    public BigDecimal getSirieDensity() {
        return sirieDensity;
    }

    public void setSirieDensity(BigDecimal sirieDensity) {
        this.sirieDensity = sirieDensity;
    }

    public BigDecimal getSirieMass() {
        return sirieMass;
    }

    public void setSirieMass(BigDecimal sirieMass) {
        this.sirieMass = sirieMass;
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
        if (!(object instanceof ActSirieMixing)) {
            return false;
        }
        ActSirieMixing other = (ActSirieMixing) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.ActSirieMixing[ id=" + id + " ]";
    }
    
}
