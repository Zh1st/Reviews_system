package com.reviews_system.dao;

import com.github.pagehelper.Page;
import com.reviews_system.domain.Comment;

import java.util.List;

public interface CommentDao {
    List<Comment> findAll();


    Integer save(Comment comment);

    void delById(int comment_id);

    Comment selectById(int comment_id);

    int updateComment(Comment comment);

    Page<Comment> search(Comment comment);

    List<Comment> selectByName(String comment_tent);

    int delByIds(int[] ids);
}
