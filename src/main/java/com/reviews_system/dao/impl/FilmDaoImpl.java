package com.reviews_system.dao.impl;

import com.reviews_system.dao.FilmDao;
import com.reviews_system.domain.Film;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

    @Override
    public int save(final Film film) {
//        创建PreparedStatementCreator
        PreparedStatementCreator creator=new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
//                使用原始jdbc完成PreparedStatement的组建
                PreparedStatement preparedStatement=connection.prepareStatement("insert into film values (?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setObject(1,null);
                preparedStatement.setObject(2,film.getFilm_name());
                preparedStatement.setObject(3,film.getBrief_introduction());
                preparedStatement.setObject(4,film.getPicture());
                preparedStatement.setObject(5,film.getPrice());
                return preparedStatement;
            }
        };
//      创建keyHolder
        GeneratedKeyHolder keyHolder=new GeneratedKeyHolder();
        jdbcTemplate.update(creator,keyHolder);
//        获得生成的主键
        int film_id=keyHolder.getKey().intValue();
        return film_id;
    }

    @Override
    public void saveFilmCategoryRel(int filmid, int[] catrgoryids) {
        for(int catrgoryId:catrgoryids)
        {
            jdbcTemplate.update("insert into film_category values (?,?)",filmid,catrgoryId);
        }
    }
}
