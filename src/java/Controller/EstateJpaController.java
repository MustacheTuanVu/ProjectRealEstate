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
import Entity.EstateStatus;
import Entity.EstateType;
import Entity.AssignDetails;
import Entity.ProjectDetails;
import Entity.ContractDetails;
import Entity.Estate;
import Entity.FeatureDetails;
import java.util.ArrayList;
import java.util.List;
import Entity.Schedule;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class EstateJpaController implements Serializable {

    public EstateJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    // function count number Estate indata base

    public void create(Estate estate) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (estate.getFeatureDetailsList() == null) {
            estate.setFeatureDetailsList(new ArrayList<FeatureDetails>());
        }
        if (estate.getScheduleList() == null) {
            estate.setScheduleList(new ArrayList<Schedule>());
        }
        EntityManager em = null;
        try {
            //utx.begin();
            em = getEntityManager();
            em.getTransaction().begin();
            EstateStatus estateStatusId = estate.getEstateStatusId();
            if (estateStatusId != null) {
                estateStatusId = em.getReference(estateStatusId.getClass(), estateStatusId.getId());
                estate.setEstateStatusId(estateStatusId);
            }
            EstateType estateTypeId = estate.getEstateTypeId();
            if (estateTypeId != null) {
                estateTypeId = em.getReference(estateTypeId.getClass(), estateTypeId.getId());
                estate.setEstateTypeId(estateTypeId);
            }
            AssignDetails assignDetails = estate.getAssignDetails();
            if (assignDetails != null) {
                assignDetails = em.getReference(assignDetails.getClass(), assignDetails.getId());
                estate.setAssignDetails(assignDetails);
            }
            ProjectDetails projectDetails = estate.getProjectDetails();
            if (projectDetails != null) {
                projectDetails = em.getReference(projectDetails.getClass(), projectDetails.getProjectDetailId());
                estate.setProjectDetails(projectDetails);
            }
            ContractDetails contractDetails = estate.getContractDetails();
            if (contractDetails != null) {
                contractDetails = em.getReference(contractDetails.getClass(), contractDetails.getId());
                estate.setContractDetails(contractDetails);
            }
            List<FeatureDetails> attachedFeatureDetailsList = new ArrayList<FeatureDetails>();
            for (FeatureDetails featureDetailsListFeatureDetailsToAttach : estate.getFeatureDetailsList()) {
                featureDetailsListFeatureDetailsToAttach = em.getReference(featureDetailsListFeatureDetailsToAttach.getClass(), featureDetailsListFeatureDetailsToAttach.getFeatureDetailsId());
                attachedFeatureDetailsList.add(featureDetailsListFeatureDetailsToAttach);
            }
            estate.setFeatureDetailsList(attachedFeatureDetailsList);
            List<Schedule> attachedScheduleList = new ArrayList<Schedule>();
            for (Schedule scheduleListScheduleToAttach : estate.getScheduleList()) {
                scheduleListScheduleToAttach = em.getReference(scheduleListScheduleToAttach.getClass(), scheduleListScheduleToAttach.getId());
                attachedScheduleList.add(scheduleListScheduleToAttach);
            }
            estate.setScheduleList(attachedScheduleList);
            em.persist(estate);
            if (estateStatusId != null) {
                estateStatusId.getEstateList().add(estate);
                estateStatusId = em.merge(estateStatusId);
            }
            if (estateTypeId != null) {
                estateTypeId.getEstateList().add(estate);
                estateTypeId = em.merge(estateTypeId);
            }
            if (assignDetails != null) {
                Estate oldEstateIdOfAssignDetails = assignDetails.getEstateId();
                if (oldEstateIdOfAssignDetails != null) {
                    oldEstateIdOfAssignDetails.setAssignDetails(null);
                    oldEstateIdOfAssignDetails = em.merge(oldEstateIdOfAssignDetails);
                }
                assignDetails.setEstateId(estate);
                assignDetails = em.merge(assignDetails);
            }
            if (projectDetails != null) {
                Estate oldEstateIdOfProjectDetails = projectDetails.getEstateId();
                if (oldEstateIdOfProjectDetails != null) {
                    oldEstateIdOfProjectDetails.setProjectDetails(null);
                    oldEstateIdOfProjectDetails = em.merge(oldEstateIdOfProjectDetails);
                }
                projectDetails.setEstateId(estate);
                projectDetails = em.merge(projectDetails);
            }
            if (contractDetails != null) {
                Estate oldEstateIdOfContractDetails = contractDetails.getEstateId();
                if (oldEstateIdOfContractDetails != null) {
                    oldEstateIdOfContractDetails.setContractDetails(null);
                    oldEstateIdOfContractDetails = em.merge(oldEstateIdOfContractDetails);
                }
                contractDetails.setEstateId(estate);
                contractDetails = em.merge(contractDetails);
            }
            for (FeatureDetails featureDetailsListFeatureDetails : estate.getFeatureDetailsList()) {
                Estate oldEstateIdOfFeatureDetailsListFeatureDetails = featureDetailsListFeatureDetails.getEstateId();
                featureDetailsListFeatureDetails.setEstateId(estate);
                featureDetailsListFeatureDetails = em.merge(featureDetailsListFeatureDetails);
                if (oldEstateIdOfFeatureDetailsListFeatureDetails != null) {
                    oldEstateIdOfFeatureDetailsListFeatureDetails.getFeatureDetailsList().remove(featureDetailsListFeatureDetails);
                    oldEstateIdOfFeatureDetailsListFeatureDetails = em.merge(oldEstateIdOfFeatureDetailsListFeatureDetails);
                }
            }
            for (Schedule scheduleListSchedule : estate.getScheduleList()) {
                Estate oldEstateIdOfScheduleListSchedule = scheduleListSchedule.getEstateId();
                scheduleListSchedule.setEstateId(estate);
                scheduleListSchedule = em.merge(scheduleListSchedule);
                if (oldEstateIdOfScheduleListSchedule != null) {
                    oldEstateIdOfScheduleListSchedule.getScheduleList().remove(scheduleListSchedule);
                    oldEstateIdOfScheduleListSchedule = em.merge(oldEstateIdOfScheduleListSchedule);
                }
            }
           // utx.commit();
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                //utx.rollback();
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findEstate(estate.getId()) != null) {
                throw new PreexistingEntityException("Estate " + estate + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Estate estate) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            //utx.begin();
            
            em = getEntityManager();
            em.getTransaction().begin();
            Estate persistentEstate = em.find(Estate.class, estate.getId());
            EstateStatus estateStatusIdOld = persistentEstate.getEstateStatusId();
            EstateStatus estateStatusIdNew = estate.getEstateStatusId();
            EstateType estateTypeIdOld = persistentEstate.getEstateTypeId();
            EstateType estateTypeIdNew = estate.getEstateTypeId();
            AssignDetails assignDetailsOld = persistentEstate.getAssignDetails();
            AssignDetails assignDetailsNew = estate.getAssignDetails();
            ProjectDetails projectDetailsOld = persistentEstate.getProjectDetails();
            ProjectDetails projectDetailsNew = estate.getProjectDetails();
            ContractDetails contractDetailsOld = persistentEstate.getContractDetails();
            ContractDetails contractDetailsNew = estate.getContractDetails();
            List<FeatureDetails> featureDetailsListOld = persistentEstate.getFeatureDetailsList();
            List<FeatureDetails> featureDetailsListNew = estate.getFeatureDetailsList();
            List<Schedule> scheduleListOld = persistentEstate.getScheduleList();
            List<Schedule> scheduleListNew = estate.getScheduleList();
            List<String> illegalOrphanMessages = null;
            if (assignDetailsOld != null && !assignDetailsOld.equals(assignDetailsNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain AssignDetails " + assignDetailsOld + " since its estateId field is not nullable.");
            }
            if (projectDetailsOld != null && !projectDetailsOld.equals(projectDetailsNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain ProjectDetails " + projectDetailsOld + " since its estateId field is not nullable.");
            }
            if (contractDetailsOld != null && !contractDetailsOld.equals(contractDetailsNew)) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("You must retain ContractDetails " + contractDetailsOld + " since its estateId field is not nullable.");
            }
            for (FeatureDetails featureDetailsListOldFeatureDetails : featureDetailsListOld) {
                if (!featureDetailsListNew.contains(featureDetailsListOldFeatureDetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain FeatureDetails " + featureDetailsListOldFeatureDetails + " since its estateId field is not nullable.");
                }
            }
            for (Schedule scheduleListOldSchedule : scheduleListOld) {
                if (!scheduleListNew.contains(scheduleListOldSchedule)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Schedule " + scheduleListOldSchedule + " since its estateId field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (estateStatusIdNew != null) {
                estateStatusIdNew = em.getReference(estateStatusIdNew.getClass(), estateStatusIdNew.getId());
                estate.setEstateStatusId(estateStatusIdNew);
            }
            if (estateTypeIdNew != null) {
                estateTypeIdNew = em.getReference(estateTypeIdNew.getClass(), estateTypeIdNew.getId());
                estate.setEstateTypeId(estateTypeIdNew);
            }
            if (assignDetailsNew != null) {
                assignDetailsNew = em.getReference(assignDetailsNew.getClass(), assignDetailsNew.getId());
                estate.setAssignDetails(assignDetailsNew);
            }
            if (projectDetailsNew != null) {
                projectDetailsNew = em.getReference(projectDetailsNew.getClass(), projectDetailsNew.getProjectDetailId());
                estate.setProjectDetails(projectDetailsNew);
            }
            if (contractDetailsNew != null) {
                contractDetailsNew = em.getReference(contractDetailsNew.getClass(), contractDetailsNew.getId());
                estate.setContractDetails(contractDetailsNew);
            }
            List<FeatureDetails> attachedFeatureDetailsListNew = new ArrayList<FeatureDetails>();
            for (FeatureDetails featureDetailsListNewFeatureDetailsToAttach : featureDetailsListNew) {
                featureDetailsListNewFeatureDetailsToAttach = em.getReference(featureDetailsListNewFeatureDetailsToAttach.getClass(), featureDetailsListNewFeatureDetailsToAttach.getFeatureDetailsId());
                attachedFeatureDetailsListNew.add(featureDetailsListNewFeatureDetailsToAttach);
            }
            featureDetailsListNew = attachedFeatureDetailsListNew;
            estate.setFeatureDetailsList(featureDetailsListNew);
            List<Schedule> attachedScheduleListNew = new ArrayList<Schedule>();
            for (Schedule scheduleListNewScheduleToAttach : scheduleListNew) {
                scheduleListNewScheduleToAttach = em.getReference(scheduleListNewScheduleToAttach.getClass(), scheduleListNewScheduleToAttach.getId());
                attachedScheduleListNew.add(scheduleListNewScheduleToAttach);
            }
            scheduleListNew = attachedScheduleListNew;
            estate.setScheduleList(scheduleListNew);
            estate = em.merge(estate);
            if (estateStatusIdOld != null && !estateStatusIdOld.equals(estateStatusIdNew)) {
                estateStatusIdOld.getEstateList().remove(estate);
                estateStatusIdOld = em.merge(estateStatusIdOld);
            }
            if (estateStatusIdNew != null && !estateStatusIdNew.equals(estateStatusIdOld)) {
                estateStatusIdNew.getEstateList().add(estate);
                estateStatusIdNew = em.merge(estateStatusIdNew);
            }
            if (estateTypeIdOld != null && !estateTypeIdOld.equals(estateTypeIdNew)) {
                estateTypeIdOld.getEstateList().remove(estate);
                estateTypeIdOld = em.merge(estateTypeIdOld);
            }
            if (estateTypeIdNew != null && !estateTypeIdNew.equals(estateTypeIdOld)) {
                estateTypeIdNew.getEstateList().add(estate);
                estateTypeIdNew = em.merge(estateTypeIdNew);
            }
            if (assignDetailsNew != null && !assignDetailsNew.equals(assignDetailsOld)) {
                Estate oldEstateIdOfAssignDetails = assignDetailsNew.getEstateId();
                if (oldEstateIdOfAssignDetails != null) {
                    oldEstateIdOfAssignDetails.setAssignDetails(null);
                    oldEstateIdOfAssignDetails = em.merge(oldEstateIdOfAssignDetails);
                }
                assignDetailsNew.setEstateId(estate);
                assignDetailsNew = em.merge(assignDetailsNew);
            }
            if (projectDetailsNew != null && !projectDetailsNew.equals(projectDetailsOld)) {
                Estate oldEstateIdOfProjectDetails = projectDetailsNew.getEstateId();
                if (oldEstateIdOfProjectDetails != null) {
                    oldEstateIdOfProjectDetails.setProjectDetails(null);
                    oldEstateIdOfProjectDetails = em.merge(oldEstateIdOfProjectDetails);
                }
                projectDetailsNew.setEstateId(estate);
                projectDetailsNew = em.merge(projectDetailsNew);
            }
            if (contractDetailsNew != null && !contractDetailsNew.equals(contractDetailsOld)) {
                Estate oldEstateIdOfContractDetails = contractDetailsNew.getEstateId();
                if (oldEstateIdOfContractDetails != null) {
                    oldEstateIdOfContractDetails.setContractDetails(null);
                    oldEstateIdOfContractDetails = em.merge(oldEstateIdOfContractDetails);
                }
                contractDetailsNew.setEstateId(estate);
                contractDetailsNew = em.merge(contractDetailsNew);
            }
            for (FeatureDetails featureDetailsListNewFeatureDetails : featureDetailsListNew) {
                if (!featureDetailsListOld.contains(featureDetailsListNewFeatureDetails)) {
                    Estate oldEstateIdOfFeatureDetailsListNewFeatureDetails = featureDetailsListNewFeatureDetails.getEstateId();
                    featureDetailsListNewFeatureDetails.setEstateId(estate);
                    featureDetailsListNewFeatureDetails = em.merge(featureDetailsListNewFeatureDetails);
                    if (oldEstateIdOfFeatureDetailsListNewFeatureDetails != null && !oldEstateIdOfFeatureDetailsListNewFeatureDetails.equals(estate)) {
                        oldEstateIdOfFeatureDetailsListNewFeatureDetails.getFeatureDetailsList().remove(featureDetailsListNewFeatureDetails);
                        oldEstateIdOfFeatureDetailsListNewFeatureDetails = em.merge(oldEstateIdOfFeatureDetailsListNewFeatureDetails);
                    }
                }
            }
            for (Schedule scheduleListNewSchedule : scheduleListNew) {
                if (!scheduleListOld.contains(scheduleListNewSchedule)) {
                    Estate oldEstateIdOfScheduleListNewSchedule = scheduleListNewSchedule.getEstateId();
                    scheduleListNewSchedule.setEstateId(estate);
                    scheduleListNewSchedule = em.merge(scheduleListNewSchedule);
                    if (oldEstateIdOfScheduleListNewSchedule != null && !oldEstateIdOfScheduleListNewSchedule.equals(estate)) {
                        oldEstateIdOfScheduleListNewSchedule.getScheduleList().remove(scheduleListNewSchedule);
                        oldEstateIdOfScheduleListNewSchedule = em.merge(oldEstateIdOfScheduleListNewSchedule);
                    }
                }
            }
            //utx.commit();
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                //utx.rollback();
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = estate.getId();
                if (findEstate(id) == null) {
                    throw new NonexistentEntityException("The estate with id " + id + " no longer exists.");
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
            Estate estate;
            try {
                estate = em.getReference(Estate.class, id);
                estate.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The estate with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            AssignDetails assignDetailsOrphanCheck = estate.getAssignDetails();
            if (assignDetailsOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Estate (" + estate + ") cannot be destroyed since the AssignDetails " + assignDetailsOrphanCheck + " in its assignDetails field has a non-nullable estateId field.");
            }
            ProjectDetails projectDetailsOrphanCheck = estate.getProjectDetails();
            if (projectDetailsOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Estate (" + estate + ") cannot be destroyed since the ProjectDetails " + projectDetailsOrphanCheck + " in its projectDetails field has a non-nullable estateId field.");
            }
            ContractDetails contractDetailsOrphanCheck = estate.getContractDetails();
            if (contractDetailsOrphanCheck != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Estate (" + estate + ") cannot be destroyed since the ContractDetails " + contractDetailsOrphanCheck + " in its contractDetails field has a non-nullable estateId field.");
            }
            List<FeatureDetails> featureDetailsListOrphanCheck = estate.getFeatureDetailsList();
            for (FeatureDetails featureDetailsListOrphanCheckFeatureDetails : featureDetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Estate (" + estate + ") cannot be destroyed since the FeatureDetails " + featureDetailsListOrphanCheckFeatureDetails + " in its featureDetailsList field has a non-nullable estateId field.");
            }
            List<Schedule> scheduleListOrphanCheck = estate.getScheduleList();
            for (Schedule scheduleListOrphanCheckSchedule : scheduleListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Estate (" + estate + ") cannot be destroyed since the Schedule " + scheduleListOrphanCheckSchedule + " in its scheduleList field has a non-nullable estateId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            EstateStatus estateStatusId = estate.getEstateStatusId();
            if (estateStatusId != null) {
                estateStatusId.getEstateList().remove(estate);
                estateStatusId = em.merge(estateStatusId);
            }
            EstateType estateTypeId = estate.getEstateTypeId();
            if (estateTypeId != null) {
                estateTypeId.getEstateList().remove(estate);
                estateTypeId = em.merge(estateTypeId);
            }
            em.remove(estate);
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

    public List<Estate> findEstateEntities() {
        return findEstateEntities(true, -1, -1);
    }

    public List<Estate> findEstateEntities(int maxResults, int firstResult) {
        return findEstateEntities(false, maxResults, firstResult);
    }

    private List<Estate> findEstateEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Estate.class));
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

    public Estate findEstate(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Estate.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstateCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Estate> rt = cq.from(Estate.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public List<Estate> getEstateWaiting() {
        
        EntityManager em=getEntityManager();
        Query q=em.createQuery("SELECT e FROM Estate e WHERE e.estateStatusId = ?1 ");
        q.setParameter(1, new EstateStatus(1));
        return q.getResultList();
    }
    
    public List<Estate> getEstateByName(String estateName) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM estate where estate_name='" + estateName + "'",Estate.class);
            List<Estate> ret = query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
    
}
