package com.reviews_system.dao;

import com.reviews_system.domain.Category;
import com.reviews_system.domain.Cinema;

import java.util.List;

public interface CinemaDao {

    List<Cinema> findAll();

    Integer addCinema(Cinema cinema);

    void delById(int cinema_id);

    Cinema findById(int cinema_id);

    Integer updateCinema(Cinema cinema);

    List<Cinema> selectByName(String cinema_name);

    int delByIds(int[]ids);

}
