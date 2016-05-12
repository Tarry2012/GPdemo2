package controller;

import domain.NoteDO;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.NoteService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

import java.util.Map;

/**
 * Created by songrunyu on 16-5-11.
 */

@Scope("prototype")
@Controller
//类级别的，处理根url
@RequestMapping("")
public class NoteController {
    Logger logger = Logger.getLogger(NoteController.class);

    @Resource
    private NoteService noteService;
    @Resource
    private UserService userService;

    //方法级别,所以处理这种url: /demo/video/videoId/addNote

   // @RequestMapping(value = "/video/{videoId}/addNote", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"} )
    @RequestMapping(value = "/video/addNote", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"} )
    @ResponseBody
    public String addNote(@RequestParam(value = "note", required = false) String content,
//                          @PathVariable("videoId") Integer videoId,
                          @RequestParam(value = "videoId", required = false) Integer videoId,
                          HttpServletRequest request){
        Map<String, String[]> params = request.getParameterMap();
        System.out.println("~~~~~" + content);
        System.out.println("````````````" + videoId);

        String username = null;

        Cookie[] cookies = request.getCookies();
        for(int i = 0; i < cookies.length; i++ ){
            if("username".equals(cookies[i].getName()))
            {
                username = cookies[i].getValue();
            }
        }

        Integer userId = userService.getIdByName(username);

        NoteDO noteDO = new NoteDO();
        noteDO.setUserId(userId);
        noteDO.setVideoId(1);
        noteDO.setNoteContent(content);

        noteService.add(noteDO);

        return "ok";
    }

    @RequestMapping(value = "/video/{videoId}/Note")
    public  String  Note(HttpServletRequest request, Model model){
        String username = (String)request.getSession().getAttribute("username");
        if (StringUtils.isEmpty(username)){
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies){
                if (cookie.getName().equals("username")){
                    username = cookie.getValue();
                }
            }
        }
        if (StringUtils.isEmpty(username)){
            logger.error("username is null");
            return "index";
        }
        model.addAttribute("username", username);
        return "jsp/noteWrite";
    }

}
