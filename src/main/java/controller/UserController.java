package controller;

import domain.UserAuthsDO;
import domain.UserDO;
import org.mindrot.jbcrypt.BCrypt;
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
import java.util.List;
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
        if (user == null) {
            String msg = "error";
            return msg;
        } else {
            Map<String, Integer> paramMap = new HashMap<String, Integer>();
            paramMap.put("userId", user.getUserId());
            //用户昵称登录
            if (type == false) {
                paramMap.put("loginType", 0);
                //用户邮箱登录
            } else {
                paramMap.put("loginType", 1);
            }
            UserAuthsDO userAuthsDO = userAuthsService.getById(paramMap);
            //当加入密码是这么样做
            //String passwordHash = BCrypt.hashpw(userpassword, BCrypt.gensalt());
            //if (userAuthsDO == null || !BCrypt.checkpw(userAuthsDO.getLoginPassword(), passwordHash))) {
            if (userAuthsDO == null || !userpassword.equals(userAuthsDO.getLoginPassword())) {
                String msg = "error";
                return msg;
            }
            userService.updateLoginById(user.getUserId());
            request.getSession().setAttribute("username", user.getUserName());
            Cookie cookieUser = new Cookie("username", user.getUserName());
            response.addCookie(cookieUser);
            String msg = "ok";
            return msg;
        }

    }

    @RequestMapping(value = "/userLogout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "jsp/user/userLogout";
    }

    @RequestMapping(value = "/userIsExist", method = RequestMethod.GET)
    @ResponseBody
    public String nameIsExist(HttpServletRequest request) {
        String username = request.getParameter("username");
        List<String> names = userService.getNames();
        if (!names.contains(username)) {
            String msg = "ok";
            return msg;
        } else {
            String msg = "error";
            return msg;
        }
    }

    @RequestMapping(value = "/mailIsExist", method = RequestMethod.GET)
    @ResponseBody
    public String mailIsExist(HttpServletRequest request) {
        String mail = request.getParameter("mail");
        List<String> mails = userAuthsService.getMails();
        if (!mails.contains(mail)) {
            String msg = "ok";
            return msg;
        } else {
            String msg = "error";
            return msg;
        }
    }

    @RequestMapping(value = "/userRegister", method = RequestMethod.POST)
    @ResponseBody
    public String userRegister(HttpServletRequest request){
        String username = request.getParameter("username");
        String password = request.getParameter("password1");
        String mail = request.getParameter("usermail");
        if (userService.add(username) <= 0){
            String msg = "error1";
            return msg;
        }
        int userId = userService.selectLastId();
        UserAuthsDO userAuthsDO1= new UserAuthsDO();
        userAuthsDO1.setUserId(userId);
        //0表示用户名登录
        userAuthsDO1.setLoginType(0);
        userAuthsDO1.setLoginName(username);
        String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());
        userAuthsDO1.setLoginPassword(passwordHash);

        UserAuthsDO userAuthsDO2 = new UserAuthsDO();
        userAuthsDO2.setUserId(userId);
        //1表示邮箱登录
        userAuthsDO2.setLoginType(1);
        userAuthsDO2.setLoginName(mail);
        userAuthsDO2.setLoginPassword(passwordHash);
        if (!userAuthsService.add(userAuthsDO1) || !userAuthsService.add(userAuthsDO2)){
            String msg = "error2";
            return msg;
        }else{
            String msg = "ok";
            return msg;
        }
    }


}
