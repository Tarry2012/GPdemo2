package controller;

import domain.CommentDO;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CommentService;

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

    //方法级别,所以处理这种url: /demo/addComment
    @RequestMapping(value = "/addComment.{format}", method = RequestMethod.POST)
    @ResponseBody
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
        CommentDO commentDO=null;
        commentService.add( commentDO);
        if (!comment_content.contains(comment_content)) {
            String msg = "ok";
            return msg;
        } else {
            String msg = "error";
            return msg;
        }
    }
}
