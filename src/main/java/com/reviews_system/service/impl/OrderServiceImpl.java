package com.reviews_system.service.impl;

import com.reviews_system.dao.CommentDao;
import com.reviews_system.dao.OrderDao;
import com.reviews_system.domain.*;
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
    public Integer save(Orders orders,int[]site_ids) {
        return orderDao.save(orders,site_ids);
    }

    @Override
    public List<Orders> selectOrder() {
        List<Orders>ordersList=orderDao.selectOrder();
        return ordersList;
    }
}
