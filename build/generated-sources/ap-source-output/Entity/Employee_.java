package Entity;

import Entity.AssignDetails;
import Entity.Contract;
import Entity.Post;
import Entity.Schedule;
import Entity.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(Employee.class)
public class Employee_ { 

    public static volatile SingularAttribute<Employee, Integer> id;
    public static volatile SingularAttribute<Employee, String> employeeIndentityCard;
    public static volatile ListAttribute<Employee, AssignDetails> assignDetailsList;
    public static volatile ListAttribute<Employee, Contract> contractList;
    public static volatile SingularAttribute<Employee, String> employeeContent;
    public static volatile ListAttribute<Employee, Schedule> scheduleList;
    public static volatile ListAttribute<Employee, Post> postList;
    public static volatile SingularAttribute<Employee, Users> userId;
    public static volatile SingularAttribute<Employee, String> employeeImg;
    public static volatile SingularAttribute<Employee, String> employeeMail;
    public static volatile SingularAttribute<Employee, String> employeeAddress;
    public static volatile SingularAttribute<Employee, String> employeePhone;
    public static volatile SingularAttribute<Employee, String> employeeName;

}