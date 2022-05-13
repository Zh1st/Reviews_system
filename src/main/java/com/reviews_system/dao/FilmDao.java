package com.reviews_system.dao;

import com.reviews_system.domain.Film;

import java.util.List;

public interface FilmDao {
    List<Film> findAll();
    Film selectById(int film_id);
    int deleteById();
    List<Film> selectByName();
    int addFilm();
}
