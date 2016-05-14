package controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import domain.CommentDO;
import domain.CommentTransDO;
import domain.VideoQuery;
import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.CommentService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public String addComment(@RequestParam("comment") String comment,
                             @RequestParam("videoId") Integer videoId,
                             HttpServletRequest request){
        JSONObject jsonObject = JSON.parseObject(comment);
        System.out.println(jsonObject);
        String username = null;

        Cookie[] cookies = request.getCookies();
        for(int i = 0; i < cookies.length; i++ ){
            if("username".equals(cookies[i].getName()))
            {
                username = cookies[i].getValue();
            }
        }

        Integer userId = userService.getIdByName(username);

        CommentDO commentDO = new CommentDO();
        commentDO.setParentId(1);
        commentDO.setAuthorId(userId);
        commentDO.setCommentContent(jsonObject.getString("content"));
        commentDO.setCommentLikes(jsonObject.getInteger("upvote_count"));
        commentDO.setVideoId(videoId);

        commentService.add(commentDO);

        return "/jsp/video";
    }

    //方法级别,所以处理这种url: /demo/getComment?videoId=123
    @RequestMapping(value = "/video/getComment", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getComment(@RequestParam("videoId") Integer videoId , HttpServletResponse response) {
        List<CommentDO> comments = commentService.getCommentsByVideoId(videoId);
        List<CommentTransDO> commentTrans = new ArrayList<CommentTransDO>();

        for(CommentDO comment : comments) {
            CommentTransDO commentTransDO = new CommentTransDO();
            //commend_id
            commentTransDO.setId(comment.getCommentId());
            //fullname
            String fullName = userService.getById(comment.getAuthorId()).getUserName();
            commentTransDO.setFullname(fullName);
            //content
            commentTransDO.setContent(comment.getCommentContent());
            //time
            commentTransDO.setCreated(comment.getCommentTime());
            //likes
            commentTransDO.setUpvote_count(comment.getCommentLikes());
            //profilePictureURL
            String profilePictureURL = userService.getById(comment.getAuthorId()).getUserPicture();
            commentTransDO.setProfilePictureURL("/demo/src/main/webapp/resources/upload/"+profilePictureURL);

            commentTrans.add(commentTransDO);
        }


        System.out.println(commentTrans);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("data", commentTrans);
        String json=jsonObject.toJSONString();

        System.out.println("comment: " + json);

        return json;
    }


    //方法级别,所以处理这种url: /demo/comment/getCommentByUserId
    @RequestMapping(value = "/comment/getCommentByUserId", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getCommentByUserId(HttpServletRequest request) {

        String username = null;

        Cookie[] cookies = request.getCookies();
        for(int i = 0; i < cookies.length; i++ ){
            if("username".equals(cookies[i].getName()))
            {
                username = cookies[i].getValue();
            }
        }

        Integer userId = userService.getIdByName(username);


        List<CommentDO> commentDOs = commentService.getContentByUserId(userId);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("comment", commentDOs);
        String json=jsonObject.toJSONString();

        System.out.println("comment: " + commentDOs);

        return json;
    }
}
