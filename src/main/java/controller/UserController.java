package controller;

import domain.UserAuthsDO;
import domain.UserDO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserAuthsService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by tqy on 16/3/14.
 */
@Controller
//类级别的，处理根url
@RequestMapping("")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private UserAuthsService userAuthsService;

    //方法级别,所以处理这种url: /demo/userLogin
    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
        String username = request.getParameter("username");
        String userpassword = request.getParameter("password");
        System.out.println("username: " + username);
        boolean type = username.contains("@");
        UserDO user = userService.getById(username);
        //该用户名不存在
        if (user == null){
            String msg = "error";
            return  msg;
        }else{
            Map<String, Integer> paramMap = new HashMap<String, Integer>();
            paramMap.put("userId", user.getUserId());
            //用户昵称登录
            if (type == false){
                paramMap.put("loginType", 0);
                //用户邮箱登录
            }else{
                paramMap.put("loginType", 1);
            }
            UserAuthsDO userAuthsDO = userAuthsService.getById(paramMap);
            if (userAuthsDO == null || !userpassword.equals(userAuthsDO.getLoginPassword())){
                String msg = "error";
                return msg;
            }
            userService.updateLoginById(user.getUserId());
            request.getSession().setAttribute("username", user.getUserName());
            Cookie cookieUser = new Cookie("username", user.getUserName());
            String msg = "ok";
            return msg;
        }

    }

    @RequestMapping(value="/userLogout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "jsp/user/userLogout";
    }

    @RequestMapping(value = "/userRegister")
    @ResponseBody
    public boolean register(HttpServletRequest request){
        UserDO userDO = genUserDO(request);
        return false;
    }

    private UserDO genUserDO(HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String mail = request.getParameter("mail");
        UserDO userDO = new UserDO();
        userDO.setUserName(username);
        return userDO;
    }

}
