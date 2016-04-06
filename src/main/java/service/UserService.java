package service;

import common.Page;
import domain.UserDO;

import java.util.List;

/**
 * Created by tqy on 16/3/14.
 */
public interface UserService {
    public  static final String SPRING_NAME = "userService";

    UserDO getById(String userName);

    Integer updateLoginById(int userId);

}
