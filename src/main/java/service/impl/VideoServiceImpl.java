package service.impl;

import dao.VideoDAO;
import domain.VideoDO;
import domain.VideoQuery;
import domain.VideoUpdate;
import org.springframework.stereotype.Service;
import service.VideoService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by tqy on 16-5-11.
 */
@Service(VideoService.SPRING_NAME)
public class VideoServiceImpl implements VideoService {
    @Resource
    VideoDAO videoDAO;

    public List<VideoDO> select(VideoQuery videoQuery) {
        return videoDAO.select(videoQuery);
    }

    public List<VideoDO> selctHotVideo(Integer limit) {
        return videoDAO.selctHotVideo(limit);
    }

    public Boolean updatePlayOrLike(VideoUpdate videoUpdate) {
        if (videoDAO.updatePlayOrLike(videoUpdate) > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<VideoDO> selectNewVideo() {
            return videoDAO.selectNewVideo();
    }

    public List<VideoDO> selectVideos(List<Integer> videoList){
        return videoDAO.selectVideos(videoList);
    }


}
