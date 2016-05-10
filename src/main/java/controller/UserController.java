package controller;

import domain.UserAuthsDO;
import domain.UserDO;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserAuthsService;
import service.UserService;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


/**
 * Created by tqy on 16/3/14.
 */
@Scope("prototype")
@Controller
//类级别的，处理根url
@RequestMapping("")
public class UserController {
   Logger logger = Logger.getLogger(UserController.class);

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

        //用户密码加密,加密比较
        UserAuthsDO userAuthsDO = userAuthsService.getByName(loginName);
        System.out.println(userAuthsDO);
        if (userAuthsDO == null || !BCrypt.checkpw(userpassword, userAuthsDO.getLoginPassword())) {
            String msg = "error";
            return msg;
        }
        String username = userService.getById(userAuthsDO.getUserId()).getUserName();
        userService.updateLoginById(userAuthsDO.getUserId());
        request.getSession().setAttribute("username", username);
        Cookie cookieUser = new Cookie("username", username);
        response.addCookie(cookieUser);
        String msg = "ok";
        return msg;
    }

    @RequestMapping(value = "/userLogout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        //String reUrl = request.getContextPath() + "/index";
        return "index";
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
        String mail = request.getParameter("usermail");
        System.out.println(mail);
        List<String> mails = userAuthsService.getMails();
        System.out.println("a: " + mails);
        if (!mails.contains(mail)) {
            String msg = "ok";
            return msg;
        } else {
            String msg = "error";
            return msg;
        }
    }

    @RequestMapping(value = "/userRegister.{format}", method = RequestMethod.POST)
    @ResponseBody
    public String userRegister(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password1");
        String mail = request.getParameter("usermail");
        UserDO userDO = new UserDO();
        userDO.setUserName(username);
        int userId = userService.add(userDO);
        if (userId <= 0) {
            String msg = "error1";
            return msg;
        }
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
            request.getSession().setAttribute("username", username);
            Cookie cookieUser = new Cookie("username", username);
            response.addCookie(cookieUser);
            String msg = "ok";
            return msg;
        }
    }

    @RequestMapping(value = "/checkOldPassword", method = RequestMethod.POST)
    @ResponseBody
    public String verifyPassword(HttpServletRequest request, HttpServletResponse response){
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)){
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies){
                if (cookie.getName().equals("username")){
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)){
            logger.error(username + "is empty");
            return "error";
        }

        UserAuthsDO userAuthsDO = userAuthsService.getByName(username);
        String inputPassword1 = request.getParameter("InputPassword1");
        if (userAuthsDO == null || !BCrypt.checkpw(inputPassword1, userAuthsDO.getLoginPassword())){
            return "error";
        }else{
            return "ok";
        }
    }

    @RequestMapping(value = "/modifyPassword", method=RequestMethod.POST)
    @ResponseBody
    public String modifyPassword(HttpServletRequest request){
        String username = (String)request.getSession().getAttribute("username");
        return "";
    }
}
