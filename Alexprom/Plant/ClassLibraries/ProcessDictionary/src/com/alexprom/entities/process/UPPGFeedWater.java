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
@Table(name = "UPPG_Feed_Water", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UPPGFeedWater.findAll", query = "SELECT u FROM UPPGFeedWater u"),
    @NamedQuery(name = "UPPGFeedWater.findById", query = "SELECT u FROM UPPGFeedWater u WHERE u.id = :id"),
    @NamedQuery(name = "UPPGFeedWater.findByActID", query = "SELECT u FROM UPPGFeedWater u WHERE u.actID = :actID"),
    @NamedQuery(name = "UPPGFeedWater.findByStartData", query = "SELECT u FROM UPPGFeedWater u WHERE u.startData = :startData"),
    @NamedQuery(name = "UPPGFeedWater.findByFinishData", query = "SELECT u FROM UPPGFeedWater u WHERE u.finishData = :finishData")})
public class UPPGFeedWater implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID", nullable = false)
    private Long id;
    @Basic(optional = false)
    @Column(name = "actID")
    private long actID;
    @Basic(optional = false)
    @Column(name = "startData")
    private int startData;
    @Basic(optional = false)
    @Column(name = "finishData")
    private int finishData;
    @Column(name = "shiftTotal")
    private Integer shiftTotal;
   
    public UPPGFeedWater() {
    }

    public UPPGFeedWater(Long id) {
        this.id = id;
    }

    public UPPGFeedWater(Long id, long actID, int startData, int finishData) {
        this.id = id;
        this.actID = actID;
        this.startData = startData;
        this.finishData = finishData;
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

    public int getStartData() {
        return startData;
    }

    public void setStartData(int startData) {
        this.startData = startData;
    }

    public int getFinishData() {
        return finishData;
    }

    public void setFinishData(int finishData) {
        this.finishData = finishData;
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
        if (!(object instanceof UPPGFeedWater)) {
            return false;
        }
        UPPGFeedWater other = (UPPGFeedWater) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.UPPGFeedWater[ id=" + id + " ]";
    }

    public Integer getShiftTotal() {
        return shiftTotal;
    }

    public void setShiftTotal(Integer shiftTotal) {
        this.shiftTotal = shiftTotal;
    }

    
}
