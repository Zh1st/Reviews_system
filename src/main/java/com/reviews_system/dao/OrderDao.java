package com.reviews_system.dao;

import com.reviews_system.domain.Orders;

import java.util.List;

public interface OrderDao {
    int save(Orders orders,int[]site_ids);
    List<Orders> selectOrder();
}
