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
import Entity.Customer;
import Entity.Transactions;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class TransactionsJpaController implements Serializable {

    public TransactionsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Transactions transactions) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Customer customerOffered = transactions.getCustomerOffered();
            if (customerOffered != null) {
                customerOffered = em.getReference(customerOffered.getClass(), customerOffered.getId());
                transactions.setCustomerOffered(customerOffered);
            }
            em.persist(transactions);
            if (customerOffered != null) {
                customerOffered.getTransactionsList().add(transactions);
                customerOffered = em.merge(customerOffered);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findTransactions(transactions.getId()) != null) {
                throw new PreexistingEntityException("Transactions " + transactions + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Transactions transactions) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Transactions persistentTransactions = em.find(Transactions.class, transactions.getId());
            Customer customerOfferedOld = persistentTransactions.getCustomerOffered();
            Customer customerOfferedNew = transactions.getCustomerOffered();
            if (customerOfferedNew != null) {
                customerOfferedNew = em.getReference(customerOfferedNew.getClass(), customerOfferedNew.getId());
                transactions.setCustomerOffered(customerOfferedNew);
            }
            transactions = em.merge(transactions);
            if (customerOfferedOld != null && !customerOfferedOld.equals(customerOfferedNew)) {
                customerOfferedOld.getTransactionsList().remove(transactions);
                customerOfferedOld = em.merge(customerOfferedOld);
            }
            if (customerOfferedNew != null && !customerOfferedNew.equals(customerOfferedOld)) {
                customerOfferedNew.getTransactionsList().add(transactions);
                customerOfferedNew = em.merge(customerOfferedNew);
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
                Integer id = transactions.getId();
                if (findTransactions(id) == null) {
                    throw new NonexistentEntityException("The transactions with id " + id + " no longer exists.");
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
            Transactions transactions;
            try {
                transactions = em.getReference(Transactions.class, id);
                transactions.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The transactions with id " + id + " no longer exists.", enfe);
            }
            Customer customerOffered = transactions.getCustomerOffered();
            if (customerOffered != null) {
                customerOffered.getTransactionsList().remove(transactions);
                customerOffered = em.merge(customerOffered);
            }
            em.remove(transactions);
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

    public List<Transactions> findTransactionsEntities() {
        return findTransactionsEntities(true, -1, -1);
    }

    public List<Transactions> findTransactionsEntities(int maxResults, int firstResult) {
        return findTransactionsEntities(false, maxResults, firstResult);
    }

    private List<Transactions> findTransactionsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Transactions.class));
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

    public Transactions findTransactions(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Transactions.class, id);
        } finally {
            em.close();
        }
    }

    public int getTransactionsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Transactions> rt = cq.from(Transactions.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    public Integer getTransactionByContractIDSale(int contractID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT COUNT(id) FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note LIKE '%request sale%'"
            );
            System.out.println(query);
            Integer ret = (Integer) query.getSingleResult();
            return ret;
        } finally {
            em.close();
        }
    }
    
    public Double getMoneyByContractIDWithEmployee(int contractID) {
        EntityManager em = getEntityManager();
        try {
            Query query1 = em.createNativeQuery("SELECT SUM(money)/(SELECT fee_estate FROM fee where id=1)*100*(SELECT fee_employee FROM fee where id=1)/100 FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note LIKE '%request sale%'"
            );
            Double sumSale1 = 0.0;
            if(query1.getSingleResult() !=null){
                sumSale1 = (Double) query1.getSingleResult();
            }else{
                sumSale1 = 0.0;
            }
            
            Query query2 = em.createNativeQuery("SELECT SUM(money)/(SELECT fee_employee FROM fee where id=1)/100 FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note IS NULL"
            );
            Double sumSale2 = 0.0;
            if(query2.getSingleResult() !=null){
                sumSale2 = (Double) query2.getSingleResult();
            }else{
                sumSale2 = 0.0;
            }
            return sumSale1 + sumSale2;
        } finally {
            em.close();
        }
    }
    
    public Double getMoneyByContractIDWithCompany(int contractID) {
        EntityManager em = getEntityManager();
        try {
            Query query1 = em.createNativeQuery("SELECT SUM(money) FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note LIKE '%request sale%'"
            );
            Double sumSale1 = 0.0;
            if(query1.getSingleResult() !=null){
                sumSale1 = (Double) query1.getSingleResult();
            }else{
                sumSale1 = 0.0;
            }
            
            Query query2 = em.createNativeQuery("SELECT SUM(money)/(SELECT fee_estate FROM fee where id=1)/100 FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note IS NULL"
            );
            Double sumSale2 = 0.0;
            if(query2.getSingleResult() !=null){
                sumSale2 = (Double) query2.getSingleResult();
            }else{
                sumSale2 = 0.0;
            }
            return sumSale1 + sumSale2;
        } finally {
            em.close();
        }
    }
    
    public int getCountByContractIDWithCompany(int contractID) {
        EntityManager em = getEntityManager();
        try {
            Query query1 = em.createNativeQuery("SELECT COUNT(id) FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note LIKE '%request sale%'"
            );
            int sumSale1 = 0;
            if(query1.getSingleResult() !=null){
                sumSale1 = (int) query1.getSingleResult();
            }else{
                sumSale1 = 0;
            }
            
            Query query2 = em.createNativeQuery("SELECT COUNT(id) FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note IS NULL"
            );
            int sumSale2 = 0;
            if(query2.getSingleResult() !=null){
                sumSale2 = (int) query2.getSingleResult();
            }else{
                sumSale2 = 0;
            }
            return sumSale1 + sumSale2;
        } finally {
            em.close();
        }
    }
    
    public Double getMoneyByContractIDWithCompanyMonth(int contractID, String month) {
        EntityManager em = getEntityManager();
        try {
            Query query1 = em.createNativeQuery("SELECT SUM(money) FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note LIKE '%request sale%' AND "
                    + "transactions_date LIKE '%"+month+"%'"
            );
            Double sumSale1 = 0.0;
            if(query1.getSingleResult() !=null){
                sumSale1 = (Double) query1.getSingleResult();
            }else{
                sumSale1 = 0.0;
            }
            
            Query query2 = em.createNativeQuery("SELECT SUM(money)/(SELECT fee_estate FROM fee where id=1)/100 FROM transactions where "
                    + "contract_id='" + contractID + "' AND "
                    + "transactions_note IS NULL AND "
                    + "transactions_date LIKE '%"+month+"%'"
            );
            Double sumSale2 = 0.0;
            if(query2.getSingleResult() !=null){
                sumSale2 = (Double) query2.getSingleResult();
            }else{
                sumSale2 = 0.0;
            }
            return sumSale1 + sumSale2;
        } finally {
            em.close();
        }
    }
    
    
    public Boolean checkMoneyByContractIDWithCompany(int contractID){
        EntityManager em = getEntityManager();
        try {
            Query query1 = em.createNativeQuery("SELECT SUM(money) FROM transactions where "
                    + "transactions_date LIKE '%-05-%' AND "
                    + "contract_id='" + contractID + "'"
            );
            double count1 = 0.0;
            if(query1.getSingleResult() != null){
                count1 = (double) query1.getSingleResult();
            }else{
                count1 = 0.0;
            }
            Query query2 = em.createNativeQuery("SELECT SUM(money) FROM transactions where "
                    + "transactions_date LIKE '%-04-%' AND "
                    + "contract_id='" + contractID + "'"
            );
            double count2 = 0.0;
            if(query2.getSingleResult() != null){
                count2 = (double) query2.getSingleResult();
            }else{
                count2 = 0.0;
            }
            return (count1 > count2);
        } finally {
            em.close();
        }
    }
    
    public int getEstateCountByContractIDWithEmployee(int contractID) {
        EntityManager em = getEntityManager();
        try {
            Query query1 = em.createNativeQuery("SELECT COUNT(id) FROM transactions  where "
                    + "contract_id='" + contractID + "'"
            );
            
            return (int) query1.getSingleResult();
        } finally {
            em.close();
        }
    }
    
    public Transactions getTransactionByContractID(int contractID) {
        EntityManager em = getEntityManager();
        try {
            Query query1 = em.createNativeQuery("SELECT * FROM transactions  where "
                    + "contract_id='" + contractID + "'",Transactions.class
            );
            
            return (Transactions) query1.getSingleResult();
        } finally {
            em.close();
        }
    }
}
