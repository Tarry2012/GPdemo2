package service;

import common.Page;
import domain.UserDO;

import java.util.List;
import java.util.Map;

/**
 * Created by tqy on 16/3/14.
 */
public interface UserService {
    public  static final String SPRING_NAME = "userService";

    UserDO getById(String userName);

    Integer updateLoginById(int userId);

    Integer add(String username);

    Integer selectLastId();

    List getNames();
}
