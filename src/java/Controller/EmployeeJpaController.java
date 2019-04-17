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
import Entity.Users;
import Entity.Contract;
import java.util.ArrayList;
import java.util.List;
import Entity.AssignDetails;
import Entity.Employee;
import Entity.Estate;
import Entity.Schedule;
import Entity.Post;
import java.util.Iterator;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidatorFactory;

/**
 *
 * @author kiems
 */
public class EmployeeJpaController implements Serializable {

    public EmployeeJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Employee employee) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (employee.getContractList() == null) {
            employee.setContractList(new ArrayList<Contract>());
        }
        if (employee.getAssignDetailsList() == null) {
            employee.setAssignDetailsList(new ArrayList<AssignDetails>());
        }
        if (employee.getScheduleList() == null) {
            employee.setScheduleList(new ArrayList<Schedule>());
        }
        if (employee.getPostList() == null) {
            employee.setPostList(new ArrayList<Post>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Users userId = employee.getUserId();
            if (userId != null) {
                userId = em.getReference(userId.getClass(), userId.getId());
                employee.setUserId(userId);
            }
            List<Contract> attachedContractList = new ArrayList<Contract>();
            for (Contract contractListContractToAttach : employee.getContractList()) {
                contractListContractToAttach = em.getReference(contractListContractToAttach.getClass(), contractListContractToAttach.getId());
                attachedContractList.add(contractListContractToAttach);
            }
            employee.setContractList(attachedContractList);
            List<AssignDetails> attachedAssignDetailsList = new ArrayList<AssignDetails>();
            for (AssignDetails assignDetailsListAssignDetailsToAttach : employee.getAssignDetailsList()) {
                assignDetailsListAssignDetailsToAttach = em.getReference(assignDetailsListAssignDetailsToAttach.getClass(), assignDetailsListAssignDetailsToAttach.getId());
                attachedAssignDetailsList.add(assignDetailsListAssignDetailsToAttach);
            }
            employee.setAssignDetailsList(attachedAssignDetailsList);
            List<Schedule> attachedScheduleList = new ArrayList<Schedule>();
            for (Schedule scheduleListScheduleToAttach : employee.getScheduleList()) {
                scheduleListScheduleToAttach = em.getReference(scheduleListScheduleToAttach.getClass(), scheduleListScheduleToAttach.getId());
                attachedScheduleList.add(scheduleListScheduleToAttach);
            }
            employee.setScheduleList(attachedScheduleList);
            List<Post> attachedPostList = new ArrayList<Post>();
            for (Post postListPostToAttach : employee.getPostList()) {
                postListPostToAttach = em.getReference(postListPostToAttach.getClass(), postListPostToAttach.getPostId());
                attachedPostList.add(postListPostToAttach);
            }
            employee.setPostList(attachedPostList);

            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            javax.validation.Validator validator = factory.getValidator();
            Set<ConstraintViolation<Employee>> constraintViolations;
            constraintViolations = validator.validate(employee);

            if (constraintViolations.size() > 0) {
                System.out.println("Constraint Violations occurred..");
                for (ConstraintViolation<Employee> employees : constraintViolations) {
                    System.out.println(employees.getRootBeanClass().getSimpleName()
                            + "." + employees.getPropertyPath() + " " + employees.getMessage());
                }
            }

            em.persist(employee);
            if (userId != null) {
                Employee oldEmployeeOfUserId = userId.getEmployee();
                if (oldEmployeeOfUserId != null) {
                    oldEmployeeOfUserId.setUserId(null);
                    oldEmployeeOfUserId = em.merge(oldEmployeeOfUserId);
                }
                userId.setEmployee(employee);
                userId = em.merge(userId);
            }
            for (Contract contractListContract : employee.getContractList()) {
                Employee oldEmployeeIdOfContractListContract = contractListContract.getEmployeeId();
                contractListContract.setEmployeeId(employee);
                contractListContract = em.merge(contractListContract);
                if (oldEmployeeIdOfContractListContract != null) {
                    oldEmployeeIdOfContractListContract.getContractList().remove(contractListContract);
                    oldEmployeeIdOfContractListContract = em.merge(oldEmployeeIdOfContractListContract);
                }
            }
            for (AssignDetails assignDetailsListAssignDetails : employee.getAssignDetailsList()) {
                Employee oldEmployeeIdOfAssignDetailsListAssignDetails = assignDetailsListAssignDetails.getEmployeeId();
                assignDetailsListAssignDetails.setEmployeeId(employee);
                assignDetailsListAssignDetails = em.merge(assignDetailsListAssignDetails);
                if (oldEmployeeIdOfAssignDetailsListAssignDetails != null) {
                    oldEmployeeIdOfAssignDetailsListAssignDetails.getAssignDetailsList().remove(assignDetailsListAssignDetails);
                    oldEmployeeIdOfAssignDetailsListAssignDetails = em.merge(oldEmployeeIdOfAssignDetailsListAssignDetails);
                }
            }
            for (Schedule scheduleListSchedule : employee.getScheduleList()) {
                Employee oldEmployeeIdOfScheduleListSchedule = scheduleListSchedule.getEmployeeId();
                scheduleListSchedule.setEmployeeId(employee);
                scheduleListSchedule = em.merge(scheduleListSchedule);
                if (oldEmployeeIdOfScheduleListSchedule != null) {
                    oldEmployeeIdOfScheduleListSchedule.getScheduleList().remove(scheduleListSchedule);
                    oldEmployeeIdOfScheduleListSchedule = em.merge(oldEmployeeIdOfScheduleListSchedule);
                }
            }
            for (Post postListPost : employee.getPostList()) {
                Employee oldEmployeeOfPostListPost = postListPost.getEmployee();
                postListPost.setEmployee(employee);
                postListPost = em.merge(postListPost);
                if (oldEmployeeOfPostListPost != null) {
                    oldEmployeeOfPostListPost.getPostList().remove(postListPost);
                    oldEmployeeOfPostListPost = em.merge(oldEmployeeOfPostListPost);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findEmployee(employee.getId()) != null) {
                throw new PreexistingEntityException("Employee " + employee + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Employee employee) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Employee persistentEmployee = em.find(Employee.class, employee.getId());
            Users userIdOld = persistentEmployee.getUserId();
            Users userIdNew = employee.getUserId();
            List<Contract> contractListOld = persistentEmployee.getContractList();
            List<Contract> contractListNew = employee.getContractList();
            List<AssignDetails> assignDetailsListOld = persistentEmployee.getAssignDetailsList();
            List<AssignDetails> assignDetailsListNew = employee.getAssignDetailsList();
            List<Schedule> scheduleListOld = persistentEmployee.getScheduleList();
            List<Schedule> scheduleListNew = employee.getScheduleList();
            List<Post> postListOld = persistentEmployee.getPostList();
            List<Post> postListNew = employee.getPostList();
            List<String> illegalOrphanMessages = null;
            for (AssignDetails assignDetailsListOldAssignDetails : assignDetailsListOld) {
                if (!assignDetailsListNew.contains(assignDetailsListOldAssignDetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain AssignDetails " + assignDetailsListOldAssignDetails + " since its employeeId field is not nullable.");
                }
            }
            for (Schedule scheduleListOldSchedule : scheduleListOld) {
                if (!scheduleListNew.contains(scheduleListOldSchedule)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Schedule " + scheduleListOldSchedule + " since its employeeId field is not nullable.");
                }
            }
            for (Post postListOldPost : postListOld) {
                if (!postListNew.contains(postListOldPost)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Post " + postListOldPost + " since its employee field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (userIdNew != null) {
                userIdNew = em.getReference(userIdNew.getClass(), userIdNew.getId());
                employee.setUserId(userIdNew);
            }
            List<Contract> attachedContractListNew = new ArrayList<Contract>();
            for (Contract contractListNewContractToAttach : contractListNew) {
                contractListNewContractToAttach = em.getReference(contractListNewContractToAttach.getClass(), contractListNewContractToAttach.getId());
                attachedContractListNew.add(contractListNewContractToAttach);
            }
            contractListNew = attachedContractListNew;
            employee.setContractList(contractListNew);
            List<AssignDetails> attachedAssignDetailsListNew = new ArrayList<AssignDetails>();
            for (AssignDetails assignDetailsListNewAssignDetailsToAttach : assignDetailsListNew) {
                assignDetailsListNewAssignDetailsToAttach = em.getReference(assignDetailsListNewAssignDetailsToAttach.getClass(), assignDetailsListNewAssignDetailsToAttach.getId());
                attachedAssignDetailsListNew.add(assignDetailsListNewAssignDetailsToAttach);
            }
            assignDetailsListNew = attachedAssignDetailsListNew;
            employee.setAssignDetailsList(assignDetailsListNew);
            List<Schedule> attachedScheduleListNew = new ArrayList<Schedule>();
            for (Schedule scheduleListNewScheduleToAttach : scheduleListNew) {
                scheduleListNewScheduleToAttach = em.getReference(scheduleListNewScheduleToAttach.getClass(), scheduleListNewScheduleToAttach.getId());
                attachedScheduleListNew.add(scheduleListNewScheduleToAttach);
            }
            scheduleListNew = attachedScheduleListNew;
            employee.setScheduleList(scheduleListNew);
            List<Post> attachedPostListNew = new ArrayList<Post>();
            for (Post postListNewPostToAttach : postListNew) {
                postListNewPostToAttach = em.getReference(postListNewPostToAttach.getClass(), postListNewPostToAttach.getPostId());
                attachedPostListNew.add(postListNewPostToAttach);
            }
            postListNew = attachedPostListNew;
            employee.setPostList(postListNew);
            employee = em.merge(employee);
            if (userIdOld != null && !userIdOld.equals(userIdNew)) {
                userIdOld.setEmployee(null);
                userIdOld = em.merge(userIdOld);
            }
            if (userIdNew != null && !userIdNew.equals(userIdOld)) {
                Employee oldEmployeeOfUserId = userIdNew.getEmployee();
                if (oldEmployeeOfUserId != null) {
                    oldEmployeeOfUserId.setUserId(null);
                    oldEmployeeOfUserId = em.merge(oldEmployeeOfUserId);
                }
                userIdNew.setEmployee(employee);
                userIdNew = em.merge(userIdNew);
            }
            for (Contract contractListOldContract : contractListOld) {
                if (!contractListNew.contains(contractListOldContract)) {
                    contractListOldContract.setEmployeeId(null);
                    contractListOldContract = em.merge(contractListOldContract);
                }
            }
            for (Contract contractListNewContract : contractListNew) {
                if (!contractListOld.contains(contractListNewContract)) {
                    Employee oldEmployeeIdOfContractListNewContract = contractListNewContract.getEmployeeId();
                    contractListNewContract.setEmployeeId(employee);
                    contractListNewContract = em.merge(contractListNewContract);
                    if (oldEmployeeIdOfContractListNewContract != null && !oldEmployeeIdOfContractListNewContract.equals(employee)) {
                        oldEmployeeIdOfContractListNewContract.getContractList().remove(contractListNewContract);
                        oldEmployeeIdOfContractListNewContract = em.merge(oldEmployeeIdOfContractListNewContract);
                    }
                }
            }
            for (AssignDetails assignDetailsListNewAssignDetails : assignDetailsListNew) {
                if (!assignDetailsListOld.contains(assignDetailsListNewAssignDetails)) {
                    Employee oldEmployeeIdOfAssignDetailsListNewAssignDetails = assignDetailsListNewAssignDetails.getEmployeeId();
                    assignDetailsListNewAssignDetails.setEmployeeId(employee);
                    assignDetailsListNewAssignDetails = em.merge(assignDetailsListNewAssignDetails);
                    if (oldEmployeeIdOfAssignDetailsListNewAssignDetails != null && !oldEmployeeIdOfAssignDetailsListNewAssignDetails.equals(employee)) {
                        oldEmployeeIdOfAssignDetailsListNewAssignDetails.getAssignDetailsList().remove(assignDetailsListNewAssignDetails);
                        oldEmployeeIdOfAssignDetailsListNewAssignDetails = em.merge(oldEmployeeIdOfAssignDetailsListNewAssignDetails);
                    }
                }
            }
            for (Schedule scheduleListNewSchedule : scheduleListNew) {
                if (!scheduleListOld.contains(scheduleListNewSchedule)) {
                    Employee oldEmployeeIdOfScheduleListNewSchedule = scheduleListNewSchedule.getEmployeeId();
                    scheduleListNewSchedule.setEmployeeId(employee);
                    scheduleListNewSchedule = em.merge(scheduleListNewSchedule);
                    if (oldEmployeeIdOfScheduleListNewSchedule != null && !oldEmployeeIdOfScheduleListNewSchedule.equals(employee)) {
                        oldEmployeeIdOfScheduleListNewSchedule.getScheduleList().remove(scheduleListNewSchedule);
                        oldEmployeeIdOfScheduleListNewSchedule = em.merge(oldEmployeeIdOfScheduleListNewSchedule);
                    }
                }
            }
            for (Post postListNewPost : postListNew) {
                if (!postListOld.contains(postListNewPost)) {
                    Employee oldEmployeeOfPostListNewPost = postListNewPost.getEmployee();
                    postListNewPost.setEmployee(employee);
                    postListNewPost = em.merge(postListNewPost);
                    if (oldEmployeeOfPostListNewPost != null && !oldEmployeeOfPostListNewPost.equals(employee)) {
                        oldEmployeeOfPostListNewPost.getPostList().remove(postListNewPost);
                        oldEmployeeOfPostListNewPost = em.merge(oldEmployeeOfPostListNewPost);
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
                Integer id = employee.getId();
                if (findEmployee(id) == null) {
                    throw new NonexistentEntityException("The employee with id " + id + " no longer exists.");
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
            Employee employee;
            try {
                employee = em.getReference(Employee.class, id);
                employee.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The employee with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<AssignDetails> assignDetailsListOrphanCheck = employee.getAssignDetailsList();
            for (AssignDetails assignDetailsListOrphanCheckAssignDetails : assignDetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Employee (" + employee + ") cannot be destroyed since the AssignDetails " + assignDetailsListOrphanCheckAssignDetails + " in its assignDetailsList field has a non-nullable employeeId field.");
            }
            List<Schedule> scheduleListOrphanCheck = employee.getScheduleList();
            for (Schedule scheduleListOrphanCheckSchedule : scheduleListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Employee (" + employee + ") cannot be destroyed since the Schedule " + scheduleListOrphanCheckSchedule + " in its scheduleList field has a non-nullable employeeId field.");
            }
            List<Post> postListOrphanCheck = employee.getPostList();
            for (Post postListOrphanCheckPost : postListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Employee (" + employee + ") cannot be destroyed since the Post " + postListOrphanCheckPost + " in its postList field has a non-nullable employee field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Users userId = employee.getUserId();
            if (userId != null) {
                userId.setEmployee(null);
                userId = em.merge(userId);
            }
            List<Contract> contractList = employee.getContractList();
            for (Contract contractListContract : contractList) {
                contractListContract.setEmployeeId(null);
                contractListContract = em.merge(contractListContract);
            }
            em.remove(employee);
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

    public List<Employee> findEmployeeEntities() {
        return findEmployeeEntities(true, -1, -1);
    }

    public List<Employee> findEmployeeEntities(int maxResults, int firstResult) {
        return findEmployeeEntities(false, maxResults, firstResult);
    }

    private List<Employee> findEmployeeEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Employee.class));
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

    public Employee findEmployee(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Employee.class, id);
        } finally {
            em.close();
        }
    }

    public int getEmployeeCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Employee> rt = cq.from(Employee.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public Employee getCustomerByUserID(int userID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM employee where user_id='" + userID + "'", Employee.class);
            Employee ret = (Employee) query.getSingleResult();
            return ret;
        } finally {
            em.close();
        }
    }

    public List<String> getEstateByEmployeeID(int employeeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT DISTINCT estate_id FROM assign_details where "
                    + "employee_id='" + employeeID + "'");
            List<String> ret = (List<String>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }

    public List<Estate> getEstatePublicByEmployeeID(int employeeID) {
        EntityManager em = getEntityManager();
        try {
            List<Estate> estateList = new ArrayList<Estate>();
            List<String> estateIDList = getEstateByEmployeeID(employeeID);
            for (String id : estateIDList) {
                Query query1 = em.createNativeQuery("SELECT * FROM estate where "
                    + "id='" + id + "'",
                Estate.class);
                estateList.add((Estate)query1.getSingleResult());
            }
            List<Estate> estateListRemove = new ArrayList<Estate>();
            if (!estateList.isEmpty()) {
                Query query = null;
                for (int i = 0; i < estateList.size(); i++) {
                    Estate estate = estateList.get(i);
                    query = em.createNativeQuery("SELECT * FROM estate where "
                            + "estate_status!='publish' AND "
                            + "id='" + estate.getId() + "'",
                            Estate.class);
                    if (!query.getResultList().isEmpty()) {
                        if(estateList.contains(estate)){
                            estateListRemove.add(estate);
                        }
                    }
                }
            }
            estateList.removeAll(estateListRemove);
            return estateList;
        } finally {
            em.close();
        }
    }

    public List<Estate> getEstateSoldByEmployeeID(int employeeID) {
        EntityManager em = getEntityManager();
        try {
            List<Estate> estateList = new ArrayList<Estate>();
            List<String> estateIDList = getEstateByEmployeeID(employeeID);
            for (String id : estateIDList) {
                Query query1 = em.createNativeQuery("SELECT * FROM estate where "
                    + "id='" + id + "'",
                Estate.class);
                estateList.add((Estate)query1.getSingleResult());
            }
            List<Estate> estateListRemove = new ArrayList<Estate>();
            if (!estateList.isEmpty()) {
                Query query = null;
                for (int i = 0; i < estateList.size(); i++) {
                    Estate estate = estateList.get(i);
                    query = em.createNativeQuery("SELECT * FROM estate where "
                            + "estate_status!='sold' AND "
                            + "id='" + estate.getId() + "'",
                            Estate.class);
                    if (!query.getResultList().isEmpty()) {
                        if(estateList.contains(estate)){
                            estateListRemove.add(estate);
                        }
                    }
                }
            }
            estateList.removeAll(estateListRemove);
            return estateList;
        } finally {
            em.close();
        }
    }

    public int getEstateCountByEmployeeID(int employeeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT count(*) FROM assign_details where employee_id='" + employeeID + "'");
            int ret = (int) query.getSingleResult();
            return ret;
        } finally {
            em.close();
        }
    }
}
