package Entity;

import Entity.Contract;
import Entity.Schedule;
import Entity.Transactions;
import Entity.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-03-25T16:58:22")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, Integer> id;
    public static volatile SingularAttribute<Customer, String> customerName;
    public static volatile SingularAttribute<Customer, String> mail;
    public static volatile SingularAttribute<Customer, String> customerContent;
    public static volatile SingularAttribute<Customer, String> phone;
    public static volatile SingularAttribute<Customer, String> customerIndentityCard;
    public static volatile ListAttribute<Customer, Contract> contractList;
    public static volatile ListAttribute<Customer, Schedule> scheduleList;
    public static volatile SingularAttribute<Customer, Users> userId;
    public static volatile SingularAttribute<Customer, String> customerAddress;
    public static volatile ListAttribute<Customer, Transactions> transactionsList;
    public static volatile SingularAttribute<Customer, String> customerImg;

}