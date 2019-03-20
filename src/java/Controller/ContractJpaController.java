/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
import Entity.ContractType;
import Entity.Customer;
import Entity.Employee;
import Entity.PaymentFrequency;
import java.util.List;
import java.util.Set;
import javax.faces.validator.Validator;
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
public class ContractJpaController implements Serializable {

    public ContractJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Contract contract) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            ContractType contractTypeId = contract.getContractTypeId();
            if (contractTypeId != null) {
                contractTypeId = em.getReference(contractTypeId.getClass(), contractTypeId.getId());
                contract.setContractTypeId(contractTypeId);
            }
            Customer customerId = contract.getCustomerId();
            if (customerId != null) {
                customerId = em.getReference(customerId.getClass(), customerId.getId());
                contract.setCustomerId(customerId);
            }
            Employee employeeId = contract.getEmployeeId();
            if (employeeId != null) {
                employeeId = em.getReference(employeeId.getClass(), employeeId.getId());
                contract.setEmployeeId(employeeId);
            }
            PaymentFrequency paymentFrequency = contract.getPaymentFrequency();
            if (paymentFrequency != null) {
                paymentFrequency = em.getReference(paymentFrequency.getClass(), paymentFrequency.getId());
                contract.setPaymentFrequency(paymentFrequency);
            }
            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            javax.validation.Validator validator =  factory.getValidator();

            Set<ConstraintViolation<Contract>> constraintViolations;
            constraintViolations = validator.validate(contract);

            if (constraintViolations.size() > 0 ) {
                System.out.println("Constraint Violations occurred..");
                for (ConstraintViolation<Contract> contraints : constraintViolations) {
                    System.out.println(contraints.getRootBeanClass().getSimpleName()+
                    "." + contraints.getPropertyPath() + " " + contraints.getMessage());
                }
            }
            em.persist(contract);
            if (contractTypeId != null) {
                contractTypeId.getContractList().add(contract);
                contractTypeId = em.merge(contractTypeId);
            }
            if (customerId != null) {
                customerId.getContractList().add(contract);
                customerId = em.merge(customerId);
            }
            if (employeeId != null) {
                employeeId.getContractList().add(contract);
                employeeId = em.merge(employeeId);
            }
            if (paymentFrequency != null) {
                paymentFrequency.getContractList().add(contract);
                paymentFrequency = em.merge(paymentFrequency);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findContract(contract.getId()) != null) {
                throw new PreexistingEntityException("Contract " + contract + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Contract contract) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Contract persistentContract = em.find(Contract.class, contract.getId());
            ContractType contractTypeIdOld = persistentContract.getContractTypeId();
            ContractType contractTypeIdNew = contract.getContractTypeId();
            Customer customerIdOld = persistentContract.getCustomerId();
            Customer customerIdNew = contract.getCustomerId();
            Employee employeeIdOld = persistentContract.getEmployeeId();
            Employee employeeIdNew = contract.getEmployeeId();
            PaymentFrequency paymentFrequencyOld = persistentContract.getPaymentFrequency();
            PaymentFrequency paymentFrequencyNew = contract.getPaymentFrequency();
            if (contractTypeIdNew != null) {
                contractTypeIdNew = em.getReference(contractTypeIdNew.getClass(), contractTypeIdNew.getId());
                contract.setContractTypeId(contractTypeIdNew);
            }
            if (customerIdNew != null) {
                customerIdNew = em.getReference(customerIdNew.getClass(), customerIdNew.getId());
                contract.setCustomerId(customerIdNew);
            }
            if (employeeIdNew != null) {
                employeeIdNew = em.getReference(employeeIdNew.getClass(), employeeIdNew.getId());
                contract.setEmployeeId(employeeIdNew);
            }
            if (paymentFrequencyNew != null) {
                paymentFrequencyNew = em.getReference(paymentFrequencyNew.getClass(), paymentFrequencyNew.getId());
                contract.setPaymentFrequency(paymentFrequencyNew);
            }
            contract = em.merge(contract);
            if (contractTypeIdOld != null && !contractTypeIdOld.equals(contractTypeIdNew)) {
                contractTypeIdOld.getContractList().remove(contract);
                contractTypeIdOld = em.merge(contractTypeIdOld);
            }
            if (contractTypeIdNew != null && !contractTypeIdNew.equals(contractTypeIdOld)) {
                contractTypeIdNew.getContractList().add(contract);
                contractTypeIdNew = em.merge(contractTypeIdNew);
            }
            if (customerIdOld != null && !customerIdOld.equals(customerIdNew)) {
                customerIdOld.getContractList().remove(contract);
                customerIdOld = em.merge(customerIdOld);
            }
            if (customerIdNew != null && !customerIdNew.equals(customerIdOld)) {
                customerIdNew.getContractList().add(contract);
                customerIdNew = em.merge(customerIdNew);
            }
            if (employeeIdOld != null && !employeeIdOld.equals(employeeIdNew)) {
                employeeIdOld.getContractList().remove(contract);
                employeeIdOld = em.merge(employeeIdOld);
            }
            if (employeeIdNew != null && !employeeIdNew.equals(employeeIdOld)) {
                employeeIdNew.getContractList().add(contract);
                employeeIdNew = em.merge(employeeIdNew);
            }
            if (paymentFrequencyOld != null && !paymentFrequencyOld.equals(paymentFrequencyNew)) {
                paymentFrequencyOld.getContractList().remove(contract);
                paymentFrequencyOld = em.merge(paymentFrequencyOld);
            }
            if (paymentFrequencyNew != null && !paymentFrequencyNew.equals(paymentFrequencyOld)) {
                paymentFrequencyNew.getContractList().add(contract);
                paymentFrequencyNew = em.merge(paymentFrequencyNew);
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
                Integer id = contract.getId();
                if (findContract(id) == null) {
                    throw new NonexistentEntityException("The contract with id " + id + " no longer exists.");
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
            Contract contract;
            try {
                contract = em.getReference(Contract.class, id);
                contract.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The contract with id " + id + " no longer exists.", enfe);
            }
            ContractType contractTypeId = contract.getContractTypeId();
            if (contractTypeId != null) {
                contractTypeId.getContractList().remove(contract);
                contractTypeId = em.merge(contractTypeId);
            }
            Customer customerId = contract.getCustomerId();
            if (customerId != null) {
                customerId.getContractList().remove(contract);
                customerId = em.merge(customerId);
            }
            Employee employeeId = contract.getEmployeeId();
            if (employeeId != null) {
                employeeId.getContractList().remove(contract);
                employeeId = em.merge(employeeId);
            }
            PaymentFrequency paymentFrequency = contract.getPaymentFrequency();
            if (paymentFrequency != null) {
                paymentFrequency.getContractList().remove(contract);
                paymentFrequency = em.merge(paymentFrequency);
            }
            em.remove(contract);
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

    public List<Contract> findContractEntities() {
        return findContractEntities(true, -1, -1);
    }

    public List<Contract> findContractEntities(int maxResults, int firstResult) {
        return findContractEntities(false, maxResults, firstResult);
    }

    private List<Contract> findContractEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Contract.class));
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

    public Contract findContract(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Contract.class, id);
        } finally {
            em.close();
        }
    }

    public int getContractCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Contract> rt = cq.from(Contract.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    public List<Integer> getContractByCustomer(int customerID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery("SELECT id FROM contract where customer_id='" + customerID + "'");
            System.out.println(query);
            List<Integer> ret = (List<Integer>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
	public List<Integer> getContractIDBy_CustomerID_EmployeeID(int cusID,int empID) {
       EntityManager em = getEntityManager();
        
       
       //q.setParameter("cusID", cusID);
       try {
            Query q=em.createNativeQuery("SELECT * FROM Contract WHERE "
                    + "customer_id = '"+cusID+"' AND "
                    + "employee_id = '"+empID+"'"
            );
            List<Integer> ret = (List<Integer>) q.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }
}
