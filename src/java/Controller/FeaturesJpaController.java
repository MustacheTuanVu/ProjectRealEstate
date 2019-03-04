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
import Entity.FeatureDetails;
import Entity.Features;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class FeaturesJpaController implements Serializable {

    public FeaturesJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Features features) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (features.getFeatureDetailsList() == null) {
            features.setFeatureDetailsList(new ArrayList<FeatureDetails>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<FeatureDetails> attachedFeatureDetailsList = new ArrayList<FeatureDetails>();
            for (FeatureDetails featureDetailsListFeatureDetailsToAttach : features.getFeatureDetailsList()) {
                featureDetailsListFeatureDetailsToAttach = em.getReference(featureDetailsListFeatureDetailsToAttach.getClass(), featureDetailsListFeatureDetailsToAttach.getFeatureDetailsId());
                attachedFeatureDetailsList.add(featureDetailsListFeatureDetailsToAttach);
            }
            features.setFeatureDetailsList(attachedFeatureDetailsList);
            em.persist(features);
            for (FeatureDetails featureDetailsListFeatureDetails : features.getFeatureDetailsList()) {
                Features oldFeatureIdOfFeatureDetailsListFeatureDetails = featureDetailsListFeatureDetails.getFeatureId();
                featureDetailsListFeatureDetails.setFeatureId(features);
                featureDetailsListFeatureDetails = em.merge(featureDetailsListFeatureDetails);
                if (oldFeatureIdOfFeatureDetailsListFeatureDetails != null) {
                    oldFeatureIdOfFeatureDetailsListFeatureDetails.getFeatureDetailsList().remove(featureDetailsListFeatureDetails);
                    oldFeatureIdOfFeatureDetailsListFeatureDetails = em.merge(oldFeatureIdOfFeatureDetailsListFeatureDetails);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findFeatures(features.getFeaturesId()) != null) {
                throw new PreexistingEntityException("Features " + features + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Features features) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Features persistentFeatures = em.find(Features.class, features.getFeaturesId());
            List<FeatureDetails> featureDetailsListOld = persistentFeatures.getFeatureDetailsList();
            List<FeatureDetails> featureDetailsListNew = features.getFeatureDetailsList();
            List<String> illegalOrphanMessages = null;
            for (FeatureDetails featureDetailsListOldFeatureDetails : featureDetailsListOld) {
                if (!featureDetailsListNew.contains(featureDetailsListOldFeatureDetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain FeatureDetails " + featureDetailsListOldFeatureDetails + " since its featureId field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<FeatureDetails> attachedFeatureDetailsListNew = new ArrayList<FeatureDetails>();
            for (FeatureDetails featureDetailsListNewFeatureDetailsToAttach : featureDetailsListNew) {
                featureDetailsListNewFeatureDetailsToAttach = em.getReference(featureDetailsListNewFeatureDetailsToAttach.getClass(), featureDetailsListNewFeatureDetailsToAttach.getFeatureDetailsId());
                attachedFeatureDetailsListNew.add(featureDetailsListNewFeatureDetailsToAttach);
            }
            featureDetailsListNew = attachedFeatureDetailsListNew;
            features.setFeatureDetailsList(featureDetailsListNew);
            features = em.merge(features);
            for (FeatureDetails featureDetailsListNewFeatureDetails : featureDetailsListNew) {
                if (!featureDetailsListOld.contains(featureDetailsListNewFeatureDetails)) {
                    Features oldFeatureIdOfFeatureDetailsListNewFeatureDetails = featureDetailsListNewFeatureDetails.getFeatureId();
                    featureDetailsListNewFeatureDetails.setFeatureId(features);
                    featureDetailsListNewFeatureDetails = em.merge(featureDetailsListNewFeatureDetails);
                    if (oldFeatureIdOfFeatureDetailsListNewFeatureDetails != null && !oldFeatureIdOfFeatureDetailsListNewFeatureDetails.equals(features)) {
                        oldFeatureIdOfFeatureDetailsListNewFeatureDetails.getFeatureDetailsList().remove(featureDetailsListNewFeatureDetails);
                        oldFeatureIdOfFeatureDetailsListNewFeatureDetails = em.merge(oldFeatureIdOfFeatureDetailsListNewFeatureDetails);
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
                String id = features.getFeaturesId();
                if (findFeatures(id) == null) {
                    throw new NonexistentEntityException("The features with id " + id + " no longer exists.");
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
            Features features;
            try {
                features = em.getReference(Features.class, id);
                features.getFeaturesId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The features with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<FeatureDetails> featureDetailsListOrphanCheck = features.getFeatureDetailsList();
            for (FeatureDetails featureDetailsListOrphanCheckFeatureDetails : featureDetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Features (" + features + ") cannot be destroyed since the FeatureDetails " + featureDetailsListOrphanCheckFeatureDetails + " in its featureDetailsList field has a non-nullable featureId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(features);
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

    public List<Features> findFeaturesEntities() {
        return findFeaturesEntities(true, -1, -1);
    }

    public List<Features> findFeaturesEntities(int maxResults, int firstResult) {
        return findFeaturesEntities(false, maxResults, firstResult);
    }

    private List<Features> findFeaturesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Features.class));
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

    public Features findFeatures(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Features.class, id);
        } finally {
            em.close();
        }
    }

    public int getFeaturesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Features> rt = cq.from(Features.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    public List<Features> getFeatureByName(String featureName) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM features where feature_name='" + featureName + "'",Features.class);
            List<Features> ret = query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
    
}
