package controller;

import domain.UserDO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Created by tqy on 16/3/14.
 */
@Controller
//类级别的，处理根url
@RequestMapping("")
public class UserController {

    @Resource
    private UserService userService;

    //方法级别,所以处理这种url: /demo/userLogin
    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    @ResponseBody
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
        String username = request.getParameter("username");
        String userpassword = request.getParameter("password");
        System.out.println("username: " + username);
        UserDO user = userService.getById(username);
        if (user == null || !userpassword.equals(user.getUserPassword())) {
            String msg = "error";
            return msg;
        }else{
            request.getSession().setAttribute("username", username);
            Cookie cookieuser = new Cookie("username", username);
            response.addCookie(cookieuser);
            userService.updateLoginById(user.getUserId());
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
        userDO.setUserPassword(password);
        userDO.setUserMail(mail);
        return userDO;
    }

}
