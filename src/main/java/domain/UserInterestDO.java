package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class UserInterestDO {
    private int id;
    private int userId;
    private int interestId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getInterestId() {
        return interestId;
    }

    public void setInterestId(int interestId) {
        this.interestId = interestId;
    }

    @Override
    public String toString() {
        return "UserInterestDO{" +
                "id=" + id +
                ", userId=" + userId +
                ", interestId=" + interestId +
                '}';
    }
}
