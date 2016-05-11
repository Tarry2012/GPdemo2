package controller;

import com.alibaba.fastjson.JSONArray;
import domain.VideoDO;
import domain.VideoQuery;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.VideoService;

import javax.annotation.Resource;
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
    @RequestMapping(value = "/video/type{format}")
    @ResponseBody
    public String computer(HttpServletRequest request){
        int limit = StringUtils.isEmpty(request.getParameter("limit"))? 0: Integer.parseInt(request.getParameter("limit"));
        int offset = StringUtils.isEmpty(request.getParameter("offset"))? 0: Integer.parseInt(request.getParameter("offset"));
        int interestId = StringUtils.isEmpty(request.getParameter("interestid"))? 1: Integer.parseInt(request.getParameter("interestid"));
        VideoQuery videoQuery = new VideoQuery();
        videoQuery.setInterestId(interestId);
        videoQuery.setLimit(limit);
        videoQuery.setOffset(offset);
        List<VideoDO> videoDOList = videoService.select(videoQuery);
        if (videoDOList == null){
            logger.error("videoList is null");
            return "error";
        }else{
            JSONArray jsonArray = new JSONArray();
            jsonArray.add(videoDOList);
            return jsonArray.toString();
        }
    }
}
