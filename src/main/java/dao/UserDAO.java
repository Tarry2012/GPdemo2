package dao;

import common.Page;
import domain.UserDO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by tqy on 16/3/14.
 */
public interface UserDAO {
//    @Select("select user_id as userId, user_name as userName, user_password as userPassword, login_times as loginTimes," +
//            "last_login_time as lastLoginTime from user where user_name=#{userName}")
    UserDO getById(@Param("userName")String userName);
 //   @Update("update user set login_times = login_times + 1, last_login_time = now() where user_id= #{userId}")
    Integer updateLoginById(@Param("userId")int userId);

    Integer insertUser(@Param("userName")String userName, @Param("password")String password, @Param("mail")String mail);
}
