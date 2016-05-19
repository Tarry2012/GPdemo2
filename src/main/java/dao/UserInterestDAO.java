package dao;

import domain.UserInterestDO;

import java.util.List;

/**
 * Created by songrunyu on 16-5-12.
 */
public interface UserInterestDAO {

    Integer delete(Integer userId);
    Integer add(List<UserInterestDO> listParam);
    List<UserInterestDO> get(Integer userId);
}
