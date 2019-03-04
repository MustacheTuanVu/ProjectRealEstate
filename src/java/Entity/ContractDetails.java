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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Cuong
 */
@Entity
@Table(name = "contract_details")
@NamedQueries({
    @NamedQuery(name = "ContractDetails.findAll", query = "SELECT c FROM ContractDetails c")})
public class ContractDetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "estate_id", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Estate estateId;
    @JoinColumn(name = "contract_id", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Contract contractId;

    public ContractDetails() {
    }

    public ContractDetails(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Estate getEstateId() {
        return estateId;
    }

    public void setEstateId(Estate estateId) {
        this.estateId = estateId;
    }

    public Contract getContractId() {
        return contractId;
    }

    public void setContractId(Contract contractId) {
        this.contractId = contractId;
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
        if (!(object instanceof ContractDetails)) {
            return false;
        }
        ContractDetails other = (ContractDetails) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.ContractDetails[ id=" + id + " ]";
    }
    
}
