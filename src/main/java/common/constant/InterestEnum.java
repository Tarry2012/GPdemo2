package common.constant;

/**
 * Created by tqy on 16-5-11.
 */
public enum InterestEnum {
    computer(1, "computer"), literatrue(2, "literatrue"), science(3, "science"), economy(4, "economy"), art(5, "art"), mentality(6, "mentality");
    private Integer index;
    private String name;

    private InterestEnum(Integer index, String name) {
        this.index = index;
        this.name = name;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static String getName(int index){
        for (InterestEnum interestEnum : InterestEnum.values()){
            if (interestEnum.getIndex() == index){
                return interestEnum.getName();
            }
        }
        return null;
    }
}
