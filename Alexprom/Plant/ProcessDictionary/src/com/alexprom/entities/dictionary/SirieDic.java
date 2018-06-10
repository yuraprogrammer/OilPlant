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
@Table(name = "sirie_dic", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SirieDic.findAll", query = "SELECT s FROM SirieDic s"),
    @NamedQuery(name = "SirieDic.findById", query = "SELECT s FROM SirieDic s WHERE s.id = :id"),
    @NamedQuery(name = "SirieDic.findByName", query = "SELECT s FROM SirieDic s WHERE s.name = :name"),
    @NamedQuery(name = "SirieDic.findByCode", query = "SELECT s FROM SirieDic s WHERE s.code = :code")})
public class SirieDic implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(nullable = false)
    private Short id;
    @Column(length = 20)
    private String name;
    private Short code;

    public SirieDic() {
    }

    public SirieDic(Short id) {
        this.id = id;
    }

    public Short getId() {
        return id;
    }

    public void setId(Short id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Short getCode() {
        return code;
    }

    public void setCode(Short code) {
        this.code = code;
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
        if (!(object instanceof SirieDic)) {
            return false;
        }
        SirieDic other = (SirieDic) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.dictionary.SirieDic[ id=" + id + " ]";
    }
    
}
