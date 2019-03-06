/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.IllegalOrphanException;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Contract;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.ContractType;
import Entity.Customer;
import Entity.Employee;
import Entity.PaymentFrequency;
import Entity.Transactions;
import Entity.ContractDetails;
import Entity.Estate;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class ContractJpaController implements Serializable {

    public ContractJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    // get id contract by id cus and status 
    // add contract details
    public Contract findIDContract_ByStatus(Customer cus){
        EntityManager em=getEntityManager();
        Query q=em.createQuery("SELECT c FROM Contract c WHERE c.customerId = :idUser AND c.status LIKE 'Waiting'");
        q.setParameter("idUser", cus);
        
        return (Contract) q.getSingleResult();
    }
    // count number contract waiting
    public List<Contract> countContractWaiting(Customer cus){
        EntityManager em=getEntityManager();
        Query q=em.createQuery("SELECT c FROM Contract c WHERE c.customerId = :idUser AND c.status LIKE 'Waiting'");
        q.setParameter("idUser", cus);
        
        return  q.getResultList();
    }


    public void create(Contract contract) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            ContractType contractTypeId = contract.getContractTypeId();
            if (contractTypeId != null) {
                contractTypeId = em.getReference(contractTypeId.getClass(), contractTypeId.getId());
                contract.setContractTypeId(contractTypeId);
            }
            Customer customerId = contract.getCustomerId();
            if (customerId != null) {
                customerId = em.getReference(customerId.getClass(), customerId.getId());
                contract.setCustomerId(customerId);
            }
            Employee employeeId = contract.getEmployeeId();
            if (employeeId != null) {
                employeeId = em.getReference(employeeId.getClass(), employeeId.getId());
                contract.setEmployeeId(employeeId);
            }
            PaymentFrequency paymentFrequency = contract.getPaymentFrequency();
            if (paymentFrequency != null) {
                paymentFrequency = em.getReference(paymentFrequency.getClass(), paymentFrequency.getId());
                contract.setPaymentFrequency(paymentFrequency);
            }
            Transactions transactions = contract.getTransactions();
            if (transactions != null) {
                transactions = em.getReference(transactions.getClass(), transactions.getId());
                contract.setTransactions(transactions);
            }
            ContractDetails contractDetails1 = contract.getContractDetails1();
            if (contractDetails1 != null) {
                contractDetails1 = em.getReference(contractDetails1.getClass(), contractDetails1.getId());
                contract.setContractDetails1(contractDetails1);
            }
            em.persist(contract);
            if (contractTypeId != null) {
                contractTypeId.getContractList().add(contract);
                contractTypeId = em.merge(contractTypeId);
            }
            if (customerId != null) {
                customerId.getContractList().add(contract);
                customerId = em.merge(customerId);
            }
            if (employeeId != null) {
                employeeId.getContractList().add(contract);
                employeeId = em.merge(employeeId);
            }
            if (paymentFrequency != null) {
                paymentFrequency.getContractList().add(contract);
                paymentFrequency = em.merge(paymentFrequency);
            }
            if (transactions != null) {
                Contract oldContractIdOfTransactions = transactions.getContractId();
                if (oldContractIdOfTransactions != null) {
                    oldContractIdOfTransactions.setTransactions(null);
                    oldContractIdOfTransactions = em.merge(oldContractIdOfTransactions);
                }
                transactions.setContractId(contract);
                transactions = em.merge(transactions);
            }
            if (contractDetails1 != null) {
                Contract oldContractIdOfContractDetails1 = contractDetails1.getContractId();
                if (oldContractIdOfContractDetails1 != null) {
                    oldContractIdOfContractDetails1.setContractDetails1(null);
                    oldContractIdOfContractDetails1 = em.merge(oldContractIdOfContractDetails1);
                }
                contractDetails1.setContractId(contract);
                contractDetails1 = em.merge(contractDetails1);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                //utx.rollback();
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findContract(contract.getId()) != null) {
                throw new PreexistingEntityException("Contract " + contract + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Contract contract) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Contract persistentContract = em.find(Contract.class, contract.getId());
            ContractType contractTypeIdOld = persistentContract.getContractTypeId();
            ContractType contractTypeIdNew = contract.getContractTypeId();
            Customer customerIdOld = persistentContract.getCustomerId();
            Customer customerIdNew = contract.getCustomerId();
            Employee employeeIdOld = persistentContract.getEmployeeId();
            Employee employeeIdNew = contract.getEmployeeId();
            PaymentFrequency paymentFrequencyOld = persistentContract.getPaymentFrequency();
            PaymentFrequency paymentFrequencyNew = contract.getPaymentFrequency();
            Transactions transactionsOld = persistentContract.getTransactions();
            Transactions transactionsNew = contract.getTransactions();
            ContractDetails contractDetails1Old = persistentContract.getContractDetails1();
            ContractDetails contractDetails1New = contract.getContractDetails1();
            List<String> illegalOrphanMessages = null;
            if (transactionsOld != null && !transactionsOld.equals(transactionsNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain Transactions " + transactionsOld + " since its contractId field is not nullable.");
            }
            if (contractDetails1Old != null && !contractDetails1Old.equals(contractDetails1New)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain ContractDetails " + contractDetails1Old + " since its contractId field is not nullable.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (contractTypeIdNew != null) {
                contractTypeIdNew = em.getReference(contractTypeIdNew.getClass(), contractTypeIdNew.getId());
                contract.setContractTypeId(contractTypeIdNew);
            }
            if (customerIdNew != null) {
                customerIdNew = em.getReference(customerIdNew.getClass(), customerIdNew.getId());
                contract.setCustomerId(customerIdNew);
            }
            if (employeeIdNew != null) {
                employeeIdNew = em.getReference(employeeIdNew.getClass(), employeeIdNew.getId());
                contract.setEmployeeId(employeeIdNew);
            }
            if (paymentFrequencyNew != null) {
                paymentFrequencyNew = em.getReference(paymentFrequencyNew.getClass(), paymentFrequencyNew.getId());
                contract.setPaymentFrequency(paymentFrequencyNew);
            }
            if (transactionsNew != null) {
                transactionsNew = em.getReference(transactionsNew.getClass(), transactionsNew.getId());
                contract.setTransactions(transactionsNew);
            }
            if (contractDetails1New != null) {
                contractDetails1New = em.getReference(contractDetails1New.getClass(), contractDetails1New.getId());
                contract.setContractDetails1(contractDetails1New);
            }
            contract = em.merge(contract);
            if (contractTypeIdOld != null && !contractTypeIdOld.equals(contractTypeIdNew)) {
                contractTypeIdOld.getContractList().remove(contract);
                contractTypeIdOld = em.merge(contractTypeIdOld);
            }
            if (contractTypeIdNew != null && !contractTypeIdNew.equals(contractTypeIdOld)) {
                contractTypeIdNew.getContractList().add(contract);
                contractTypeIdNew = em.merge(contractTypeIdNew);
            }
            if (customerIdOld != null && !customerIdOld.equals(customerIdNew)) {
                customerIdOld.getContractList().remove(contract);
                customerIdOld = em.merge(customerIdOld);
            }
            if (customerIdNew != null && !customerIdNew.equals(customerIdOld)) {
                customerIdNew.getContractList().add(contract);
                customerIdNew = em.merge(customerIdNew);
            }
            if (employeeIdOld != null && !employeeIdOld.equals(employeeIdNew)) {
                employeeIdOld.getContractList().remove(contract);
                employeeIdOld = em.merge(employeeIdOld);
            }
            if (employeeIdNew != null && !employeeIdNew.equals(employeeIdOld)) {
                employeeIdNew.getContractList().add(contract);
                employeeIdNew = em.merge(employeeIdNew);
            }
            if (paymentFrequencyOld != null && !paymentFrequencyOld.equals(paymentFrequencyNew)) {
                paymentFrequencyOld.getContractList().remove(contract);
                paymentFrequencyOld = em.merge(paymentFrequencyOld);
            }
            if (paymentFrequencyNew != null && !paymentFrequencyNew.equals(paymentFrequencyOld)) {
                paymentFrequencyNew.getContractList().add(contract);
                paymentFrequencyNew = em.merge(paymentFrequencyNew);
            }
            if (transactionsNew != null && !transactionsNew.equals(transactionsOld)) {
                Contract oldContractIdOfTransactions = transactionsNew.getContractId();
                if (oldContractIdOfTransactions != null) {
                    oldContractIdOfTransactions.setTransactions(null);
                    oldContractIdOfTransactions = em.merge(oldContractIdOfTransactions);
                }
                transactionsNew.setContractId(contract);
                transactionsNew = em.merge(transactionsNew);
            }
            if (contractDetails1New != null && !contractDetails1New.equals(contractDetails1Old)) {
                Contract oldContractIdOfContractDetails1 = contractDetails1New.getContractId();
                if (oldContractIdOfContractDetails1 != null) {
                    oldContractIdOfContractDetails1.setContractDetails1(null);
                    oldContractIdOfContractDetails1 = em.merge(oldContractIdOfContractDetails1);
                }
                contractDetails1New.setContractId(contract);
                contractDetails1New = em.merge(contractDetails1New);
            }
            //utx.commit();
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                //utx.rollback();
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = contract.getId();
                if (findContract(id) == null) {
                    throw new NonexistentEntityException("The contract with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Contract contract;
            try {
                contract = em.getReference(Contract.class, id);
                contract.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The contract with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            Transactions transactionsOrphanCheck = contract.getTransactions();
            if (transactionsOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Contract (" + contract + ") cannot be destroyed since the Transactions " + transactionsOrphanCheck + " in its transactions field has a non-nullable contractId field.");
            }
            ContractDetails contractDetails1OrphanCheck = contract.getContractDetails1();
            if (contractDetails1OrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Contract (" + contract + ") cannot be destroyed since the ContractDetails " + contractDetails1OrphanCheck + " in its contractDetails1 field has a non-nullable contractId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            ContractType contractTypeId = contract.getContractTypeId();
            if (contractTypeId != null) {
                contractTypeId.getContractList().remove(contract);
                contractTypeId = em.merge(contractTypeId);
            }
            Customer customerId = contract.getCustomerId();
            if (customerId != null) {
                customerId.getContractList().remove(contract);
                customerId = em.merge(customerId);
            }
            Employee employeeId = contract.getEmployeeId();
            if (employeeId != null) {
                employeeId.getContractList().remove(contract);
                employeeId = em.merge(employeeId);
            }
            PaymentFrequency paymentFrequency = contract.getPaymentFrequency();
            if (paymentFrequency != null) {
                paymentFrequency.getContractList().remove(contract);
                paymentFrequency = em.merge(paymentFrequency);
            }
            em.remove(contract);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Contract> findContractEntities() {
        return findContractEntities(true, -1, -1);
    }

    public List<Contract> findContractEntities(int maxResults, int firstResult) {
        return findContractEntities(false, maxResults, firstResult);
    }

    private List<Contract> findContractEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Contract.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Contract findContract(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Contract.class, id);
        } finally {
            em.close();
        }
    }

    public int getContractCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Contract> rt = cq.from(Contract.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
