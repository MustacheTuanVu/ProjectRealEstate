/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author kiems
 */
@Entity
@Table(name = "project")
@NamedQueries({
    @NamedQuery(name = "Project.findAll", query = "SELECT p FROM Project p")})
public class Project implements Serializable {
    @OneToMany(mappedBy = "idProject")
    private List<LoveProject> loveProjectList;
    @OneToMany(mappedBy = "idProject")
    private List<Comment> commentList;
    @OneToMany(mappedBy = "idProject")
    private List<Rating> ratingList;
    @Size(max = 2147483647)
    @Column(name = "project_content")
    private String projectContent;

    @Column(name = "year_build")
    @Temporal(TemporalType.DATE)
    private Date yearBuild;

    @Basic(optional = false)
    @NotNull
    @Column(name = "floor_number")
    private double floorNumber;
    @Column(name = "date_add")
    @Temporal(TemporalType.DATE)
    private Date dateAdd;
    @Size(max = 50)
    @Column(name = "district")
    private String district;

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "project_id")
    private String projectId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "project_name")
    private String projectName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "project_address")
    private String projectAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "project_status")
    private String projectStatus;
    @Basic(optional = false)
    @NotNull
    @Column(name = "block_number")
    private int blockNumber;
    @Size(max = 255)
    @Column(name = "image_1st")
    private String image1st;
    @Size(max = 255)
    @Column(name = "image_2st")
    private String image2st;
    @Size(max = 255)
    @Column(name = "image_3st")
    private String image3st;
    @Size(max = 255)
    @Column(name = "image_4st")
    private String image4st;
    @Size(max = 255)
    @Column(name = "image_5st")
    private String image5st;
    @Size(max = 50)
    @Column(name = "status")
    private String status;
    @Size(max = 255)
    @Column(name = "document_url")
    private String documentUrl;
    @JoinColumn(name = "manager_id", referencedColumnName = "manager_id")
    @ManyToOne(optional = false)
    private Manager managerId;

    public Project() {
    }

    public Project(String projectId) {
        this.projectId = projectId;
    }

    public Project(String projectId, String projectName, String projectAddress, String projectStatus, int blockNumber) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.projectAddress = projectAddress;
        this.projectStatus = projectStatus;
        this.blockNumber = blockNumber;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectAddress() {
        return projectAddress;
    }

    public void setProjectAddress(String projectAddress) {
        this.projectAddress = projectAddress;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    public int getBlockNumber() {
        return blockNumber;
    }

    public void setBlockNumber(int blockNumber) {
        this.blockNumber = blockNumber;
    }

    public String getImage1st() {
        return image1st;
    }

    public void setImage1st(String image1st) {
        this.image1st = image1st;
    }

    public String getImage2st() {
        return image2st;
    }

    public void setImage2st(String image2st) {
        this.image2st = image2st;
    }

    public String getImage3st() {
        return image3st;
    }

    public void setImage3st(String image3st) {
        this.image3st = image3st;
    }

    public String getImage4st() {
        return image4st;
    }

    public void setImage4st(String image4st) {
        this.image4st = image4st;
    }

    public String getImage5st() {
        return image5st;
    }

    public void setImage5st(String image5st) {
        this.image5st = image5st;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDocumentUrl() {
        return documentUrl;
    }

    public void setDocumentUrl(String documentUrl) {
        this.documentUrl = documentUrl;
    }

    public Manager getManagerId() {
        return managerId;
    }

    public void setManagerId(Manager managerId) {
        this.managerId = managerId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (projectId != null ? projectId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Project)) {
            return false;
        }
        Project other = (Project) object;
        if ((this.projectId == null && other.projectId != null) || (this.projectId != null && !this.projectId.equals(other.projectId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Project[ projectId=" + projectId + " ]";
    }

    public double getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(double floorNumber) {
        this.floorNumber = floorNumber;
    }

    public Date getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Date getYearBuild() {
        return yearBuild;
    }

    public void setYearBuild(Date yearBuild) {
        this.yearBuild = yearBuild;
    }

    public String getProjectContent() {
        return projectContent;
    }

    public void setProjectContent(String projectContent) {
        this.projectContent = projectContent;
    }

    public List<Rating> getRatingList() {
        return ratingList;
    }

    public void setRatingList(List<Rating> ratingList) {
        this.ratingList = ratingList;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public List<LoveProject> getLoveProjectList() {
        return loveProjectList;
    }

    public void setLoveProjectList(List<LoveProject> loveProjectList) {
        this.loveProjectList = loveProjectList;
    }
    
}
