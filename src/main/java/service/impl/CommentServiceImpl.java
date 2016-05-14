package service.impl;

import dao.CommentDAO;
import domain.CommentDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import service.CommentService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by songrunyu on 16-5-9.
 */
@Service(CommentService.SPRING_NAME)
public class CommentServiceImpl implements CommentService{

    @Resource
    private CommentDAO commentDAO;

    public void setCommentDAO(CommentDAO commentDAO) {

        this.commentDAO = commentDAO;
    }

    public CommentDAO geCommetDAO() {

        return commentDAO;
    }

    public Integer updateCommentById(int commentId)
    {
        return this.commentDAO.updateCommentById(commentId);
    }

    public Integer add(CommentDO commentDO)
    {
        this.commentDAO.add(commentDO);
        return commentDO.getCommentId();
    }

    public List getCommentsByVideoId(int videoId)
    {
        List<CommentDO> comments = commentDAO.getCommentsByVideoId(videoId);
        return comments;
    }

    public List getContentByUserId(int userId)
    {
        List<CommentDO> commentDOs = commentDAO.getContentByUserId(userId);
        return commentDOs;
    }



}
