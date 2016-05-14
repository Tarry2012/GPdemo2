package dao;

import domain.NoteDO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by songrunyu on 16-5-11.
 */
public interface NoteDAO {

    Integer updateNoteById(NoteDO noteDO);

    Integer add(NoteDO noteDO);

    List getContentById(@Param("userId")int userId);

    NoteDO getContentByNoteId(int noteId);
}
