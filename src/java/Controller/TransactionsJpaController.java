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
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Contract;
import Entity.Customer;
import Entity.Transactions;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class TransactionsJpaController implements Serializable {

    public TransactionsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Transactions transactions) throws IllegalOrphanException, PreexistingEntityException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        Contract contractIdOrphanCheck = transactions.getContractId();
        if (contractIdOrphanCheck != null) {
            Transactions oldTransactionsOfContractId = contractIdOrphanCheck.getTransactions();
            if (oldTransactionsOfContractId != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Contract " + contractIdOrphanCheck + " already has an item of type Transactions whose contractId column cannot be null. Please make another selection for the contractId field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Contract contractId = transactions.getContractId();
            if (contractId != null) {
                contractId = em.getReference(contractId.getClass(), contractId.getId());
                transactions.setContractId(contractId);
            }
            Customer customerOffered = transactions.getCustomerOffered();
            if (customerOffered != null) {
                customerOffered = em.getReference(customerOffered.getClass(), customerOffered.getId());
                transactions.setCustomerOffered(customerOffered);
            }
            em.persist(transactions);
            if (contractId != null) {
                contractId.setTransactions(transactions);
                contractId = em.merge(contractId);
            }
            if (customerOffered != null) {
                customerOffered.getTransactionsList().add(transactions);
                customerOffered = em.merge(customerOffered);
            }
            //utx.commit();
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
               // utx.rollback();
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findTransactions(transactions.getId()) != null) {
                throw new PreexistingEntityException("Transactions " + transactions + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Transactions transactions) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            
            em = getEntityManager();
            em.getTransaction().begin();
            Transactions persistentTransactions = em.find(Transactions.class, transactions.getId());
            Contract contractIdOld = persistentTransactions.getContractId();
            Contract contractIdNew = transactions.getContractId();
            Customer customerOfferedOld = persistentTransactions.getCustomerOffered();
            Customer customerOfferedNew = transactions.getCustomerOffered();
            List<String> illegalOrphanMessages = null;
            if (contractIdNew != null && !contractIdNew.equals(contractIdOld)) {
                Transactions oldTransactionsOfContractId = contractIdNew.getTransactions();
                if (oldTransactionsOfContractId != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Contract " + contractIdNew + " already has an item of type Transactions whose contractId column cannot be null. Please make another selection for the contractId field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (contractIdNew != null) {
                contractIdNew = em.getReference(contractIdNew.getClass(), contractIdNew.getId());
                transactions.setContractId(contractIdNew);
            }
            if (customerOfferedNew != null) {
                customerOfferedNew = em.getReference(customerOfferedNew.getClass(), customerOfferedNew.getId());
                transactions.setCustomerOffered(customerOfferedNew);
            }
            transactions = em.merge(transactions);
            if (contractIdOld != null && !contractIdOld.equals(contractIdNew)) {
                contractIdOld.setTransactions(null);
                contractIdOld = em.merge(contractIdOld);
            }
            if (contractIdNew != null && !contractIdNew.equals(contractIdOld)) {
                contractIdNew.setTransactions(transactions);
                contractIdNew = em.merge(contractIdNew);
            }
            if (customerOfferedOld != null && !customerOfferedOld.equals(customerOfferedNew)) {
                customerOfferedOld.getTransactionsList().remove(transactions);
                customerOfferedOld = em.merge(customerOfferedOld);
            }
            if (customerOfferedNew != null && !customerOfferedNew.equals(customerOfferedOld)) {
                customerOfferedNew.getTransactionsList().add(transactions);
                customerOfferedNew = em.merge(customerOfferedNew);
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
                Integer id = transactions.getId();
                if (findTransactions(id) == null) {
                    throw new NonexistentEntityException("The transactions with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Transactions transactions;
            try {
                transactions = em.getReference(Transactions.class, id);
                transactions.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The transactions with id " + id + " no longer exists.", enfe);
            }
            Contract contractId = transactions.getContractId();
            if (contractId != null) {
                contractId.setTransactions(null);
                contractId = em.merge(contractId);
            }
            Customer customerOffered = transactions.getCustomerOffered();
            if (customerOffered != null) {
                customerOffered.getTransactionsList().remove(transactions);
                customerOffered = em.merge(customerOffered);
            }
            em.remove(transactions);
            //utx.commit();
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                //utx.rollback();
                em.getTransaction().rollback();
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

    public List<Transactions> findTransactionsEntities() {
        return findTransactionsEntities(true, -1, -1);
    }

    public List<Transactions> findTransactionsEntities(int maxResults, int firstResult) {
        return findTransactionsEntities(false, maxResults, firstResult);
    }

    private List<Transactions> findTransactionsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Transactions.class));
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

    public Transactions findTransactions(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Transactions.class, id);
        } finally {
            em.close();
        }
    }

    public int getTransactionsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Transactions> rt = cq.from(Transactions.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
