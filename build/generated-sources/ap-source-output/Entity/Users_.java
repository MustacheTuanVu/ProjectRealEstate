package Entity;

import Entity.Customer;
import Entity.Employee;
import Entity.Manager;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-03-25T16:58:22")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, Integer> id;
    public static volatile SingularAttribute<Users, String> username;
    public static volatile SingularAttribute<Users, Manager> manager;
    public static volatile SingularAttribute<Users, Boolean> status;
    public static volatile SingularAttribute<Users, String> role;
    public static volatile SingularAttribute<Users, Employee> employee;
    public static volatile SingularAttribute<Users, Customer> customer;
    public static volatile SingularAttribute<Users, String> password;

}