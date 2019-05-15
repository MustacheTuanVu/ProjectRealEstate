package Entity;

import Entity.Category;
import Entity.Comment;
import Entity.Employee;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(Post.class)
public class Post_ { 

    public static volatile SingularAttribute<Post, Category> postCategory;
    public static volatile SingularAttribute<Post, String> postTilte;
    public static volatile SingularAttribute<Post, String> postImage;
    public static volatile SingularAttribute<Post, Date> postDate;
    public static volatile SingularAttribute<Post, String> postContent;
    public static volatile SingularAttribute<Post, Employee> employee;
    public static volatile ListAttribute<Post, Comment> commentList;
    public static volatile SingularAttribute<Post, Integer> postId;

}