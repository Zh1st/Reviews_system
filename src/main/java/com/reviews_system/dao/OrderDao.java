package com.reviews_system.dao;

import com.reviews_system.domain.Order;
import com.reviews_system.domain.Orders;

public interface OrderDao {
    int save(Orders orders);
}
