package Entity;

import Entity.Project;
import Entity.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(Rating.class)
public class Rating_ { 

    public static volatile SingularAttribute<Rating, String> catRating;
    public static volatile SingularAttribute<Rating, Users> idUser;
    public static volatile SingularAttribute<Rating, Integer> idRating;
    public static volatile SingularAttribute<Rating, Integer> pointRating;
    public static volatile SingularAttribute<Rating, Project> idProject;

}