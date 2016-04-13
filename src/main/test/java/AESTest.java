import org.mindrot.jbcrypt.BCrypt;
import org.springframework.test.context.TestExecutionListeners;
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

        for(int i = 0; i < 1000000000; i++);
        if (BCrypt.checkpw("123456", "$2a$10$aZcd.yqCDnC4LEteVnYI4.zVwSo6SYQMQFlut674WlA0cbY0Z.FN6")) {
            System.out.println("It matches");
        } else {
            System.out.println("It does not match");
        }
    }
}
