package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class UserVideoDO {
    private int id;
    private int userId;
    private int videoId;
    private boolean isDelete;
    private boolean isLike;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    public boolean isLike() {
        return isLike;
    }

    public void setIsLike(boolean isLike) {
        this.isLike = isLike;
    }

    @Override
    public String toString() {
        return "UserVideoDO{" +
                "id=" + id +
                ", userId=" + userId +
                ", videoId=" + videoId +
                ", isDelete=" + isDelete +
                ", isLike=" + isLike +
                '}';
    }
}
