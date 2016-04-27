package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class UserVideoDO {
    private int id;
    private int userId;
    private int videoId;
    private boolean idDelete;

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

    public boolean isIdDelete() {
        return idDelete;
    }

    public void setIdDelete(boolean idDelete) {
        this.idDelete = idDelete;
    }

    @Override
    public String toString() {
        return "UserVideoDO{" +
                "id=" + id +
                ", userId=" + userId +
                ", videoId=" + videoId +
                ", idDelete=" + idDelete +
                '}';
    }
}
