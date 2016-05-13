package dao;

import domain.UserVideoDO;

import java.util.List;

/**
 * Created by tqy on 16-5-12.
 */
public interface UserVideoDAO {
    Integer add(UserVideoDO userVideoDO);
    List<UserVideoDO> selectVideos(Integer userId);
}
