package com.reviews_system.service;

import com.reviews_system.domain.Comment;
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
}
