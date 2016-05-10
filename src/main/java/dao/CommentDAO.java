package dao;

import domain.CommentDO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by songrunyu on 16-5-9.
 */
public interface CommentDAO {

    Integer updateCommentById(@Param("commentId")int commentId);

    Integer add(CommentDO commentDO);

    List getCommentsByVideoId(@Param("videoId")int videoId);

}
