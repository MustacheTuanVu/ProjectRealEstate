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
public class ContractDetailsJpaController implements Serializable {

    public ContractDetailsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ContractDetails contractDetails) throws IllegalOrphanException, PreexistingEntityException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        Contract contractIdOrphanCheck = contractDetails.getContractId();
        if (contractIdOrphanCheck != null) {
            ContractDetails oldContractDetails1OfContractId = contractIdOrphanCheck.getContractDetails1();
            if (oldContractDetails1OfContractId != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Contract " + contractIdOrphanCheck + " already has an item of type ContractDetails whose contractId column cannot be null. Please make another selection for the contractId field.");
            }
        }
        Estate estateIdOrphanCheck = contractDetails.getEstateId();
        if (estateIdOrphanCheck != null) {
            ContractDetails oldContractDetailsOfEstateId = estateIdOrphanCheck.getContractDetails();
            if (oldContractDetailsOfEstateId != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Estate " + estateIdOrphanCheck + " already has an item of type ContractDetails whose estateId column cannot be null. Please make another selection for the estateId field.");
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
            Contract contractId = contractDetails.getContractId();
            if (contractId != null) {
                contractId = em.getReference(contractId.getClass(), contractId.getId());
                contractDetails.setContractId(contractId);
            }
            Estate estateId = contractDetails.getEstateId();
            if (estateId != null) {
                estateId = em.getReference(estateId.getClass(), estateId.getId());
                contractDetails.setEstateId(estateId);
            }
            em.persist(contractDetails);
            if (contractId != null) {
                contractId.setContractDetails1(contractDetails);
                contractId = em.merge(contractId);
            }
            if (estateId != null) {
                estateId.setContractDetails(contractDetails);
                estateId = em.merge(estateId);
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
            if (findContractDetails(contractDetails.getId()) != null) {
                throw new PreexistingEntityException("ContractDetails " + contractDetails + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ContractDetails contractDetails) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            ContractDetails persistentContractDetails = em.find(ContractDetails.class, contractDetails.getId());
            Contract contractIdOld = persistentContractDetails.getContractId();
            Contract contractIdNew = contractDetails.getContractId();
            Estate estateIdOld = persistentContractDetails.getEstateId();
            Estate estateIdNew = contractDetails.getEstateId();
            List<String> illegalOrphanMessages = null;
            if (contractIdNew != null && !contractIdNew.equals(contractIdOld)) {
                ContractDetails oldContractDetails1OfContractId = contractIdNew.getContractDetails1();
                if (oldContractDetails1OfContractId != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Contract " + contractIdNew + " already has an item of type ContractDetails whose contractId column cannot be null. Please make another selection for the contractId field.");
                }
            }
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                ContractDetails oldContractDetailsOfEstateId = estateIdNew.getContractDetails();
                if (oldContractDetailsOfEstateId != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Estate " + estateIdNew + " already has an item of type ContractDetails whose estateId column cannot be null. Please make another selection for the estateId field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (contractIdNew != null) {
                contractIdNew = em.getReference(contractIdNew.getClass(), contractIdNew.getId());
                contractDetails.setContractId(contractIdNew);
            }
            if (estateIdNew != null) {
                estateIdNew = em.getReference(estateIdNew.getClass(), estateIdNew.getId());
                contractDetails.setEstateId(estateIdNew);
            }
            contractDetails = em.merge(contractDetails);
            if (contractIdOld != null && !contractIdOld.equals(contractIdNew)) {
                contractIdOld.setContractDetails1(null);
                contractIdOld = em.merge(contractIdOld);
            }
            if (contractIdNew != null && !contractIdNew.equals(contractIdOld)) {
                contractIdNew.setContractDetails1(contractDetails);
                contractIdNew = em.merge(contractIdNew);
            }
            if (estateIdOld != null && !estateIdOld.equals(estateIdNew)) {
                estateIdOld.setContractDetails(null);
                estateIdOld = em.merge(estateIdOld);
            }
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                estateIdNew.setContractDetails(contractDetails);
                estateIdNew = em.merge(estateIdNew);
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
                Integer id = contractDetails.getId();
                if (findContractDetails(id) == null) {
                    throw new NonexistentEntityException("The contractDetails with id " + id + " no longer exists.");
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
            utx.begin();
            em = getEntityManager();
            ContractDetails contractDetails;
            try {
                contractDetails = em.getReference(ContractDetails.class, id);
                contractDetails.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The contractDetails with id " + id + " no longer exists.", enfe);
            }
            Contract contractId = contractDetails.getContractId();
            if (contractId != null) {
                contractId.setContractDetails1(null);
                contractId = em.merge(contractId);
            }
            Estate estateId = contractDetails.getEstateId();
            if (estateId != null) {
                estateId.setContractDetails(null);
                estateId = em.merge(estateId);
            }
            em.remove(contractDetails);
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

    public List<ContractDetails> findContractDetailsEntities() {
        return findContractDetailsEntities(true, -1, -1);
    }

    public List<ContractDetails> findContractDetailsEntities(int maxResults, int firstResult) {
        return findContractDetailsEntities(false, maxResults, firstResult);
    }

    private List<ContractDetails> findContractDetailsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ContractDetails.class));
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

    public ContractDetails findContractDetails(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ContractDetails.class, id);
        } finally {
            em.close();
        }
    }

    public int getContractDetailsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ContractDetails> rt = cq.from(ContractDetails.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
