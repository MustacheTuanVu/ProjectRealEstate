/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author kiems
 */
@Entity
@Table(name = "estate_status")
@NamedQueries({
    @NamedQuery(name = "EstateStatus.findAll", query = "SELECT e FROM EstateStatus e")})
public class EstateStatus implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "estate_status_name")
    private String estateStatusName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estateStatusId")
    private List<Estate> estateList;

    public EstateStatus() {
    }

    public EstateStatus(Integer id) {
        this.id = id;
    }

    public EstateStatus(Integer id, String estateStatusName) {
        this.id = id;
        this.estateStatusName = estateStatusName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEstateStatusName() {
        return estateStatusName;
    }

    public void setEstateStatusName(String estateStatusName) {
        this.estateStatusName = estateStatusName;
    }

    public List<Estate> getEstateList() {
        return estateList;
    }

    public void setEstateList(List<Estate> estateList) {
        this.estateList = estateList;
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
        if (!(object instanceof EstateStatus)) {
            return false;
        }
        EstateStatus other = (EstateStatus) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.EstateStatus[ id=" + id + " ]";
    }
    
}
