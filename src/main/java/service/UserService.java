package service;

import common.Page;
import domain.UserDO;

import java.util.List;

/**
 * Created by tqy on 16/3/14.
 */
public interface UserService {
    String SPRING_NAME = "userService";

    UserDO findByUserName(String userName);

    Integer updateUserLoginInfo(int userId);

    List<UserDO> findPage(Page page);
}
