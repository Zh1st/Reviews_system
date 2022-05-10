package com.reviews_system.dao;

import com.reviews_system.domain.Page;

public interface PageDao {
    public int getTotalRecord(String sql, Object... arrayParameters);
    public Page getPage(int pageNum, Class clazz, String sql, int totalRecord, Object... parameters);
}
