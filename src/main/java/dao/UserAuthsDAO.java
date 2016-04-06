package dao;

import org.apache.ibatis.annotations.Param;

/**
 * Created by tqy on 16/4/6.
 */
public interface UserAuthsDAO {
    public UserAuthsDAO getById(@Param("userId") int userId);
}
