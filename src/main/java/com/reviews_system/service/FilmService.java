package com.reviews_system.service;

import com.reviews_system.domain.Film;
import com.reviews_system.domain.User;

import java.util.List;

public interface FilmService {

    /**
     * 查询所有数据笔数
     * @return
     */
    public Integer selectFilmCount();

    /**
     * 分页查询数据
     * @param start
     * @param end
     * @return
     */
    public List<Film> listByPage(Integer start, Integer end);

//    通过电影名称进行模糊查询
    List<Film> selectByName(String film_name);

    List<Film> findAll();
    Film selectById(int film_id);
    int deleteById();
    List<Film> selectByName();
    int addFilm();

    void save(Film film, int[] catrgoryids);

//更新
    int updateFilm(Film film, int[] catrgoryIds);
}
