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

/**
 *
 * @author kiems
 */
@Entity
@Table(name = "fee")
@NamedQueries({
    @NamedQuery(name = "Fee.findAll", query = "SELECT f FROM Fee f")})
public class Fee implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fee_employee")
    private double feeEmployee;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fee_estate")
    private double feeEstate;

    public Fee() {
    }

    public Fee(Integer id) {
        this.id = id;
    }

    public Fee(Integer id, double feeEmployee, double feeEstate) {
        this.id = id;
        this.feeEmployee = feeEmployee;
        this.feeEstate = feeEstate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public double getFeeEmployee() {
        return feeEmployee;
    }

    public void setFeeEmployee(double feeEmployee) {
        this.feeEmployee = feeEmployee;
    }

    public double getFeeEstate() {
        return feeEstate;
    }

    public void setFeeEstate(double feeEstate) {
        this.feeEstate = feeEstate;
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
        if (!(object instanceof Fee)) {
            return false;
        }
        Fee other = (Fee) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Fee[ id=" + id + " ]";
    }
    
}
