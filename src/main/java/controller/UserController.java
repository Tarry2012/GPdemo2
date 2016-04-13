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
        String loginName = request.getParameter("loginName");
        String userpassword = request.getParameter("password");
        System.out.println("loginName: " + loginName);

        //用户密码加密,加密比较
        UserAuthsDO userAuthsDO = userAuthsService.getByName(loginName);
        System.out.println(userAuthsDO);
        if (userAuthsDO == null || !BCrypt.checkpw(userpassword,userAuthsDO.getLoginPassword())) {
            String msg = "error";
            return msg;
        }
        String username = userService.getById(userAuthsDO.getUserId()).getUserName();
        request.getSession().setAttribute("username", username);
        Cookie cookieUser = new Cookie("username", username);
        response.addCookie(cookieUser);
        String msg = "ok";
        return msg;
    }

    @RequestMapping(value = "/userLogout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "jsp/user/userLogout";
    }

    @RequestMapping(value = "/userIsExist.{format}", method = RequestMethod.GET)
    @ResponseBody
    public String nameIsExist(HttpServletRequest request) {
        String username = request.getParameter("username");
        List<String> names = userService.getNames();
        System.out.println(names);
        if (!names.contains(username)) {
            String msg = "ok";
            return msg;
        } else {
            String msg = "error";
            return msg;
        }
    }

    @RequestMapping(value = "/mailIsExist.{format}", method = RequestMethod.GET)
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
    public String userRegister(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password1");
        String mail = request.getParameter("usermail");
        if (userService.add(username) <= 0) {
            String msg = "error1";
            return msg;
        }
        int userId = userService.selectLastId();
        UserAuthsDO userAuthsDO1 = new UserAuthsDO();
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
        if (!userAuthsService.add(userAuthsDO1) || !userAuthsService.add(userAuthsDO2)) {
            String msg = "error2";
            return msg;
        } else {
            String msg = "ok";
            return msg;
        }
    }


}
