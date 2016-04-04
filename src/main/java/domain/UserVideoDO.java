package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class UserVideoDO {
    private String userId;
    private String videoId;
    private String typeId;
    private boolean idDelete;

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public void setIdDelete(boolean idDelete) {
        this.idDelete = idDelete;
    }

    public String getUserId() {
        return userId;
    }

    public String getVideoId() {
        return videoId;
    }

    public String getTypeId() {
        return typeId;
    }

    public boolean isIdDelete() {
        return idDelete;
    }

    @Override
    public String toString() {
        return "UserVideoDO{" +
                "userId='" + userId + '\'' +
                ", videoId='" + videoId + '\'' +
                ", typeId='" + typeId + '\'' +
                ", idDelete=" + idDelete +
                '}';
    }
}
