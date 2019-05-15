package Entity;

import Entity.Contract;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:21")
@StaticMetamodel(PaymentFrequency.class)
public class PaymentFrequency_ { 

    public static volatile SingularAttribute<PaymentFrequency, Integer> id;
    public static volatile ListAttribute<PaymentFrequency, Contract> contractList;
    public static volatile SingularAttribute<PaymentFrequency, String> paymentFrequencyName;

}