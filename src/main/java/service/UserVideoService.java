package service;

import domain.UserVideoDO;

/**
 * Created by tqy on 16-5-12.
 */
public interface UserVideoService {
    String STRING_NAME = "userVideoService";

    boolean add(UserVideoDO userVideoDO);
}
