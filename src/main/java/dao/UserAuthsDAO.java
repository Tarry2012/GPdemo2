package dao;

import domain.UserAuthsDO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by tqy on 16/4/6.
 */
public interface UserAuthsDAO {
    public UserAuthsDO getById(Map paramMap);

    public List getMails();
}
