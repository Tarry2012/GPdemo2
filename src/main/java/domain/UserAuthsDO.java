package domain;

/**
 * Created by tqy on 16/4/6.
 */
public class UserAuthsDO {
    private String id;
    private String userId;
    private int logintype;
    private String loginName;
    private String password;

    public String getId() {
        return id;
    }

    public String getUserId() {
        return userId;
    }

    public int getLogintype() {
        return logintype;
    }

    public String getLoginName() {
        return loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setLogintype(int logintype) {
        this.logintype = logintype;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserAuthorDO{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", logintype=" + logintype +
                ", loginName='" + loginName + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
