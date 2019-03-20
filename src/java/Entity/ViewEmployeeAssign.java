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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author kiems
 */
@Entity
@Table(name = "view_employee_assign")
@NamedQueries({
    @NamedQuery(name = "ViewEmployeeAssign.findAll", query = "SELECT v FROM ViewEmployeeAssign v")})
public class ViewEmployeeAssign implements Serializable {

    private static final long serialVersionUID = 1L;
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    @Id
    private int id;
    @Column(name = "Expr1")
    private Integer expr1;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "employee_name")
    private String employeeName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "employee_address")
    private String employeeAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "employee_indentity_card")
    private String employeeIndentityCard;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "employee_phone")
    private String employeePhone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "employee_mail")
    private String employeeMail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "employee_img")
    private String employeeImg;
    @Column(name = "user_id")
    private Integer userId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "employee_content")
    private String employeeContent;

    public ViewEmployeeAssign() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getExpr1() {
        return expr1;
    }

    public void setExpr1(Integer expr1) {
        this.expr1 = expr1;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeAddress() {
        return employeeAddress;
    }

    public void setEmployeeAddress(String employeeAddress) {
        this.employeeAddress = employeeAddress;
    }

    public String getEmployeeIndentityCard() {
        return employeeIndentityCard;
    }

    public void setEmployeeIndentityCard(String employeeIndentityCard) {
        this.employeeIndentityCard = employeeIndentityCard;
    }

    public String getEmployeePhone() {
        return employeePhone;
    }

    public void setEmployeePhone(String employeePhone) {
        this.employeePhone = employeePhone;
    }

    public String getEmployeeMail() {
        return employeeMail;
    }

    public void setEmployeeMail(String employeeMail) {
        this.employeeMail = employeeMail;
    }

    public String getEmployeeImg() {
        return employeeImg;
    }

    public void setEmployeeImg(String employeeImg) {
        this.employeeImg = employeeImg;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getEmployeeContent() {
        return employeeContent;
    }

    public void setEmployeeContent(String employeeContent) {
        this.employeeContent = employeeContent;
    }
    
}
