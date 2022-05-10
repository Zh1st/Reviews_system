package com.reviews_system.service.impl;

import com.reviews_system.dao.CategoryDao;
import com.reviews_system.dao.UserDao;
import com.reviews_system.dao.impl.CategoryDaoImpl;
import com.reviews_system.domain.Category;
import com.reviews_system.domain.User;
import com.reviews_system.service.CategoryService;
import entity.PageResult;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {

    private CategoryDao categoryDao;

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
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


}
