import common.AES;
import org.apache.axis.encoding.Base64;
import org.junit.Test;

/**
 * Created by tqy on 16/4/6.
 */
public class AESTest {

    @Test
    public  void AesTest(){
        String content = "test";
        String password = "12345678";
        //加密
        System.out.println("加密前：" + content);
        byte[] encryptResult = AES.encrypt(content, password);
        String tt4 = Base64.encode(encryptResult);
        System.out.println(new String(tt4));

        //解密
        byte[] decryptResult = AES.decrypt(encryptResult,password);
        System.out.println("解密后：" + new String(decryptResult));
    }
}
