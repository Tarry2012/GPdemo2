package domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by tqy on 16/3/14.
 */
public class UserDO implements Serializable{
    private int userId;
    private String userName;
    private String userSex;
    private String userPicture;
    private int loginTimes;
    private Date lastLoginTime;

    public void setUserId(int useId) {
        this.userId = useId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setLoginTimes(int loginTimes) {
        this.loginTimes = loginTimes;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public int getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }


    public int getLoginTimes() {
        return loginTimes;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public String getUserSex() {
        return userSex;
    }

    public String getUserPicture() {
        return userPicture;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public void setUserPicture(String userPicture) {
        this.userPicture = userPicture;
    }

    @Override
    public String toString() {
        return "UserDO{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userSex='" + userSex + '\'' +
                ", userPicture='" + userPicture + '\'' +
                ", loginTimes=" + loginTimes +
                ", lastLoginTime=" + lastLoginTime +
                '}';
    }
}
