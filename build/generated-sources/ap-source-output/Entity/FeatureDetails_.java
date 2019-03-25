package Entity;

import Entity.Estate;
import Entity.Features;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-03-25T16:58:22")
@StaticMetamodel(FeatureDetails.class)
public class FeatureDetails_ { 

    public static volatile SingularAttribute<FeatureDetails, Integer> featureDetailsId;
    public static volatile SingularAttribute<FeatureDetails, Features> featureId;
    public static volatile SingularAttribute<FeatureDetails, Estate> estateId;

}