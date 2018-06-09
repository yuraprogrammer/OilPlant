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
@Table(name = "counters_daq", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CountersDaq.findAll", query = "SELECT c FROM CountersDaq c"),
    @NamedQuery(name = "CountersDaq.findById", query = "SELECT c FROM CountersDaq c WHERE c.id = :id"),
    @NamedQuery(name = "CountersDaq.findByDaqDt", query = "SELECT c FROM CountersDaq c WHERE c.daqDt = :daqDt"),
    @NamedQuery(name = "CountersDaq.findByShift", query = "SELECT c FROM CountersDaq c WHERE c.shift = :shift"),
    @NamedQuery(name = "CountersDaq.findByTagName", query = "SELECT c FROM CountersDaq c WHERE c.tagName = :tagName"),
    @NamedQuery(name = "CountersDaq.findByTagValue", query = "SELECT c FROM CountersDaq c WHERE c.tagValue = :tagValue")})
public class CountersDaq implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(nullable = false)
    private Long id;
    @Basic(optional = false)
    @Column(name = "daq_dt", nullable = false, length = 10)
    private String daqDt;
    @Basic(optional = false)
    @Column(nullable = false)
    private int shift;
    @Basic(optional = false)
    @Column(name = "tag_name", nullable = false, length = 20)
    private String tagName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "tag_value", precision = 18, scale = 4)
    private BigDecimal tagValue;

    public CountersDaq() {
    }

    public CountersDaq(Long id) {
        this.id = id;
    }

    public CountersDaq(Long id, String daqDt, int shift, String tagName) {
        this.id = id;
        this.daqDt = daqDt;
        this.shift = shift;
        this.tagName = tagName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDaqDt() {
        return daqDt;
    }

    public void setDaqDt(String daqDt) {
        this.daqDt = daqDt;
    }

    public int getShift() {
        return shift;
    }

    public void setShift(int shift) {
        this.shift = shift;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public BigDecimal getTagValue() {
        return tagValue;
    }

    public void setTagValue(BigDecimal tagValue) {
        this.tagValue = tagValue;
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
        if (!(object instanceof CountersDaq)) {
            return false;
        }
        CountersDaq other = (CountersDaq) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.CountersDaq[ id=" + id + " ]";
    }
    
}
