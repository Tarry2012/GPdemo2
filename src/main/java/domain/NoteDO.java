package domain;

import java.util.Date;

/**
 * Created by tqy on 16/4/4.
 */
public class NoteDO {
    private String userId;
    private String videoId;
    private String noteName;
    private Date noteTime;
    private String noteAddress;

    public String getUserId() {
        return userId;
    }

    public String getVideoId() {
        return videoId;
    }

    public String getNoteName() {
        return noteName;
    }

    public Date getNoteTime() {
        return noteTime;
    }

    public String getNoteAddress() {
        return noteAddress;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public void setNoteName(String noteName) {
        this.noteName = noteName;
    }

    public void setNoteTime(Date noteTime) {
        this.noteTime = noteTime;
    }

    public void setNoteAddress(String noteAddress) {
        this.noteAddress = noteAddress;
    }

    @Override
    public String toString() {
        return "NoteDO{" +
                "userId='" + userId + '\'' +
                ", videoId='" + videoId + '\'' +
                ", noteName='" + noteName + '\'' +
                ", noteTime=" + noteTime +
                ", noteAddress='" + noteAddress + '\'' +
                '}';
    }
}
