package Entity;

import Entity.Contract;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-03-25T16:58:23")
@StaticMetamodel(ContractType.class)
public class ContractType_ { 

    public static volatile SingularAttribute<ContractType, Integer> id;
    public static volatile ListAttribute<ContractType, Contract> contractList;
    public static volatile SingularAttribute<ContractType, String> contractTypeName;

}