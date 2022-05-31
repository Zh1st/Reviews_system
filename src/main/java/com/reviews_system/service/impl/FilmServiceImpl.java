package com.reviews_system.service.impl;

import com.reviews_system.dao.CategoryDao;
import com.reviews_system.dao.FilmDao;
import com.reviews_system.domain.Category;
import com.reviews_system.domain.Film;
import com.reviews_system.domain.User;
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
    public Integer selectFilmCount() {
        int i=filmDao.selectFilmCount();
        return i;
    }

    @Override
    public List<Film> listByPage(Integer start, Integer end) {
        List<Film>filmList=filmDao.listByPage(start,end);
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

//    根据电影名称进行模糊查询
    @Override
    public List<Film> selectByName(String film_name) {
        List<Film>filmList=filmDao.selectByName(film_name);
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
//      获得user的id
        int id=film.getFilm_id();
//      将film_id作为参数查询当前film_id对应的类型集合数据
        List<Category>categoryList=categoryDao.findRoleById(id);
        film.setCategories(categoryList);
        return film;
    }

    @Override
    public int deleteById(int film_id) {
        int i=filmDao.deleteById(film_id);
        return i;
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
    public void save(Film film, int[] catrgoryids) {
//        先向film表中存储数据
        int filmid=filmDao.save(film);
//        然后向film_category表中存储数据
        filmDao.saveFilmCategoryRel(filmid,catrgoryids);
    }

    @Override
    public int updateFilm(Film film, int[] catrgoryIds) {
        int i=filmDao.updateFilm(film);
        int film_id=film.getFilm_id();
        int j=filmDao.updateFilmAndCategory(film_id,catrgoryIds);
        if(i>=0&&j>=0)
        {
            return 1;
        }
        return 0;
    }


}
