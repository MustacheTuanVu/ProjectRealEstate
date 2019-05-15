package Entity;

import Entity.Post;
import Entity.Project;
import Entity.ReplyComment;
import Entity.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:20")
@StaticMetamodel(Comment.class)
public class Comment_ { 

    public static volatile SingularAttribute<Comment, String> content;
    public static volatile SingularAttribute<Comment, Date> dateComment;
    public static volatile SingularAttribute<Comment, String> roleComment;
    public static volatile SingularAttribute<Comment, String> emailComment;
    public static volatile SingularAttribute<Comment, Users> idUser;
    public static volatile SingularAttribute<Comment, String> nameComment;
    public static volatile SingularAttribute<Comment, Post> idPost;
    public static volatile SingularAttribute<Comment, Project> idProject;
    public static volatile SingularAttribute<Comment, String> statusComment;
    public static volatile ListAttribute<Comment, ReplyComment> replyCommentList;
    public static volatile SingularAttribute<Comment, Integer> idComment;

}