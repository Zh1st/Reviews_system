package com.reviews_system.service;

import com.reviews_system.domain.Category;
import com.reviews_system.domain.User;
import com.reviews_system.domain.Film;
import entity.PageResult;

import java.util.List;

public interface CategoryService {
    public Integer selectFilmCount(int category_id);
    List<Film> listByPage(Integer start, Integer end,int category_id);
    List<Category> list();

    Integer save(Category category);

    void delById(int category_id);

    Category selectById(int category_id);

    int updateCategory(Category category);

    PageResult search(Category category, Integer pageNum, Integer pageSize);

    List<Category> selectByName(String category_name);

    int delByIds(int[]ids);

    List<Film> findFilm(int category_id);

    public Integer selectUserCount();

    public List<Category> listByPage(Integer start,Integer end);
}
