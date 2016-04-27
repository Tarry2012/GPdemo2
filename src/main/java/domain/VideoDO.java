package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class VideoDO {
    private int videoId;
    private String videoName;
    private String videoDescribe;
    private String videoTime;
    private String videoUrl;
    private String videoComment;
    private String videoLike;
    private String videoPlay;
    private int interestId;

    public String getVideoName() {
        return videoName;
    }

    public String getVideoDescribe() {
        return videoDescribe;
    }

    public String getVideoTime() {
        return videoTime;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public String getVideoComment() {
        return videoComment;
    }

    public String getVideoLike() {
        return videoLike;
    }

    public String getVideoPlay() {
        return videoPlay;
    }

    public void setVideoPlay(String videoPlay) {
        this.videoPlay = videoPlay;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public void setVideoDescribe(String videoDescribe) {
        this.videoDescribe = videoDescribe;
    }

    public void setVideoTime(String videoTime) {
        this.videoTime = videoTime;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public void setVideoComment(String videoCommment) {
        this.videoComment = videoCommment;
    }

    public void setVideoLike(String videoLike) {
        this.videoLike = videoLike;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getInterestId() {
        return interestId;
    }

    public void setInterestId(int interestId) {
        this.interestId = interestId;
    }

    @Override
    public String toString() {
        return "VideoDO{" +
                "videoId=" + videoId +
                ", videoName='" + videoName + '\'' +
                ", videoDescribe='" + videoDescribe + '\'' +
                ", videoTime='" + videoTime + '\'' +
                ", videoUrl='" + videoUrl + '\'' +
                ", videoComment='" + videoComment + '\'' +
                ", videoLike='" + videoLike + '\'' +
                ", videoPlay='" + videoPlay + '\'' +
                ", interestId=" + interestId +
                '}';
    }
}
