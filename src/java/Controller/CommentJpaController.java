/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.Comment;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Users;
import Entity.Post;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
public class CommentJpaController implements Serializable {

    public CommentJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Comment comment) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Users idUser = comment.getIdUser();
            if (idUser != null) {
                idUser = em.getReference(idUser.getClass(), idUser.getId());
                comment.setIdUser(idUser);
            }
            Post idPost = comment.getIdPost();
            if (idPost != null) {
                idPost = em.getReference(idPost.getClass(), idPost.getPostId());
                comment.setIdPost(idPost);
            }
            em.persist(comment);
            if (idUser != null) {
                idUser.getCommentList().add(comment);
                idUser = em.merge(idUser);
            }
            if (idPost != null) {
                idPost.getCommentList().add(comment);
                idPost = em.merge(idPost);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findComment(comment.getIdComment()) != null) {
                throw new PreexistingEntityException("Comment " + comment + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Comment comment) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
           // utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Comment persistentComment = em.find(Comment.class, comment.getIdComment());
            Users idUserOld = persistentComment.getIdUser();
            Users idUserNew = comment.getIdUser();
            Post idPostOld = persistentComment.getIdPost();
            Post idPostNew = comment.getIdPost();
            if (idUserNew != null) {
                idUserNew = em.getReference(idUserNew.getClass(), idUserNew.getId());
                comment.setIdUser(idUserNew);
            }
            if (idPostNew != null) {
                idPostNew = em.getReference(idPostNew.getClass(), idPostNew.getPostId());
                comment.setIdPost(idPostNew);
            }
            comment = em.merge(comment);
            if (idUserOld != null && !idUserOld.equals(idUserNew)) {
                idUserOld.getCommentList().remove(comment);
                idUserOld = em.merge(idUserOld);
            }
            if (idUserNew != null && !idUserNew.equals(idUserOld)) {
                idUserNew.getCommentList().add(comment);
                idUserNew = em.merge(idUserNew);
            }
            if (idPostOld != null && !idPostOld.equals(idPostNew)) {
                idPostOld.getCommentList().remove(comment);
                idPostOld = em.merge(idPostOld);
            }
            if (idPostNew != null && !idPostNew.equals(idPostOld)) {
                idPostNew.getCommentList().add(comment);
                idPostNew = em.merge(idPostNew);
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
                Integer id = comment.getIdComment();
                if (findComment(id) == null) {
                    throw new NonexistentEntityException("The comment with id " + id + " no longer exists.");
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
            Comment comment;
            try {
                comment = em.getReference(Comment.class, id);
                comment.getIdComment();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The comment with id " + id + " no longer exists.", enfe);
            }
            Users idUser = comment.getIdUser();
            if (idUser != null) {
                idUser.getCommentList().remove(comment);
                idUser = em.merge(idUser);
            }
            Post idPost = comment.getIdPost();
            if (idPost != null) {
                idPost.getCommentList().remove(comment);
                idPost = em.merge(idPost);
            }
            em.remove(comment);
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

    public List<Comment> findCommentEntities() {
        return findCommentEntities(true, -1, -1);
    }

    public List<Comment> findCommentEntities(int maxResults, int firstResult) {
        return findCommentEntities(false, maxResults, firstResult);
    }

    private List<Comment> findCommentEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Comment.class));
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

    public Comment findComment(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Comment.class, id);
        } finally {
            em.close();
        }
    }

    public int getCommentCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Comment> rt = cq.from(Comment.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    // cuong add
    public List<Comment> getCommentByIdPost(Post id) {
        EntityManager em = getEntityManager();
        Query q = em.createNativeQuery("select * from comment where id_post ='"
                + id.getPostId()
                + "' and status_comment like 'accept'", Comment.class);
        return q.getResultList();
    }

    // cuong add

    public Comment countCommentAccept(int idCom) {
        EntityManager em = getEntityManager();
        
        Query q = em.createNativeQuery("select count(id_post) as id_comment from comment where id_post=" + idCom + " and status_comment like 'accept'", Comment.class);
        return (Comment) q.getSingleResult();
    }
    // cuong add
    public List<Comment> getCommentWait() {
        EntityManager em = getEntityManager();
        
        Query q = em.createNativeQuery("select * from comment where status_comment like 'wait'", Comment.class);
        return q.getResultList();
    }
}
