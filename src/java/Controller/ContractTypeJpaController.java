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
import Entity.ContractType;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class ContractTypeJpaController implements Serializable {

    public ContractTypeJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ContractType contractType) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (contractType.getContractList() == null) {
            contractType.setContractList(new ArrayList<Contract>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Contract> attachedContractList = new ArrayList<Contract>();
            for (Contract contractListContractToAttach : contractType.getContractList()) {
                contractListContractToAttach = em.getReference(contractListContractToAttach.getClass(), contractListContractToAttach.getId());
                attachedContractList.add(contractListContractToAttach);
            }
            contractType.setContractList(attachedContractList);
            em.persist(contractType);
            for (Contract contractListContract : contractType.getContractList()) {
                ContractType oldContractTypeIdOfContractListContract = contractListContract.getContractTypeId();
                contractListContract.setContractTypeId(contractType);
                contractListContract = em.merge(contractListContract);
                if (oldContractTypeIdOfContractListContract != null) {
                    oldContractTypeIdOfContractListContract.getContractList().remove(contractListContract);
                    oldContractTypeIdOfContractListContract = em.merge(oldContractTypeIdOfContractListContract);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findContractType(contractType.getId()) != null) {
                throw new PreexistingEntityException("ContractType " + contractType + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ContractType contractType) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            ContractType persistentContractType = em.find(ContractType.class, contractType.getId());
            List<Contract> contractListOld = persistentContractType.getContractList();
            List<Contract> contractListNew = contractType.getContractList();
            List<String> illegalOrphanMessages = null;
            for (Contract contractListOldContract : contractListOld) {
                if (!contractListNew.contains(contractListOldContract)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Contract " + contractListOldContract + " since its contractTypeId field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Contract> attachedContractListNew = new ArrayList<Contract>();
            for (Contract contractListNewContractToAttach : contractListNew) {
                contractListNewContractToAttach = em.getReference(contractListNewContractToAttach.getClass(), contractListNewContractToAttach.getId());
                attachedContractListNew.add(contractListNewContractToAttach);
            }
            contractListNew = attachedContractListNew;
            contractType.setContractList(contractListNew);
            contractType = em.merge(contractType);
            for (Contract contractListNewContract : contractListNew) {
                if (!contractListOld.contains(contractListNewContract)) {
                    ContractType oldContractTypeIdOfContractListNewContract = contractListNewContract.getContractTypeId();
                    contractListNewContract.setContractTypeId(contractType);
                    contractListNewContract = em.merge(contractListNewContract);
                    if (oldContractTypeIdOfContractListNewContract != null && !oldContractTypeIdOfContractListNewContract.equals(contractType)) {
                        oldContractTypeIdOfContractListNewContract.getContractList().remove(contractListNewContract);
                        oldContractTypeIdOfContractListNewContract = em.merge(oldContractTypeIdOfContractListNewContract);
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
                Integer id = contractType.getId();
                if (findContractType(id) == null) {
                    throw new NonexistentEntityException("The contractType with id " + id + " no longer exists.");
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
            em = getEntityManager();
            em.getTransaction().begin();
            ContractType contractType;
            try {
                contractType = em.getReference(ContractType.class, id);
                contractType.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The contractType with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Contract> contractListOrphanCheck = contractType.getContractList();
            for (Contract contractListOrphanCheckContract : contractListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This ContractType (" + contractType + ") cannot be destroyed since the Contract " + contractListOrphanCheckContract + " in its contractList field has a non-nullable contractTypeId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(contractType);
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

    public List<ContractType> findContractTypeEntities() {
        return findContractTypeEntities(true, -1, -1);
    }

    public List<ContractType> findContractTypeEntities(int maxResults, int firstResult) {
        return findContractTypeEntities(false, maxResults, firstResult);
    }

    private List<ContractType> findContractTypeEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ContractType.class));
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

    public ContractType findContractType(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ContractType.class, id);
        } finally {
            em.close();
        }
    }

    public int getContractTypeCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ContractType> rt = cq.from(ContractType.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public List<ContractType> findContractTypeName(String a) {
        
        EntityManager em= getEntityManager();
        Query q=em.createQuery("SELECT t FROM ContractType t WHERE t.contractTypeName like :typeName");
        q.setParameter("typeName", a);
        return q.getResultList();
    }
    
}
