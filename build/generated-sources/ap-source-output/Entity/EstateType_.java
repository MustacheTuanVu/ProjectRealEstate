package Entity;

import Entity.Estate;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(EstateType.class)
public class EstateType_ { 

    public static volatile SingularAttribute<EstateType, String> id;
    public static volatile SingularAttribute<EstateType, String> typeName;
    public static volatile ListAttribute<EstateType, Estate> estateList;

}