package domain;

/**
 * Created by tqy on 16/4/6.
 */
public class UserAuthsDO {
    private int id;
    private int userId;
    private int loginType;
    private String loginName;
    private String loginPassword;

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getLoginType() {
        return loginType;
    }

    public String getLoginName() {
        return loginName;
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setLoginType(int loginType) {
        this.loginType = loginType;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    @Override
    public String toString() {
        return "UserAuthsDO{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", loginType=" + loginType +
                ", loginName='" + loginName + '\'' +
                ", loginPassword='" + loginPassword + '\'' +
                '}';
    }
}
