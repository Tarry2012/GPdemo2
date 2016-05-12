package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import common.constant.ChineseInterestEnum;
import common.constant.InterestEnum;
import domain.VideoDO;
import domain.VideoQuery;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.VideoService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by tqy on 16-5-11.
 */
@Scope("prototype")
@Controller
//类级别的，处理根url
@RequestMapping("")
public class VideoController {
    private static Logger logger = Logger.getLogger(VideoController.class);
    @Resource
    VideoService videoService;
    @RequestMapping(value = "/video/type{format}",produces = {"application/json;charset=UTF-8"},method = RequestMethod.GET)
    public String computer(HttpServletRequest request, Model model){
        int limit = StringUtils.isEmpty(request.getParameter("limit"))? 0: Integer.parseInt(request.getParameter("limit"));
        int offset = StringUtils.isEmpty(request.getParameter("offset"))? 0: Integer.parseInt(request.getParameter("offset"));
        int interestId = StringUtils.isEmpty(request.getParameter("interestid"))? 1: Integer.parseInt(request.getParameter("interestid"));
        VideoQuery videoQuery = new VideoQuery();
        videoQuery.setInterestId(interestId);
        videoQuery.setLimit(limit);
        videoQuery.setOffset(offset);
        List<VideoDO> videoDOList = videoService.select(videoQuery);
        System.out.println("list： " + videoDOList);
        if (videoDOList == null){
            logger.error("videoList is null");
            return "index.jsp";
        }else{
            JSONArray jsonArray = new JSONArray();
            jsonArray.add(videoDOList);
            model.addAttribute("list",jsonArray);
            String page = InterestEnum.getName(interestId);
            return "jsp/"+page;
        }
    }

    @RequestMapping(value="/video/{videoId}",produces = {"application/json;charset=UTF-8"},method = RequestMethod.GET)
    public String videoPlay(@PathVariable("videoId")Integer videoId,HttpServletRequest request, Model model){
        String username = (String)request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)){
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies){
                if (cookie.getName().equals("username")){
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)){
            logger.error("username is null");
            return "index";
        }
        VideoQuery videoQuery = new VideoQuery();
        videoQuery.setVideoId(videoId);
        VideoDO videoDO = videoService.select(videoQuery).get(0);
        System.out.println("videoDO:" + videoDO);
        model.addAttribute("videoName", videoDO.getVideoName());
        model.addAttribute("videoDescribe", videoDO.getVideoDescribe());
        model.addAttribute("videoLikes", videoDO.getVideoLike());
        model.addAttribute("videoPlays", videoDO.getVideoPlay());
        String type = ChineseInterestEnum.getName(videoDO.getInterestId());
        model.addAttribute("videoType", type);
        model.addAttribute("username",username);
        String noteUrl = "video/"+ videoDO.getVideoId()+ "/Note";
        model.addAttribute("noteUrl", noteUrl);
        String videoUrl = "resources/video/" + videoDO.getVideoUrl();
        model.addAttribute("videoUrl", videoUrl);
//        JSONObject jsonObject = new JSONObject();
//        jsonObject.put("video", videoDO);
        return "jsp/video";
    }
}
