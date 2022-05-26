package com.reviews_system.dao;

import com.reviews_system.domain.Film;
import com.reviews_system.domain.User;

import java.util.List;

public interface FilmDao {
    List<Film> findAll();
    Film selectById(int film_id);
    int deleteById();
    List<Film> selectByName();
    int addFilm();

    int save(Film film);

    void saveFilmCategoryRel(int filmid, int[] catrgoryids);

    int selectFilmCount();

    List<Film> listByPage(Integer start, Integer end);

    List<Film> selectByName(String film_name);

    int updateFilm(Film film);

    int updateFilmAndCategory(int film_id, int[] catrgoryIds);
}
