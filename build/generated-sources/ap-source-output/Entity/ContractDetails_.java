package Entity;

import Entity.Contract;
import Entity.Estate;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:21")
@StaticMetamodel(ContractDetails.class)
public class ContractDetails_ { 

    public static volatile SingularAttribute<ContractDetails, Integer> id;
    public static volatile SingularAttribute<ContractDetails, Contract> contractId;
    public static volatile SingularAttribute<ContractDetails, Estate> estateId;

}