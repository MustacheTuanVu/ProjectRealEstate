/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Cuong
 */
@Entity
@Table(name = "reply_comment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ReplyComment.findAll", query = "SELECT r FROM ReplyComment r"),
    @NamedQuery(name = "ReplyComment.findByIdReply", query = "SELECT r FROM ReplyComment r WHERE r.idReply = :idReply"),
    @NamedQuery(name = "ReplyComment.findByDateReply", query = "SELECT r FROM ReplyComment r WHERE r.dateReply = :dateReply"),
    @NamedQuery(name = "ReplyComment.findByStatusReply", query = "SELECT r FROM ReplyComment r WHERE r.statusReply = :statusReply"),
    @NamedQuery(name = "ReplyComment.findByRoleReply", query = "SELECT r FROM ReplyComment r WHERE r.roleReply = :roleReply")})
public class ReplyComment implements Serializable {
    @Size(max = 50)
    @Column(name = "name_reply")
    private String nameReply;
    @Size(max = 50)
    @Column(name = "email_reply")
    private String emailReply;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_reply")
    private Integer idReply;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "content")
    private String content;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_reply")
    @Temporal(TemporalType.DATE)
    private Date dateReply;
    @Size(max = 20)
    @Column(name = "status_reply")
    private String statusReply;
    @Size(max = 20)
    @Column(name = "role_reply")
    private String roleReply;
    @JoinColumn(name = "id_user", referencedColumnName = "id")
    @ManyToOne
    private Users idUser;
    @JoinColumn(name = "id_comment", referencedColumnName = "id_comment")
    @ManyToOne
    private Comment idComment;

    public ReplyComment() {
    }

    public ReplyComment(Integer idReply) {
        this.idReply = idReply;
    }

    public ReplyComment(Integer idReply, String content, Date dateReply) {
        this.idReply = idReply;
        this.content = content;
        this.dateReply = dateReply;
    }

    public Integer getIdReply() {
        return idReply;
    }

    public void setIdReply(Integer idReply) {
        this.idReply = idReply;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDateReply() {
        return dateReply;
    }

    public void setDateReply(Date dateReply) {
        this.dateReply = dateReply;
    }

    public String getStatusReply() {
        return statusReply;
    }

    public void setStatusReply(String statusReply) {
        this.statusReply = statusReply;
    }

    public String getRoleReply() {
        return roleReply;
    }

    public void setRoleReply(String roleReply) {
        this.roleReply = roleReply;
    }

    public Users getIdUser() {
        return idUser;
    }

    public void setIdUser(Users idUser) {
        this.idUser = idUser;
    }

    public Comment getIdComment() {
        return idComment;
    }

    public void setIdComment(Comment idComment) {
        this.idComment = idComment;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idReply != null ? idReply.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ReplyComment)) {
            return false;
        }
        ReplyComment other = (ReplyComment) object;
        if ((this.idReply == null && other.idReply != null) || (this.idReply != null && !this.idReply.equals(other.idReply))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.ReplyComment[ idReply=" + idReply + " ]";
    }

    public String getNameReply() {
        return nameReply;
    }

    public void setNameReply(String nameReply) {
        this.nameReply = nameReply;
    }

    public String getEmailReply() {
        return emailReply;
    }

    public void setEmailReply(String emailReply) {
        this.emailReply = emailReply;
    }
    
}
