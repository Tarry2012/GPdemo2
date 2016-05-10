package domain;

import java.util.Date;

/**
 * Created by tqy on 16/4/4.
 */
public class CommentDO {
    private int commentId;
    private int parentId;
    private int authorId;
    private int videoId;
    private int commentLike;
    private String commentContent;
    private Date commentTime;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getCommentLike() {
        return commentLike;
    }

    public void setCommentLike(int commentLike) {
        this.commentLike = commentLike;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    @Override
    public String toString() {
        return "CommentDO{" +
                "commentId=" + commentId +
                ", parentId=" + parentId +
                ", authorId=" + authorId +
                ", videoId=" + videoId +
                ", commentLike=" + commentLike +
                ", commentContent='" + commentContent + '\'' +
                ", commentTime=" + commentTime +
                '}';
    }
}
