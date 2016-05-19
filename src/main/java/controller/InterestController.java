package controller;

import com.alibaba.fastjson.JSONObject;
import common.constant.InterestEnum;
import domain.UserInterestDO;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserInterestService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
    private UserInterestService userInterestService;
    @Resource
    private UserService userService;

    @RequestMapping(value = "/user/addInterest", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"} )
    @ResponseBody
    public String addInterest(@RequestParam(value = "interest[]", required = false)String [] arr,
                          HttpServletRequest request){
        String username = (String) request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)) {
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)) {
            logger.error("username is null");
            return "error";
        }
        Integer userId = userService.getIdByName(username);
        List<UserInterestDO> userInterestDOList = new ArrayList<UserInterestDO>();
        for( int i = 0 ; i < arr.length; i++ ) {
            UserInterestDO userInterestDO = new UserInterestDO();
            userInterestDO.setUserId(userId);
            Integer interestId = InterestEnum.getIndex(arr[i]);
            userInterestDO.setInterestId(interestId);
            userInterestDOList.add(userInterestDO);
        }
        if (userInterestService.update(userInterestDOList, userId)){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("msg", "ok");
            return jsonObject.toJSONString();
        }else{
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("data", "error");
            return jsonObject.toJSONString();
        }

    }
}
