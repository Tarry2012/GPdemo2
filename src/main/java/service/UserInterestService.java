package service;

import domain.UserInterestDO;

import java.util.List;

/**
 * Created by songrunyu on 16-5-12.
 */
public interface UserInterestService {
    public  static final String SPRING_NAME = "userInterestService";


    boolean add(List<UserInterestDO> listParam);
    boolean delete(Integer userId);
    List<UserInterestDO> get(Integer userId);

    boolean update(List<UserInterestDO> listParam, Integer userId);
}
