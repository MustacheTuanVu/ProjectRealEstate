package Entity;

import Entity.Project;
import Entity.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(Manager.class)
public class Manager_ { 

    public static volatile SingularAttribute<Manager, String> managerMail;
    public static volatile SingularAttribute<Manager, String> managerImg;
    public static volatile SingularAttribute<Manager, String> managerName;
    public static volatile SingularAttribute<Manager, String> managerIndentityCard;
    public static volatile SingularAttribute<Manager, Integer> managerId;
    public static volatile SingularAttribute<Manager, String> managerAddress;
    public static volatile SingularAttribute<Manager, String> managerPhone;
    public static volatile SingularAttribute<Manager, Users> userId;
    public static volatile SingularAttribute<Manager, String> managerContent;
    public static volatile ListAttribute<Manager, Project> projectList;

}