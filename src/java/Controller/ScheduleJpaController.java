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
import Entity.Employee;
import Entity.Customer;
import Entity.Schedule;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
public class ScheduleJpaController implements Serializable {

    public ScheduleJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Schedule schedule) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Estate estateId = schedule.getEstateId();
            if (estateId != null) {
                estateId = em.getReference(estateId.getClass(), estateId.getId());
                schedule.setEstateId(estateId);
            }
            Employee employeeId = schedule.getEmployeeId();
            if (employeeId != null) {
                employeeId = em.getReference(employeeId.getClass(), employeeId.getId());
                schedule.setEmployeeId(employeeId);
            }
            Customer customerId = schedule.getCustomerId();
            if (customerId != null) {
                customerId = em.getReference(customerId.getClass(), customerId.getId());
                schedule.setCustomerId(customerId);
            }
            em.persist(schedule);
            if (estateId != null) {
                estateId.getScheduleList().add(schedule);
                estateId = em.merge(estateId);
            }
            if (employeeId != null) {
                employeeId.getScheduleList().add(schedule);
                employeeId = em.merge(employeeId);
            }
            if (customerId != null) {
                customerId.getScheduleList().add(schedule);
                customerId = em.merge(customerId);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findSchedule(schedule.getId()) != null) {
                throw new PreexistingEntityException("Schedule " + schedule + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Schedule schedule) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Schedule persistentSchedule = em.find(Schedule.class, schedule.getId());
            Estate estateIdOld = persistentSchedule.getEstateId();
            Estate estateIdNew = schedule.getEstateId();
            Employee employeeIdOld = persistentSchedule.getEmployeeId();
            Employee employeeIdNew = schedule.getEmployeeId();
            Customer customerIdOld = persistentSchedule.getCustomerId();
            Customer customerIdNew = schedule.getCustomerId();
            if (estateIdNew != null) {
                estateIdNew = em.getReference(estateIdNew.getClass(), estateIdNew.getId());
                schedule.setEstateId(estateIdNew);
            }
            if (employeeIdNew != null) {
                employeeIdNew = em.getReference(employeeIdNew.getClass(), employeeIdNew.getId());
                schedule.setEmployeeId(employeeIdNew);
            }
            if (customerIdNew != null) {
                customerIdNew = em.getReference(customerIdNew.getClass(), customerIdNew.getId());
                schedule.setCustomerId(customerIdNew);
            }
            schedule = em.merge(schedule);
            if (estateIdOld != null && !estateIdOld.equals(estateIdNew)) {
                estateIdOld.getScheduleList().remove(schedule);
                estateIdOld = em.merge(estateIdOld);
            }
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                estateIdNew.getScheduleList().add(schedule);
                estateIdNew = em.merge(estateIdNew);
            }
            if (employeeIdOld != null && !employeeIdOld.equals(employeeIdNew)) {
                employeeIdOld.getScheduleList().remove(schedule);
                employeeIdOld = em.merge(employeeIdOld);
            }
            if (employeeIdNew != null && !employeeIdNew.equals(employeeIdOld)) {
                employeeIdNew.getScheduleList().add(schedule);
                employeeIdNew = em.merge(employeeIdNew);
            }
            if (customerIdOld != null && !customerIdOld.equals(customerIdNew)) {
                customerIdOld.getScheduleList().remove(schedule);
                customerIdOld = em.merge(customerIdOld);
            }
            if (customerIdNew != null && !customerIdNew.equals(customerIdOld)) {
                customerIdNew.getScheduleList().add(schedule);
                customerIdNew = em.merge(customerIdNew);
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
                Integer id = schedule.getId();
                if (findSchedule(id) == null) {
                    throw new NonexistentEntityException("The schedule with id " + id + " no longer exists.");
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
            Schedule schedule;
            try {
                schedule = em.getReference(Schedule.class, id);
                schedule.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The schedule with id " + id + " no longer exists.", enfe);
            }
            Estate estateId = schedule.getEstateId();
            if (estateId != null) {
                estateId.getScheduleList().remove(schedule);
                estateId = em.merge(estateId);
            }
            Employee employeeId = schedule.getEmployeeId();
            if (employeeId != null) {
                employeeId.getScheduleList().remove(schedule);
                employeeId = em.merge(employeeId);
            }
            Customer customerId = schedule.getCustomerId();
            if (customerId != null) {
                customerId.getScheduleList().remove(schedule);
                customerId = em.merge(customerId);
            }
            em.remove(schedule);
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

    public List<Schedule> findScheduleEntities() {
        return findScheduleEntities(true, -1, -1);
    }

    public List<Schedule> findScheduleEntities(int maxResults, int firstResult) {
        return findScheduleEntities(false, maxResults, firstResult);
    }

    private List<Schedule> findScheduleEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Schedule.class));
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

    public Schedule findSchedule(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Schedule.class, id);
        } finally {
            em.close();
        }
    }

    public int getScheduleCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Schedule> rt = cq.from(Schedule.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
