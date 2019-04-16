/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
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
@Table(name = "transactions")
@NamedQueries({
    @NamedQuery(name = "Transactions.findAll", query = "SELECT t FROM Transactions t")})
public class Transactions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "transactions_date")
    @Temporal(TemporalType.DATE)
    private Date transactionsDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "money")
    private Double money;
    @Size(max = 1073741823)
    @Column(name = "transactions_note")
    private String transactionsNote;
    @JoinColumn(name = "contract_id", referencedColumnName = "id")
    @OneToOne(optional = false)
    private Contract contractId;
    @JoinColumn(name = "customer_offered", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Customer customerOffered;

    public Transactions() {
        
    }

    public Transactions(Integer id) {
        this.id = id;
    }

    public Transactions(Integer id, Date transactionsDate) {
        this.id = id;
        this.transactionsDate = transactionsDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getTransactionsDate() {
        return transactionsDate;
    }

    public void setTransactionsDate(Date transactionsDate) {
        this.transactionsDate = transactionsDate;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getTransactionsNote() {
        return transactionsNote;
    }

    public void setTransactionsNote(String transactionsNote) {
        this.transactionsNote = transactionsNote;
    }

    public Contract getContractId() {
        return contractId;
    }

    public void setContractId(Contract contractId) {
        this.contractId = contractId;
    }

    public Customer getCustomerOffered() {
        return customerOffered;
    }

    public void setCustomerOffered(Customer customerOffered) {
        this.customerOffered = customerOffered;
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
        if (!(object instanceof Transactions)) {
            return false;
        }
        Transactions other = (Transactions) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Transactions[ id=" + id + " ]";
    }
    
}
