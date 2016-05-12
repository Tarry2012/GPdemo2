package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class InterestDO {
    private int Id;
    private int userId;
    private int interestId;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
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
        return "InterestDO{" +
                "Id=" + Id +
                ", userId=" + userId +
                ", interestId=" + interestId +
                '}';
    }
}
