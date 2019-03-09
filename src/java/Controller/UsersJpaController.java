/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Controller.exceptions.NonexistentEntityException;
import Controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Manager;
import Entity.Customer;
import Entity.Employee;
import Entity.Users;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Cuong
 */
public class UsersJpaController implements Serializable {

    public UsersJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public Users checkLogin(String user,String pass){
        EntityManager em=getEntityManager();
        Query q=em.createQuery("SELECT u FROM Users u WHERE u.username LIKE :user AND u.password LIKE :pass AND u.status =TRUE");
        q.setParameter("user", user);
        q.setParameter("pass", pass);
        
        try {
            Users obj=(Users) q.getResultList().get(0);
            return obj;

        } catch (ArrayIndexOutOfBoundsException e) {
            return null;
        }
 
    }
    
    public List<Users> findUserActive(){
        EntityManager em=getEntityManager();
        Query q=em.createQuery("SELECT u FROM Users u WHERE u.status = TRUE AND u.role LIKE 'Customer'");
        
        return q.getResultList();
    }

    public void create(Users users) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Manager manager = users.getManager();
            if (manager != null) {
                manager = em.getReference(manager.getClass(), manager.getManagerId());
                users.setManager(manager);
            }
            Customer customer = users.getCustomer();
            if (customer != null) {
                customer = em.getReference(customer.getClass(), customer.getId());
                users.setCustomer(customer);
            }
            Employee employee = users.getEmployee();
            if (employee != null) {
                employee = em.getReference(employee.getClass(), employee.getId());
                users.setEmployee(employee);
            }
            em.persist(users);
            if (manager != null) {
                Users oldUserIdOfManager = manager.getUserId();
                if (oldUserIdOfManager != null) {
                    oldUserIdOfManager.setManager(null);
                    oldUserIdOfManager = em.merge(oldUserIdOfManager);
                }
                manager.setUserId(users);
                manager = em.merge(manager);
            }
            if (customer != null) {
                Users oldUserIdOfCustomer = customer.getUserId();
                if (oldUserIdOfCustomer != null) {
                    oldUserIdOfCustomer.setCustomer(null);
                    oldUserIdOfCustomer = em.merge(oldUserIdOfCustomer);
                }
                customer.setUserId(users);
                customer = em.merge(customer);
            }
            if (employee != null) {
                Users oldUserIdOfEmployee = employee.getUserId();
                if (oldUserIdOfEmployee != null) {
                    oldUserIdOfEmployee.setEmployee(null);
                    oldUserIdOfEmployee = em.merge(oldUserIdOfEmployee);
                }
                employee.setUserId(users);
                employee = em.merge(employee);
            }
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

    public void edit(Users users) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Users persistentUsers = em.find(Users.class, users.getId());
            Manager managerOld = persistentUsers.getManager();
            Manager managerNew = users.getManager();
            Customer customerOld = persistentUsers.getCustomer();
            Customer customerNew = users.getCustomer();
            Employee employeeOld = persistentUsers.getEmployee();
            Employee employeeNew = users.getEmployee();
            if (managerNew != null) {
                managerNew = em.getReference(managerNew.getClass(), managerNew.getManagerId());
                users.setManager(managerNew);
            }
            if (customerNew != null) {
                customerNew = em.getReference(customerNew.getClass(), customerNew.getId());
                users.setCustomer(customerNew);
            }
            if (employeeNew != null) {
                employeeNew = em.getReference(employeeNew.getClass(), employeeNew.getId());
                users.setEmployee(employeeNew);
            }
            users = em.merge(users);
            if (managerOld != null && !managerOld.equals(managerNew)) {
                managerOld.setUserId(null);
                managerOld = em.merge(managerOld);
            }
            if (managerNew != null && !managerNew.equals(managerOld)) {
                Users oldUserIdOfManager = managerNew.getUserId();
                if (oldUserIdOfManager != null) {
                    oldUserIdOfManager.setManager(null);
                    oldUserIdOfManager = em.merge(oldUserIdOfManager);
                }
                managerNew.setUserId(users);
                managerNew = em.merge(managerNew);
            }
            if (customerOld != null && !customerOld.equals(customerNew)) {
                customerOld.setUserId(null);
                customerOld = em.merge(customerOld);
            }
            if (customerNew != null && !customerNew.equals(customerOld)) {
                Users oldUserIdOfCustomer = customerNew.getUserId();
                if (oldUserIdOfCustomer != null) {
                    oldUserIdOfCustomer.setCustomer(null);
                    oldUserIdOfCustomer = em.merge(oldUserIdOfCustomer);
                }
                customerNew.setUserId(users);
                customerNew = em.merge(customerNew);
            }
            if (employeeOld != null && !employeeOld.equals(employeeNew)) {
                employeeOld.setUserId(null);
                employeeOld = em.merge(employeeOld);
            }
            if (employeeNew != null && !employeeNew.equals(employeeOld)) {
                Users oldUserIdOfEmployee = employeeNew.getUserId();
                if (oldUserIdOfEmployee != null) {
                    oldUserIdOfEmployee.setEmployee(null);
                    oldUserIdOfEmployee = em.merge(oldUserIdOfEmployee);
                }
                employeeNew.setUserId(users);
                employeeNew = em.merge(employeeNew);
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
                Integer id = users.getId();
                if (findUsers(id) == null) {
                    throw new NonexistentEntityException("The users with id " + id + " no longer exists.");
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
            Users users;
            try {
                users = em.getReference(Users.class, id);
                users.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The users with id " + id + " no longer exists.", enfe);
            }
            Manager manager = users.getManager();
            if (manager != null) {
                manager.setUserId(null);
                manager = em.merge(manager);
            }
            Customer customer = users.getCustomer();
            if (customer != null) {
                customer.setUserId(null);
                customer = em.merge(customer);
            }
            Employee employee = users.getEmployee();
            if (employee != null) {
                employee.setUserId(null);
                employee = em.merge(employee);
            }
            em.remove(users);
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

    public List<Users> findUsersEntities() {
        return findUsersEntities(true, -1, -1);
    }

    public List<Users> findUsersEntities(int maxResults, int firstResult) {
        return findUsersEntities(false, maxResults, firstResult);
    }

    private List<Users> findUsersEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Users.class));
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

    public Users findUsers(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Users.class, id);
        } finally {
            em.close();
        }
    }

    public int getUsersCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Users> rt = cq.from(Users.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
