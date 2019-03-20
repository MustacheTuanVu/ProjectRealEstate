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
@Table(name = "features")
@NamedQueries({
    @NamedQuery(name = "Features.findAll", query = "SELECT f FROM Features f")})
public class Features implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "features_id")
    private String featuresId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "feature_name")
    private String featureName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "featureId")
    private List<FeatureDetails> featureDetailsList;

    public Features() {
    }

    public Features(String featuresId) {
        this.featuresId = featuresId;
    }

    public Features(String featuresId, String featureName) {
        this.featuresId = featuresId;
        this.featureName = featureName;
    }

    public String getFeaturesId() {
        return featuresId;
    }

    public void setFeaturesId(String featuresId) {
        this.featuresId = featuresId;
    }

    public String getFeatureName() {
        return featureName;
    }

    public void setFeatureName(String featureName) {
        this.featureName = featureName;
    }

    public List<FeatureDetails> getFeatureDetailsList() {
        return featureDetailsList;
    }

    public void setFeatureDetailsList(List<FeatureDetails> featureDetailsList) {
        this.featureDetailsList = featureDetailsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (featuresId != null ? featuresId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Features)) {
            return false;
        }
        Features other = (Features) object;
        if ((this.featuresId == null && other.featuresId != null) || (this.featuresId != null && !this.featuresId.equals(other.featuresId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Features[ featuresId=" + featuresId + " ]";
    }
    
}
