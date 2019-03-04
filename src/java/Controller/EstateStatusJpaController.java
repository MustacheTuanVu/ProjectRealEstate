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
import Entity.EstateStatus;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class EstateStatusJpaController implements Serializable {

    public EstateStatusJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(EstateStatus estateStatus) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (estateStatus.getEstateList() == null) {
            estateStatus.setEstateList(new ArrayList<Estate>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Estate> attachedEstateList = new ArrayList<Estate>();
            for (Estate estateListEstateToAttach : estateStatus.getEstateList()) {
                estateListEstateToAttach = em.getReference(estateListEstateToAttach.getClass(), estateListEstateToAttach.getId());
                attachedEstateList.add(estateListEstateToAttach);
            }
            estateStatus.setEstateList(attachedEstateList);
            em.persist(estateStatus);
            for (Estate estateListEstate : estateStatus.getEstateList()) {
                EstateStatus oldEstateStatusIdOfEstateListEstate = estateListEstate.getEstateStatusId();
                estateListEstate.setEstateStatusId(estateStatus);
                estateListEstate = em.merge(estateListEstate);
                if (oldEstateStatusIdOfEstateListEstate != null) {
                    oldEstateStatusIdOfEstateListEstate.getEstateList().remove(estateListEstate);
                    oldEstateStatusIdOfEstateListEstate = em.merge(oldEstateStatusIdOfEstateListEstate);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findEstateStatus(estateStatus.getId()) != null) {
                throw new PreexistingEntityException("EstateStatus " + estateStatus + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(EstateStatus estateStatus) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            EstateStatus persistentEstateStatus = em.find(EstateStatus.class, estateStatus.getId());
            List<Estate> estateListOld = persistentEstateStatus.getEstateList();
            List<Estate> estateListNew = estateStatus.getEstateList();
            List<String> illegalOrphanMessages = null;
            for (Estate estateListOldEstate : estateListOld) {
                if (!estateListNew.contains(estateListOldEstate)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Estate " + estateListOldEstate + " since its estateStatusId field is not nullable.");
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
            estateStatus.setEstateList(estateListNew);
            estateStatus = em.merge(estateStatus);
            for (Estate estateListNewEstate : estateListNew) {
                if (!estateListOld.contains(estateListNewEstate)) {
                    EstateStatus oldEstateStatusIdOfEstateListNewEstate = estateListNewEstate.getEstateStatusId();
                    estateListNewEstate.setEstateStatusId(estateStatus);
                    estateListNewEstate = em.merge(estateListNewEstate);
                    if (oldEstateStatusIdOfEstateListNewEstate != null && !oldEstateStatusIdOfEstateListNewEstate.equals(estateStatus)) {
                        oldEstateStatusIdOfEstateListNewEstate.getEstateList().remove(estateListNewEstate);
                        oldEstateStatusIdOfEstateListNewEstate = em.merge(oldEstateStatusIdOfEstateListNewEstate);
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
                Integer id = estateStatus.getId();
                if (findEstateStatus(id) == null) {
                    throw new NonexistentEntityException("The estateStatus with id " + id + " no longer exists.");
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
            utx.begin();
            em = getEntityManager();
            EstateStatus estateStatus;
            try {
                estateStatus = em.getReference(EstateStatus.class, id);
                estateStatus.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The estateStatus with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Estate> estateListOrphanCheck = estateStatus.getEstateList();
            for (Estate estateListOrphanCheckEstate : estateListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This EstateStatus (" + estateStatus + ") cannot be destroyed since the Estate " + estateListOrphanCheckEstate + " in its estateList field has a non-nullable estateStatusId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(estateStatus);
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

    public List<EstateStatus> findEstateStatusEntities() {
        return findEstateStatusEntities(true, -1, -1);
    }

    public List<EstateStatus> findEstateStatusEntities(int maxResults, int firstResult) {
        return findEstateStatusEntities(false, maxResults, firstResult);
    }

    private List<EstateStatus> findEstateStatusEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(EstateStatus.class));
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

    public EstateStatus findEstateStatus(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(EstateStatus.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstateStatusCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<EstateStatus> rt = cq.from(EstateStatus.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
