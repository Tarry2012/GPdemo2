package domain;

/**
 * Created by tqy on 16-5-12.
 */
public class VideoUpdate {
    private int videoId;
    private boolean videoPlay;
    private boolean videoLike;

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public boolean isVideoPlay() {
        return videoPlay;
    }

    public void setVideoPlay(boolean videoPlay) {
        this.videoPlay = videoPlay;
    }

    public boolean isVideoLike() {
        return videoLike;
    }

    public void setVideoLike(boolean videoLike) {
        this.videoLike = videoLike;
    }

    @Override
    public String toString() {
        return "VideoUpdate{" +
                "videoId=" + videoId +
                ", videoPlay=" + videoPlay +
                ", videoLike=" + videoLike +
                '}';
    }
}
