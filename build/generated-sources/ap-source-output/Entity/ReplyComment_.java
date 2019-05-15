package Entity;

import Entity.Comment;
import Entity.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-14T12:49:21")
@StaticMetamodel(ReplyComment.class)
public class ReplyComment_ { 

    public static volatile SingularAttribute<ReplyComment, String> content;
    public static volatile SingularAttribute<ReplyComment, String> nameReply;
    public static volatile SingularAttribute<ReplyComment, Integer> idReply;
    public static volatile SingularAttribute<ReplyComment, String> emailReply;
    public static volatile SingularAttribute<ReplyComment, Users> idUser;
    public static volatile SingularAttribute<ReplyComment, Date> dateReply;
    public static volatile SingularAttribute<ReplyComment, String> statusReply;
    public static volatile SingularAttribute<ReplyComment, String> roleReply;
    public static volatile SingularAttribute<ReplyComment, Comment> idComment;

}