/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Contract;
import Entity.ContractType;
import Entity.PaymentFrequency;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class PaymentFrequencyJpaController implements Serializable {

    public PaymentFrequencyJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(PaymentFrequency paymentFrequency) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (paymentFrequency.getContractList() == null) {
            paymentFrequency.setContractList(new ArrayList<Contract>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Contract> attachedContractList = new ArrayList<Contract>();
            for (Contract contractListContractToAttach : paymentFrequency.getContractList()) {
                contractListContractToAttach = em.getReference(contractListContractToAttach.getClass(), contractListContractToAttach.getId());
                attachedContractList.add(contractListContractToAttach);
            }
            paymentFrequency.setContractList(attachedContractList);
            em.persist(paymentFrequency);
            for (Contract contractListContract : paymentFrequency.getContractList()) {
                PaymentFrequency oldPaymentFrequencyOfContractListContract = contractListContract.getPaymentFrequency();
                contractListContract.setPaymentFrequency(paymentFrequency);
                contractListContract = em.merge(contractListContract);
                if (oldPaymentFrequencyOfContractListContract != null) {
                    oldPaymentFrequencyOfContractListContract.getContractList().remove(contractListContract);
                    oldPaymentFrequencyOfContractListContract = em.merge(oldPaymentFrequencyOfContractListContract);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findPaymentFrequency(paymentFrequency.getId()) != null) {
                throw new PreexistingEntityException("PaymentFrequency " + paymentFrequency + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(PaymentFrequency paymentFrequency) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            PaymentFrequency persistentPaymentFrequency = em.find(PaymentFrequency.class, paymentFrequency.getId());
            List<Contract> contractListOld = persistentPaymentFrequency.getContractList();
            List<Contract> contractListNew = paymentFrequency.getContractList();
            List<Contract> attachedContractListNew = new ArrayList<Contract>();
            for (Contract contractListNewContractToAttach : contractListNew) {
                contractListNewContractToAttach = em.getReference(contractListNewContractToAttach.getClass(), contractListNewContractToAttach.getId());
                attachedContractListNew.add(contractListNewContractToAttach);
            }
            contractListNew = attachedContractListNew;
            paymentFrequency.setContractList(contractListNew);
            paymentFrequency = em.merge(paymentFrequency);
            for (Contract contractListOldContract : contractListOld) {
                if (!contractListNew.contains(contractListOldContract)) {
                    contractListOldContract.setPaymentFrequency(null);
                    contractListOldContract = em.merge(contractListOldContract);
                }
            }
            for (Contract contractListNewContract : contractListNew) {
                if (!contractListOld.contains(contractListNewContract)) {
                    PaymentFrequency oldPaymentFrequencyOfContractListNewContract = contractListNewContract.getPaymentFrequency();
                    contractListNewContract.setPaymentFrequency(paymentFrequency);
                    contractListNewContract = em.merge(contractListNewContract);
                    if (oldPaymentFrequencyOfContractListNewContract != null && !oldPaymentFrequencyOfContractListNewContract.equals(paymentFrequency)) {
                        oldPaymentFrequencyOfContractListNewContract.getContractList().remove(contractListNewContract);
                        oldPaymentFrequencyOfContractListNewContract = em.merge(oldPaymentFrequencyOfContractListNewContract);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = paymentFrequency.getId();
                if (findPaymentFrequency(id) == null) {
                    throw new NonexistentEntityException("The paymentFrequency with id " + id + " no longer exists.");
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
            em = getEntityManager();
            em.getTransaction().begin();
            PaymentFrequency paymentFrequency;
            try {
                paymentFrequency = em.getReference(PaymentFrequency.class, id);
                paymentFrequency.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paymentFrequency with id " + id + " no longer exists.", enfe);
            }
            List<Contract> contractList = paymentFrequency.getContractList();
            for (Contract contractListContract : contractList) {
                contractListContract.setPaymentFrequency(null);
                contractListContract = em.merge(contractListContract);
            }
            em.remove(paymentFrequency);
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
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

    public List<PaymentFrequency> findPaymentFrequencyEntities() {
        return findPaymentFrequencyEntities(true, -1, -1);
    }

    public List<PaymentFrequency> findPaymentFrequencyEntities(int maxResults, int firstResult) {
        return findPaymentFrequencyEntities(false, maxResults, firstResult);
    }

    private List<PaymentFrequency> findPaymentFrequencyEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(PaymentFrequency.class));
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

    public PaymentFrequency findPaymentFrequency(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(PaymentFrequency.class, id);
        } finally {
            em.close();
        }
    }

    public int getPaymentFrequencyCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<PaymentFrequency> rt = cq.from(PaymentFrequency.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public List<ContractType> findPaymentName(String a) {
        EntityManager em= getEntityManager();
        Query q=em.createQuery("SELECT t FROM PaymentFrequency t WHERE t.paymentFrequencyName like :typeName");
        q.setParameter("typeName", a);
        return q.getResultList();
    }
    
}
