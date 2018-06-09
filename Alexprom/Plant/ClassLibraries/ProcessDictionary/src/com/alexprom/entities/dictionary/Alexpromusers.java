package com.alexprom.entities.dictionary;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.xml.bind.annotation.XmlRootElement;


@Entity
@Table(catalog = "Alexprom_ASUTP", schema = "dbo", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"UNAME"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Alexpromusers.findAll", query = "SELECT a FROM Alexpromusers a"),
    @NamedQuery(name = "Alexpromusers.findByUname", query = "SELECT a FROM Alexpromusers a WHERE a.uname = :uname"),
    @NamedQuery(name = "Alexpromusers.findByUnamePassword", query = "SELECT a FROM Alexpromusers a WHERE a.uname = :uname AND a.upassword = :upassword"),
    @NamedQuery(name = "Alexpromusers.findByUpassword", query = "SELECT a FROM Alexpromusers a WHERE a.upassword = :upassword"),
    @NamedQuery(name = "Alexpromusers.findByUaccesslevel", query = "SELECT a FROM Alexpromusers a WHERE a.uaccesslevel = :uaccesslevel"),
    @NamedQuery(name = "Alexpromusers.findByUpurchased", query = "SELECT a FROM Alexpromusers a WHERE a.upurchased = :upurchased"),
    @NamedQuery(name = "Alexpromusers.findByUID", query = "SELECT a FROM Alexpromusers a WHERE a.uID = :uID")})
public class Alexpromusers implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @Column(nullable = false, length = 20)
    private String uname;
    @Column(length = 20)
    private String upassword;
    @Basic(optional = false)
    @Column(nullable = false)
    private short uaccesslevel;
    private Short upurchased;
    @Id
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer uID;

    public Alexpromusers() {
    }

    public Alexpromusers(Integer uID) {
        this.uID = uID;
    }

    public Alexpromusers(Integer uID, String uname, short uaccesslevel) {
        this.uID = uID;
        this.uname = uname;
        this.uaccesslevel = uaccesslevel;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public short getUaccesslevel() {
        return uaccesslevel;
    }

    public void setUaccesslevel(short uaccesslevel) {
        this.uaccesslevel = uaccesslevel;
    }

    public Short getUpurchased() {
        return upurchased;
    }

    public void setUpurchased(Short upurchased) {
        this.upurchased = upurchased;
    }

    public Integer getUID() {
        return uID;
    }

    public void setUID(Integer uID) {
        this.uID = uID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (uID != null ? uID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Alexpromusers)) {
            return false;
        }
        Alexpromusers other = (Alexpromusers) object;
        if ((this.uID == null && other.uID != null) || (this.uID != null && !this.uID.equals(other.uID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.alexprom.entities.dictionary.Alexpromusers[ uID=" + uID + " ]";
    }
    
}
