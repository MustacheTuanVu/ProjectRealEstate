package Entity;

import Entity.Employee;
import Entity.Estate;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-03-25T16:58:23")
@StaticMetamodel(AssignDetails.class)
public class AssignDetails_ { 

    public static volatile SingularAttribute<AssignDetails, Integer> id;
    public static volatile SingularAttribute<AssignDetails, Employee> employeeId;
    public static volatile SingularAttribute<AssignDetails, Date> dateTo;
    public static volatile SingularAttribute<AssignDetails, Estate> estateId;

}