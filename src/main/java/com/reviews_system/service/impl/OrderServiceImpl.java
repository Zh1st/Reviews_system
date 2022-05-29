package com.reviews_system.service.impl;

import com.reviews_system.dao.CommentDao;
import com.reviews_system.dao.OrderDao;
import com.reviews_system.domain.Comment;
import com.reviews_system.domain.Order;
import com.reviews_system.domain.Orders;
import com.reviews_system.domain.User;
import com.reviews_system.service.CommentService;
import com.reviews_system.service.OrderService;
import entity.PageResult;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao;

    public OrderDao getOrderDao() {
        return orderDao;
    }

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }
    @Override
    public Integer save(Orders orders) {
        return orderDao.save(orders);
    }
}
