package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class VideoInterestDO {
    private String videoId;
    private String interestId;

    public String getVideoId() {
        return videoId;
    }

    public String getInterestId() {
        return interestId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public void setInterestId(String interestId) {
        this.interestId = interestId;
    }

    @Override
    public String toString() {
        return "VideoInterestDO{" +
                "videoId='" + videoId + '\'' +
                ", interestId='" + interestId + '\'' +
                '}';
    }
}
