package service;

import domain.NoteDO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by songrunyu on 16-5-11.
 */
public interface NoteService {

    public  static final String SPRING_NAME = "noteService";

    Integer updateNoteById(@Param("noteId")int noteId);

    Integer add(NoteDO noteDO);

    List getContentById(@Param("userId")int userId);

}
