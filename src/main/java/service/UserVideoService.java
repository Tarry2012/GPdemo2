package service;

import domain.UserVideoDO;

import java.util.List;

/**
 * Created by tqy on 16-5-12.
 */
public interface UserVideoService {
    String STRING_NAME = "userVideoService";

    boolean add(UserVideoDO userVideoDO);

    List<UserVideoDO> selectVideos(Integer userId);
}
