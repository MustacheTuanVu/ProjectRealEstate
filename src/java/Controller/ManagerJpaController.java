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
import Entity.Manager;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Users;
import Entity.Project;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class ManagerJpaController implements Serializable {

    public ManagerJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Manager manager) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (manager.getProjectList() == null) {
            manager.setProjectList(new ArrayList<Project>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Users userId = manager.getUserId();
            if (userId != null) {
                userId = em.getReference(userId.getClass(), userId.getId());
                manager.setUserId(userId);
            }
            List<Project> attachedProjectList = new ArrayList<Project>();
            for (Project projectListProjectToAttach : manager.getProjectList()) {
                projectListProjectToAttach = em.getReference(projectListProjectToAttach.getClass(), projectListProjectToAttach.getProjectId());
                attachedProjectList.add(projectListProjectToAttach);
            }
            manager.setProjectList(attachedProjectList);
            em.persist(manager);
            if (userId != null) {
                Manager oldManagerOfUserId = userId.getManager();
                if (oldManagerOfUserId != null) {
                    oldManagerOfUserId.setUserId(null);
                    oldManagerOfUserId = em.merge(oldManagerOfUserId);
                }
                userId.setManager(manager);
                userId = em.merge(userId);
            }
            for (Project projectListProject : manager.getProjectList()) {
                Manager oldManagerIdOfProjectListProject = projectListProject.getManagerId();
                projectListProject.setManagerId(manager);
                projectListProject = em.merge(projectListProject);
                if (oldManagerIdOfProjectListProject != null) {
                    oldManagerIdOfProjectListProject.getProjectList().remove(projectListProject);
                    oldManagerIdOfProjectListProject = em.merge(oldManagerIdOfProjectListProject);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findManager(manager.getManagerId()) != null) {
                throw new PreexistingEntityException("Manager " + manager + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Manager manager) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Manager persistentManager = em.find(Manager.class, manager.getManagerId());
            Users userIdOld = persistentManager.getUserId();
            Users userIdNew = manager.getUserId();
            List<Project> projectListOld = persistentManager.getProjectList();
            List<Project> projectListNew = manager.getProjectList();
            List<String> illegalOrphanMessages = null;
            for (Project projectListOldProject : projectListOld) {
                if (!projectListNew.contains(projectListOldProject)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Project " + projectListOldProject + " since its managerId field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (userIdNew != null) {
                userIdNew = em.getReference(userIdNew.getClass(), userIdNew.getId());
                manager.setUserId(userIdNew);
            }
            List<Project> attachedProjectListNew = new ArrayList<Project>();
            for (Project projectListNewProjectToAttach : projectListNew) {
                projectListNewProjectToAttach = em.getReference(projectListNewProjectToAttach.getClass(), projectListNewProjectToAttach.getProjectId());
                attachedProjectListNew.add(projectListNewProjectToAttach);
            }
            projectListNew = attachedProjectListNew;
            manager.setProjectList(projectListNew);
            manager = em.merge(manager);
            if (userIdOld != null && !userIdOld.equals(userIdNew)) {
                userIdOld.setManager(null);
                userIdOld = em.merge(userIdOld);
            }
            if (userIdNew != null && !userIdNew.equals(userIdOld)) {
                Manager oldManagerOfUserId = userIdNew.getManager();
                if (oldManagerOfUserId != null) {
                    oldManagerOfUserId.setUserId(null);
                    oldManagerOfUserId = em.merge(oldManagerOfUserId);
                }
                userIdNew.setManager(manager);
                userIdNew = em.merge(userIdNew);
            }
            for (Project projectListNewProject : projectListNew) {
                if (!projectListOld.contains(projectListNewProject)) {
                    Manager oldManagerIdOfProjectListNewProject = projectListNewProject.getManagerId();
                    projectListNewProject.setManagerId(manager);
                    projectListNewProject = em.merge(projectListNewProject);
                    if (oldManagerIdOfProjectListNewProject != null && !oldManagerIdOfProjectListNewProject.equals(manager)) {
                        oldManagerIdOfProjectListNewProject.getProjectList().remove(projectListNewProject);
                        oldManagerIdOfProjectListNewProject = em.merge(oldManagerIdOfProjectListNewProject);
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
                Integer id = manager.getManagerId();
                if (findManager(id) == null) {
                    throw new NonexistentEntityException("The manager with id " + id + " no longer exists.");
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
            Manager manager;
            try {
                manager = em.getReference(Manager.class, id);
                manager.getManagerId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The manager with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Project> projectListOrphanCheck = manager.getProjectList();
            for (Project projectListOrphanCheckProject : projectListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Manager (" + manager + ") cannot be destroyed since the Project " + projectListOrphanCheckProject + " in its projectList field has a non-nullable managerId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Users userId = manager.getUserId();
            if (userId != null) {
                userId.setManager(null);
                userId = em.merge(userId);
            }
            em.remove(manager);
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

    public List<Manager> findManagerEntities() {
        return findManagerEntities(true, -1, -1);
    }

    public List<Manager> findManagerEntities(int maxResults, int firstResult) {
        return findManagerEntities(false, maxResults, firstResult);
    }

    private List<Manager> findManagerEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Manager.class));
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

    public Manager findManager(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Manager.class, id);
        } finally {
            em.close();
        }
    }

    public int getManagerCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Manager> rt = cq.from(Manager.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
