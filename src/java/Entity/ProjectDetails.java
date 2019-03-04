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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author kiems
 */
@Entity
@Table(name = "project_details")
@NamedQueries({
    @NamedQuery(name = "ProjectDetails.findAll", query = "SELECT p FROM ProjectDetails p")})
public class ProjectDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "project_detail_id")
    private Integer projectDetailId;
    @JoinColumn(name = "estate_id", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Estate estateId;
    @JoinColumn(name = "prject_id", referencedColumnName = "project_id")
    @ManyToOne(optional = false)
    private Project prjectId;

    public ProjectDetails() {
    }

    public ProjectDetails(Integer projectDetailId) {
        this.projectDetailId = projectDetailId;
    }

    public Integer getProjectDetailId() {
        return projectDetailId;
    }

    public void setProjectDetailId(Integer projectDetailId) {
        this.projectDetailId = projectDetailId;
    }

    public Estate getEstateId() {
        return estateId;
    }

    public void setEstateId(Estate estateId) {
        this.estateId = estateId;
    }

    public Project getPrjectId() {
        return prjectId;
    }

    public void setPrjectId(Project prjectId) {
        this.prjectId = prjectId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (projectDetailId != null ? projectDetailId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProjectDetails)) {
            return false;
        }
        ProjectDetails other = (ProjectDetails) object;
        if ((this.projectDetailId == null && other.projectDetailId != null) || (this.projectDetailId != null && !this.projectDetailId.equals(other.projectDetailId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.ProjectDetails[ projectDetailId=" + projectDetailId + " ]";
    }
    
}
