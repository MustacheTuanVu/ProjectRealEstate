package Entity;

import Entity.Comment;
import Entity.Manager;
import Entity.ProjectDetails;
import Entity.Rating;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(Project.class)
public class Project_ { 

    public static volatile SingularAttribute<Project, String> image5st;
    public static volatile SingularAttribute<Project, String> status;
    public static volatile SingularAttribute<Project, String> image2st;
    public static volatile SingularAttribute<Project, String> projectId;
    public static volatile SingularAttribute<Project, String> documentUrl;
    public static volatile SingularAttribute<Project, Date> yearBuild;
    public static volatile SingularAttribute<Project, Date> dateAdd;
    public static volatile SingularAttribute<Project, String> projectAddress;
    public static volatile SingularAttribute<Project, String> projectStatus;
    public static volatile SingularAttribute<Project, String> projectContent;
    public static volatile ListAttribute<Project, ProjectDetails> projectDetailsList;
    public static volatile SingularAttribute<Project, Double> floorNumber;
    public static volatile ListAttribute<Project, Rating> ratingList;
    public static volatile SingularAttribute<Project, Manager> managerId;
    public static volatile SingularAttribute<Project, String> image3st;
    public static volatile SingularAttribute<Project, String> district;
    public static volatile SingularAttribute<Project, String> projectName;
    public static volatile ListAttribute<Project, Comment> commentList;
    public static volatile SingularAttribute<Project, String> image1st;
    public static volatile SingularAttribute<Project, String> image4st;
    public static volatile SingularAttribute<Project, Integer> blockNumber;

}