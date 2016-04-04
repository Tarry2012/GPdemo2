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
    UserDO findByUserName(@Param("userName")String userName);
 //   @Update("update user set login_times = login_times + 1, last_login_time = now() where user_id= #{userId}")
    Integer updateUserLoginInfo(@Param("userId")int userId);

    List<UserDO>findPage(Page page);
    Integer insertUser(@Param("userName")String userName, @Param("password")String password, @Param("mail")String mail);
}
