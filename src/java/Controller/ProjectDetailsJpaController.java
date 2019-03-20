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
import Entity.Estate;
import Entity.ProjectDetails;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class ProjectDetailsJpaController implements Serializable {

    public ProjectDetailsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ProjectDetails projectDetails) throws IllegalOrphanException, PreexistingEntityException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        Estate estateIdOrphanCheck = projectDetails.getEstateId();
        if (estateIdOrphanCheck != null) {
            ProjectDetails oldProjectDetailsOfEstateId = estateIdOrphanCheck.getProjectDetails();
            if (oldProjectDetailsOfEstateId != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Estate " + estateIdOrphanCheck + " already has an item of type ProjectDetails whose estateId column cannot be null. Please make another selection for the estateId field.");
            }
        }
        if (illegalOrphanMessages != null) {
            throw new IllegalOrphanException(illegalOrphanMessages);
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Estate estateId = projectDetails.getEstateId();
            if (estateId != null) {
                estateId = em.getReference(estateId.getClass(), estateId.getId());
                projectDetails.setEstateId(estateId);
            }
            em.persist(projectDetails);
            if (estateId != null) {
                estateId.setProjectDetails(projectDetails);
                estateId = em.merge(estateId);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProjectDetails(projectDetails.getProjectDetailId()) != null) {
                throw new PreexistingEntityException("ProjectDetails " + projectDetails + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ProjectDetails projectDetails) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            ProjectDetails persistentProjectDetails = em.find(ProjectDetails.class, projectDetails.getProjectDetailId());
            Estate estateIdOld = persistentProjectDetails.getEstateId();
            Estate estateIdNew = projectDetails.getEstateId();
            List<String> illegalOrphanMessages = null;
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                ProjectDetails oldProjectDetailsOfEstateId = estateIdNew.getProjectDetails();
                if (oldProjectDetailsOfEstateId != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Estate " + estateIdNew + " already has an item of type ProjectDetails whose estateId column cannot be null. Please make another selection for the estateId field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (estateIdNew != null) {
                estateIdNew = em.getReference(estateIdNew.getClass(), estateIdNew.getId());
                projectDetails.setEstateId(estateIdNew);
            }
            projectDetails = em.merge(projectDetails);
            if (estateIdOld != null && !estateIdOld.equals(estateIdNew)) {
                estateIdOld.setProjectDetails(null);
                estateIdOld = em.merge(estateIdOld);
            }
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                estateIdNew.setProjectDetails(projectDetails);
                estateIdNew = em.merge(estateIdNew);
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
                Integer id = projectDetails.getProjectDetailId();
                if (findProjectDetails(id) == null) {
                    throw new NonexistentEntityException("The projectDetails with id " + id + " no longer exists.");
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
            ProjectDetails projectDetails;
            try {
                projectDetails = em.getReference(ProjectDetails.class, id);
                projectDetails.getProjectDetailId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The projectDetails with id " + id + " no longer exists.", enfe);
            }
            Estate estateId = projectDetails.getEstateId();
            if (estateId != null) {
                estateId.setProjectDetails(null);
                estateId = em.merge(estateId);
            }
            em.remove(projectDetails);
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

    public List<ProjectDetails> findProjectDetailsEntities() {
        return findProjectDetailsEntities(true, -1, -1);
    }

    public List<ProjectDetails> findProjectDetailsEntities(int maxResults, int firstResult) {
        return findProjectDetailsEntities(false, maxResults, firstResult);
    }

    private List<ProjectDetails> findProjectDetailsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ProjectDetails.class));
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

    public ProjectDetails findProjectDetails(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ProjectDetails.class, id);
        } finally {
            em.close();
        }
    }

    public int getProjectDetailsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ProjectDetails> rt = cq.from(ProjectDetails.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
