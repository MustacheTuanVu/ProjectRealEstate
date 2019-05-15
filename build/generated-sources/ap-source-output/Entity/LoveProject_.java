package Entity;

import Entity.Project;
import Entity.Users;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(LoveProject.class)
public class LoveProject_ { 

    public static volatile SingularAttribute<LoveProject, Integer> id;
    public static volatile SingularAttribute<LoveProject, Users> idUser;
    public static volatile SingularAttribute<LoveProject, Project> idProject;

}