import common.AES;
import org.apache.axis.encoding.Base64;
import org.junit.Test;

/**
 * Created by tqy on 16/4/6.
 */
public class AESTest {

    @Test
    public  void AesTest(){
        String ID = "tqy12345678";

        String idEncrypt = AES.encrypt(ID);
        System.out.println(idEncrypt);
        String idDecrypt = AES.decrypt(idEncrypt);
        System.out.println(idDecrypt);
    }
}
