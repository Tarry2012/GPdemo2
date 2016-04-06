import utils.AESUtils;
import org.junit.Test;

/**
 * Created by tqy on 16/4/6.
 */
public class AESTest {

    @Test
    public  void AesTest(){
        String s = "18878186";
        String key = AESUtils.WEDDAO_KEY;
        String s1 = AESUtils.encrypt(s, key);
        String s2 = AESUtils.decrypt(s1, key);
        System.out.println(s);
        System.out.println(s1 + "  " + s1.length());
        System.out.println(s2);
    }
}
