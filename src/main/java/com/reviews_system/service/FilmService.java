package com.reviews_system.service;

import com.reviews_system.domain.Film;

import java.util.List;

public interface FilmService {
    List<Film> findAll();
    Film selectById(int film_id);
    int deleteById();
    List<Film> selectByName();
    int addFilm();

    void save(Film film, int[] catrgoryids);
}
