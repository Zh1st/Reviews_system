package com.reviews_system.dao;

import com.github.pagehelper.Page;
import com.reviews_system.domain.Comment;
import com.reviews_system.domain.User;

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
    User selectUserByUserId(int user_id);
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

    //查询user_id的姓名

}
