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

    public Integer updateNoteById( int noteId, String noteName, String noteContent)
    {
        NoteDO noteDO = new NoteDO();
        noteDO.setNoteContent(noteContent);
        noteDO.setNoteName(noteName);
        noteDO.setNoteId(noteId);
        return this.noteDAO.updateNoteById(noteDO);
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

    public NoteDO getContentByNoteId(int noteId)
    {
        return this.noteDAO.getContentByNoteId(noteId);
    }
}
