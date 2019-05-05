/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.LoveProject;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Users;
import Entity.Project;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
public class LoveProjectJpaController implements Serializable {

    public LoveProjectJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(LoveProject loveProject) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Users idUser = loveProject.getIdUser();
            if (idUser != null) {
                idUser = em.getReference(idUser.getClass(), idUser.getId());
                loveProject.setIdUser(idUser);
            }
            Project idProject = loveProject.getIdProject();
            if (idProject != null) {
                idProject = em.getReference(idProject.getClass(), idProject.getProjectId());
                loveProject.setIdProject(idProject);
            }
            em.persist(loveProject);
            if (idUser != null) {
                idUser.getLoveProjectList().add(loveProject);
                idUser = em.merge(idUser);
            }
            if (idProject != null) {
                idProject.getLoveProjectList().add(loveProject);
                idProject = em.merge(idProject);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findLoveProject(loveProject.getId()) != null) {
                throw new PreexistingEntityException("LoveProject " + loveProject + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(LoveProject loveProject) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            LoveProject persistentLoveProject = em.find(LoveProject.class, loveProject.getId());
            Users idUserOld = persistentLoveProject.getIdUser();
            Users idUserNew = loveProject.getIdUser();
            Project idProjectOld = persistentLoveProject.getIdProject();
            Project idProjectNew = loveProject.getIdProject();
            if (idUserNew != null) {
                idUserNew = em.getReference(idUserNew.getClass(), idUserNew.getId());
                loveProject.setIdUser(idUserNew);
            }
            if (idProjectNew != null) {
                idProjectNew = em.getReference(idProjectNew.getClass(), idProjectNew.getProjectId());
                loveProject.setIdProject(idProjectNew);
            }
            loveProject = em.merge(loveProject);
            if (idUserOld != null && !idUserOld.equals(idUserNew)) {
                idUserOld.getLoveProjectList().remove(loveProject);
                idUserOld = em.merge(idUserOld);
            }
            if (idUserNew != null && !idUserNew.equals(idUserOld)) {
                idUserNew.getLoveProjectList().add(loveProject);
                idUserNew = em.merge(idUserNew);
            }
            if (idProjectOld != null && !idProjectOld.equals(idProjectNew)) {
                idProjectOld.getLoveProjectList().remove(loveProject);
                idProjectOld = em.merge(idProjectOld);
            }
            if (idProjectNew != null && !idProjectNew.equals(idProjectOld)) {
                idProjectNew.getLoveProjectList().add(loveProject);
                idProjectNew = em.merge(idProjectNew);
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
                Integer id = loveProject.getId();
                if (findLoveProject(id) == null) {
                    throw new NonexistentEntityException("The loveProject with id " + id + " no longer exists.");
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
            LoveProject loveProject;
            try {
                loveProject = em.getReference(LoveProject.class, id);
                loveProject.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The loveProject with id " + id + " no longer exists.", enfe);
            }
            Users idUser = loveProject.getIdUser();
            if (idUser != null) {
                idUser.getLoveProjectList().remove(loveProject);
                idUser = em.merge(idUser);
            }
            Project idProject = loveProject.getIdProject();
            if (idProject != null) {
                idProject.getLoveProjectList().remove(loveProject);
                idProject = em.merge(idProject);
            }
            em.remove(loveProject);
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

    public List<LoveProject> findLoveProjectEntities() {
        return findLoveProjectEntities(true, -1, -1);
    }

    public List<LoveProject> findLoveProjectEntities(int maxResults, int firstResult) {
        return findLoveProjectEntities(false, maxResults, firstResult);
    }

    private List<LoveProject> findLoveProjectEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(LoveProject.class));
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

    public LoveProject findLoveProject(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(LoveProject.class, id);
        } finally {
            em.close();
        }
    }

    public int getLoveProjectCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<LoveProject> rt = cq.from(LoveProject.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    // cuong add
    public List<LoveProject> getListByIdUser(int idUser){
        EntityManager em=getEntityManager();
        Query q=em.createNativeQuery("select * from love_project where id_user ="+idUser,LoveProject.class);
                
        return q.getResultList();
    }
}
