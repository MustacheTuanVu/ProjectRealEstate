/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.ReplyComment;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Users;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidatorFactory;

/**
 *
 * @author Cuong
 */
public class ReplyCommentJpaController implements Serializable {

    public ReplyCommentJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ReplyComment replyComment) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            Users idUser = replyComment.getIdUser();
            if (idUser != null) {
                idUser = em.getReference(idUser.getClass(), idUser.getId());
                replyComment.setIdUser(idUser);
            }
            
            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            javax.validation.Validator validator = factory.getValidator();

            Set<ConstraintViolation<ReplyComment>> constraintViolations;
            constraintViolations = validator.validate(replyComment);

            if (constraintViolations.size() > 0) {
                System.out.println("Constraint Violations occurred..");
                for (ConstraintViolation<ReplyComment> estates : constraintViolations) {
                    System.out.println(estates.getRootBeanClass().getSimpleName()
                            + "." + estates.getPropertyPath() + " " + estates.getMessage());
                }
            }
            
            em.persist(replyComment);
            if (idUser != null) {
                idUser.getReplyCommentList().add(replyComment);
                idUser = em.merge(idUser);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findReplyComment(replyComment.getIdReply()) != null) {
                throw new PreexistingEntityException("Reply " + replyComment + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ReplyComment replyComment) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            ReplyComment persistentReplyComment = em.find(ReplyComment.class, replyComment.getIdReply());
            Users idUserOld = persistentReplyComment.getIdUser();
            Users idUserNew = replyComment.getIdUser();
            if (idUserNew != null) {
                idUserNew = em.getReference(idUserNew.getClass(), idUserNew.getId());
                replyComment.setIdUser(idUserNew);
            }
            replyComment = em.merge(replyComment);
            if (idUserOld != null && !idUserOld.equals(idUserNew)) {
                idUserOld.getReplyCommentList().remove(replyComment);
                idUserOld = em.merge(idUserOld);
            }
            if (idUserNew != null && !idUserNew.equals(idUserOld)) {
                idUserNew.getReplyCommentList().add(replyComment);
                idUserNew = em.merge(idUserNew);
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
                Integer id = replyComment.getIdReply();
                if (findReplyComment(id) == null) {
                    throw new NonexistentEntityException("The replyComment with id " + id + " no longer exists.");
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
            ReplyComment replyComment;
            try {
                replyComment = em.getReference(ReplyComment.class, id);
                replyComment.getIdReply();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The replyComment with id " + id + " no longer exists.", enfe);
            }
            Users idUser = replyComment.getIdUser();
            if (idUser != null) {
                idUser.getReplyCommentList().remove(replyComment);
                idUser = em.merge(idUser);
            }
            em.remove(replyComment);
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

    public List<ReplyComment> findReplyCommentEntities() {
        return findReplyCommentEntities(true, -1, -1);
    }

    public List<ReplyComment> findReplyCommentEntities(int maxResults, int firstResult) {
        return findReplyCommentEntities(false, maxResults, firstResult);
    }

    private List<ReplyComment> findReplyCommentEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ReplyComment.class));
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

    public ReplyComment findReplyComment(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ReplyComment.class, id);
        } finally {
            em.close();
        }
    }

    public int getReplyCommentCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ReplyComment> rt = cq.from(ReplyComment.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
 
        // cuong add
    public List<ReplyComment> getReplyComment(int id){
        EntityManager em=getEntityManager();
        Query q=em.createNativeQuery("select * from reply_comment where id_comment ='"+id+"' and status_reply like 'accept'",ReplyComment.class);
        
        return q.getResultList();
    }
    // cuong add
    public ReplyComment countReplyCommentAccept(int idCom){
        EntityManager em=getEntityManager();
        Query q=em.createNativeQuery("select count(id_comment) as id_reply from reply_comment where id_comment="+idCom+" and status_reply like 'accept'",ReplyComment.class);
        
        return (ReplyComment) q.getSingleResult();
    }
    // cuong add
    public ReplyComment countReplyCommentAcceptProject(int idCom){
        EntityManager em=getEntityManager();
        Query q=em.createNativeQuery("select count(id_comment) as id_reply from reply_comment where id_comment="+idCom+" and status_reply like 'accept'",ReplyComment.class);
        
        return (ReplyComment) q.getSingleResult();
    }
    // cuong add
    public List<ReplyComment> getReplyWait(){
        EntityManager em=getEntityManager();
        Query q=em.createNativeQuery("select * from reply_comment where status_reply like 'wait'",ReplyComment.class);
        
        return q.getResultList();
    }
    // cuong add
    public void updateStatusDeleteComentByID(int id) {
        try {
            Entity.ReplyComment reply= new ReplyComment();
            reply =findReplyComment(id);
            reply.setStatusReply("delete");
            edit(reply);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ReplyCommentJpaController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ReplyCommentJpaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    // cuong add
    public void updateStatusAcceptComentByID(int id) {
        try {
            Entity.ReplyComment reply= new ReplyComment();
            reply =findReplyComment(id);
            reply.setStatusReply("accept");
            edit(reply);
        } catch (RollbackFailureException ex) {
            Logger.getLogger(ReplyCommentJpaController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ReplyCommentJpaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
