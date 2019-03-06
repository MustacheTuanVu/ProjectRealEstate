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
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Cuong
 */
@Entity
@Table(name = "estate")
@NamedQueries({
    @NamedQuery(name = "Estate.findAll", query = "SELECT e FROM Estate e")})
public class Estate implements Serializable {
<<<<<<< HEAD

    @Size(max = 50)
    @Column(name = "estate_status")
    private String estateStatus;

=======
>>>>>>> master
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "id")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "estate_name")
    private String estateName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "estate_description")
    private String estateDescription;
    @Column(name = "bed_room")
    private Integer bedRoom;
    @Column(name = "bath_room")
    private Integer bathRoom;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "garages")
    private Double garages;
    @Column(name = "price")
    private Double price;
    @Column(name = "areas")
    private Double areas;
    @Size(max = 1073741823)
    @Column(name = "estate_content")
    private String estateContent;
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
    @Column(name = "direction")
    private String direction;
    @Size(max = 10)
    @Column(name = "block")
    private String block;
    @Size(max = 255)
    @Column(name = "address1")
    private String address1;
    @Size(max = 255)
    @Column(name = "address2")
    private String address2;
    @Column(name = "year_build")
    @Temporal(TemporalType.DATE)
    private Date yearBuild;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "estateId")
    private AssignDetails assignDetails;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "estateId")
    private ProjectDetails projectDetails;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estateId")
    private List<Schedule> scheduleList;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "estateId")
    private ContractDetails contractDetails;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "estateId")
    private List<FeatureDetails> featureDetailsList;
    @JoinColumn(name = "estate_type_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private EstateType estateTypeId;
    @JoinColumn(name = "estate_status_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private EstateStatus estateStatusId;

    public Estate() {
    }

    public Estate(String id) {
        this.id = id;
    }

    public Estate(String id, String estateName, String estateDescription) {
        this.id = id;
        this.estateName = estateName;
        this.estateDescription = estateDescription;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEstateName() {
        return estateName;
    }

    public void setEstateName(String estateName) {
        this.estateName = estateName;
    }

    public String getEstateDescription() {
        return estateDescription;
    }

    public void setEstateDescription(String estateDescription) {
        this.estateDescription = estateDescription;
    }

    public Integer getBedRoom() {
        return bedRoom;
    }

    public void setBedRoom(Integer bedRoom) {
        this.bedRoom = bedRoom;
    }

    public Integer getBathRoom() {
        return bathRoom;
    }

    public void setBathRoom(Integer bathRoom) {
        this.bathRoom = bathRoom;
    }

    public Double getGarages() {
        return garages;
    }

    public void setGarages(Double garages) {
        this.garages = garages;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getAreas() {
        return areas;
    }

    public void setAreas(Double areas) {
        this.areas = areas;
    }

    public String getEstateContent() {
        return estateContent;
    }

    public void setEstateContent(String estateContent) {
        this.estateContent = estateContent;
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

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public Date getYearBuild() {
        return yearBuild;
    }

    public void setYearBuild(Date yearBuild) {
        this.yearBuild = yearBuild;
    }

    public AssignDetails getAssignDetails() {
        return assignDetails;
    }

    public void setAssignDetails(AssignDetails assignDetails) {
        this.assignDetails = assignDetails;
    }

    public ProjectDetails getProjectDetails() {
        return projectDetails;
    }

    public void setProjectDetails(ProjectDetails projectDetails) {
        this.projectDetails = projectDetails;
    }

    public List<Schedule> getScheduleList() {
        return scheduleList;
    }

    public void setScheduleList(List<Schedule> scheduleList) {
        this.scheduleList = scheduleList;
    }

    public ContractDetails getContractDetails() {
        return contractDetails;
    }

    public void setContractDetails(ContractDetails contractDetails) {
        this.contractDetails = contractDetails;
    }

    public List<FeatureDetails> getFeatureDetailsList() {
        return featureDetailsList;
    }

    public void setFeatureDetailsList(List<FeatureDetails> featureDetailsList) {
        this.featureDetailsList = featureDetailsList;
    }

    public EstateType getEstateTypeId() {
        return estateTypeId;
    }

    public void setEstateTypeId(EstateType estateTypeId) {
        this.estateTypeId = estateTypeId;
    }

    public EstateStatus getEstateStatusId() {
        return estateStatusId;
    }

    public void setEstateStatusId(EstateStatus estateStatusId) {
        this.estateStatusId = estateStatusId;
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
        if (!(object instanceof Estate)) {
            return false;
        }
        Estate other = (Estate) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Estate[ id=" + id + " ]";
    }

    public String getEstateStatus() {
        return estateStatus;
    }

    public void setEstateStatus(String estateStatus) {
        this.estateStatus = estateStatus;
    }
    
}
