package com.reviews_system.dao;

import com.reviews_system.domain.Film;

import java.util.List;

public interface FilmDao {
    List<Film> findAll();
}
