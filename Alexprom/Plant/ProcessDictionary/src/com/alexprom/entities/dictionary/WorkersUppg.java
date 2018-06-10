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


@Entity
@Table(name = "workers_uppg", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "WorkersUppg.findAll", query = "SELECT w FROM WorkersUppg w"),
    @NamedQuery(name = "WorkersUppg.findByName", query = "SELECT w FROM WorkersUppg w WHERE w.name = :name"),
    @NamedQuery(name = "WorkersUppg.findByFio", query = "SELECT w FROM WorkersUppg w WHERE w.fio = :fio"),
    @NamedQuery(name = "WorkersUppg.findById", query = "SELECT w FROM WorkersUppg w WHERE w.id = :id"),
    @NamedQuery(name = "WorkersUppg.findByCode", query = "SELECT w FROM WorkersUppg w WHERE w.code = :code")})
public class WorkersUppg implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(length = 20)
    private String name;
    @Column(length = 50)
    private String fio;
    @Id
    @Basic(optional = false)
    @Column(nullable = false)
    private int id;    
    private Short code;

    public WorkersUppg() {
    }

    public WorkersUppg(Short code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WorkersUppg)) {
            return false;
        }
        WorkersUppg other = (WorkersUppg) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.dictionary.WorkersUppg[ code=" + code + " ]";
    }
    
}
