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
import Entity.Contract;
import Entity.ContractDetails;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Estate;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author kiems
 */
public class ContractDetailsJpaController implements Serializable {

    public ContractDetailsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ContractDetails contractDetails) throws IllegalOrphanException, PreexistingEntityException, RollbackFailureException, Exception {
        List<String> illegalOrphanMessages = null;
        Estate estateIdOrphanCheck = contractDetails.getEstateId();
        if (estateIdOrphanCheck != null) {
            ContractDetails oldContractDetailsOfEstateId = estateIdOrphanCheck.getContractDetails();
            if (oldContractDetailsOfEstateId != null) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("The Estate " + estateIdOrphanCheck + " already has an item of type ContractDetails whose estateId column cannot be null. Please make another selection for the estateId field.");
            }
        }
//        if (illegalOrphanMessages != null) {
//            throw new IllegalOrphanException(illegalOrphanMessages);
//        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Estate estateId = contractDetails.getEstateId();
            if (estateId != null) {
                estateId = em.getReference(estateId.getClass(), estateId.getId());
                contractDetails.setEstateId(estateId);
            }
            em.persist(contractDetails);
            if (estateId != null) {
                estateId.setContractDetails(contractDetails);
                estateId = em.merge(estateId);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findContractDetails(contractDetails.getId()) != null) {
                throw new PreexistingEntityException("ContractDetails " + contractDetails + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ContractDetails contractDetails) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            ContractDetails persistentContractDetails = em.find(ContractDetails.class, contractDetails.getId());
            Estate estateIdOld = persistentContractDetails.getEstateId();
            Estate estateIdNew = contractDetails.getEstateId();
            List<String> illegalOrphanMessages = null;
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                ContractDetails oldContractDetailsOfEstateId = estateIdNew.getContractDetails();
                if (oldContractDetailsOfEstateId != null) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("The Estate " + estateIdNew + " already has an item of type ContractDetails whose estateId column cannot be null. Please make another selection for the estateId field.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (estateIdNew != null) {
                estateIdNew = em.getReference(estateIdNew.getClass(), estateIdNew.getId());
                contractDetails.setEstateId(estateIdNew);
            }
            contractDetails = em.merge(contractDetails);
            if (estateIdOld != null && !estateIdOld.equals(estateIdNew)) {
                estateIdOld.setContractDetails(null);
                estateIdOld = em.merge(estateIdOld);
            }
            if (estateIdNew != null && !estateIdNew.equals(estateIdOld)) {
                estateIdNew.setContractDetails(contractDetails);
                estateIdNew = em.merge(estateIdNew);
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
                Integer id = contractDetails.getId();
                if (findContractDetails(id) == null) {
                    throw new NonexistentEntityException("The contractDetails with id " + id + " no longer exists.");
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
            ContractDetails contractDetails;
            try {
                contractDetails = em.getReference(ContractDetails.class, id);
                contractDetails.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The contractDetails with id " + id + " no longer exists.", enfe);
            }
            Estate estateId = contractDetails.getEstateId();
            if (estateId != null) {
                estateId.setContractDetails(null);
                estateId = em.merge(estateId);
            }
            em.remove(contractDetails);
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

    public List<ContractDetails> findContractDetailsEntities() {
        return findContractDetailsEntities(true, -1, -1);
    }

    public List<ContractDetails> findContractDetailsEntities(int maxResults, int firstResult) {
        return findContractDetailsEntities(false, maxResults, firstResult);
    }

    private List<ContractDetails> findContractDetailsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ContractDetails.class));
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

    public ContractDetails findContractDetails(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ContractDetails.class, id);
        } finally {
            em.close();
        }
    }

    public int getContractDetailsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ContractDetails> rt = cq.from(ContractDetails.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    public ContractDetails getContractDetailsByContract(int contractID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM contract_details where contract_id='" + contractID + "'",ContractDetails.class);
            ContractDetails ret = (ContractDetails) query.getSingleResult();
            return ret;
        } finally {
            em.close();
        }
    }
    
    public List<Contract>  getContractByEmployee(int employeeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM contract where employee_id='" + employeeID + "'",Contract.class);
            List<Contract> ret = (List<Contract>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
    
    public List<Contract>  getContractByEmployeeAndCustomer(int employeeID, int customerID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM contract where "
                    + "employee_id='" + employeeID + "' AND "
                    + "customer_id='" + customerID + "'"
                    ,Contract.class);
            List<Contract> ret = (List<Contract>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
    
    
    public List<ContractDetails>  getContractDetailsByContractID(int employeeID) {
        EntityManager em = getEntityManager();
        try {
            List<Contract> contractList = getContractByEmployee(employeeID);
            List<ContractDetails> ret = (List<ContractDetails>) new ArrayList<ContractDetails>();
            
            for (Contract contract : contractList) {
                Query query = em.createNativeQuery("SELECT * FROM contract_details where contract_id='" + contract.getId() + "'",ContractDetails.class);
                List<ContractDetails> ret2 = (List<ContractDetails>) query.getResultList();
                ret.addAll(ret2);
            }
            return ret;
        } finally {
            em.close();
        }
    }
    
    
    // CAI NAY NHE
    public List<ContractDetails>  getContractDetailsByContractIDCustomerID(int employeeID, int customerID) {
        EntityManager em = getEntityManager();
        try {
            List<Contract> contractList = getContractByEmployeeAndCustomer(employeeID, customerID);
            List<ContractDetails> ret = (List<ContractDetails>) new ArrayList<ContractDetails>();
            
            for (Contract contract : contractList) {
                Query query = em.createNativeQuery("SELECT * FROM contract_details where "
                        + "contract_id='" + contract.getId() + "'"
                        ,ContractDetails.class);
                List<ContractDetails> ret2 = (List<ContractDetails>) query.getResultList();
                ret.addAll(ret2);
            }
            return ret;
        } finally {
            em.close();
        }
    }

    public Object getContractDetailsByContractIDandKeyword(int employeeID, String keyword) {
        EntityManager em = getEntityManager();
        try {
            List<Contract> contractList = getContractByEmployee(employeeID);
            List<ContractDetails> ret = (List<ContractDetails>) new ArrayList<ContractDetails>();
            
            for (Contract contract : contractList) {
                Query query = em.createNativeQuery("SELECT * FROM contract_details where contract_id='" + contract.getId() + "'"+
                        " AND "
                        ,ContractDetails.class);
                List<ContractDetails> ret2 = (List<ContractDetails>) query.getResultList();
                ret.addAll(ret2);
            }
            return ret;
        } finally {
            em.close();
        }
     }


    /* cuong add */
    ///// 0000000000000000000000000000
    // Request Buy
    // Cuong get list id contract from empID and status 'waitting to transaction'
       public List<Contract>  getContractByEmployeeAndStatus(int employeeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM contract where employee_id='" + employeeID + "' And status like 'waitting to transaction'",Contract.class);
            List<Contract> ret = (List<Contract>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }

     /* cuong add */
    public List<ContractDetails> getContractDetailsByEmployeeID(int empID) {
            EntityManager em = getEntityManager();
        try {
            List<Contract> contractList = getContractByEmployeeAndStatus(empID);
            List<ContractDetails> ret = (List<ContractDetails>) new ArrayList<ContractDetails>();
            
            for (Contract contract : contractList) {
                Query query = em.createNativeQuery("SELECT * FROM contract_details where "
                        + "contract_id='" + contract.getId() + "'"
                        ,ContractDetails.class);
                List<ContractDetails> ret2 = (List<ContractDetails>) query.getResultList();
                ret.addAll(ret2);
            }
            return ret;
        } finally {
            em.close();
        }
    }
    
    
    //---------------------------
    // request Sale
     /* cuong add */
       public List<Contract>  getContractByEmployeeAndStatusSale(int employeeID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT * FROM contract where employee_id='" + employeeID + "' And status like 'waitting for employee'",Contract.class);
            List<Contract> ret = (List<Contract>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }

     /* cuong add */
    public List<ContractDetails> getContractDetailsByEmployeeIDSale(int empID) {
            EntityManager em = getEntityManager();
        try {
            List<Contract> contractList = getContractByEmployeeAndStatusSale(empID);
            List<ContractDetails> ret = (List<ContractDetails>) new ArrayList<ContractDetails>();
            
            for (Contract contract : contractList) {
                Query query = em.createNativeQuery("SELECT * FROM contract_details where "
                        + "contract_id='" + contract.getId() + "'"
                        ,ContractDetails.class);
                List<ContractDetails> ret2 = (List<ContractDetails>) query.getResultList();
                ret.addAll(ret2);
            }
            return ret;
        } finally {
            em.close();
        }
    }
    
}
