package com.reviews_system.dao.impl;

import com.reviews_system.dao.PageDao;
import com.reviews_system.domain.Page;
import com.reviews_system.domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PageDaoImpl implements PageDao {
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
//    获得记录总数
    @SuppressWarnings("deprecation")
    @Override
    public int getTotalRecord(String sql, Object... arrayParameters) {
        int totalRecord = jdbcTemplate.queryForObject(sql,Integer.class);
        return totalRecord;
    }
//    获取当前页数据
    @SuppressWarnings("unchecked")
    @Override
    public Page getPage(int pageNum, Class clazz, String sql, int totalRecord, Object... parameters) {
        Page page = new Page(pageNum, totalRecord);
        sql = sql+" limit "+page.getStartIndex()+","+page.getPageSize();
        List list=jdbcTemplate.query(sql,new BeanPropertyRowMapper<User>(clazz));
        page.setList(list);
        return page;
    }

}
