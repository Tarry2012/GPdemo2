package domain;

import java.util.Date;

/**
 * Created by tqy on 16-5-11.
 */
public class VideoQuery {
    private int videoId;
    private String videoName;
    private int interestId;
    private int limit;
    private int offset;
    private Date startTime;
    private Date endTime;

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public int getInterestId() {
        return interestId;
    }

    public void setInterestId(int interestId) {
        this.interestId = interestId;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "VideoQuery{" +
                "videoId=" + videoId +
                ", videoName='" + videoName + '\'' +
                ", interestId=" + interestId +
                ", limit=" + limit +
                ", offset=" + offset +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}

