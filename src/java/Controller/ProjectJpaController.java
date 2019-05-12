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
import Entity.Estate;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entity.Manager;
import Entity.Project;
import java.util.ArrayList;
import java.util.List;
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
public class ProjectJpaController implements Serializable {

    public ProjectJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Project project) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Manager managerId = project.getManagerId();
            if (managerId != null) {
                managerId = em.getReference(managerId.getClass(), managerId.getManagerId());
                project.setManagerId(managerId);
            }
            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            javax.validation.Validator validator = factory.getValidator();

            Set<ConstraintViolation<Project>> constraintViolations;
            constraintViolations = validator.validate(project);

            if (constraintViolations.size() > 0) {
                System.out.println("Constraint Violations occurred..");
                for (ConstraintViolation<Project> projects : constraintViolations) {
                    System.out.println(projects.getRootBeanClass().getSimpleName()
                            + "." + projects.getPropertyPath() + " " + projects.getMessage());
                }
            }
            em.persist(project);
            if (managerId != null) {
                managerId.getProjectList().add(project);
                managerId = em.merge(managerId);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            try {
                em.getTransaction().rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProject(project.getProjectId()) != null) {
                throw new PreexistingEntityException("Project " + project + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Project project) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Project persistentProject = em.find(Project.class, project.getProjectId());
            Manager managerIdOld = persistentProject.getManagerId();
            Manager managerIdNew = project.getManagerId();
            if (managerIdNew != null) {
                managerIdNew = em.getReference(managerIdNew.getClass(), managerIdNew.getManagerId());
                project.setManagerId(managerIdNew);
            }
            ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
            javax.validation.Validator validator = factory.getValidator();

            Set<ConstraintViolation<Project>> constraintViolations;
            constraintViolations = validator.validate(project);

            if (constraintViolations.size() > 0) {
                System.out.println("Constraint Violations occurred..");
                for (ConstraintViolation<Project> projects : constraintViolations) {
                    System.out.println(projects.getRootBeanClass().getSimpleName()
                            + "." + projects.getPropertyPath() + " " + projects.getMessage());
                }
            }
            project = em.merge(project);
            if (managerIdOld != null && !managerIdOld.equals(managerIdNew)) {
                managerIdOld.getProjectList().remove(project);
                managerIdOld = em.merge(managerIdOld);
            }
            if (managerIdNew != null && !managerIdNew.equals(managerIdOld)) {
                managerIdNew.getProjectList().add(project);
                managerIdNew = em.merge(managerIdNew);
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
                String id = project.getProjectId();
                if (findProject(id) == null) {
                    throw new NonexistentEntityException("The project with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Project project;
            try {
                project = em.getReference(Project.class, id);
                project.getProjectId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The project with id " + id + " no longer exists.", enfe);
            }
            Manager managerId = project.getManagerId();
            if (managerId != null) {
                managerId.getProjectList().remove(project);
                managerId = em.merge(managerId);
            }
            em.remove(project);
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

    public List<Project> findProjectEntities() {
        return findProjectEntities(true, -1, -1);
    }

    public List<Project> findProjectEntities(int maxResults, int firstResult) {
        return findProjectEntities(false, maxResults, firstResult);
    }

    private List<Project> findProjectEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Project.class));
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

    public Project findProject(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Project.class, id);
        } finally {
            em.close();
        }
    }

    public int getProjectCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Project> rt = cq.from(Project.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public List<Project> getProjectInSiderBar(
            String projectName,
            String district,
            String yearBuildFrom,
            String yearBuildTo,
            String dateFrom,
            String dateTo) {
        EntityManager em = getEntityManager();
        try {
            Query query = null;
            if (district.equals("all")) {
                query = em.createNativeQuery(
                        "SELECT * FROM project where "
                        + "project_name LIKE '%" + projectName + "%' AND "
                        //+ "district = '"+district+"' AND "
                        + "year_build > '" + yearBuildFrom + "' AND year_build < '" + yearBuildTo + "' AND "
                        + "date_add > '" + dateFrom + "' AND date_add < '" + dateTo + "' AND "
                        + "project_status = 'publish' "
                        + "ORDER BY date_add DESC", Project.class);
            } else {
                query = em.createNativeQuery(
                        "SELECT * FROM project where "
                        + "project_name LIKE '%" + projectName + "%' AND "
                        + "district = '" + district + "' AND "
                        + "year_build > '" + yearBuildFrom + "' AND year_build < '" + yearBuildTo + "' AND "
                        + "date_add > '" + dateFrom + "' AND date_add < '" + dateTo + "' AND "
                        + "project_status = 'publish' "
                        + "ORDER BY date_add DESC", Project.class);
            }
            System.out.println(query);
            List<Project> ret = (List<Project>) query.getResultList();
            return ret;
        } finally {
            em.close();
        }
    }

    public int getManagerByProjectCount(int managerID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery(
                    "SELECT count(*) FROM project where manager_id = '" + managerID + "' ");
            System.out.println(query);
            int ret = (int) query.getSingleResult();
            return ret;
        } finally {
            em.close();
        }
    }

    public int getManagerByProject(int projectID) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNativeQuery(
                    "SELECT manager_id FROM project where project_id = '" + projectID + "'");
            System.out.println(query);
            int ret = (int) query.getSingleResult();
            return ret;
        } finally {
            em.close();
        }
    }

    public Project getProjectByAddress(String address) {
        EntityManager em = getEntityManager();
        try {
            //Query query = em.createNativeQuery("SELECT estate_id FROM assign_details where employee_id='" + employeeID + "'", Estate.class);
            Query query = em.createNativeQuery("SELECT * FROM project where "
                    + "project_address='" + address + "'", Estate.class
            );
            if (!query.getResultList().isEmpty()) {
                Project ret = (Project) query.getSingleResult();
                return ret;
            } else {
                return null;
            }
        } finally {
            em.close();
        }
    }

    // cuong edit status project ->publish
    public List<Project> getProjectByManager(String managerID, String filter) {
        EntityManager em = getEntityManager();
        try {
            Query query = null;
            List<Project> ret = (List<Project>) new ArrayList<Project>();
            if (managerID.equals("all")) {
                if (filter.equals("all")) {
                    query = em.createNativeQuery("SELECT * FROM project "
                            //cuong edit
                            //+ "where project_status  like ('publish') and  [status] like ('publish') "
                            + "ORDER BY date_add DESC",
                            Project.class);
                } else {
                    // cuong edit
                    query = em.createNativeQuery("SELECT * FROM project "
                            //+ "where "
                            //+ "project_status LIKE '%publish%' AND "
                            //+ "status LIKE '%publish%' "
                            + "ORDER BY date_add DESC",
                            Project.class);
                }
                ret = (List<Project>) query.getResultList();
                return ret;
            } else {
                query = em.createNativeQuery("SELECT * FROM project where "
                        + "manager_id='" + managerID + "' "
                        //+ "and project_status  like ('publish') and  [status] like ('publish') "
                        + "ORDER BY date_add DESC", Project.class
                );
                if (!query.getResultList().isEmpty()) {
                    ret = (List<Project>) query.getResultList();
                    return ret;
                } else {
                    return null;
                }
            }
        } finally {
            em.close();
        }
    }
// cuong edit status ò project publish

    public List<String> getProjectByManagerSearch(String managerID, String address) {
        EntityManager em = getEntityManager();
        try {
            Query query = null;
            List<String> ret = (List<String>) new ArrayList<String>();
            if (managerID.equals("all")) {
                query = em.createNativeQuery("SELECT project_id FROM project where "
                        + "project_address LIKE N'%" + address + "%' "
                                + "AND "
                        + "project_status LIKE '%publish%' AND "
                        + "status LIKE '%publish%'"
                );
                if (query.getResultList().size() != 0) {
                    ret.add((String) query.getSingleResult());
                }
            } else {
                List<Project> projectList = getProjectByManager(managerID, "all");
                for (Project project : projectList) {
                    query = em.createNativeQuery("SELECT project_id FROM project where "
                            + "project_id = '" + project.getProjectId() + "' "
                                    + "AND "
                            + "project_address LIKE N'%" + address + "%' and project_status  like ('publish') and  [status] like ('publish') "
                    );
                    System.out.println(query);
                    if (query.getResultList().size() != 0) {
                        ret.add((String) query.getSingleResult());
                    }
                }

            }

            System.out.println(ret.size());
            return ret;
        } finally {
            em.close();
        }
    }

    // cuong add
    public int countRating(String idProject) {
        EntityManager em = getEntityManager();
        Query q = em.createNativeQuery("select count(*) from rating where id_project like '" + idProject + "'");
        return (int) q.getSingleResult();
    }

    // cuong add

    public List<Project> getListByStatusPublish() {
        EntityManager em = getEntityManager();
        Query q = em.createNativeQuery("select * from project where project_status  like ('publish') and  [status] like ('publish')");

        return q.getResultList();
    }

    // cuong add

    public int checkAddressProject(String address) {
        EntityManager em = getEntityManager();
        Query q = em.createNativeQuery("select count(project_id) as dem from project \n"
                + "where project_address like N'" + address + "' and project_status  like 'publish' and  [status] like 'publish'");

        return (int) q.getSingleResult();
    }

}
