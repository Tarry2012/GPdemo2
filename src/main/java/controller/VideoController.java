package controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import common.constant.ChineseInterestEnum;
import common.constant.InterestEnum;
import common.constant.NumConstant;
import domain.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserInterestService;
import service.UserService;
import service.UserVideoService;
import service.VideoService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
    @Resource
    UserService userService;
    @Resource
    UserVideoService userVideoService;
    @Resource
    UserInterestService userInterestService;

    @RequestMapping(value = "/video/type{format}", produces = {"application/json;charset=UTF-8"}, method = RequestMethod.GET)
    public String course(HttpServletRequest request, Model model) {
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
        int limit = StringUtils.isEmpty(request.getParameter("limit")) ? 0 : Integer.parseInt(request.getParameter("limit"));
        int offset = StringUtils.isEmpty(request.getParameter("offset")) ? 0 : Integer.parseInt(request.getParameter("offset"));
        int interestId = StringUtils.isEmpty(request.getParameter("interestid")) ? 1 : Integer.parseInt(request.getParameter("interestid"));
        VideoQuery videoQuery = new VideoQuery();
        videoQuery.setInterestId(interestId);
        videoQuery.setLimit(limit);
        videoQuery.setOffset(offset);
        List<VideoDO> videoDOList = videoService.select(videoQuery);
        if (videoDOList == null) {
            logger.error("videoList is null");
            return "index";
        } else {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("videoDOList", videoDOList);
            model.addAttribute("videoDOList", jsonObject);
            model.addAttribute("username", username);
            System.out.println("jsonObject" + jsonObject);
            String page = InterestEnum.getName(interestId);
            return "jsp/course";
        }
    }

    @RequestMapping(value = "/video/{videoId}", produces = {"application/json;charset=UTF-8"}, method = RequestMethod.GET)
    public String videoPlay(@PathVariable("videoId") Integer videoId, HttpServletRequest request, Model model) {
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
        VideoQuery videoQuery = new VideoQuery();
        videoQuery.setVideoId(videoId);
        VideoDO videoDO = videoService.select(videoQuery).get(0);
        VideoUpdate videoUpdate = new VideoUpdate();
        videoUpdate.setVideoId(videoId);
        videoUpdate.setVideoPlay(true);
        if (!videoService.updatePlayOrLike(videoUpdate)) {
            logger.error("update video plays is error");
            return "index";
        }
        UserVideoDO userVideoDO = new UserVideoDO();
        userVideoDO.setUserId(userId);
        userVideoDO.setVideoId(videoId);
        userVideoDO.setIsDelete(false);
        userVideoDO.setIsLike(false);
        if (!userVideoService.add(userVideoDO)) {
            logger.error("add userVideo is error");
            return "index";
        }
        model.addAttribute("videoName", videoDO.getVideoName());
        model.addAttribute("videoDescribe", videoDO.getVideoDescribe());
        model.addAttribute("videoLikes", videoDO.getVideoLike());
        model.addAttribute("videoPlays", videoDO.getVideoPlay());
        String type = ChineseInterestEnum.getName(videoDO.getInterestId());
        model.addAttribute("videoType", type);
        model.addAttribute("username", username);

        String noteUrl = "video/" + videoDO.getVideoId() + "/Note";
        model.addAttribute("noteUrl", noteUrl);
        String videoUrl = "resources/video/" + videoDO.getVideoUrl();
        model.addAttribute("videoUrl", videoUrl);
        String videoPicture = "resources/images/video/" + videoDO.getVideoPicture();
        model.addAttribute("videoPicture", videoPicture);
        String videoLikeUrl = "video/" + videoDO.getVideoId() + "/addLike";
        model.addAttribute("videoLikeUrl", videoLikeUrl);
        return "jsp/video";
    }

    @RequestMapping(value = "/video/hotVideo", produces = {"application/json;charset=UTF-8"}, method = RequestMethod.GET)
    @ResponseBody
    public String selectHotVideo(HttpServletRequest request) {
        int limit = StringUtils.isEmpty(request.getParameter("limit")) ? 10 : Integer.parseInt(request.getParameter("limit"));
        List<VideoDO> videoDOList = videoService.selctHotVideo(limit);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("videoList", videoDOList);
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "/video/{videoId}/addLike")
    @ResponseBody
    public String addLike(@PathVariable("videoId") Integer videoId) {
        VideoUpdate videoUpdate = new VideoUpdate();
        videoUpdate.setVideoId(videoId);
        videoUpdate.setVideoLike(true);
        VideoQuery videoQuery = new VideoQuery();
        videoQuery.setVideoId(videoId);
        if (videoService.updatePlayOrLike(videoUpdate)) {
            return videoService.select(videoQuery).get(0).getVideoLike();
        } else {
            logger.error("add video like error");
            return videoService.select(videoQuery).get(0).getVideoLike();
        }
    }

    @RequestMapping(value = "/video/indexVideo", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String indexVideo() {
        List<VideoDO> videoDOList = videoService.selectNewVideo();
        if (videoDOList == null) {
            logger.error("select new Videos error");
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("videoList", videoDOList);
        return jsonObject.toJSONString();
    }


    @RequestMapping(value = "/video/recommend", produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String recommendVideo(HttpServletRequest request) {

        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        username = cookie.getValue();
                    }
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            List<VideoDO> videoDOs = BackUp();
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("videoDOList", videoDOs);
            return jsonObject.toJSONString();
        }
        Integer userId = userService.getIdByName(username);
        List<Integer> interestId = new ArrayList<>();
        List<UserInterestDO> userInterestDOList = userInterestService.get(userId);
        for (UserInterestDO userInterestDO : userInterestDOList) {
            interestId.add(userInterestDO.getInterestId());
        }
        List<VideoDO> videoDOList = videoService.selectLikeVideos(interestId);
        List<VideoDO> recommandVideos = new ArrayList<>();
        if (videoDOList.size() >= NumConstant.recommendNum) {
            HashSet<Integer> set = new HashSet<Integer>();
            random(videoDOList, set);
            for (Integer i : set) {
                recommandVideos.add(videoDOList.get(i));
            }
        } else {
            recommandVideos = BackUp();
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("videoDOList", recommandVideos);
        return jsonObject.toJSONString();
    }

    private List<VideoDO> BackUp() {
        VideoQuery videoQuery = new VideoQuery();
        Date endTime = new Date();
        Date startTime = DateUtils.addMonths(endTime, -1);
        videoQuery.setLimit(3);
        videoQuery.setStartTime(startTime);
        videoQuery.setEndTime(endTime);
        return videoService.selectRecent(videoQuery);

    }

    private void random(List videoList, HashSet set){
        set.add(0);
        set.add(videoList.size() -1);
        Random random = new Random(System.currentTimeMillis());
        int num = random.nextInt(videoList.size()-1);
        if (num == videoList.size() -1){
            num = videoList.size() -2;
        }else if (num == 0){
            num = num +1;
        }
        set.add(num);
    }
}
