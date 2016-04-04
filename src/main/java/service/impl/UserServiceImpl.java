package service.impl;


import common.Page;
import dao.UserDAO;
import domain.UserDO;

import org.springframework.stereotype.Service;
import service.UserService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by tqy on 16/3/14.
 */
@Service(UserService.SPRING_NAME)
public class UserServiceImpl implements UserService{


    @Resource
    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {

        this.userDAO = userDAO;
    }

    public UserDAO getUserDAO() {

        return userDAO;
    }

    public UserDO findByUserName(String userName) {
        UserDO user =  this.userDAO.findByUserName(userName);
        if (user == null){
            System.out.println("username is null");
        }else{
            user.toString();
        }
        return user;
    }

    public Integer updateUserLoginInfo(int userId){
        System.out.println("userId: " + userId);
        return this.userDAO.updateUserLoginInfo(userId);
    }

    public List<UserDO> findPage (Page page){
        return this.userDAO.findPage(page);
    }
}
