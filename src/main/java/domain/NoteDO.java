package domain;

import java.util.Date;

/**
 * Created by tqy on 16/4/4.
 */
public class NoteDO {
    private int noteId;
    private int userId;
    private int videoId;
    private String noteName;
    private Date noteTime;
    private String noteContent;

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
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

    public String getNoteName() {
        return noteName;
    }

    public void setNoteName(String noteName) {
        this.noteName = noteName;
    }

    public Date getNoteTime() {
        return noteTime;
    }

    public void setNoteTime(Date noteTime) {
        this.noteTime = noteTime;
    }

    public String getNoteContent() {
        return noteContent;
    }

    public void setNoteContent(String noteContent) {
        this.noteContent = noteContent;
    }

    @Override
    public String toString() {
        return "NoteDO{" +
                "noteId=" + noteId +
                ", userId=" + userId +
                ", videoId=" + videoId +
                ", noteName='" + noteName + '\'' +
                ", noteTime=" + noteTime +
                ", noteContent='" + noteContent + '\'' +
                '}';
    }
}
