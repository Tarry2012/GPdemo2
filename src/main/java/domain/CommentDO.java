package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class CommentDO {
    private String commentId;
    private String parentId;
    private String authorId;
    private String videoId;
    private String commentLike;
    private String commentContext;
    private String commentTime;
    private boolean isReply;

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public void setCommentLike(String commentLike) {
        this.commentLike = commentLike;
    }

    public void setCommentContext(String commentContext) {
        this.commentContext = commentContext;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public void setIsReply(boolean isReply) {
        this.isReply = isReply;
    }

    public String getCommentId() {
        return commentId;
    }

    public String getParentId() {
        return parentId;
    }

    public String getAuthorId() {
        return authorId;
    }

    public String getVideoId() {
        return videoId;
    }

    public String getCommentLike() {
        return commentLike;
    }

    public String getCommentContext() {
        return commentContext;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public boolean isReply() {
        return isReply;
    }

    @Override
    public String toString() {
        return "CommentDO{" +
                "commentId='" + commentId + '\'' +
                ", parentId='" + parentId + '\'' +
                ", authorId='" + authorId + '\'' +
                ", videoId='" + videoId + '\'' +
                ", commentLike='" + commentLike + '\'' +
                ", commentContext='" + commentContext + '\'' +
                ", commentTime='" + commentTime + '\'' +
                ", isReply=" + isReply +
                '}';
    }
}
