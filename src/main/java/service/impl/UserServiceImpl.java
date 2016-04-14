package service.impl;


import common.Page;
import dao.UserDAO;
import domain.UserDO;

import org.springframework.stereotype.Service;
import service.UserService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    public UserDO getById(Integer userId) {
        UserDO user =  this.userDAO.getById(userId);
        if (user == null){
            System.out.println("username is null");
        }else{
            user.toString();
        }
        return user;
    }

    public Integer updateLoginById(int userId){
        return this.userDAO.updateLoginById(userId);
    }

   public Integer add(UserDO userDO){
       this.userDAO.add(userDO);
       return userDO.getUserId();
   }


    public List getNames(){
         List<UserDO> users = userDAO.getNames();
         List<String> names = new ArrayList<String>();
         for(UserDO user : users){
             names.add(user.getUserName());
         }
        return names;
    }

}
