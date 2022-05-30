package com.reviews_system.service;


import com.reviews_system.domain.Orders;

import java.util.List;

public interface OrderService {
    Integer save(Orders orders,int[]site_ids);
    List<Orders> selectOrder();
}
