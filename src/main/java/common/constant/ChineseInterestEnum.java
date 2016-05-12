package common.constant;

/**
 * Created by tqy on 16-5-12.
 */
public enum ChineseInterestEnum {
    computer(1, "计算机"), literatrue(2, "文学"), science(3, "科学"), economy(4, "经济"), art(5, "艺术"), mentality(6, "心理");
    private Integer index;
    private String name;

    private ChineseInterestEnum(Integer index, String name) {
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
        for (ChineseInterestEnum chineseInterestEnum : ChineseInterestEnum.values()){
            if (chineseInterestEnum.getIndex() == index){
                return chineseInterestEnum.getName();
            }
        }
        return null;
    }
    public static Integer getIndex(String name){
        for (ChineseInterestEnum chineseInterestEnum : ChineseInterestEnum.values()){
            if (chineseInterestEnum.getName().equals(name)){
                return chineseInterestEnum.getIndex();
            }
        }
        return 1;
    }
}
