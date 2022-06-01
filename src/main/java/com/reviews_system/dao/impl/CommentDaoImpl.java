package com.reviews_system.dao.impl;

import com.github.pagehelper.Page;
import com.reviews_system.dao.CommentDao;
import com.reviews_system.dao.UserDao;
import com.reviews_system.domain.Comment;
import com.reviews_system.domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class CommentDaoImpl implements CommentDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public List<Comment> findAll() {
        List<Comment>commentList=jdbcTemplate.query("select * from comment",new BeanPropertyRowMapper<Comment>(Comment.class));
        return commentList;
    }

    @Override
    public Integer save(Comment comment) {
        SimpleDateFormat formatter = new SimpleDateFormat   ("yyyy-MM-dd   HH:mm:ss");
        Date curDate = new Date(System.currentTimeMillis());//获取当前时间
        String time = formatter.format(curDate);
        Integer i = jdbcTemplate.update("insert into comment values (?,?,?,?,?,?,?)",null,time,comment.getComment_content(),comment.getWatch(),comment.getFilm_id(),comment.getUser_id(),comment.getFilm_score());
        return i;
    }

    @Override
    public void delById(int comment_id) {
        int i=jdbcTemplate.update("delete from comment where comment_id=?",comment_id);
        System.out.println(i);
    }

    @Override
    public Comment selectById(int comment_id) {
//        SimpleDateFormat   formatter   =   new   SimpleDateFormat   ("yyyy年MM月dd日   HH:mm:ss     ");
//        Date   curDate   =   new   Date(System.currentTimeMillis());//获取当前时间
//        String   time   =   formatter.format(curDate);
        Comment comment=jdbcTemplate.queryForObject("select * from comment where comment_id=?",new BeanPropertyRowMapper<Comment>(Comment.class),comment_id);
        comment.toString();
        return comment;
    }

    @Override
    public int updateComment(Comment comment) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd   HH:mm:ss");
        Date curDate = new Date(System.currentTimeMillis());//获取当前时间
        String time = formatter.format(curDate);
        int i=jdbcTemplate.update("update comment set comment_time=?,comment_content=?,watch=?,film_id=?,user_id=?,film_score=? where comment_id=?",time,comment.getComment_content(),comment.getWatch(),comment.getFilm_id(),comment.getUser_id(),comment.getFilm_score(),comment.getComment_id());
        return i;
    }

    @Override
    public Page<Comment> search(Comment comment) {
        Page<Comment>page= (Page<Comment>) jdbcTemplate.query("select * from comment",new BeanPropertyRowMapper<Comment>(Comment.class));
        return page;
    }

    @Override
    public List<Comment> selectByName(String comment_content) {
        String sql="select * from comment where comment_content like '%"+comment_content+"%'";
        List<Comment>commentList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Comment>(Comment.class));
        return commentList;
    }

    @Override
    public int delByIds(int[] ids) {
        int i=0;
        for (int id:ids) {
            int j=jdbcTemplate.update("delete from comment where comment_id=?",id);
            i+=j;
        }
        return i;
    }

    @Override
    public User selectUserByUserId(int user_id) {
        User user=jdbcTemplate.queryForObject("select * from user where user_id=?",new BeanPropertyRowMapper<User>(User.class),user_id);
        user.toString();
        return user;
    }

    @Override
    public Integer selectUserCount() {
        String sql="select count(*) from comment";
        int i= jdbcTemplate.queryForObject(sql,Integer.class);
        return i;
    }


    @Override
    public List<Comment> listByPage(Integer start, Integer end) {
        String sql = "select * from comment limit "+start+","+end;
        List<Comment> commentList =jdbcTemplate.query(sql,new BeanPropertyRowMapper<Comment>(Comment.class));
        return commentList;
    }

    @Override
    public List<Comment> selectByFilmId(int film_id) {
        String sql="SELECT * FROM comment WHERE film_id="+film_id;
        List<Comment>comments=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Comment>(Comment.class));
        for (Comment comment:comments) {
            User user=userDao.selectById(comment.getUser_id());
            comment.setUser_name(user.getUser_name());
        }
        return comments;
    }
}
