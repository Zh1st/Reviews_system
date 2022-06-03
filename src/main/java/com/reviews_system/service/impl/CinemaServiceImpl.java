package com.reviews_system.service.impl;

import com.reviews_system.dao.CinemaDao;
import com.reviews_system.domain.Cinema;
import com.reviews_system.service.CinemaService;

import java.util.List;

public class CinemaServiceImpl implements CinemaService {
    private CinemaDao cinemaDao;

    public void setCinemaDao(CinemaDao cinemaDao) {
        this.cinemaDao = cinemaDao;
    }

    @Override
    public List<Cinema> findAll() {
        List<Cinema>cinemaList=cinemaDao.findAll();
        return cinemaList;
    }

    @Override
    public Integer addCinema(Cinema cinema) {
        return cinemaDao.addCinema(cinema);
    }

    @Override
    public void delById(int cinema_id) {
        cinemaDao.delById(cinema_id);
    }

    @Override
    public Cinema findById(int cinema_id) {
        return cinemaDao.findById(cinema_id);
    }

    @Override
    public Integer updateCinema(Cinema cinema) {
        return cinemaDao.updateCinema(cinema);
    }

    @Override
    public List<Cinema> selectByName(String cinema_name) {
        return cinemaDao.selectByName(cinema_name);
    }

    @Override
    public int delByIds(int[] ids) {
        return cinemaDao.delByIds(ids);
    }

    @Override
    public Integer selectCinemaCount() {
        return cinemaDao.selectCinemaCount();
    }

    @Override
    public List<Cinema> listByPage(Integer start, Integer end) {
        return cinemaDao.listByPage(start,end);
    }
}
