package com.reviews_system.dao.impl;

import com.github.pagehelper.Page;
import com.reviews_system.dao.CategoryDao;
import com.reviews_system.domain.Category;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<Category> findAll() {
        List<Category>categoryList=jdbcTemplate.query("select * from category",new BeanPropertyRowMapper<Category>(Category.class));
        return categoryList;
    }

    @Override
    public Integer save(Category category) {
        Integer i = jdbcTemplate.update("insert into category values (?,?)",null,category.getCategory_name());
        return i;
    }

    @Override
    public void delById(int category_id) {
        int i=jdbcTemplate.update("delete from category where category_id=?",category_id);
        System.out.println(i);
    }

    @Override
    public Category selectById(int category_id) {
        Category category=jdbcTemplate.queryForObject("select * from category where category_id=?",new BeanPropertyRowMapper<Category>(Category.class),category_id);
        category.toString();
        return category;
    }

    @Override
    public int updateCategory(Category category) {
        int i=jdbcTemplate.update("update category set category_name=?where category_id=?",category.getCategory_name(),category.getCategory_id());
        return i;
    }

    @Override
    public Page<Category> search(Category category) {
        Page<Category>page= (Page<Category>) jdbcTemplate.query("select * from category",new BeanPropertyRowMapper<Category>(Category.class));
        return page;
    }

    @Override
    public List<Category> selectByName(String category_name) {
        String sql="select * from category where category_name like '%"+category_name+"%'";
        List<Category>categoryList=jdbcTemplate.query(sql,new BeanPropertyRowMapper<Category>(Category.class));
        return categoryList;
    }

    @Override
    public int delByIds(int[] ids) {
        int i=0;
        for (int id:ids) {
            int j=jdbcTemplate.update("delete from category where category_id=?",id);
            i+=j;
        }
        return i;
    }
}
