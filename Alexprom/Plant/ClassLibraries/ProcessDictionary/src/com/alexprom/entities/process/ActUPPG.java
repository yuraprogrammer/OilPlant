/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.process;

import java.io.Serializable;
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
@Table(name = "Act_UPPG", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ActUPPG.findAll", query = "SELECT a FROM ActUPPG a"),
    @NamedQuery(name = "ActUPPG.findById", query = "SELECT a FROM ActUPPG a WHERE a.id = :id"),
    @NamedQuery(name = "ActUPPG.findByADate", query = "SELECT a FROM ActUPPG a WHERE a.aDate = :aDate"),
    @NamedQuery(name = "ActUPPG.findByAShift", query = "SELECT a FROM ActUPPG a WHERE a.aShift = :aShift"),
    @NamedQuery(name = "ActUPPG.findByMainOper", query = "SELECT a FROM ActUPPG a WHERE a.mainOper = :mainOper"),
    @NamedQuery(name = "ActUPPG.findBySlaveOper", query = "SELECT a FROM ActUPPG a WHERE a.slaveOper = :slaveOper"),
    @NamedQuery(name = "ActUPPG.findByComplete", query = "SELECT a FROM ActUPPG a WHERE a.complete = :complete"),
    @NamedQuery(name = "ActUPPG.findByACode", query = "SELECT a FROM ActUPPG a WHERE a.aCode = :aCode"),
    @NamedQuery(name = "ActUPPG.findByDateShift", query = "SELECT a FROM ActUPPG a WHERE a.aDate = :aDate AND a.aShift = :aShift")})
public class ActUPPG implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(nullable = false)
    private Long id;
    @Column(length = 10)
    private String aDate;
    private Integer aShift;
    @Basic(optional = false)
    @Column(nullable = false)
    private int mainOper;
    @Basic(optional = false)
    @Column(nullable = false)
    private int slaveOper;
    @Basic(optional = false)
    @Column(nullable = false)
    private int complete;
    @Basic(optional = false)
    @Column(nullable = false)
    private int aCode;

    public ActUPPG() {
    }

    public ActUPPG(Long id) {
        this.id = id;
    }

    public ActUPPG(Long id, int mainOper, int slaveOper, int complete, int aCode) {
        this.id = id;
        this.mainOper = mainOper;
        this.slaveOper = slaveOper;
        this.complete = complete;
        this.aCode = aCode;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getADate() {
        return aDate;
    }

    public void setADate(String aDate) {
        this.aDate = aDate;
    }

    public Integer getAShift() {
        return aShift;
    }

    public void setAShift(Integer aShift) {
        this.aShift = aShift;
    }

    public int getMainOper() {
        return mainOper;
    }

    public void setMainOper(int mainOper) {
        this.mainOper = mainOper;
    }

    public int getSlaveOper() {
        return slaveOper;
    }

    public void setSlaveOper(int slaveOper) {
        this.slaveOper = slaveOper;
    }

    public int getComplete() {
        return complete;
    }

    public void setComplete(int complete) {
        this.complete = complete;
    }

    public int getACode() {
        return aCode;
    }

    public void setACode(int aCode) {
        this.aCode = aCode;
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
        if (!(object instanceof ActUPPG)) {
            return false;
        }
        ActUPPG other = (ActUPPG) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.ActUPPG[ id=" + id + " ]";
    }
    
}
