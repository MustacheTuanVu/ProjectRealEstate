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
import Entity.Manager;
import Entity.Project;
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
public class ProjectJpaController implements Serializable {

    public ProjectJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Project project) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (project.getProjectDetailsList() == null) {
            project.setProjectDetailsList(new ArrayList<ProjectDetails>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Manager managerId = project.getManagerId();
            if (managerId != null) {
                managerId = em.getReference(managerId.getClass(), managerId.getManagerId());
                project.setManagerId(managerId);
            }
            List<ProjectDetails> attachedProjectDetailsList = new ArrayList<ProjectDetails>();
            for (ProjectDetails projectDetailsListProjectDetailsToAttach : project.getProjectDetailsList()) {
                projectDetailsListProjectDetailsToAttach = em.getReference(projectDetailsListProjectDetailsToAttach.getClass(), projectDetailsListProjectDetailsToAttach.getProjectDetailId());
                attachedProjectDetailsList.add(projectDetailsListProjectDetailsToAttach);
            }
            project.setProjectDetailsList(attachedProjectDetailsList);
            em.persist(project);
            if (managerId != null) {
                managerId.getProjectList().add(project);
                managerId = em.merge(managerId);
            }
            for (ProjectDetails projectDetailsListProjectDetails : project.getProjectDetailsList()) {
                Project oldPrjectIdOfProjectDetailsListProjectDetails = projectDetailsListProjectDetails.getPrjectId();
                projectDetailsListProjectDetails.setPrjectId(project);
                projectDetailsListProjectDetails = em.merge(projectDetailsListProjectDetails);
                if (oldPrjectIdOfProjectDetailsListProjectDetails != null) {
                    oldPrjectIdOfProjectDetailsListProjectDetails.getProjectDetailsList().remove(projectDetailsListProjectDetails);
                    oldPrjectIdOfProjectDetailsListProjectDetails = em.merge(oldPrjectIdOfProjectDetailsListProjectDetails);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProject(project.getProjectId()) != null) {
                throw new PreexistingEntityException("Project " + project + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Project project) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Project persistentProject = em.find(Project.class, project.getProjectId());
            Manager managerIdOld = persistentProject.getManagerId();
            Manager managerIdNew = project.getManagerId();
            List<ProjectDetails> projectDetailsListOld = persistentProject.getProjectDetailsList();
            List<ProjectDetails> projectDetailsListNew = project.getProjectDetailsList();
            List<String> illegalOrphanMessages = null;
            for (ProjectDetails projectDetailsListOldProjectDetails : projectDetailsListOld) {
                if (!projectDetailsListNew.contains(projectDetailsListOldProjectDetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain ProjectDetails " + projectDetailsListOldProjectDetails + " since its prjectId field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (managerIdNew != null) {
                managerIdNew = em.getReference(managerIdNew.getClass(), managerIdNew.getManagerId());
                project.setManagerId(managerIdNew);
            }
            List<ProjectDetails> attachedProjectDetailsListNew = new ArrayList<ProjectDetails>();
            for (ProjectDetails projectDetailsListNewProjectDetailsToAttach : projectDetailsListNew) {
                projectDetailsListNewProjectDetailsToAttach = em.getReference(projectDetailsListNewProjectDetailsToAttach.getClass(), projectDetailsListNewProjectDetailsToAttach.getProjectDetailId());
                attachedProjectDetailsListNew.add(projectDetailsListNewProjectDetailsToAttach);
            }
            projectDetailsListNew = attachedProjectDetailsListNew;
            project.setProjectDetailsList(projectDetailsListNew);
            project = em.merge(project);
            if (managerIdOld != null && !managerIdOld.equals(managerIdNew)) {
                managerIdOld.getProjectList().remove(project);
                managerIdOld = em.merge(managerIdOld);
            }
            if (managerIdNew != null && !managerIdNew.equals(managerIdOld)) {
                managerIdNew.getProjectList().add(project);
                managerIdNew = em.merge(managerIdNew);
            }
            for (ProjectDetails projectDetailsListNewProjectDetails : projectDetailsListNew) {
                if (!projectDetailsListOld.contains(projectDetailsListNewProjectDetails)) {
                    Project oldPrjectIdOfProjectDetailsListNewProjectDetails = projectDetailsListNewProjectDetails.getPrjectId();
                    projectDetailsListNewProjectDetails.setPrjectId(project);
                    projectDetailsListNewProjectDetails = em.merge(projectDetailsListNewProjectDetails);
                    if (oldPrjectIdOfProjectDetailsListNewProjectDetails != null && !oldPrjectIdOfProjectDetailsListNewProjectDetails.equals(project)) {
                        oldPrjectIdOfProjectDetailsListNewProjectDetails.getProjectDetailsList().remove(projectDetailsListNewProjectDetails);
                        oldPrjectIdOfProjectDetailsListNewProjectDetails = em.merge(oldPrjectIdOfProjectDetailsListNewProjectDetails);
                    }
                }
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
                String id = project.getProjectId();
                if (findProject(id) == null) {
                    throw new NonexistentEntityException("The project with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Project project;
            try {
                project = em.getReference(Project.class, id);
                project.getProjectId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The project with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<ProjectDetails> projectDetailsListOrphanCheck = project.getProjectDetailsList();
            for (ProjectDetails projectDetailsListOrphanCheckProjectDetails : projectDetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Project (" + project + ") cannot be destroyed since the ProjectDetails " + projectDetailsListOrphanCheckProjectDetails + " in its projectDetailsList field has a non-nullable prjectId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Manager managerId = project.getManagerId();
            if (managerId != null) {
                managerId.getProjectList().remove(project);
                managerId = em.merge(managerId);
            }
            em.remove(project);
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

    public List<Project> findProjectEntities() {
        return findProjectEntities(true, -1, -1);
    }

    public List<Project> findProjectEntities(int maxResults, int firstResult) {
        return findProjectEntities(false, maxResults, firstResult);
    }

    private List<Project> findProjectEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Project.class));
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

    public Project findProject(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Project.class, id);
        } finally {
            em.close();
        }
    }

    public int getProjectCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Project> rt = cq.from(Project.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
