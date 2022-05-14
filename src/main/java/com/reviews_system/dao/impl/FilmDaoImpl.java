package com.reviews_system.dao.impl;

import com.reviews_system.dao.FilmDao;
import com.reviews_system.domain.Film;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class FilmDaoImpl implements FilmDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Film> findAll() {
        String sql="select * from film";
        List<Film>filmList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Film>(Film.class));
        return filmList;
    }

    @Override
    public Film selectById(int film_id) {
        String sql="select * from film where film_id="+film_id;
        Film film=jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<Film>(Film.class));
        return film;
    }

    @Override
    public int deleteById() {
        return 0;
    }

    @Override
    public List<Film> selectByName() {
        return null;
    }

    @Override
    public int addFilm() {
        return 0;
    }
}
