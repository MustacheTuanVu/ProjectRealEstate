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
import Entity.AssignDetails;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Employee;
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
public class AssignDetailsJpaController implements Serializable {

    public AssignDetailsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AssignDetails assignDetails) throws IllegalOrphanException, PreexistingEntityException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        Estate estateIdOrphanCheck = assignDetails.getEstateId();
        if (estateIdOrphanCheck != null) {
            AssignDetails oldAssignDetailsOfEstateId = estateIdOrphanCheck.getAssignDetails();
            if (oldAssignDetailsOfEstateId != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Estate " + estateIdOrphanCheck + " already has an item of type AssignDetails whose estateId column cannot be null. Please make another selection for the estateId field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Employee employeeId = assignDetails.getEmployeeId();
            if (employeeId != null) {
                employeeId = em.getReference(employeeId.getClass(), employeeId.getId());
                assignDetails.setEmployeeId(employeeId);
            }
            Estate estateId = assignDetails.getEstateId();
            if (estateId != null) {
                estateId = em.getReference(estateId.getClass(), estateId.getId());
                assignDetails.setEstateId(estateId);
            }
            em.persist(assignDetails);
            if (employeeId != null) {
                employeeId.getAssignDetailsList().add(assignDetails);
                employeeId = em.merge(employeeId);
            }
            if (estateId != null) {
                estateId.setAssignDetails(assignDetails);
                estateId = em.merge(estateId);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findAssignDetails(assignDetails.getId()) != null) {
                throw new PreexistingEntityException("AssignDetails " + assignDetails + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(AssignDetails assignDetails) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            AssignDetails persistentAssignDetails = em.find(AssignDetails.class, assignDetails.getId());
            Employee employeeIdOld = persistentAssignDetails.getEmployeeId();
            Employee employeeIdNew = assignDetails.getEmployeeId();
            Estate estateIdOld = persistentAssignDetails.getEstateId();
            Estate estateIdNew = assignDetails.getEstateId();
            List<String> illegalOrphanMessages = null;
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                AssignDetails oldAssignDetailsOfEstateId = estateIdNew.getAssignDetails();
                if (oldAssignDetailsOfEstateId != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Estate " + estateIdNew + " already has an item of type AssignDetails whose estateId column cannot be null. Please make another selection for the estateId field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (employeeIdNew != null) {
                employeeIdNew = em.getReference(employeeIdNew.getClass(), employeeIdNew.getId());
                assignDetails.setEmployeeId(employeeIdNew);
            }
            if (estateIdNew != null) {
                estateIdNew = em.getReference(estateIdNew.getClass(), estateIdNew.getId());
                assignDetails.setEstateId(estateIdNew);
            }
            assignDetails = em.merge(assignDetails);
            if (employeeIdOld != null && !employeeIdOld.equals(employeeIdNew)) {
                employeeIdOld.getAssignDetailsList().remove(assignDetails);
                employeeIdOld = em.merge(employeeIdOld);
            }
            if (employeeIdNew != null && !employeeIdNew.equals(employeeIdOld)) {
                employeeIdNew.getAssignDetailsList().add(assignDetails);
                employeeIdNew = em.merge(employeeIdNew);
            }
            if (estateIdOld != null && !estateIdOld.equals(estateIdNew)) {
                estateIdOld.setAssignDetails(null);
                estateIdOld = em.merge(estateIdOld);
            }
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                estateIdNew.setAssignDetails(assignDetails);
                estateIdNew = em.merge(estateIdNew);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = assignDetails.getId();
                if (findAssignDetails(id) == null) {
                    throw new NonexistentEntityException("The assignDetails with id " + id + " no longer exists.");
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
            AssignDetails assignDetails;
            try {
                assignDetails = em.getReference(AssignDetails.class, id);
                assignDetails.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The assignDetails with id " + id + " no longer exists.", enfe);
            }
            Employee employeeId = assignDetails.getEmployeeId();
            if (employeeId != null) {
                employeeId.getAssignDetailsList().remove(assignDetails);
                employeeId = em.merge(employeeId);
            }
            Estate estateId = assignDetails.getEstateId();
            if (estateId != null) {
                estateId.setAssignDetails(null);
                estateId = em.merge(estateId);
            }
            em.remove(assignDetails);
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

    public List<AssignDetails> findAssignDetailsEntities() {
        return findAssignDetailsEntities(true, -1, -1);
    }

    public List<AssignDetails> findAssignDetailsEntities(int maxResults, int firstResult) {
        return findAssignDetailsEntities(false, maxResults, firstResult);
    }

    private List<AssignDetails> findAssignDetailsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(AssignDetails.class));
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

    public AssignDetails findAssignDetails(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(AssignDetails.class, id);
        } finally {
            em.close();
        }
    }

    public int getAssignDetailsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<AssignDetails> rt = cq.from(AssignDetails.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
