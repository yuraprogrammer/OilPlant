/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.dictionary;

import java.io.Serializable;
import java.math.BigInteger;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(name = "grad_view", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "GradView.findAll", query = "SELECT g FROM GradView g"),
    @NamedQuery(name = "GradView.findByTankName", query = "SELECT g FROM GradView g WHERE g.tankName = :tankName"),
    @NamedQuery(name = "GradView.findByMatLevel", query = "SELECT g FROM GradView g WHERE g.matLevel = :matLevel"),
    @NamedQuery(name = "GradView.findByMatVolume", query = "SELECT g FROM GradView g WHERE g.matVolume = :matVolume"),
    @NamedQuery(name = "GradView.findByTankId", query = "SELECT g FROM GradView g WHERE g.tankId = :tankId"),
    @NamedQuery(name = "GradView.findByTankIdLevel", query = "SELECT g FROM GradView g WHERE g.tankId = :tankId AND g.matLevel = :matLevel")})
public class GradView implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(name = "Tank_Name", nullable = false, length = 10)
    private String tankName;
    @Column(name = "mat_Level")
    private Short matLevel;
    @Column(name = "mat_Volume")
    private BigInteger matVolume;
    @Column(name = "tank_id")
    private BigInteger tankId;
    @EmbeddedId
    private gradId id;

    public gradId getId() {
        return id;
    }

    public void setId(gradId id) {
        this.id = id;
    }

    public GradView() {
    }

    public String getTankName() {
        return tankName;
    }

    public void setTankName(String tankName) {
        this.tankName = tankName;
    }

    public Short getMatLevel() {
        return matLevel;
    }

    public void setMatLevel(Short matLevel) {
        this.matLevel = matLevel;
    }

    public BigInteger getMatVolume() {
        return matVolume;
    }

    public void setMatVolume(BigInteger matVolume) {
        this.matVolume = matVolume;
    }

    public BigInteger getTankId() {
        return tankId;
    }

    public void setTankId(BigInteger tankId) {
        this.tankId = tankId;
    }    
    
}

@Embeddable
class gradId implements Serializable{
    @Column(name = "tank_id")
    private BigInteger tankId;
    @Column(name = "mat_Level")
    private Short matLevel;
}