package controller;

import common.constant.ChineseInterestEnum;
import common.constant.InterestEnum;
import domain.InterestDO;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.InterestService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by songrunyu on 16-5-12.
 */

@Scope("prototype")
@Controller
//类级别的，处理根url
@RequestMapping("")
public class InterestController {

    Logger logger = Logger.getLogger(NoteController.class);

    @Resource
    private InterestService interestService;
    @Resource
    private UserService userService;

    @RequestMapping(value = "/user/addInterest", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"} )
    @ResponseBody
    public String addInterest(@RequestParam(value = "interest[]", required = false)String [] arr,
                          HttpServletRequest request){
        String username = null;


        Cookie[] cookies = request.getCookies();
        for(int i = 0; i < cookies.length; i++ ){
            if("username".equals(cookies[i].getName()))
            {
                username = cookies[i].getValue();
            }
        }

        Integer userId = userService.getIdByName(username);

        for( int i = 0 ; i < arr.length; i++ ) {
            InterestDO interestDO = new InterestDO();

            interestDO.setUserId(userId);
            Integer interest_id = InterestEnum.getIndex(arr[i]);
            interestDO.setInterestId(interest_id);

            interestService.add(interestDO);
        }
        return "";
    }




}
