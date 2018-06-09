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
@Table(name = "Act_Sirie", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ActSirie.findAll", query = "SELECT a FROM ActSirie a"),
    @NamedQuery(name = "ActSirie.findById", query = "SELECT a FROM ActSirie a WHERE a.id = :id"),
    @NamedQuery(name = "ActSirie.findByActID", query = "SELECT a FROM ActSirie a WHERE a.actID = :actID"),
    @NamedQuery(name = "ActSirie.findByComponent1", query = "SELECT a FROM ActSirie a WHERE a.component1 = :component1"),
    @NamedQuery(name = "ActSirie.findByPercent1", query = "SELECT a FROM ActSirie a WHERE a.percent1 = :percent1"),
    @NamedQuery(name = "ActSirie.findByComponent2", query = "SELECT a FROM ActSirie a WHERE a.component2 = :component2"),
    @NamedQuery(name = "ActSirie.findByPercent2", query = "SELECT a FROM ActSirie a WHERE a.percent2 = :percent2"),
    @NamedQuery(name = "ActSirie.findByComponent3", query = "SELECT a FROM ActSirie a WHERE a.component3 = :component3"),
    @NamedQuery(name = "ActSirie.findByPercent3", query = "SELECT a FROM ActSirie a WHERE a.percent3 = :percent3"),
    @NamedQuery(name = "ActSirie.findByComponent4", query = "SELECT a FROM ActSirie a WHERE a.component4 = :component4"),
    @NamedQuery(name = "ActSirie.findByPercent4", query = "SELECT a FROM ActSirie a WHERE a.percent4 = :percent4"),
    @NamedQuery(name = "ActSirie.findByComponent5", query = "SELECT a FROM ActSirie a WHERE a.component5 = :component5"),
    @NamedQuery(name = "ActSirie.findByPercent5", query = "SELECT a FROM ActSirie a WHERE a.percent5 = :percent5"),
    @NamedQuery(name = "ActSirie.findByComponent6", query = "SELECT a FROM ActSirie a WHERE a.component5 = :component6"),
    @NamedQuery(name = "ActSirie.findByPercent6", query = "SELECT a FROM ActSirie a WHERE a.percent5 = :percent6")
})
public class ActSirie implements Serializable {

    
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(nullable = false)
    private Long id;
    @Basic(optional = false)
    @Column(nullable = false)
    private long actID;
    @Basic(optional = false)
    @Column(name = "Component_1", nullable = false)
    private int component1;
    @Basic(optional = false)
    @Column(name = "Percent_1", nullable = false)
    private double percent1;
    @Basic(optional = false)
    @Column(name = "Component_2", nullable = false)
    private int component2;
    @Basic(optional = false)
    @Column(name = "Percent_2", nullable = false)
    private double percent2;
    @Basic(optional = false)
    @Column(name = "Component_3", nullable = false)
    private int component3;
    @Basic(optional = false)
    @Column(name = "Percent_3", nullable = false)
    private double percent3;
    @Basic(optional = false)
    @Column(name = "Component_4", nullable = false)
    private int component4;
    @Basic(optional = false)
    @Column(name = "Percent_4", nullable = false)
    private double percent4;
    @Basic(optional = false)
    @Column(name = "Component_5", nullable = false)
    private int component5;
    @Basic(optional = false)
    @Column(name = "Percent_5", nullable = false)
    private double percent5;
    @Basic(optional = false)
    @Column(name = "Component_6", nullable = false)
    private int component6;
    @Basic(optional = false)
    @Column(name = "Percent_6", nullable = false)
    private double percent6;

    public int getComponent6() {
        return component6;
    }

    public void setComponent6(int component6) {
        this.component6 = component6;
    }

    public double getPercent6() {
        return percent6;
    }

    public void setPercent6(double percent6) {
        this.percent6 = percent6;
    }
    
    public ActSirie() {
    }

    public ActSirie(Long id) {
        this.id = id;
    }

    public ActSirie(Long id, long actID, int component1, double percent1, int component2, double percent2, int component3, double percent3, int component4, double percent4, int component5, double percent5, int component6, double percent6) {
        this.id = id;
        this.actID = actID;
        this.component1 = component1;
        this.percent1 = percent1;
        this.component2 = component2;
        this.percent2 = percent2;
        this.component3 = component3;
        this.percent3 = percent3;
        this.component4 = component4;
        this.percent4 = percent4;
        this.component5 = component5;
        this.percent5 = percent5;
        this.component6 = component6;
        this.percent6 = percent6;
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

    public int getComponent1() {
        return component1;
    }

    public void setComponent1(int component1) {
        this.component1 = component1;
    }

    public double getPercent1() {
        return percent1;
    }

    public void setPercent1(double percent1) {
        this.percent1 = percent1;
    }

    public int getComponent2() {
        return component2;
    }

    public void setComponent2(int component2) {
        this.component2 = component2;
    }

    public double getPercent2() {
        return percent2;
    }

    public void setPercent2(double percent2) {
        this.percent2 = percent2;
    }

    public int getComponent3() {
        return component3;
    }

    public void setComponent3(int component3) {
        this.component3 = component3;
    }

    public double getPercent3() {
        return percent3;
    }

    public void setPercent3(double percent3) {
        this.percent3 = percent3;
    }

    public int getComponent4() {
        return component4;
    }

    public void setComponent4(int component4) {
        this.component4 = component4;
    }

    public double getPercent4() {
        return percent4;
    }

    public void setPercent4(double percent4) {
        this.percent4 = percent4;
    }

    public int getComponent5() {
        return component5;
    }

    public void setComponent5(int component5) {
        this.component5 = component5;
    }

    public double getPercent5() {
        return percent5;
    }

    public void setPercent5(double percent5) {
        this.percent5 = percent5;
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
        if (!(object instanceof ActSirie)) {
            return false;
        }
        ActSirie other = (ActSirie) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.process.ActSirie[ id=" + id + " ]";
    }


    public ActSirie(Long id, long actID) {
        this.id = id;
        this.actID = actID;
    }

    
}
