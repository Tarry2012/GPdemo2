package service.impl;

import dao.UserInterestDAO;
import domain.UserInterestDO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.UserInterestService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by songrunyu on 16-5-12.
 */
@Service(UserInterestService.SPRING_NAME)
public class UserUserInterestServiceImpl implements UserInterestService {

    @Resource
    private UserInterestDAO userInterestDAO;

    @Override
    public boolean add(List<UserInterestDO> listParam) {
        if (userInterestDAO.add(listParam) > 0){
            return true;
        }else{
            return false;
        }

    }

    @Override
    public boolean delete(Integer userId) {
        if (userInterestDAO.delete(userId) > 0){
            return true;
        }
        return false;
    }

    @Override
    public List<UserInterestDO> get(Integer userId) {
        return userInterestDAO.get(userId);
    }

    @Override
    @Transactional
    public boolean update(List<UserInterestDO> listParam, Integer userId) {
        userInterestDAO.delete(userId);
        if (userInterestDAO.add(listParam) > 0){
            return true;
        }else{
            return false;
        }

    }
}
