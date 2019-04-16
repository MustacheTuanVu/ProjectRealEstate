/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Cuong
 */
@Entity
@Table(name = "comment")
@NamedQueries({
    @NamedQuery(name = "Comment.findAll", query = "SELECT c FROM Comment c")})
public class Comment implements Serializable {
    @OneToMany(mappedBy = "idComment")
    private List<ReplyComment> replyCommentList;
    private static final long serialVersionUID = 1L;
    @Id
      @Column(name = "id_comment", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idComment;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "content")
    private String content;
    @Column(name = "date_comment")
    @Temporal(TemporalType.DATE)
    private Date dateComment;
    @Size(max = 20)
    @Column(name = "status_comment")
    private String statusComment;
    @Size(max = 20)
    @Column(name = "role_comment")
    private String roleComment;
    @Size(max = 30)
    @Column(name = "name_comment")
    private String nameComment;
    @Size(max = 50)
    @Column(name = "email_comment")
    private String emailComment;
    @JoinColumn(name = "id_user", referencedColumnName = "id")
    @ManyToOne
    private Users idUser;
    @JoinColumn(name = "id_post", referencedColumnName = "post_id")
    @ManyToOne
    private Post idPost;

    public Comment() {
    }

    public Comment(Integer idComment) {
        this.idComment = idComment;
    }

    public Integer getIdComment() {
        return idComment;
    }

    public void setIdComment(Integer idComment) {
        this.idComment = idComment;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateComment() {
        return dateComment;
    }

    public void setDateComment(Date dateComment) {
        this.dateComment = dateComment;
    }

    public String getStatusComment() {
        return statusComment;
    }

    public void setStatusComment(String statusComment) {
        this.statusComment = statusComment;
    }

    public String getRoleComment() {
        return roleComment;
    }

    public void setRoleComment(String roleComment) {
        this.roleComment = roleComment;
    }

    public String getNameComment() {
        return nameComment;
    }

    public void setNameComment(String nameComment) {
        this.nameComment = nameComment;
    }

    public String getEmailComment() {
        return emailComment;
    }

    public void setEmailComment(String emailComment) {
        this.emailComment = emailComment;
    }

    public Users getIdUser() {
        return idUser;
    }

    public void setIdUser(Users idUser) {
        this.idUser = idUser;
    }

    public Post getIdPost() {
        return idPost;
    }

    public void setIdPost(Post idPost) {
        this.idPost = idPost;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idComment != null ? idComment.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Comment)) {
            return false;
        }
        Comment other = (Comment) object;
        if ((this.idComment == null && other.idComment != null) || (this.idComment != null && !this.idComment.equals(other.idComment))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Comment[ idComment=" + idComment + " ]";
    }

    public List<ReplyComment> getReplyCommentList() {
        return replyCommentList;
    }

    public void setReplyCommentList(List<ReplyComment> replyCommentList) {
        this.replyCommentList = replyCommentList;
    }
    
}
