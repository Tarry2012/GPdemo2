package service.impl;

import dao.UserAuthsDAO;
import domain.UserAuthsDO;
import org.springframework.stereotype.Service;
import service.UserAuthsService;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by tqy on 16/4/6.
 */
@Service(UserAuthsService.STRING_NANE)
public class UserAuthsServiceImpl implements UserAuthsService{

    @Resource
    UserAuthsDAO userAuthsDAO;

    public UserAuthsDO getById(Map paramMap){
        System.out.println("hello");
        return userAuthsDAO.getById(paramMap);
    }

    public List getMails(){
        List<UserAuthsDO> userAuthsDOs = userAuthsDAO.getMails();
        List<String> mails = new ArrayList<String>();
        for (UserAuthsDO userAuthsDO : userAuthsDOs){
            mails.add(userAuthsDO.getLoginName());
        }
        return mails;

    }
}
