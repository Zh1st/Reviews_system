package com.reviews_system.dao;

import com.github.pagehelper.Page;
import com.reviews_system.domain.Category;
import com.reviews_system.domain.User;


import java.util.List;

public interface CategoryDao {

    List<Category> findAll();

    Integer save(Category category);

    void delById(int category_id);

    Category selectById(int category_id);

    int updateCategory(Category category);

    Page<Category> search(Category category);


    List<Category> selectByName(String category_name);

    int delByIds(int[]ids);

    List<Category>findRoleById(int id);

}
