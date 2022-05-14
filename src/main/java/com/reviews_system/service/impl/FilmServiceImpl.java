package com.reviews_system.service.impl;

import com.reviews_system.dao.CategoryDao;
import com.reviews_system.dao.FilmDao;
import com.reviews_system.domain.Category;
import com.reviews_system.domain.Film;
import com.reviews_system.service.FilmService;

import java.util.List;

public class FilmServiceImpl implements FilmService {
    private FilmDao filmDao;

    public void setFilmDao(FilmDao filmDao) {
        this.filmDao = filmDao;
    }

    private CategoryDao categoryDao;

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    @Override
    public List<Film> findAll() {
        List<Film>filmList=filmDao.findAll();
        for (Film film:filmList)
        {
//            获得user的id
            int id=film.getFilm_id();
//          将film_id作为参数查询当前film_id对应的类型集合数据
            List<Category>categoryList=categoryDao.findRoleById(id);
            film.setCategories(categoryList);
        }
        return filmList;
    }

    @Override
    public Film selectById(int film_id) {
        Film film=filmDao.selectById(film_id);
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
