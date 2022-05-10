package com.reviews_system.service;

import com.reviews_system.domain.Category;
import com.reviews_system.domain.User;
import entity.PageResult;

import java.util.List;

public interface CategoryService {

    List<Category> list();

    Integer save(Category category);

    void delById(int category_id);

    Category selectById(int category_id);

    int updateCategory(Category category);

    PageResult search(Category category, Integer pageNum, Integer pageSize);

    List<Category> selectByName(String category_name);

    int delByIds(int[]ids);

}
