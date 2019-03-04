/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author kiems
 */
@Entity
@Table(name = "feature_details")
@NamedQueries({
    @NamedQuery(name = "FeatureDetails.findAll", query = "SELECT f FROM FeatureDetails f")})
public class FeatureDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "feature_details_id")
    private Integer featureDetailsId;
    @JoinColumn(name = "estate_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Estate estateId;
    @JoinColumn(name = "feature_id", referencedColumnName = "features_id")
    @ManyToOne(optional = false)
    private Features featureId;

    public FeatureDetails() {
    }

    public FeatureDetails(Integer featureDetailsId) {
        this.featureDetailsId = featureDetailsId;
    }

    public Integer getFeatureDetailsId() {
        return featureDetailsId;
    }

    public void setFeatureDetailsId(Integer featureDetailsId) {
        this.featureDetailsId = featureDetailsId;
    }

    public Estate getEstateId() {
        return estateId;
    }

    public void setEstateId(Estate estateId) {
        this.estateId = estateId;
    }

    public Features getFeatureId() {
        return featureId;
    }

    public void setFeatureId(Features featureId) {
        this.featureId = featureId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (featureDetailsId != null ? featureDetailsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FeatureDetails)) {
            return false;
        }
        FeatureDetails other = (FeatureDetails) object;
        if ((this.featureDetailsId == null && other.featureDetailsId != null) || (this.featureDetailsId != null && !this.featureDetailsId.equals(other.featureDetailsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.FeatureDetails[ featureDetailsId=" + featureDetailsId + " ]";
    }
    
}
