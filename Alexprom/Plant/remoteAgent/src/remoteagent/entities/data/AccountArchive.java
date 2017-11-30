/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package remoteagent.entities.data;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author yura_
 */
@Entity
@Table(name = "account_archive")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccountArchive.findAll", query = "SELECT a FROM AccountArchive a"),
    @NamedQuery(name = "AccountArchive.findById", query = "SELECT a FROM AccountArchive a WHERE a.id = :id"),
    @NamedQuery(name = "AccountArchive.findByADate", query = "SELECT a FROM AccountArchive a WHERE a.aDate = :aDate"),
    @NamedQuery(name = "AccountArchive.findByAShift", query = "SELECT a FROM AccountArchive a WHERE a.aShift = :aShift"),
    @NamedQuery(name = "AccountArchive.findByAE1", query = "SELECT a FROM AccountArchive a WHERE a.aE1 = :aE1"),
    @NamedQuery(name = "AccountArchive.findByAE11", query = "SELECT a FROM AccountArchive a WHERE a.aE11 = :aE11"),
    @NamedQuery(name = "AccountArchive.findByAUPPG", query = "SELECT a FROM AccountArchive a WHERE a.aUPPG = :aUPPG")})
public class AccountArchive implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Long id;
    @Column(name = "aDate")
    @Temporal(TemporalType.DATE)
    private Date aDate;
    @Column(name = "aShift")
    private Integer aShift;
    @Column(name = "aE1")
    private Long aE1;
    @Column(name = "aE1_1")
    private Long aE11;
    @Column(name = "aUPPG")
    private BigInteger aUPPG;

    public AccountArchive() {
    }

    public AccountArchive(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getADate() {
        return aDate;
    }

    public void setADate(Date aDate) {
        this.aDate = aDate;
    }

    public Integer getAShift() {
        return aShift;
    }

    public void setAShift(Integer aShift) {
        this.aShift = aShift;
    }

    public Long getAE1() {
        return aE1;
    }

    public void setAE1(Long aE1) {
        this.aE1 = aE1;
    }

    public Long getAE11() {
        return aE11;
    }

    public void setAE11(Long aE11) {
        this.aE11 = aE11;
    }

    public BigInteger getAUPPG() {
        return aUPPG;
    }

    public void setAUPPG(BigInteger aUPPG) {
        this.aUPPG = aUPPG;
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
        if (!(object instanceof AccountArchive)) {
            return false;
        }
        AccountArchive other = (AccountArchive) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "remoteagent.entities.data.AccountArchive[ id=" + id + " ]";
    }
    
}
