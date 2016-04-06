import org.mindrot.jbcrypt.BCrypt;
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

    @Test
    public void BCrypt(){
        String password = "123456";
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println("hash: " + hash);

        if (BCrypt.checkpw("123C", hash)) {
            System.out.println("It matches");
        } else {
            System.out.println("It does not match");
        }
    }
}
