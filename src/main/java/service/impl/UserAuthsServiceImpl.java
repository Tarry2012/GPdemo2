package service.impl;

import dao.UserAuthsDAO;
import domain.UserAuthsDO;
import org.springframework.stereotype.Service;
import service.UserAuthsService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tqy on 16/4/6.
 */
@Service(UserAuthsService.STRING_NANE)
public class UserAuthsServiceImpl implements UserAuthsService{

    @Resource
    UserAuthsDAO userAuthsDAO;

    public List getMails(){
        List<UserAuthsDO> userAuthsDOs = userAuthsDAO.getMails();
        List<String> mails = new ArrayList<String>();
        for (UserAuthsDO userAuthsDO : userAuthsDOs){
            mails.add(userAuthsDO.getLoginName());
        }
        return mails;
    }

    public boolean add(UserAuthsDO userAuthsDO){
        if( userAuthsDAO.add(userAuthsDO) > 0){
            return true;
        }else{
            return false;
        }
    }

    public UserAuthsDO getByName(String loginName){
        return userAuthsDAO.getByName(loginName);
    }

    public boolean UpdatePassword(Integer userId, String password){
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", userId);
        paramMap.put("password", password);
        if (userAuthsDAO.UpdatePassword(paramMap) > 0){
            return true;
        }else{
            return false;
        }
    }
}
