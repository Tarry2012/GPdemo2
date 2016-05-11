package controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.NoteService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

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

    //方法级别,所以处理这种url: /demo/video/addComment

    @RequestMapping(value = "/note/addNote", method = RequestMethod.POST)
    public String addNote(HttpServletRequest request){
        String note_content = request.getParameter("editor");
        System.out.println("~~~~~" + note_content);

        return "";
    }
}
