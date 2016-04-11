import domain.UserDO;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.UserService;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

/**
 * Created by tqy on 16/3/14.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserTest extends AbstractJUnit4SpringContextTests{

    @Resource
    UserService userService;
    @Test
    public void findByName() {
        System.out.println(userService);
        UserDO user = userService.getById("test1");
        if (user == null) {
            System.out.println("user is null");
        } else {
            System.out.println(user.toString());
        }
    }

    @Test
    public void updateUserLoginInfo(){
        HttpServletRequest request = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null){
            for (Cookie cookie : cookies){
                String name = cookie.getName();
                String value = cookie.getValue();
                if (name.equals("username") && value.equals("password")){
                    break;
                }else{

                }
            }
        }

        System.out.println(userService.updateLoginById(2));

    }

    @Test
    public void StringTest(){
        String test = "a,b,c,d";
        String[] res = test.split(",");
        List<String> listRest = new ArrayList<String>();

        for (String i : res){
            System.out.println(i);
            listRest.add(i);
        }
        System.out.println(listRest);
    }


}