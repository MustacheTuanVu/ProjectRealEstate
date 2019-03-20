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
import Entity.Estate;
import Entity.FeatureDetails;
import Entity.Features;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class FeatureDetailsJpaController implements Serializable {

    public FeatureDetailsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(FeatureDetails featureDetails) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Estate estateId = featureDetails.getEstateId();
            if (estateId != null) {
                estateId = em.getReference(estateId.getClass(), estateId.getId());
                featureDetails.setEstateId(estateId);
            }
            Features featureId = featureDetails.getFeatureId();
            if (featureId != null) {
                featureId = em.getReference(featureId.getClass(), featureId.getFeaturesId());
                featureDetails.setFeatureId(featureId);
            }
            em.persist(featureDetails);
            if (estateId != null) {
                estateId.getFeatureDetailsList().add(featureDetails);
                estateId = em.merge(estateId);
            }
            if (featureId != null) {
                featureId.getFeatureDetailsList().add(featureDetails);
                featureId = em.merge(featureId);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findFeatureDetails(featureDetails.getFeatureDetailsId()) != null) {
                throw new PreexistingEntityException("FeatureDetails " + featureDetails + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(FeatureDetails featureDetails) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            FeatureDetails persistentFeatureDetails = em.find(FeatureDetails.class, featureDetails.getFeatureDetailsId());
            Estate estateIdOld = persistentFeatureDetails.getEstateId();
            Estate estateIdNew = featureDetails.getEstateId();
            Features featureIdOld = persistentFeatureDetails.getFeatureId();
            Features featureIdNew = featureDetails.getFeatureId();
            if (estateIdNew != null) {
                estateIdNew = em.getReference(estateIdNew.getClass(), estateIdNew.getId());
                featureDetails.setEstateId(estateIdNew);
            }
            if (featureIdNew != null) {
                featureIdNew = em.getReference(featureIdNew.getClass(), featureIdNew.getFeaturesId());
                featureDetails.setFeatureId(featureIdNew);
            }
            featureDetails = em.merge(featureDetails);
            if (estateIdOld != null && !estateIdOld.equals(estateIdNew)) {
                estateIdOld.getFeatureDetailsList().remove(featureDetails);
                estateIdOld = em.merge(estateIdOld);
            }
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                estateIdNew.getFeatureDetailsList().add(featureDetails);
                estateIdNew = em.merge(estateIdNew);
            }
            if (featureIdOld != null && !featureIdOld.equals(featureIdNew)) {
                featureIdOld.getFeatureDetailsList().remove(featureDetails);
                featureIdOld = em.merge(featureIdOld);
            }
            if (featureIdNew != null && !featureIdNew.equals(featureIdOld)) {
                featureIdNew.getFeatureDetailsList().add(featureDetails);
                featureIdNew = em.merge(featureIdNew);
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
                Integer id = featureDetails.getFeatureDetailsId();
                if (findFeatureDetails(id) == null) {
                    throw new NonexistentEntityException("The featureDetails with id " + id + " no longer exists.");
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
            em = getEntityManager();
            em.getTransaction().begin();
            FeatureDetails featureDetails;
            try {
                featureDetails = em.getReference(FeatureDetails.class, id);
                featureDetails.getFeatureDetailsId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The featureDetails with id " + id + " no longer exists.", enfe);
            }
            Estate estateId = featureDetails.getEstateId();
            if (estateId != null) {
                estateId.getFeatureDetailsList().remove(featureDetails);
                estateId = em.merge(estateId);
            }
            Features featureId = featureDetails.getFeatureId();
            if (featureId != null) {
                featureId.getFeatureDetailsList().remove(featureDetails);
                featureId = em.merge(featureId);
            }
            em.remove(featureDetails);
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

    public List<FeatureDetails> findFeatureDetailsEntities() {
        return findFeatureDetailsEntities(true, -1, -1);
    }

    public List<FeatureDetails> findFeatureDetailsEntities(int maxResults, int firstResult) {
        return findFeatureDetailsEntities(false, maxResults, firstResult);
    }

    private List<FeatureDetails> findFeatureDetailsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(FeatureDetails.class));
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

    public FeatureDetails findFeatureDetails(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(FeatureDetails.class, id);
        } finally {
            em.close();
        }
    }

    public int getFeatureDetailsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<FeatureDetails> rt = cq.from(FeatureDetails.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    public List<String> findFeatureDetailsByEstate(String estateID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT feature_id FROM feature_details where estate_id='" + estateID + "'");
            List<String> ret = (List<String>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
    
    public List<Integer> findEstatesByFeature(String estateID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT feature_details_id FROM feature_details where estate_id='" + estateID + "'");
            List<Integer> ret = (List<Integer>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
}
