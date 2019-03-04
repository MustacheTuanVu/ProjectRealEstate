/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Category;
import Entity.Employee;
import Entity.Post;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class PostJpaController implements Serializable {

    public PostJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Post post) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Category postCategory = post.getPostCategory();
            if (postCategory != null) {
                postCategory = em.getReference(postCategory.getClass(), postCategory.getCategoryId());
                post.setPostCategory(postCategory);
            }
            Employee employee = post.getEmployee();
            if (employee != null) {
                employee = em.getReference(employee.getClass(), employee.getId());
                post.setEmployee(employee);
            }
            em.persist(post);
            if (postCategory != null) {
                postCategory.getPostList().add(post);
                postCategory = em.merge(postCategory);
            }
            if (employee != null) {
                employee.getPostList().add(post);
                employee = em.merge(employee);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findPost(post.getPostId()) != null) {
                throw new PreexistingEntityException("Post " + post + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Post post) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Post persistentPost = em.find(Post.class, post.getPostId());
            Category postCategoryOld = persistentPost.getPostCategory();
            Category postCategoryNew = post.getPostCategory();
            Employee employeeOld = persistentPost.getEmployee();
            Employee employeeNew = post.getEmployee();
            if (postCategoryNew != null) {
                postCategoryNew = em.getReference(postCategoryNew.getClass(), postCategoryNew.getCategoryId());
                post.setPostCategory(postCategoryNew);
            }
            if (employeeNew != null) {
                employeeNew = em.getReference(employeeNew.getClass(), employeeNew.getId());
                post.setEmployee(employeeNew);
            }
            post = em.merge(post);
            if (postCategoryOld != null && !postCategoryOld.equals(postCategoryNew)) {
                postCategoryOld.getPostList().remove(post);
                postCategoryOld = em.merge(postCategoryOld);
            }
            if (postCategoryNew != null && !postCategoryNew.equals(postCategoryOld)) {
                postCategoryNew.getPostList().add(post);
                postCategoryNew = em.merge(postCategoryNew);
            }
            if (employeeOld != null && !employeeOld.equals(employeeNew)) {
                employeeOld.getPostList().remove(post);
                employeeOld = em.merge(employeeOld);
            }
            if (employeeNew != null && !employeeNew.equals(employeeOld)) {
                employeeNew.getPostList().add(post);
                employeeNew = em.merge(employeeNew);
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
                Integer id = post.getPostId();
                if (findPost(id) == null) {
                    throw new NonexistentEntityException("The post with id " + id + " no longer exists.");
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
            Post post;
            try {
                post = em.getReference(Post.class, id);
                post.getPostId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The post with id " + id + " no longer exists.", enfe);
            }
            Category postCategory = post.getPostCategory();
            if (postCategory != null) {
                postCategory.getPostList().remove(post);
                postCategory = em.merge(postCategory);
            }
            Employee employee = post.getEmployee();
            if (employee != null) {
                employee.getPostList().remove(post);
                employee = em.merge(employee);
            }
            em.remove(post);
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

    public List<Post> findPostEntities() {
        return findPostEntities(true, -1, -1);
    }

    public List<Post> findPostEntities(int maxResults, int firstResult) {
        return findPostEntities(false, maxResults, firstResult);
    }

    private List<Post> findPostEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Post.class));
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

    public Post findPost(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Post.class, id);
        } finally {
            em.close();
        }
    }

    public int getPostCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Post> rt = cq.from(Post.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
