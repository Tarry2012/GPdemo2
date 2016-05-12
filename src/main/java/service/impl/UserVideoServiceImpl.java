package service.impl;

import dao.UserVideoDAO;
import domain.UserVideoDO;
import org.springframework.stereotype.Service;
import service.UserVideoService;

import javax.annotation.Resource;

/**
 * Created by tqy on 16-5-12.
 */
@Service(UserVideoService.STRING_NAME)
public class UserVideoServiceImpl implements UserVideoService{
    @Resource
    UserVideoDAO userVideoDAO;
    public  boolean add(UserVideoDO userVideoDO){
        if (userVideoDAO.add(userVideoDO) > 0){
            return true;
        }else{
            return false;
        }
    }
}
