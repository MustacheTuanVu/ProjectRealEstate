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
import Entity.Category;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Post;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class CategoryJpaController implements Serializable {

    public CategoryJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Category category) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (category.getPostList() == null) {
            category.setPostList(new ArrayList<Post>());
        }
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            List<Post> attachedPostList = new ArrayList<Post>();
            for (Post postListPostToAttach : category.getPostList()) {
                postListPostToAttach = em.getReference(postListPostToAttach.getClass(), postListPostToAttach.getPostId());
                attachedPostList.add(postListPostToAttach);
            }
            category.setPostList(attachedPostList);
            em.persist(category);
            for (Post postListPost : category.getPostList()) {
                Category oldPostCategoryOfPostListPost = postListPost.getPostCategory();
                postListPost.setPostCategory(category);
                postListPost = em.merge(postListPost);
                if (oldPostCategoryOfPostListPost != null) {
                    oldPostCategoryOfPostListPost.getPostList().remove(postListPost);
                    oldPostCategoryOfPostListPost = em.merge(oldPostCategoryOfPostListPost);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findCategory(category.getCategoryId()) != null) {
                throw new PreexistingEntityException("Category " + category + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Category category) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            
            em = getEntityManager();
            em.getTransaction().begin();
            Category persistentCategory = em.find(Category.class, category.getCategoryId());
            List<Post> postListOld = persistentCategory.getPostList();
            List<Post> postListNew = category.getPostList();
            List<String> illegalOrphanMessages = null;
            for (Post postListOldPost : postListOld) {
                if (!postListNew.contains(postListOldPost)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Post " + postListOldPost + " since its postCategory field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Post> attachedPostListNew = new ArrayList<Post>();
            for (Post postListNewPostToAttach : postListNew) {
                postListNewPostToAttach = em.getReference(postListNewPostToAttach.getClass(), postListNewPostToAttach.getPostId());
                attachedPostListNew.add(postListNewPostToAttach);
            }
            postListNew = attachedPostListNew;
            category.setPostList(postListNew);
            category = em.merge(category);
            for (Post postListNewPost : postListNew) {
                if (!postListOld.contains(postListNewPost)) {
                    Category oldPostCategoryOfPostListNewPost = postListNewPost.getPostCategory();
                    postListNewPost.setPostCategory(category);
                    postListNewPost = em.merge(postListNewPost);
                    if (oldPostCategoryOfPostListNewPost != null && !oldPostCategoryOfPostListNewPost.equals(category)) {
                        oldPostCategoryOfPostListNewPost.getPostList().remove(postListNewPost);
                        oldPostCategoryOfPostListNewPost = em.merge(oldPostCategoryOfPostListNewPost);
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
                Integer id = category.getCategoryId();
                if (findCategory(id) == null) {
                    throw new NonexistentEntityException("The category with id " + id + " no longer exists.");
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
            Category category;
            try {
                category = em.getReference(Category.class, id);
                category.getCategoryId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The category with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Post> postListOrphanCheck = category.getPostList();
            for (Post postListOrphanCheckPost : postListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Category (" + category + ") cannot be destroyed since the Post " + postListOrphanCheckPost + " in its postList field has a non-nullable postCategory field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(category);
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

    /* cuong add */
       public List<Entity.Category> getCategoryByName(String featureName) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM category where category_name='" + featureName + "'",Category.class);
            List<Category> ret = query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
    public List<Category> findCategoryEntities() {
        return findCategoryEntities(true, -1, -1);
    }

    public List<Category> findCategoryEntities(int maxResults, int firstResult) {
        return findCategoryEntities(false, maxResults, firstResult);
    }

    private List<Category> findCategoryEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Category.class));
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

    public Category findCategory(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Category.class, id);
        } finally {
            em.close();
        }
    }

    public int getCategoryCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Category> rt = cq.from(Category.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    /* cuong add */
      public Integer getPostByCategoryCount(int categoryID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT COUNT(post_id) FROM post WHERE post_category='"+categoryID+"'");

            Integer ret = (Integer) query.getSingleResult();
            return ret;
        } finally {
            em.close();
        }
    }
      /* cuong add */
      public int getEstateTypeByEstateCount(String estateTypeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT count(post_id) as axs FROM post where post_category='" + estateTypeID + "'");
            int ret = (int) query.getSingleResult();
            System.out.println(query);
            System.out.println(ret);
            return ret;
        } finally {
            em.close();
        }
    }
    
}
