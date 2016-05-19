package dao;

import domain.VideoDO;
import domain.VideoQuery;
import domain.VideoUpdate;

import java.util.List;

/**
 * Created by tqy on 16-5-11.
 */
public interface VideoDAO {
    List<VideoDO> select(VideoQuery videoQuery);
    List<VideoDO> selctHotVideo(Integer limit);
    Integer updatePlayOrLike(VideoUpdate videoUpdate);
    List<VideoDO> selectNewVideo();
    List<VideoDO> selectVideos(List<Integer> videoList);
    List<VideoDO> selectLikeVideos(List<Integer> interestList);
}
