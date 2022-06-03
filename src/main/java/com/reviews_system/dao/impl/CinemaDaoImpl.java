package com.reviews_system.dao.impl;

import com.reviews_system.dao.CinemaDao;
import com.reviews_system.domain.Category;
import com.reviews_system.domain.Cinema;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CinemaDaoImpl implements CinemaDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Cinema> findAll() {
        List<Cinema>cinemaList=jdbcTemplate.query("select * from cinema",new BeanPropertyRowMapper<Cinema>(Cinema.class));
        return cinemaList;
    }

    @Override
    public Integer addCinema(Cinema cinema) {
        Integer i = jdbcTemplate.update("insert into cinema values (?,?,?)",null,cinema.getCinema_name(),cinema.getCinema_address());
        return i;
    }

    @Override
    public void delById(int cinema_id) {
        jdbcTemplate.update("delete from cinema where cinema_id=?",cinema_id);
    }

    @Override
    public Cinema findById(int cinema_id) {
        Cinema cinema=jdbcTemplate.queryForObject("select * from cinema where cinema_id=?",new BeanPropertyRowMapper<Cinema>(Cinema.class),cinema_id);
        return cinema;
    }

    @Override
    public Integer updateCinema(Cinema cinema) {
        Integer i=jdbcTemplate.update("update cinema set cinema_name=?,cinema_address=? where cinema_id=?",cinema.getCinema_name(),cinema.getCinema_address(),cinema.getCinema_id());
        return i;
    }

    @Override
    public List<Cinema> selectByName(String cinema_name) {
        List<Cinema> cinemaList=jdbcTemplate.query("select * from cinema where cinema_name like '%"+cinema_name+"%'",new BeanPropertyRowMapper<Cinema>(Cinema.class));
        return cinemaList;
    }

    @Override
    public int delByIds(int[] ids) {
        int i=0;
        for (int id:ids
             ) {
            int j=jdbcTemplate.update("delete from cinema where cinema_id=?",id);
            i+=j;
        }
        return i;
    }

    @Override
    public Integer selectCinemaCount() {
        String sql="select count(*) from cinema";
        int i= jdbcTemplate.queryForObject(sql,Integer.class);
        return i;
    }

    @Override
    public List<Cinema> listByPage(Integer start, Integer end) {
        String sql = "select * from cinema limit "+start+","+end;
        List<Cinema> cinemaList =jdbcTemplate.query(sql,new BeanPropertyRowMapper<Cinema>(Cinema.class));
        return cinemaList;
    }
}
