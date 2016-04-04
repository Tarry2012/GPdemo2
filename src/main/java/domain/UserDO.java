package domain;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by tqy on 16/3/14.
 */
public class UserDO implements Serializable{
    private int userId;
    private String userName;
    private String userPassword;
    private String userSex;
    private String userMail;
    private String userPicture;
    private String userHomePage;
    private int loginTimes;
    private Date lastLoginTime;

    public void setUserId(int useId) {
        this.userId = useId;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
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

    public String getUserPassword() {
        return userPassword;
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

    public String getUserMail() {
        return userMail;
    }

    public String getUserPicture() {
        return userPicture;
    }

    public String getUserHomePage() {
        return userHomePage;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    public void setUserPicture(String userPicture) {
        this.userPicture = userPicture;
    }

    public void setUserHomePage(String userHomePage) {
        this.userHomePage = userHomePage;
    }

    @Override
    public String toString() {
        return "UserDO{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userSex='" + userSex + '\'' +
                ", userMail='" + userMail + '\'' +
                ", userPicture='" + userPicture + '\'' +
                ", userHomePage='" + userHomePage + '\'' +
                ", loginTimes=" + loginTimes +
                ", lastLoginTime=" + lastLoginTime +
                '}';
    }
}
