package dao;

import common.Page;
import domain.UserDO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by tqy on 16/3/14.
 */
public interface UserDAO {
    UserDO getById(Integer userId);

    Integer updateLoginById(@Param("userId")int userId);

    Integer add(UserDO userDO);

    List getNames();

    Integer getIdByName(String userName);

}
