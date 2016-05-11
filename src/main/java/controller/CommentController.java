package controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import domain.CommentDO;
import domain.CommentTransDO;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CommentService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.xml.crypto.Data;
import java.util.ArrayList;
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

    //方法级别,所以处理这种url: /demo/video/addComment

    @RequestMapping(value = "/video/addComment", method = RequestMethod.POST)

    public String addComment(@RequestParam("content") String content,
                             @RequestParam("upvote_count") Integer upvote_count,
                             HttpServletRequest request) {
        System.out.println(content);
        System.out.println(upvote_count);

        String username = null;

        Cookie[] cookies = request.getCookies();
        for(int i = 0; i < cookies.length; i++ ){
            if("username".equals(cookies[i].getName()))
            {
                username = cookies[i].getValue();
            }
        }

        Integer userId = userService.getIdByName(username);
        System.out.print(userId);

        CommentDO commentDO = new CommentDO();
        commentDO.setParentId(1);
        commentDO.setAuthorId(userId);
        commentDO.setCommentContent(content);
        commentDO.setCommentLikes(upvote_count);
        commentDO.setVideoId(123);
        commentService.add(commentDO);

        return "jsp/video";
    }

    //方法级别,所以处理这种url: /demo/getComment?videoId=123
    @RequestMapping(value = "/video/getComment", method = RequestMethod.POST)
    @ResponseBody
    public String getComment(@RequestParam("videoId") Integer videoId) {
        List<CommentDO> comments = commentService.getCommentsByVideoId(videoId);
        List<CommentTransDO> commentTrans = new ArrayList<CommentTransDO>();

        for(CommentDO comment : comments) {
            CommentTransDO commentTransDO = new CommentTransDO();
            commentTransDO.setId(comment.getAuthorId());
            commentTransDO.setContent(comment.getCommentContent());
            commentTransDO.setCreated(comment.getCommentTime());
            String fullName = userService.getById(comment.getAuthorId()).getUserName();
            commentTransDO.setFullname(fullName);
            commentTransDO.setUpvote_count(comment.getCommentLikes());

            commentTrans.add(commentTransDO);
        }


        System.out.println(commentTrans);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data", commentTrans);
        String json=jsonObject.toJSONString();

        System.out.println("comment: " + json);
        return json;
    }
}