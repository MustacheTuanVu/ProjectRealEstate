package Entity;

import Entity.Contract;
import Entity.Customer;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(Transactions.class)
public class Transactions_ { 

    public static volatile SingularAttribute<Transactions, Integer> id;
    public static volatile SingularAttribute<Transactions, Date> transactionsDate;
    public static volatile SingularAttribute<Transactions, Double> money;
    public static volatile SingularAttribute<Transactions, Customer> customerOffered;
    public static volatile SingularAttribute<Transactions, Contract> contractId;
    public static volatile SingularAttribute<Transactions, String> transactionsNote;

}