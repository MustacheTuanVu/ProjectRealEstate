/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.PreexistingEntityException;
import Controller.exceptions.RollbackFailureException;
import Entity.ViewEmployeeAssign;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class ViewEmployeeAssignJpaController implements Serializable {

    public ViewEmployeeAssignJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ViewEmployeeAssign viewEmployeeAssign) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            em.persist(viewEmployeeAssign);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findViewEmployeeAssign(viewEmployeeAssign.getId()) != null) {
                throw new PreexistingEntityException("ViewEmployeeAssign " + viewEmployeeAssign + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ViewEmployeeAssign viewEmployeeAssign) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            viewEmployeeAssign = em.merge(viewEmployeeAssign);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = viewEmployeeAssign.getId();
                if (findViewEmployeeAssign(id) == null) {
                    throw new NonexistentEntityException("The viewEmployeeAssign with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            ViewEmployeeAssign viewEmployeeAssign;
            try {
                viewEmployeeAssign = em.getReference(ViewEmployeeAssign.class, id);
                viewEmployeeAssign.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The viewEmployeeAssign with id " + id + " no longer exists.", enfe);
            }
            em.remove(viewEmployeeAssign);
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

    public List<ViewEmployeeAssign> findViewEmployeeAssignEntities() {
        return findViewEmployeeAssignEntities(true, -1, -1);
    }

    public List<ViewEmployeeAssign> findViewEmployeeAssignEntities(int maxResults, int firstResult) {
        return findViewEmployeeAssignEntities(false, maxResults, firstResult);
    }

    private List<ViewEmployeeAssign> findViewEmployeeAssignEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ViewEmployeeAssign.class));
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

    public ViewEmployeeAssign findViewEmployeeAssign(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ViewEmployeeAssign.class, id);
        } finally {
            em.close();
        }
    }

    public int getViewEmployeeAssignCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ViewEmployeeAssign> rt = cq.from(ViewEmployeeAssign.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
