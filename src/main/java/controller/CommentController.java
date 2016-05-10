package controller;

import dao.UserDAO;
import domain.CommentDO;
import domain.UserDO;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CommentService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by songrunyu on 16-5-9.
 */

@Scope("prototype")
@Controller
//类级别的，处理根url
@RequestMapping("")
public class CommentController {
    Logger logger = Logger.getLogger(CommentController.class);

    @Resource
    private CommentService commentService;
    @Resource
    private UserService userService;

    //方法级别,所以处理这种url: /demo/addComment
    @RequestMapping(value = "/addComment", method = RequestMethod.POST)

    public String addComment(HttpServletRequest request) {
        String username = null;
        Cookie[] cookies = request.getCookies();
        for(int i = 0; i < cookies.length; i++ ){
            if("username".equals(cookies[i].getName()))
            {
                username = cookies[i].getValue();
            }
        }
        System.out.println(username);
        String comment_content = request.getParameter("textarea");
        System.out.println("content: " + comment_content);
        Integer userId = userService.getIdByName(username);
        if(userId == null)
            System.out.println("userid is null");
        System.out.print(userId);

        CommentDO commentDO = new CommentDO();
        commentDO.setParentId(1);
        commentDO.setAuthorId(userId);
        commentDO.setCommentContent(comment_content);
        commentDO.setCommentLike(3);
        commentDO.setVideoId(123);
        commentService.add(commentDO);

        return "jsp/video";
    }
}
