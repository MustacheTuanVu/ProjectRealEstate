/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
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
 * @author Cuong
 */
@Entity
@Table(name = "payment_frequency")
@NamedQueries({
    @NamedQuery(name = "PaymentFrequency.findAll", query = "SELECT p FROM PaymentFrequency p")})
public class PaymentFrequency implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "payment_frequency_name")
    private String paymentFrequencyName;
    @OneToMany(mappedBy = "paymentFrequency")
    private List<Contract> contractList;

    public PaymentFrequency() {
    }

    public PaymentFrequency(Integer id) {
        this.id = id;
    }

    public PaymentFrequency(Integer id, String paymentFrequencyName) {
        this.id = id;
        this.paymentFrequencyName = paymentFrequencyName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPaymentFrequencyName() {
        return paymentFrequencyName;
    }

    public void setPaymentFrequencyName(String paymentFrequencyName) {
        this.paymentFrequencyName = paymentFrequencyName;
    }

    public List<Contract> getContractList() {
        return contractList;
    }

    public void setContractList(List<Contract> contractList) {
        this.contractList = contractList;
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
        if (!(object instanceof PaymentFrequency)) {
            return false;
        }
        PaymentFrequency other = (PaymentFrequency) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.PaymentFrequency[ id=" + id + " ]";
    }
    
}
