package com.reviews_system.service;

import com.reviews_system.domain.Comment;
import com.reviews_system.domain.User;
import entity.PageResult;

import java.util.List;

public interface CommentService {
    List<Comment> list();

    Integer save(Comment comment);

    void delById(int comment_id);

    Comment selectById(int comment_id);

    int updateComment(Comment comment);

    PageResult search(Comment comment, Integer pageNum, Integer pageSize);

    List<Comment> selectByName(String commenr_content);

    int delByIds(int[] ids);

    /**
     * 查询所有数据笔数
     * @return
     */
    public Integer selectUserCount();

    /**
     * 分页查询数据
     * @param start
     * @param end
     * @return
     */
    public List<Comment> listByPage(Integer start, Integer end);
}
