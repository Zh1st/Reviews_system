package com.reviews_system.dao.impl;

import com.github.pagehelper.Page;
import com.reviews_system.dao.AdminDao;
import com.reviews_system.domain.Admin;
import com.reviews_system.domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class AdminDaoImpl implements AdminDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
//    登录
    @Override
    public Admin findByUsernameAndPassword(String admin_name, String admin_password) {
        Admin admin=jdbcTemplate.queryForObject("select * from admin where admin_name=? and admin_password=?",new BeanPropertyRowMapper<Admin>(Admin.class),admin_name,admin_password);
        return admin;
    }

    @Override
    public List<Admin> findAll() {
        List<Admin>adminList=jdbcTemplate.query("select * from admin",new BeanPropertyRowMapper<Admin>(Admin.class));
        return adminList;
    }

    @Override
    public Integer save(Admin admin) {
        Integer i = jdbcTemplate.update("insert into admin values (?,?,?)",null,admin.getAdmin_name(),admin.getAdmin_password());
        return i;
    }

    @Override
    public void delById(int id) {
        int i=jdbcTemplate.update("delete from admin where id=?",id);
        System.out.println(i);
    }

    @Override
    public Admin selectById(int id) {
        Admin admin=jdbcTemplate.queryForObject("select * from admin where id=?",new BeanPropertyRowMapper<Admin>(Admin.class),id);
        admin.toString();
        return admin;
    }

    @Override
    public int updateAdmin(Admin admin) {
        int i=jdbcTemplate.update("update admin set admin_name=?,admin_password=? where id=?",admin.getAdmin_name(),admin.getAdmin_password(),admin.getId());
        return i;
    }

    @Override
    public Page<Admin> search(Admin admin) {
        Page<Admin>page= (Page<Admin>) jdbcTemplate.query("select * from admin",new BeanPropertyRowMapper<Admin>(Admin.class));
        return page;
    }

    @Override
    public List<Admin> selectByName(String admin_name) {
        String sql="select * from admin where admin_name like '%"+admin_name+"%'";
        List<Admin>adminList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Admin>(Admin.class));
        return adminList;
    }

    @Override
    public int delByIds(int[] ids) {
        int i=0;
        for (int id:ids) {
            int j=jdbcTemplate.update("delete from admin where id=?",id);
            i+=j;
        }
        return i;
    }
}
