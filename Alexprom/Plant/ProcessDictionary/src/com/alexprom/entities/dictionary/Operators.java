/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alexprom.entities.dictionary;

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
@Table(catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Operators.findAll", query = "SELECT o FROM Operators o"),
    @NamedQuery(name = "Operators.findById", query = "SELECT o FROM Operators o WHERE o.id = :id"),
    @NamedQuery(name = "Operators.findByCode", query = "SELECT o FROM Operators o WHERE o.code = :code"),
    @NamedQuery(name = "Operators.findByFio", query = "SELECT o FROM Operators o WHERE o.fio = :fio")})
public class Operators implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    private Short code;
    @Column(length = 50)
    private String fio;

    public Operators() {
    }

    public Operators(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Short getCode() {
        return code;
    }

    public void setCode(Short code) {
        this.code = code;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
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
        if (!(object instanceof Operators)) {
            return false;
        }
        Operators other = (Operators) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.dictionary.Operators[ id=" + id + " ]";
    }
    
}
