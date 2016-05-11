package service.impl;

import dao.NoteDAO;
import domain.NoteDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import service.NoteService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by songrunyu on 16-5-11.
 */
@Service(NoteService.SPRING_NAME)
public class NoteServiceImpl implements  NoteService{


    @Resource
    private NoteDAO noteDAO;


    public void setNoteDAO(NoteDAO noteDAO) {

        this.noteDAO = noteDAO;
    }

    public NoteDAO getNoteDAO() {

        return noteDAO;
    }

    public Integer updateNoteById( int userId)
    {
        return this.noteDAO.updateNoteById(userId);
    }

    public Integer add(NoteDO noteDO)
    {
        this.noteDAO.add(noteDO);
        return noteDO.getNoteId();
    }

    public List getContentById(int userId)
    {
        List<NoteDO> notes = noteDAO.getContentById(userId);
        return notes;
    }
}
