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
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author kiems
 */
@Entity
@Table(name = "manager")
@NamedQueries({
    @NamedQuery(name = "Manager.findAll", query = "SELECT m FROM Manager m")})
public class Manager implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "manager_id")
    private Integer managerId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "manager_name")
    private String managerName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "manager_address")
    private String managerAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "manager_indentity_card")
    private String managerIndentityCard;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "manager_phone")
    private String managerPhone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "manager_mail")
    private String managerMail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "manager_img")
    private String managerImg;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1073741823)
    @Column(name = "manager_content")
    private String managerContent;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @OneToOne
    private Users userId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "managerId")
    private List<Project> projectList;

    public Manager() {
    }

    public Manager(Integer managerId) {
        this.managerId = managerId;
    }

    public Manager(Integer managerId, String managerName, String managerAddress, String managerIndentityCard, String managerPhone, String managerMail, String managerImg, String managerContent) {
        this.managerId = managerId;
        this.managerName = managerName;
        this.managerAddress = managerAddress;
        this.managerIndentityCard = managerIndentityCard;
        this.managerPhone = managerPhone;
        this.managerMail = managerMail;
        this.managerImg = managerImg;
        this.managerContent = managerContent;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerAddress() {
        return managerAddress;
    }

    public void setManagerAddress(String managerAddress) {
        this.managerAddress = managerAddress;
    }

    public String getManagerIndentityCard() {
        return managerIndentityCard;
    }

    public void setManagerIndentityCard(String managerIndentityCard) {
        this.managerIndentityCard = managerIndentityCard;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }

    public String getManagerMail() {
        return managerMail;
    }

    public void setManagerMail(String managerMail) {
        this.managerMail = managerMail;
    }

    public String getManagerImg() {
        return managerImg;
    }

    public void setManagerImg(String managerImg) {
        this.managerImg = managerImg;
    }

    public String getManagerContent() {
        return managerContent;
    }

    public void setManagerContent(String managerContent) {
        this.managerContent = managerContent;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (managerId != null ? managerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Manager)) {
            return false;
        }
        Manager other = (Manager) object;
        if ((this.managerId == null && other.managerId != null) || (this.managerId != null && !this.managerId.equals(other.managerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Manager[ managerId=" + managerId + " ]";
    }
    
}
