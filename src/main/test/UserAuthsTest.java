import dao.UserAuthsDAO;
import domain.UserAuthsDO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.UserAuthsService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by tqy on 16/4/6.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserAuthsTest {
    @Resource
    UserAuthsService userAuthsService;

    @Test
    public void getById(){
        Map<String, Integer> paramMap = new HashMap<String, Integer>();
        paramMap.put("userId", 1);
        paramMap.put("loginType", 0);
        System.out.println(paramMap);
        System.out.println(userAuthsService);
        UserAuthsDO userAuthsDO = userAuthsService.getById(paramMap);
        if (userAuthsDO == null) {
            System.out.println("user is null");
        } else {
            System.out.println(userAuthsDO.toString());
        }
    }
}
