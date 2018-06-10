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
@Table(name = "Act_Density20", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ActDensity20.findAll", query = "SELECT a FROM ActDensity20 a"),
    @NamedQuery(name = "ActDensity20.findById", query = "SELECT a FROM ActDensity20 a WHERE a.id = :id"),
    @NamedQuery(name = "ActDensity20.findByActID", query = "SELECT a FROM ActDensity20 a WHERE a.actID = :actID"),
    @NamedQuery(name = "ActDensity20.findBySirieDensity20Start", query = "SELECT a FROM ActDensity20 a WHERE a.sirieDensity20Start = :sirieDensity20Start"),
    @NamedQuery(name = "ActDensity20.findBySirieDensity20End", query = "SELECT a FROM ActDensity20 a WHERE a.sirieDensity20End = :sirieDensity20End"),
    @NamedQuery(name = "ActDensity20.findByBlfDensity20Start", query = "SELECT a FROM ActDensity20 a WHERE a.blfDensity20Start = :blfDensity20Start"),
    @NamedQuery(name = "ActDensity20.findByBlfDensity20End", query = "SELECT a FROM ActDensity20 a WHERE a.blfDensity20End = :blfDensity20End"),
    @NamedQuery(name = "ActDensity20.findByAkdgDensity20Start", query = "SELECT a FROM ActDensity20 a WHERE a.akdgDensity20Start = :akdgDensity20Start"),
    @NamedQuery(name = "ActDensity20.findByAkdgDensity20End", query = "SELECT a FROM ActDensity20 a WHERE a.akdgDensity20End = :akdgDensity20End")})
public class ActDensity20 implements Serializable {

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
    @Column(name = "sirieDensity20_Start", nullable = false, precision = 18, scale = 4)
    private BigDecimal sirieDensity20Start;
    @Basic(optional = false)
    @Column(name = "sirieDensity20_End", nullable = false, precision = 18, scale = 4)
    private BigDecimal sirieDensity20End;
    @Basic(optional = false)
    @Column(name = "blfDensity20_Start", nullable = false, precision = 18, scale = 4)
    private BigDecimal blfDensity20Start;
    @Basic(optional = false)
    @Column(name = "blfDensity20_End", nullable = false, precision = 18, scale = 4)
    private BigDecimal blfDensity20End;
    @Basic(optional = false)
    @Column(name = "akdgDensity20_Start", nullable = false, precision = 18, scale = 4)
    private BigDecimal akdgDensity20Start;
    @Basic(optional = false)
    @Column(name = "akdgDensity20_End", nullable = false, precision = 18, scale = 4)
    private BigDecimal akdgDensity20End;

    public ActDensity20() {
    }

    public ActDensity20(Long id) {
        this.id = id;
    }

    public ActDensity20(Long id, long actID, BigDecimal sirieDensity20Start, BigDecimal sirieDensity20End, BigDecimal blfDensity20Start, BigDecimal blfDensity20End, BigDecimal akdgDensity20Start, BigDecimal akdgDensity20End) {
        this.id = id;
        this.actID = actID;
        this.sirieDensity20Start = sirieDensity20Start;
        this.sirieDensity20End = sirieDensity20End;
        this.blfDensity20Start = blfDensity20Start;
        this.blfDensity20End = blfDensity20End;
        this.akdgDensity20Start = akdgDensity20Start;
        this.akdgDensity20End = akdgDensity20End;
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

    public BigDecimal getSirieDensity20Start() {
        return sirieDensity20Start;
    }

    public void setSirieDensity20Start(BigDecimal sirieDensity20Start) {
        this.sirieDensity20Start = sirieDensity20Start;
    }

    public BigDecimal getSirieDensity20End() {
        return sirieDensity20End;
    }

    public void setSirieDensity20End(BigDecimal sirieDensity20End) {
        this.sirieDensity20End = sirieDensity20End;
    }

    public BigDecimal getBlfDensity20Start() {
        return blfDensity20Start;
    }

    public void setBlfDensity20Start(BigDecimal blfDensity20Start) {
        this.blfDensity20Start = blfDensity20Start;
    }

    public BigDecimal getBlfDensity20End() {
        return blfDensity20End;
    }

    public void setBlfDensity20End(BigDecimal blfDensity20End) {
        this.blfDensity20End = blfDensity20End;
    }

    public BigDecimal getAkdgDensity20Start() {
        return akdgDensity20Start;
    }

    public void setAkdgDensity20Start(BigDecimal akdgDensity20Start) {
        this.akdgDensity20Start = akdgDensity20Start;
    }

    public BigDecimal getAkdgDensity20End() {
        return akdgDensity20End;
    }

    public void setAkdgDensity20End(BigDecimal akdgDensity20End) {
        this.akdgDensity20End = akdgDensity20End;
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
        if (!(object instanceof ActDensity20)) {
            return false;
        }
        ActDensity20 other = (ActDensity20) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.ActDensity20[ id=" + id + " ]";
    }
    
}
