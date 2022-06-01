package com.reviews_system.dao.impl;

import com.reviews_system.dao.OrderDao;
import com.reviews_system.domain.Category;
import com.reviews_system.domain.Film;
import com.reviews_system.domain.Orders;
import com.reviews_system.domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDaolmpl implements OrderDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public int save(Orders orders,int[]site_ids) {
        SimpleDateFormat   formatter   =   new   SimpleDateFormat   ("yyyy-MM-dd");
        Date   curDate   =   new   Date(System.currentTimeMillis());//获取当前时间
        String   time   =   formatter.format(curDate);
        for (int site_id:site_ids) {
            Integer i = jdbcTemplate.update("insert into orders values (?,?,?,?,?)", null
                    ,orders.getUser_id()
                    ,orders.getFilm_id()
                    ,site_id
                    ,time);
        }

        return 0;
    }

    @Override
    public List<Orders> selectOrder(int film_id) {
        SimpleDateFormat   formatter   =   new   SimpleDateFormat   ("yyyy-MM-dd");
        Date   curDate   =   new   Date(System.currentTimeMillis());//获取当前时间
        String   nowtime   =   formatter.format(curDate);
        nowtime = "'"+nowtime+"'";
        System.out.println(nowtime);
        String sql = "select * from orders where time="+nowtime+" and film_id ="+ film_id;
        List<Orders>ordersList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Orders>(Orders.class));
        return ordersList;
    }

    @Override
    public List<Orders> findAll() {
        List<Orders> ordersList=jdbcTemplate.query("select * from orders",new BeanPropertyRowMapper<Orders>(Orders.class));
        return ordersList;
    }

    @Override
    public void delById(int orders_id) {
        int i=jdbcTemplate.update("delete from orders where order_id=?",orders_id);
        System.out.println(i);
    }

    @Override
    public int delByIds(int[] ids) {
        int i=0;
        for (int id:ids) {
            int j=jdbcTemplate.update("delete from orders where order_id=?",id);
            i+=j;
        }
        return i;
    }

    @Override
    public List<Orders> findByFilmId(int film_id) {
        String sql="select * from orders where film_id=?";
        List<Orders>ordersList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Orders>(Orders.class),film_id);
        return ordersList;
    }

    @Override
    public String findUserNameById(int user_id) {
        User user=jdbcTemplate.queryForObject("select * from user where user_id=?",new BeanPropertyRowMapper<User>(User.class),user_id);
        String userName=user.getUser_name();
        return userName;
    }



    @Override
    public List<Orders> findOrderByName(String film_name) {
        String sql="select * from orders where film_id in (select film_id from film where film_name like '%"+film_name+"%')";
        List<Orders> ordersList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Orders>(Orders.class));
        return ordersList;
    }
}
