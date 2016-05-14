package controller;

import com.alibaba.fastjson.JSONObject;
import domain.UserAuthsDO;
import domain.UserDO;
import domain.UserVideoDO;
import domain.VideoDO;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import service.UserAuthsService;
import service.UserService;
import service.UserVideoService;
import service.VideoService;

import javax.annotation.Resource;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by tqy on 16/3/14.
 */
@Scope("prototype")
@Controller
//类级别的，处理根url
@RequestMapping("")
public class UserController {
    private static Logger logger = Logger.getLogger(UserController.class);

    @Resource
    private UserService userService;
    @Resource
    private UserAuthsService userAuthsService;
    @Resource
    private UserVideoService userVideoService;
    @Resource
    private VideoService videoService;

    //方法级别,所以处理这种url: /demo/userLogin
    @RequestMapping(value = "/userLogin", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
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

    @RequestMapping(value = "/userRegister.{format}", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
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
            userDO.setUserId(userId);
            userDO.setUserPicture("default.png");
            userService.update(userDO);
            request.getSession().setAttribute("username", username);
            Cookie cookieUser = new Cookie("username", username);
            response.addCookie(cookieUser);
            String msg = "ok";
            return msg;
        }
    }

    @RequestMapping(value = "/checkOldPassword", method = RequestMethod.POST)
    @ResponseBody
    public String verifyPassword(HttpServletRequest request, HttpServletResponse response) {
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("checkOldPassword username is null");
            return "error";
        }

        UserAuthsDO userAuthsDO = userAuthsService.getByName(username);
        String inputPassword1 = request.getParameter("InputPassword1");
        if (userAuthsDO == null || !BCrypt.checkpw(inputPassword1, userAuthsDO.getLoginPassword())) {
            return "error";
        } else {
            return "ok";
        }
    }

    @RequestMapping(value = "/modifyPassword", method = RequestMethod.POST)
    @ResponseBody
    public String modifyPassword(HttpServletRequest request) {
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("username is null");
            return "error";
        }
        Integer userId = userService.getIdByName(username);
        String password = request.getParameter("InputPassword2");
        String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());
        if (userAuthsService.UpdatePassword(userId, passwordHash)) {
            return "ok";
        } else {
            return "error";
        }
    }

    @RequestMapping(value = "/modifyHead", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String modifyInfo(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("modifyPassword username is null");
            return "error";
        }
        Integer userId = userService.getIdByName(username);
        if (!file.isEmpty()) {
            try {
                String realpath = request.getSession().getServletContext().getRealPath("/resources/upload");
                String filename = file.getOriginalFilename();
                File newFile = new File(realpath + "/" + userId + "-" + filename);
                UserDO userDO = new UserDO();
                userDO.setUserId(userId);
                userDO.setUserPicture(newFile.getName());
                System.out.println("file: " + newFile.getName());
                FileUtils.copyInputStreamToFile(file.getInputStream(), newFile);
                if (userService.update(userDO)) {
                    return "ok";
                } else {
                    return "error";
                }
            } catch (IOException e) {
                logger.error("upload " + file.getOriginalFilename() + " error");
                return "error";
            }
        }
        return "error";
    }

    @RequestMapping(value = "/modifySex", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String modifySex(HttpServletRequest request) {
        String sex = request.getParameter("sex");
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("modifyPassword username is null");
            return "error";
        }
        Integer userId = userService.getIdByName(username);
        UserDO userDO = new UserDO();
        userDO.setUserId(userId);
        userDO.setUserSex(sex);
        if (userService.update(userDO)) {
            return "ok";
        } else {
            return "error";
        }
    }

    @RequestMapping(value = "baseInfo", produces = {"application/json;charset=UTF-8"})
    public String baseInfo(HttpServletRequest request, Model model) {
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("username is null");
            return "index";
        }
        Integer userId = userService.getIdByName(username);
        UserDO userDO = userService.getById(userId);
        model.addAttribute("username", username);
        model.addAttribute("picture", userDO.getUserPicture());
        return "jsp/user/base";
    }

    @RequestMapping(value = "/password", produces = {"application/json;charset=UTF-8"})
    public String interPassword(HttpServletRequest request, Model model) {
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("username is null");
            return "index";
        }
        model.addAttribute("username", username);
        return "jsp/user/password";
    }

    @RequestMapping(value = "/interest", produces = {"application/json;charset=UTF-8"})
    public String inerest(HttpServletRequest request, Model model) {
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("username is null");
            return "index";
        }
        Integer userId = userService.getIdByName(username);
        UserDO userDO = userService.getById(userId);
        model.addAttribute("username", username);
        model.addAttribute("picture", userDO.getUserPicture());
        return "jsp/user/interest";
    }

    @RequestMapping(value = "/comments", produces = {"application/json;charset=UTF-8"})
    public String comments(HttpServletRequest request, Model model) {
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("username is null");
            return "index";
        }
        Integer userId = userService.getIdByName(username);
        UserDO userDO = userService.getById(userId);
        model.addAttribute("username", username);
        model.addAttribute("picture", userDO.getUserPicture());
        return "jsp/user/comments";
    }

    @RequestMapping(value = "/note", produces = {"application/json;charset=UTF-8"})
    public String note(HttpServletRequest request, Model model) {
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("username is null");
            return "index";
        }
        Integer userId = userService.getIdByName(username);
        UserDO userDO = userService.getById(userId);
        model.addAttribute("username", username);
        model.addAttribute("picture", userDO.getUserPicture());
        return "jsp/user/note";
    }

    @RequestMapping(value = "/userHomepage{format}", produces = {"application/json;charset=UTF-8"})
    public String userHomepageLimit(HttpServletRequest request, Model model) {
        String username = (String) request.getSession().getAttribute("username");
        int limit = StringUtils.isEmpty(request.getParameter("limit")) ? 0 : Integer.parseInt(request.getParameter("limit"));
        int offset = StringUtils.isEmpty(request.getParameter("offset")) ? 3 : Integer.parseInt(request.getParameter("offset"));
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("username is null");
            return "index";
        }
        Integer userId = userService.getIdByName(username);
        UserDO userDO = userService.getById(userId);
        model.addAttribute("username", username);
        model.addAttribute("picture", userDO.getUserPicture());
        List<UserVideoDO> userVideoDOList = userVideoService.selectVideos(userId);
        if (userVideoDOList == null || limit >= userVideoDOList.size()) {
            logger.error("userVideoDOList is null");
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("videoDOList", null);
            model.addAttribute("videoDOList", jsonObject.toJSONString());
            return "jsp/user/userHomepage";
        }
        List<Integer> videoIdList = new ArrayList<>();
        for (UserVideoDO userVideoDO : userVideoDOList) {
            videoIdList.add(userVideoDO.getVideoId());
        }
        List<VideoDO> videoDOs = videoService.selectVideos(videoIdList);
        List<VideoDO> videoDOList = new ArrayList<>();
        //在内存中处理分页
        JSONObject jsonObject = new JSONObject();
        for (int i = limit; i < limit + offset; i++) {
            videoDOList.add(videoDOs.get(i));
        }
        jsonObject.put("videoDOList", videoDOList);
        model.addAttribute("videoDOList", jsonObject.toJSONString());
        return "jsp/user/userHomepage";
    }
}
