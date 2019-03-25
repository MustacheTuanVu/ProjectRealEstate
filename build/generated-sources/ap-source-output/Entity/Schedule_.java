package Entity;

import Entity.Customer;
import Entity.Employee;
import Entity.Estate;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-03-25T16:58:23")
@StaticMetamodel(Schedule.class)
public class Schedule_ { 

    public static volatile SingularAttribute<Schedule, Integer> id;
    public static volatile SingularAttribute<Schedule, Date> contactTime;
    public static volatile SingularAttribute<Schedule, Employee> employeeId;
    public static volatile SingularAttribute<Schedule, Customer> customerId;
    public static volatile SingularAttribute<Schedule, String> contactContext;
    public static volatile SingularAttribute<Schedule, Estate> estateId;

}