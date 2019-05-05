/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Users;
import Entity.Project;
import Entity.Rating;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
public class RatingJpaController implements Serializable {

    public RatingJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Rating rating) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Users idUser = rating.getIdUser();
            if (idUser != null) {
                idUser = em.getReference(idUser.getClass(), idUser.getId());
                rating.setIdUser(idUser);
            }
            Project idProject = rating.getIdProject();
            if (idProject != null) {
                idProject = em.getReference(idProject.getClass(), idProject.getProjectId());
                rating.setIdProject(idProject);
            }
            em.persist(rating);
            if (idUser != null) {
                idUser.getRatingList().add(rating);
                idUser = em.merge(idUser);
            }
            if (idProject != null) {
                idProject.getRatingList().add(rating);
                idProject = em.merge(idProject);
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

    public void edit(Rating rating) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Rating persistentRating = em.find(Rating.class, rating.getIdRating());
            Users idUserOld = persistentRating.getIdUser();
            Users idUserNew = rating.getIdUser();
            Project idProjectOld = persistentRating.getIdProject();
            Project idProjectNew = rating.getIdProject();
            if (idUserNew != null) {
                idUserNew = em.getReference(idUserNew.getClass(), idUserNew.getId());
                rating.setIdUser(idUserNew);
            }
            if (idProjectNew != null) {
                idProjectNew = em.getReference(idProjectNew.getClass(), idProjectNew.getProjectId());
                rating.setIdProject(idProjectNew);
            }
            rating = em.merge(rating);
            if (idUserOld != null && !idUserOld.equals(idUserNew)) {
                idUserOld.getRatingList().remove(rating);
                idUserOld = em.merge(idUserOld);
            }
            if (idUserNew != null && !idUserNew.equals(idUserOld)) {
                idUserNew.getRatingList().add(rating);
                idUserNew = em.merge(idUserNew);
            }
            if (idProjectOld != null && !idProjectOld.equals(idProjectNew)) {
                idProjectOld.getRatingList().remove(rating);
                idProjectOld = em.merge(idProjectOld);
            }
            if (idProjectNew != null && !idProjectNew.equals(idProjectOld)) {
                idProjectNew.getRatingList().add(rating);
                idProjectNew = em.merge(idProjectNew);
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
                Integer id = rating.getIdRating();
                if (findRating(id) == null) {
                    throw new NonexistentEntityException("The rating with id " + id + " no longer exists.");
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
           // utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Rating rating;
            try {
                rating = em.getReference(Rating.class, id);
                rating.getIdRating();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The rating with id " + id + " no longer exists.", enfe);
            }
            Users idUser = rating.getIdUser();
            if (idUser != null) {
                idUser.getRatingList().remove(rating);
                idUser = em.merge(idUser);
            }
            Project idProject = rating.getIdProject();
            if (idProject != null) {
                idProject.getRatingList().remove(rating);
                idProject = em.merge(idProject);
            }
            em.remove(rating);
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

    public List<Rating> findRatingEntities() {
        return findRatingEntities(true, -1, -1);
    }

    public List<Rating> findRatingEntities(int maxResults, int firstResult) {
        return findRatingEntities(false, maxResults, firstResult);
    }

    private List<Rating> findRatingEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Rating.class));
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

    public Rating findRating(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Rating.class, id);
        } finally {
            em.close();
        }
    }

    public int getRatingCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Rating> rt = cq.from(Rating.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    // cuong add
    public Double getPointByProject(String id){
        EntityManager em=getEntityManager();
        Query q=em.createNativeQuery("select avg(point_rating) as point from rating where id_project ="+id);
        return (Double) q.getSingleResult();
    }
    // cuong add
    public Integer checkUserRatingByIdUser(int idUser,String idProject){
        EntityManager em=getEntityManager();
        Query q=em.createNativeQuery("select count(id_rating) as point from rating where id_project ="+idProject+" and id_user="+idUser);
        System.out.println("count "+q.getSingleResult());
        return (Integer) q.getSingleResult();
    }
}
