package com.reviews_system.service.impl;

import com.reviews_system.dao.CategoryDao;
import com.reviews_system.domain.Category;
import com.reviews_system.domain.Film;
import com.reviews_system.service.CategoryService;
import entity.PageResult;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {

    private CategoryDao categoryDao;

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    @Override
    public Integer selectFilmCount(int category_id) {
        int i=categoryDao.selectFilmCount(category_id);
        return i;
    }
    @Override
    public List<Film> listByPage(Integer start, Integer end,int category_id) {
        List<Film>filmList=categoryDao.listByPage(start,end,category_id);
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
    public List<Category> list() {
        List<Category> categoryList=categoryDao.findAll();
        return categoryList;
    }

    @Override
    public Integer save(Category category) {
        return categoryDao.save(category);
    }

    @Override
    public void delById(int category_id) {
        categoryDao.delById(category_id);
    }

    @Override
    public Category selectById(int category_id) {
        Category category=categoryDao.selectById(category_id);
        return category;
    }

    @Override
    public int updateCategory(Category category) {
        int i=categoryDao.updateCategory(category);
        return i;
    }

    @Override
    public PageResult search(Category category, Integer pageNum, Integer pageSize) {
        return null;
    }

    @Override
    public List<Category> selectByName(String category_name) {
        List<Category>categoryList=categoryDao.selectByName(category_name);
        return categoryList;
    }

    @Override
    public int delByIds(int[] ids) {
        int i=categoryDao.delByIds(ids);
        return i;
    }

    @Override
    public List<Film> findFilm(int category_id){
        List<Film> filmList=categoryDao.findFilm(category_id);
        return filmList;
    }

    @Override
    public Integer selectUserCount() {
        return categoryDao.selectUserCount();
    }

    @Override
    public List<Category> listByPage(Integer start, Integer end) {
        List<Category>categoryList=categoryDao.listByPage(start,end);
        return categoryList;
    }


}
