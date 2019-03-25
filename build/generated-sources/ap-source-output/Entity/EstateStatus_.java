package Entity;

import Entity.Estate;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-03-25T16:58:22")
@StaticMetamodel(EstateStatus.class)
public class EstateStatus_ { 

    public static volatile SingularAttribute<EstateStatus, Integer> id;
    public static volatile ListAttribute<EstateStatus, Estate> estateList;
    public static volatile SingularAttribute<EstateStatus, String> estateStatusName;

}