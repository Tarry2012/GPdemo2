package domain;

import java.util.Date;

/**
 * Created by songrunyu on 16-5-10.
 */
public class CommentTransDO {

    private int id;
    private String fullname;
    private int upvote_count;
    private String content;
    private Date created;
    private boolean user_has_upvoted = false;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getUpvote_count() {
        return upvote_count;
    }

    public void setUpvote_count(int upvote_count) {
        this.upvote_count = upvote_count;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public boolean isUser_has_upvoted() {
        return user_has_upvoted;
    }

    public void setUser_has_upvoted(boolean user_has_upvoted) {
        this.user_has_upvoted = user_has_upvoted;
    }

    @Override
    public String toString() {
        return "CommentTransDO{" +
                "id=" + id +
                ", fullname='" + fullname + '\'' +
                ", upvote_count=" + upvote_count +
                ", content='" + content + '\'' +
                ", created=" + created +
                ", user_has_upvoted=" + user_has_upvoted +
                '}';
    }
}
