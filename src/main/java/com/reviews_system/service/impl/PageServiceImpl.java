package com.reviews_system.service.impl;

import com.reviews_system.dao.PageDao;
import com.reviews_system.domain.Page;
import com.reviews_system.domain.User;
import com.reviews_system.service.PageService;

public class PageServiceImpl implements PageService {
    private PageDao pageDao;

    public void setPageDao(PageDao pageDao) {
        this.pageDao = pageDao;
    }

    @Override
    public Page getClassifyPage(int pageNum) {
        String sql = "select count(*) from user";
        int totalRecord = pageDao.getTotalRecord(sql);
        sql = "select * from user";
        Page page = pageDao.getPage(pageNum, User.class, sql, totalRecord);
        return page;
    }
}
