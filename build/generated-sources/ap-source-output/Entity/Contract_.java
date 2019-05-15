package Entity;

import Entity.ContractType;
import Entity.Customer;
import Entity.Employee;
import Entity.PaymentFrequency;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:21")
@StaticMetamodel(Contract.class)
public class Contract_ { 

    public static volatile SingularAttribute<Contract, Integer> id;
    public static volatile SingularAttribute<Contract, Date> dateSigned;
    public static volatile SingularAttribute<Contract, Employee> employeeId;
    public static volatile SingularAttribute<Contract, Double> paymentAmount;
    public static volatile SingularAttribute<Contract, String> contractDetails;
    public static volatile SingularAttribute<Contract, Customer> customerId;
    public static volatile SingularAttribute<Contract, String> status;
    public static volatile SingularAttribute<Contract, Double> feePrecentage;
    public static volatile SingularAttribute<Contract, PaymentFrequency> paymentFrequency;
    public static volatile SingularAttribute<Contract, String> documentUrl;
    public static volatile SingularAttribute<Contract, ContractType> contractTypeId;

}