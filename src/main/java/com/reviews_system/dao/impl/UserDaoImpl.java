package com.reviews_system.dao.impl;

import com.github.pagehelper.Page;
import com.reviews_system.dao.UserDao;
import com.reviews_system.domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements UserDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<User> findAll() {
        List<User>userList=jdbcTemplate.query("select * from user",new BeanPropertyRowMapper<User>(User.class));
        return userList;
    }

    @Override
    public Integer save(User user) {
////        创建PreparedStatementCreator
//        PreparedStatementCreator creator=new PreparedStatementCreator() {
//            @Override
//            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
//                //                使用原始jdbc完成PreparedStatement的组建
//                PreparedStatement preparedStatement=connection.prepareStatement("insert into user values (?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
//                preparedStatement.setObject(1,null);
//                preparedStatement.setObject(2,user.getUser_name());
//                preparedStatement.setObject(3,user.getUser_password());
//                preparedStatement.setObject(4,user.getUser_phone());
//                preparedStatement.setObject(5,user.getUser_email());
//                return preparedStatement;
//            }
//        };
        Integer i = jdbcTemplate.update("insert into user values (?,?,?,?,?)",null,user.getUser_name(),user.getUser_password(),user.getUser_phone(),user.getUser_email());
        return i;
    }

    @Override
    public void delById(int user_id) {
        int i=jdbcTemplate.update("delete from user where user_id=?",user_id);
        System.out.println(i);
    }

    @Override
    public User selectById(int user_id) {
        User user=jdbcTemplate.queryForObject("select * from user where user_id=?",new BeanPropertyRowMapper<User>(User.class),user_id);
        user.toString();
        return user;
    }

    @Override
    public int updateUser(User user) {
        int i=jdbcTemplate.update("update user set user_name=?,user_password=?,user_phone=?,user_email=? where user_id=?",user.getUser_name(),user.getUser_password(),user.getUser_phone(),user.getUser_email(),user.getUser_id());
        return i;
    }

    @Override
    public Page<User> search(User user) {
        Page<User>page= (Page<User>) jdbcTemplate.query("select * from user",new BeanPropertyRowMapper<User>(User.class));
        return page;
    }

    @Override
    public List<User> selectByName(String user_name) {
        String sql="select * from user where user_name like '%"+user_name+"%'";
        List<User>userList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<User>(User.class));
        return userList;
    }

//    批量删除
    @Override
    public int delByIds(int[] ids) {
        int i=0;
        for (int id:ids) {
            int j=jdbcTemplate.update("delete from user where user_id=?",id);
            i+=j;
        }
        return i;
    }

}
