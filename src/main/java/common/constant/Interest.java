package common.constant;

import org.apache.commons.lang3.StringUtils;

/**
 * Created by tqy on 16-5-11.
 */
public enum Interest {
    computer(1, "计算机"), literatrue(2, "文学"), science(3, "科学"), economy(4, "经济"), art(5, "艺术"), mentality(6, "心理");
    private Integer index;
    private String name;

    private Interest(Integer index, String name) {
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
        for (Interest interest : Interest.values()){
            if (interest.getIndex() == index){
                return interest.getName();
            }
        }
        return null;
    }
}
