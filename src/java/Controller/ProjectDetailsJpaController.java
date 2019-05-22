/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.IllegalOrphanException;
import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Estate;
import Entity.Project;
import Entity.ProjectDetails;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
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

    public void create(ProjectDetails projectDetails) throws IllegalOrphanException, RollbackFailureException, Exception {
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
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Estate estateId = projectDetails.getEstateId();
            if (estateId != null) {
                estateId = em.getReference(estateId.getClass(), estateId.getId());
                projectDetails.setEstateId(estateId);
            }
            Project prjectId = projectDetails.getPrjectId();
            if (prjectId != null) {
                prjectId = em.getReference(prjectId.getClass(), prjectId.getProjectId());
                projectDetails.setPrjectId(prjectId);
            }
            em.persist(projectDetails);
            if (estateId != null) {
                estateId.setProjectDetails(projectDetails);
                estateId = em.merge(estateId);
            }
            if (prjectId != null) {
                prjectId.getProjectDetailsList().add(projectDetails);
                prjectId = em.merge(prjectId);
            }
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

    public void edit(ProjectDetails projectDetails) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            ProjectDetails persistentProjectDetails = em.find(ProjectDetails.class, projectDetails.getProjectDetailId());
            Estate estateIdOld = persistentProjectDetails.getEstateId();
            Estate estateIdNew = projectDetails.getEstateId();
            Project prjectIdOld = persistentProjectDetails.getPrjectId();
            Project prjectIdNew = projectDetails.getPrjectId();
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
            if (prjectIdNew != null) {
                prjectIdNew = em.getReference(prjectIdNew.getClass(), prjectIdNew.getProjectId());
                projectDetails.setPrjectId(prjectIdNew);
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
            if (prjectIdOld != null && !prjectIdOld.equals(prjectIdNew)) {
                prjectIdOld.getProjectDetailsList().remove(projectDetails);
                prjectIdOld = em.merge(prjectIdOld);
            }
            if (prjectIdNew != null && !prjectIdNew.equals(prjectIdOld)) {
                prjectIdNew.getProjectDetailsList().add(projectDetails);
                prjectIdNew = em.merge(prjectIdNew);
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
            //utx.begin();
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
            Project prjectId = projectDetails.getPrjectId();
            if (prjectId != null) {
                prjectId.getProjectDetailsList().remove(projectDetails);
                prjectId = em.merge(prjectId);
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

      public List<ProjectDetails> getProjectDetailByProject(String projectID) {
        EntityManager em = getEntityManager();
        try {
            //Query query = em.createNativeQuery("SELECT estate_id FROM assign_details where employee_id='" + employeeID + "'", Estate.class);
            Query query = em.createNativeQuery("SELECT project_detail_id FROM project_details where prject_id='" + projectID + "'");
            List<ProjectDetails> ret = (List<ProjectDetails>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
      // cuong add
      public List<Integer> getBlockNumerByProjectId(String projectID) {
        EntityManager em = getEntityManager();
        try {
            //Query query = em.createNativeQuery("SELECT estate_id FROM assign_details where employee_id='" + employeeID + "'", Estate.class);
            Query query = em.createNativeQuery("select distinct block_number as project_detail_id from project_details where prject_id = '"+projectID+"'");
            List<Integer> ret = (List<Integer>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
      // cuong add
      public List<ProjectDetails> getIDEstateByProjectId_Block(String projectID,String block) {
        EntityManager em = getEntityManager();
        try {
            //Query query = em.createNativeQuery("SELECT estate_id FROM assign_details where employee_id='" + employeeID + "'", Estate.class);
            Query query = em.createNativeQuery("select * from project_details where prject_id = '"+projectID+"' and block_number="+block,ProjectDetails.class);
           return (List<ProjectDetails>)query.getResultList();
        } finally {
            em.close();
        }
    }
      
       // cuong add
    public List<ProjectDetails> getListEstateIDByProjectID(String id) {
        EntityManager em = getEntityManager();
        Query q = em.createNativeQuery("select * from project_details\n"
                + "where prject_id="+id,ProjectDetails.class);
        
        return q.getResultList();
    }


    
}