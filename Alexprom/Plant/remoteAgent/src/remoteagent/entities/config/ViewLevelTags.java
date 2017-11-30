/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package remoteagent.entities.config;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author yura_
 */
@Entity
@Table(name = "viewLevelTags")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ViewLevelTags.findAll", query = "SELECT v FROM ViewLevelTags v"),
    @NamedQuery(name = "ViewLevelTags.findByNode", query = "SELECT v FROM ViewLevelTags v WHERE v.node = :node"),
    @NamedQuery(name = "ViewLevelTags.findByNodeClass", query = "SELECT v FROM ViewLevelTags v WHERE v.nodeClass = :nodeClass"),
    @NamedQuery(name = "ViewLevelTags.findByText", query = "SELECT v FROM ViewLevelTags v WHERE v.text = :text"),
    @NamedQuery(name = "ViewLevelTags.findByPropName", query = "SELECT v FROM ViewLevelTags v WHERE v.propName = :propName"),
    @NamedQuery(name = "ViewLevelTags.findByPropValue", query = "SELECT v FROM ViewLevelTags v WHERE v.propValue = :propValue"),
    @NamedQuery(name = "ViewLevelTags.findByName", query = "SELECT v FROM ViewLevelTags v WHERE v.name = :name"),
    @NamedQuery(name = "ViewLevelTags.findByVarClass", query = "SELECT v FROM ViewLevelTags v WHERE v.varClass = :varClass"),
    @NamedQuery(name = "ViewLevelTags.findByVarType", query = "SELECT v FROM ViewLevelTags v WHERE v.varType = :varType"),
    @NamedQuery(name = "ViewLevelTags.findByVarClassName", query = "SELECT v FROM ViewLevelTags v WHERE v.varClass = :varClass AND v.name = :name"),
    @NamedQuery(name = "ViewLevelTags.findByVarId", query = "SELECT v FROM ViewLevelTags v WHERE v.varId = :varId")})
public class ViewLevelTags implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull    
    @Column(name = "Node")
    @Id
    private long node;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Node_Class")
    private int nodeClass;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "Text")
    private String text;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "PROP_NAME")
    private String propName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "PROP_VALUE")
    private String propValue;
    @Size(max = 50)
    @Column(name = "Name")
    private String name;
    @Column(name = "VAR_CLASS")
    private Integer varClass;
    @Column(name = "VAR_TYPE")
    private Integer varType;
    @Basic(optional = false)
    @NotNull
    @Column(name = "VAR_ID")
    private long varId;

    public ViewLevelTags() {
    }

    public long getNode() {
        return node;
    }

    public void setNode(long node) {
        this.node = node;
    }

    public int getNodeClass() {
        return nodeClass;
    }

    public void setNodeClass(int nodeClass) {
        this.nodeClass = nodeClass;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getPropName() {
        return propName;
    }

    public void setPropName(String propName) {
        this.propName = propName;
    }

    public String getPropValue() {
        return propValue;
    }

    public void setPropValue(String propValue) {
        this.propValue = propValue;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getVarClass() {
        return varClass;
    }

    public void setVarClass(Integer varClass) {
        this.varClass = varClass;
    }

    public Integer getVarType() {
        return varType;
    }

    public void setVarType(Integer varType) {
        this.varType = varType;
    }

    public long getVarId() {
        return varId;
    }

    public void setVarId(long varId) {
        this.varId = varId;
    }
    
}
