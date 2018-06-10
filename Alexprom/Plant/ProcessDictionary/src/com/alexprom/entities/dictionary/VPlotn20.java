package com.alexprom.entities.dictionary;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author yura_
 */
@Entity
@Table(name = "v_plotn20", catalog = "Alexprom_ASUTP", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VPlotn20.findAll", query = "SELECT v FROM VPlotn20 v"),
    @NamedQuery(name = "VPlotn20.findByTemperName", query = "SELECT v FROM VPlotn20 v WHERE v.temperName = :temperName"),
    @NamedQuery(name = "VPlotn20.findByPlotn", query = "SELECT v FROM VPlotn20 v WHERE v.plotn = :plotn"),
    @NamedQuery(name = "VPlotn20.findByPlotn20", query = "SELECT v FROM VPlotn20 v WHERE v.plotn20 = :plotn20"),
    @NamedQuery(name = "VPlotn20.findByTemperPlotn", query = "SELECT v FROM VPlotn20 v WHERE v.plotn like :plotn AND v.temperName = :temperName")})
public class VPlotn20 implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "temper_name", precision = 4, scale = 1)
    private BigDecimal temperName;
    @Column(precision = 53)
    private Double plotn;
    @Column(length = 255)
    private String plotn20;    
    @EmbeddedId
    private plotnId id;

    public plotnId getId() {
        return id;
    }

    public void setId(plotnId id) {
        this.id = id;
    }
    
    public VPlotn20() {
    }

    public BigDecimal getTemperName() {
        return temperName;
    }

    public void setTemperName(BigDecimal temperName) {
        this.temperName = temperName;
    }

    public Double getPlotn() {
        return plotn;
    }

    public void setPlotn(Double plotn) {
        this.plotn = plotn;
    }

    public String getPlotn20() {
        return plotn20;
    }

    public void setPlotn20(String plotn20) {
        this.plotn20 = plotn20;
    }
    
}

@Embeddable
class plotnId{
    @Column(name = "temper_name", precision = 4, scale = 1)
    private BigDecimal temperName;
    @Column(precision = 53)
    private Double plotn;
}
