package com.reviews_system.service;

import com.reviews_system.domain.Cinema;

import java.util.List;

public interface CinemaService {
    List<Cinema> findAll();

    Integer addCinema(Cinema cinema);

    void delById(int cinema_id);

    Cinema findById(int cinema_id);

    Integer updateCinema(Cinema cinema);

    List<Cinema> selectByName(String cinema_name);

    int delByIds(int[]ids);
}
