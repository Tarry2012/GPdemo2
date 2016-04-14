import org.junit.Test;

/**
 * Created by tqy on 16/4/14.
 */
public class SimpleTest {

    @Test
    public void SimpleTest1(){
        String str = "已停业";
        String str2 = "影院名称, 影院地址, 已停业, 区域商圈";
        System.out.println(str2.contains(str));
    }
}
