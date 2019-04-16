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
import Entity.Estate;
import Entity.EstateType;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class EstateTypeJpaController implements Serializable {

    public EstateTypeJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(EstateType estateType) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (estateType.getEstateList() == null) {
            estateType.setEstateList(new ArrayList<Estate>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Estate> attachedEstateList = new ArrayList<Estate>();
            for (Estate estateListEstateToAttach : estateType.getEstateList()) {
                estateListEstateToAttach = em.getReference(estateListEstateToAttach.getClass(), estateListEstateToAttach.getId());
                attachedEstateList.add(estateListEstateToAttach);
            }
            estateType.setEstateList(attachedEstateList);
            em.persist(estateType);
            for (Estate estateListEstate : estateType.getEstateList()) {
                EstateType oldEstateTypeIdOfEstateListEstate = estateListEstate.getEstateTypeId();
                estateListEstate.setEstateTypeId(estateType);
                estateListEstate = em.merge(estateListEstate);
                if (oldEstateTypeIdOfEstateListEstate != null) {
                    oldEstateTypeIdOfEstateListEstate.getEstateList().remove(estateListEstate);
                    oldEstateTypeIdOfEstateListEstate = em.merge(oldEstateTypeIdOfEstateListEstate);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findEstateType(estateType.getId()) != null) {
                throw new PreexistingEntityException("EstateType " + estateType + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(EstateType estateType) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            EstateType persistentEstateType = em.find(EstateType.class, estateType.getId());
            List<Estate> estateListOld = persistentEstateType.getEstateList();
            List<Estate> estateListNew = estateType.getEstateList();
            List<String> illegalOrphanMessages = null;
            for (Estate estateListOldEstate : estateListOld) {
                if (!estateListNew.contains(estateListOldEstate)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Estate " + estateListOldEstate + " since its estateTypeId field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Estate> attachedEstateListNew = new ArrayList<Estate>();
            for (Estate estateListNewEstateToAttach : estateListNew) {
                estateListNewEstateToAttach = em.getReference(estateListNewEstateToAttach.getClass(), estateListNewEstateToAttach.getId());
                attachedEstateListNew.add(estateListNewEstateToAttach);
            }
            estateListNew = attachedEstateListNew;
            estateType.setEstateList(estateListNew);
            estateType = em.merge(estateType);
            for (Estate estateListNewEstate : estateListNew) {
                if (!estateListOld.contains(estateListNewEstate)) {
                    EstateType oldEstateTypeIdOfEstateListNewEstate = estateListNewEstate.getEstateTypeId();
                    estateListNewEstate.setEstateTypeId(estateType);
                    estateListNewEstate = em.merge(estateListNewEstate);
                    if (oldEstateTypeIdOfEstateListNewEstate != null && !oldEstateTypeIdOfEstateListNewEstate.equals(estateType)) {
                        oldEstateTypeIdOfEstateListNewEstate.getEstateList().remove(estateListNewEstate);
                        oldEstateTypeIdOfEstateListNewEstate = em.merge(oldEstateTypeIdOfEstateListNewEstate);
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
                String id = estateType.getId();
                if (findEstateType(id) == null) {
                    throw new NonexistentEntityException("The estateType with id " + id + " no longer exists.");
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
            em = getEntityManager();
            em.getTransaction().begin();
            EstateType estateType;
            try {
                estateType = em.getReference(EstateType.class, id);
                estateType.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The estateType with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Estate> estateListOrphanCheck = estateType.getEstateList();
            for (Estate estateListOrphanCheckEstate : estateListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This EstateType (" + estateType + ") cannot be destroyed since the Estate " + estateListOrphanCheckEstate + " in its estateList field has a non-nullable estateTypeId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(estateType);
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

    public List<EstateType> findEstateTypeEntities() {
        return findEstateTypeEntities(true, -1, -1);
    }

    public List<EstateType> findEstateTypeEntities(int maxResults, int firstResult) {
        return findEstateTypeEntities(false, maxResults, firstResult);
    }

    private List<EstateType> findEstateTypeEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(EstateType.class));
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

    public EstateType findEstateType(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(EstateType.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstateTypeCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<EstateType> rt = cq.from(EstateType.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public List<EstateType> getEstateTypeByName(String estateTypeName) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM estate_type where type_name='" + estateTypeName + "'", EstateType.class);
            List<EstateType> ret = query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }

    public int getEstateTypeByEstateCount(String estateTypeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT count(id) as axs FROM estate where estate_type_id='" + estateTypeID + "'");
            int ret = (int) query.getSingleResult();
            System.out.println(query);
            System.out.println(ret);
            return ret;
        } finally {
            em.close();
        }
    }
    
    public int getEstateTypeByEstateCountStaticPublic(String estateTypeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT count(id) as axs FROM estate where "
                    + "estate_type_id='" + estateTypeID + "' AND "
                    + "estate_status='publish'");
            int ret = (int) query.getSingleResult();
            System.out.println(query);
            System.out.println(ret);
            return ret;
        } finally {
            em.close();
        }
    }
    
    public int getEstateTypeByEstateCountStaticSold(String estateTypeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT count(id) as axs FROM estate where "
                    + "estate_type_id='" + estateTypeID + "' AND "
                    + "estate_status='sold'");
            int ret = (int) query.getSingleResult();
            System.out.println(query);
            System.out.println(ret);
            return ret;
        } finally {
            em.close();
        }
    }
}
