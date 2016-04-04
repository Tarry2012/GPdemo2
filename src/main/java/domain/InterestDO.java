package domain;

/**
 * Created by tqy on 16/4/4.
 */
public class InterestDO {
    private String interestId;
    private String interestName;

    public String getInterestId() {
        return interestId;
    }

    public String getInterestName() {
        return interestName;
    }

    public void setInterestId(String interestId) {
        this.interestId = interestId;
    }

    public void setInterestName(String interestName) {
        this.interestName = interestName;
    }

    @Override
    public String toString() {
        return "InterestDO{" +
                "interestId='" + interestId + '\'' +
                ", interestName='" + interestName + '\'' +
                '}';
    }
}
