package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class UserInterestDO {
    private String userUd;
    private String interestId;

    public void setUserUd(String userUd) {
        this.userUd = userUd;
    }

    public void setInterestId(String interestId) {
        this.interestId = interestId;
    }

    public String getUserUd() {
        return userUd;
    }

    public String getInterestId() {
        return interestId;
    }

    @Override
    public String toString() {
        return "UserInterestDO{" +
                "userUd='" + userUd + '\'' +
                ", interestId='" + interestId + '\'' +
                '}';
    }
}
