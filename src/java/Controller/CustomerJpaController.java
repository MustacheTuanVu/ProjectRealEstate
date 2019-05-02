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
import Entity.Customer;
import Entity.Employee;
import Entity.Estate;
import java.util.ArrayList;
import java.util.List;
import Entity.Transactions;
import Entity.Schedule;
import java.math.BigDecimal;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class CustomerJpaController implements Serializable {

    public CustomerJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Customer customer) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (customer.getContractList() == null) {
            customer.setContractList(new ArrayList<Contract>());
        }
        if (customer.getTransactionsList() == null) {
            customer.setTransactionsList(new ArrayList<Transactions>());
        }
        if (customer.getScheduleList() == null) {
            customer.setScheduleList(new ArrayList<Schedule>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Users userId = customer.getUserId();
            if (userId != null) {
                userId = em.getReference(userId.getClass(), userId.getId());
                customer.setUserId(userId);
            }
            List<Contract> attachedContractList = new ArrayList<Contract>();
            for (Contract contractListContractToAttach : customer.getContractList()) {
                contractListContractToAttach = em.getReference(contractListContractToAttach.getClass(), contractListContractToAttach.getId());
                attachedContractList.add(contractListContractToAttach);
            }
            customer.setContractList(attachedContractList);
            List<Transactions> attachedTransactionsList = new ArrayList<Transactions>();
            for (Transactions transactionsListTransactionsToAttach : customer.getTransactionsList()) {
                transactionsListTransactionsToAttach = em.getReference(transactionsListTransactionsToAttach.getClass(), transactionsListTransactionsToAttach.getId());
                attachedTransactionsList.add(transactionsListTransactionsToAttach);
            }
            customer.setTransactionsList(attachedTransactionsList);
            List<Schedule> attachedScheduleList = new ArrayList<Schedule>();
            for (Schedule scheduleListScheduleToAttach : customer.getScheduleList()) {
                scheduleListScheduleToAttach = em.getReference(scheduleListScheduleToAttach.getClass(), scheduleListScheduleToAttach.getId());
                attachedScheduleList.add(scheduleListScheduleToAttach);
            }
            customer.setScheduleList(attachedScheduleList);
            em.persist(customer);
            if (userId != null) {
                Customer oldCustomerOfUserId = userId.getCustomer();
                if (oldCustomerOfUserId != null) {
                    oldCustomerOfUserId.setUserId(null);
                    oldCustomerOfUserId = em.merge(oldCustomerOfUserId);
                }
                userId.setCustomer(customer);
                userId = em.merge(userId);
            }
            for (Contract contractListContract : customer.getContractList()) {
                Customer oldCustomerIdOfContractListContract = contractListContract.getCustomerId();
                contractListContract.setCustomerId(customer);
                contractListContract = em.merge(contractListContract);
                if (oldCustomerIdOfContractListContract != null) {
                    oldCustomerIdOfContractListContract.getContractList().remove(contractListContract);
                    oldCustomerIdOfContractListContract = em.merge(oldCustomerIdOfContractListContract);
                }
            }
            for (Transactions transactionsListTransactions : customer.getTransactionsList()) {
                Customer oldCustomerOfferedOfTransactionsListTransactions = transactionsListTransactions.getCustomerOffered();
                transactionsListTransactions.setCustomerOffered(customer);
                transactionsListTransactions = em.merge(transactionsListTransactions);
                if (oldCustomerOfferedOfTransactionsListTransactions != null) {
                    oldCustomerOfferedOfTransactionsListTransactions.getTransactionsList().remove(transactionsListTransactions);
                    oldCustomerOfferedOfTransactionsListTransactions = em.merge(oldCustomerOfferedOfTransactionsListTransactions);
                }
            }
            for (Schedule scheduleListSchedule : customer.getScheduleList()) {
                Customer oldCustomerIdOfScheduleListSchedule = scheduleListSchedule.getCustomerId();
                scheduleListSchedule.setCustomerId(customer);
                scheduleListSchedule = em.merge(scheduleListSchedule);
                if (oldCustomerIdOfScheduleListSchedule != null) {
                    oldCustomerIdOfScheduleListSchedule.getScheduleList().remove(scheduleListSchedule);
                    oldCustomerIdOfScheduleListSchedule = em.merge(oldCustomerIdOfScheduleListSchedule);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findCustomer(customer.getId()) != null) {
                throw new PreexistingEntityException("Customer " + customer + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Customer customer) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Customer persistentCustomer = em.find(Customer.class, customer.getId());
            Users userIdOld = persistentCustomer.getUserId();
            Users userIdNew = customer.getUserId();
            List<Contract> contractListOld = persistentCustomer.getContractList();
            List<Contract> contractListNew = customer.getContractList();
            List<Transactions> transactionsListOld = persistentCustomer.getTransactionsList();
            List<Transactions> transactionsListNew = customer.getTransactionsList();
            List<Schedule> scheduleListOld = persistentCustomer.getScheduleList();
            List<Schedule> scheduleListNew = customer.getScheduleList();
            List<String> illegalOrphanMessages = null;
            for (Contract contractListOldContract : contractListOld) {
                if (!contractListNew.contains(contractListOldContract)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Contract " + contractListOldContract + " since its customerId field is not nullable.");
                }
            }
            for (Transactions transactionsListOldTransactions : transactionsListOld) {
                if (!transactionsListNew.contains(transactionsListOldTransactions)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Transactions " + transactionsListOldTransactions + " since its customerOffered field is not nullable.");
                }
            }
            for (Schedule scheduleListOldSchedule : scheduleListOld) {
                if (!scheduleListNew.contains(scheduleListOldSchedule)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Schedule " + scheduleListOldSchedule + " since its customerId field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (userIdNew != null) {
                userIdNew = em.getReference(userIdNew.getClass(), userIdNew.getId());
                customer.setUserId(userIdNew);
            }
            List<Contract> attachedContractListNew = new ArrayList<Contract>();
            for (Contract contractListNewContractToAttach : contractListNew) {
                contractListNewContractToAttach = em.getReference(contractListNewContractToAttach.getClass(), contractListNewContractToAttach.getId());
                attachedContractListNew.add(contractListNewContractToAttach);
            }
            contractListNew = attachedContractListNew;
            customer.setContractList(contractListNew);
            List<Transactions> attachedTransactionsListNew = new ArrayList<Transactions>();
            for (Transactions transactionsListNewTransactionsToAttach : transactionsListNew) {
                transactionsListNewTransactionsToAttach = em.getReference(transactionsListNewTransactionsToAttach.getClass(), transactionsListNewTransactionsToAttach.getId());
                attachedTransactionsListNew.add(transactionsListNewTransactionsToAttach);
            }
            transactionsListNew = attachedTransactionsListNew;
            customer.setTransactionsList(transactionsListNew);
            List<Schedule> attachedScheduleListNew = new ArrayList<Schedule>();
            for (Schedule scheduleListNewScheduleToAttach : scheduleListNew) {
                scheduleListNewScheduleToAttach = em.getReference(scheduleListNewScheduleToAttach.getClass(), scheduleListNewScheduleToAttach.getId());
                attachedScheduleListNew.add(scheduleListNewScheduleToAttach);
            }
            scheduleListNew = attachedScheduleListNew;
            customer.setScheduleList(scheduleListNew);
            customer = em.merge(customer);
            if (userIdOld != null && !userIdOld.equals(userIdNew)) {
                userIdOld.setCustomer(null);
                userIdOld = em.merge(userIdOld);
            }
            if (userIdNew != null && !userIdNew.equals(userIdOld)) {
                Customer oldCustomerOfUserId = userIdNew.getCustomer();
                if (oldCustomerOfUserId != null) {
                    oldCustomerOfUserId.setUserId(null);
                    oldCustomerOfUserId = em.merge(oldCustomerOfUserId);
                }
                userIdNew.setCustomer(customer);
                userIdNew = em.merge(userIdNew);
            }
            for (Contract contractListNewContract : contractListNew) {
                if (!contractListOld.contains(contractListNewContract)) {
                    Customer oldCustomerIdOfContractListNewContract = contractListNewContract.getCustomerId();
                    contractListNewContract.setCustomerId(customer);
                    contractListNewContract = em.merge(contractListNewContract);
                    if (oldCustomerIdOfContractListNewContract != null && !oldCustomerIdOfContractListNewContract.equals(customer)) {
                        oldCustomerIdOfContractListNewContract.getContractList().remove(contractListNewContract);
                        oldCustomerIdOfContractListNewContract = em.merge(oldCustomerIdOfContractListNewContract);
                    }
                }
            }
            for (Transactions transactionsListNewTransactions : transactionsListNew) {
                if (!transactionsListOld.contains(transactionsListNewTransactions)) {
                    Customer oldCustomerOfferedOfTransactionsListNewTransactions = transactionsListNewTransactions.getCustomerOffered();
                    transactionsListNewTransactions.setCustomerOffered(customer);
                    transactionsListNewTransactions = em.merge(transactionsListNewTransactions);
                    if (oldCustomerOfferedOfTransactionsListNewTransactions != null && !oldCustomerOfferedOfTransactionsListNewTransactions.equals(customer)) {
                        oldCustomerOfferedOfTransactionsListNewTransactions.getTransactionsList().remove(transactionsListNewTransactions);
                        oldCustomerOfferedOfTransactionsListNewTransactions = em.merge(oldCustomerOfferedOfTransactionsListNewTransactions);
                    }
                }
            }
            for (Schedule scheduleListNewSchedule : scheduleListNew) {
                if (!scheduleListOld.contains(scheduleListNewSchedule)) {
                    Customer oldCustomerIdOfScheduleListNewSchedule = scheduleListNewSchedule.getCustomerId();
                    scheduleListNewSchedule.setCustomerId(customer);
                    scheduleListNewSchedule = em.merge(scheduleListNewSchedule);
                    if (oldCustomerIdOfScheduleListNewSchedule != null && !oldCustomerIdOfScheduleListNewSchedule.equals(customer)) {
                        oldCustomerIdOfScheduleListNewSchedule.getScheduleList().remove(scheduleListNewSchedule);
                        oldCustomerIdOfScheduleListNewSchedule = em.merge(oldCustomerIdOfScheduleListNewSchedule);
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
                Integer id = customer.getId();
                if (findCustomer(id) == null) {
                    throw new NonexistentEntityException("The customer with id " + id + " no longer exists.");
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
            Customer customer;
            try {
                customer = em.getReference(Customer.class, id);
                customer.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The customer with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Contract> contractListOrphanCheck = customer.getContractList();
            for (Contract contractListOrphanCheckContract : contractListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Customer (" + customer + ") cannot be destroyed since the Contract " + contractListOrphanCheckContract + " in its contractList field has a non-nullable customerId field.");
            }
            List<Transactions> transactionsListOrphanCheck = customer.getTransactionsList();
            for (Transactions transactionsListOrphanCheckTransactions : transactionsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Customer (" + customer + ") cannot be destroyed since the Transactions " + transactionsListOrphanCheckTransactions + " in its transactionsList field has a non-nullable customerOffered field.");
            }
            List<Schedule> scheduleListOrphanCheck = customer.getScheduleList();
            for (Schedule scheduleListOrphanCheckSchedule : scheduleListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Customer (" + customer + ") cannot be destroyed since the Schedule " + scheduleListOrphanCheckSchedule + " in its scheduleList field has a non-nullable customerId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Users userId = customer.getUserId();
            if (userId != null) {
                userId.setCustomer(null);
                userId = em.merge(userId);
            }
            em.remove(customer);
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

    public List<Customer> findCustomerEntities() {
        return findCustomerEntities(true, -1, -1);
    }

    public List<Customer> findCustomerEntities(int maxResults, int firstResult) {
        return findCustomerEntities(false, maxResults, firstResult);
    }

    private List<Customer> findCustomerEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Customer.class));
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

    public Customer findCustomer(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Customer.class, id);
        } finally {
            em.close();
        }
    }

    public int getCustomerCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Customer> rt = cq.from(Customer.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public Customer getCustomerByUserID(int userID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM customer where user_id='" + userID + "'",Customer.class);
            Customer ret = (Customer) query.getSingleResult();
            return ret;
        } finally {
            em.close();
        }
    }
	public List<Customer> findCustomerByEMployeeID(int employeeID) {
        EntityManager em = getEntityManager();
        try { // select * from customer where id = (SELECT DISTINCT customer_id from contract where employee_id = 3)
            Query query = em.createNativeQuery("SELECT * FROM customer where "
                    + "id = (SELECT DISTINCT customer_id from contract where employee_id = '"+employeeID+"') "
                    ,Customer.class);
            List<Customer> ret = (List<Customer>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }

    public Object findByIdUser(Users users) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
