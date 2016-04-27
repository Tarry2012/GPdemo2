package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class InterestDO {
    private int interestId;
    private String interestName;

    public int getInterestId() {
        return interestId;
    }

    public void setInterestId(int interestId) {
        this.interestId = interestId;
    }

    public String getInterestName() {
        return interestName;
    }

    public void setInterestName(String interestName) {
        this.interestName = interestName;
    }

    @Override
    public String toString() {
        return "InterestDO{" +
                "interestId=" + interestId +
                ", interestName='" + interestName + '\'' +
                '}';
    }
}
