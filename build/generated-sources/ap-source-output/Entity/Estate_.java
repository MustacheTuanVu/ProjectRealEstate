package Entity;

import Entity.AssignDetails;
import Entity.ContractDetails;
import Entity.EstateStatus;
import Entity.EstateType;
import Entity.FeatureDetails;
import Entity.ProjectDetails;
import Entity.Schedule;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-03-25T16:58:23")
@StaticMetamodel(Estate.class)
public class Estate_ { 

    public static volatile ListAttribute<Estate, FeatureDetails> featureDetailsList;
    public static volatile SingularAttribute<Estate, ContractDetails> contractDetails;
    public static volatile SingularAttribute<Estate, String> image5st;
    public static volatile SingularAttribute<Estate, EstateType> estateTypeId;
    public static volatile SingularAttribute<Estate, String> direction;
    public static volatile SingularAttribute<Estate, Integer> bedRoom;
    public static volatile SingularAttribute<Estate, String> address1;
    public static volatile SingularAttribute<Estate, String> block;
    public static volatile SingularAttribute<Estate, String> address2;
    public static volatile SingularAttribute<Estate, String> estateContent;
    public static volatile SingularAttribute<Estate, String> id;
    public static volatile SingularAttribute<Estate, String> image3st;
    public static volatile SingularAttribute<Estate, String> district;
    public static volatile SingularAttribute<Estate, String> image4st;
    public static volatile SingularAttribute<Estate, EstateStatus> estateStatusId;
    public static volatile SingularAttribute<Estate, String> estateName;
    public static volatile SingularAttribute<Estate, String> estateStatus;
    public static volatile ListAttribute<Estate, Schedule> scheduleList;
    public static volatile SingularAttribute<Estate, String> image2st;
    public static volatile SingularAttribute<Estate, Integer> bathRoom;
    public static volatile SingularAttribute<Estate, Date> dateAdd;
    public static volatile SingularAttribute<Estate, Date> yearBuild;
    public static volatile SingularAttribute<Estate, Double> price;
    public static volatile SingularAttribute<Estate, String> floor;
    public static volatile SingularAttribute<Estate, ProjectDetails> projectDetails;
    public static volatile SingularAttribute<Estate, Double> garages;
    public static volatile SingularAttribute<Estate, Double> areas;
    public static volatile SingularAttribute<Estate, String> estateDescription;
    public static volatile SingularAttribute<Estate, String> image1st;
    public static volatile SingularAttribute<Estate, AssignDetails> assignDetails;

}