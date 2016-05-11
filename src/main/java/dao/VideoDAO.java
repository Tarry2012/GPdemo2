package dao;

import domain.VideoDO;
import domain.VideoQuery;

import java.util.List;

/**
 * Created by tqy on 16-5-11.
 */
public interface VideoDAO {
    List<VideoDO> select(VideoQuery videoQuery);
}
