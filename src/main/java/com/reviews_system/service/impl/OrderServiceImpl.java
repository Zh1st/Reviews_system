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
    public List<Orders> selectOrder(int film_id) {
        List<Orders>ordersList=orderDao.selectOrder(film_id);
        return ordersList;
    }



    @Override
    public List<Orders> findAll() {
        List<Orders> ordersList= orderDao.findAll();
        return ordersList;
    }

    @Override
    public void delById(int orders_id) {
        orderDao.delById(orders_id);
    }

    @Override
    public int delByIds(int[] ids) {
        int i=orderDao.delByIds(ids);
        return i;
    }

    @Override
    public List<Orders> findByFilmId(int film_id) {
        List<Orders>ordersList= getOrderDao().findByFilmId(film_id);
        return ordersList;
    }

    @Override
    public String findUserNameById(int user_id) {
        String userName=orderDao.findUserNameById(user_id);
        return userName;
    }


    @Override
    public List<Orders> findOrderByName(String film_name) {
        List<Orders> ordersList=orderDao.findOrderByName(film_name);
        return ordersList;
    }

    @Override
    public List<Orders> findOrderByUserId(int user_id) {
        List<Orders> ordersList=orderDao.findOrderByUserId(user_id);
        return ordersList;
    }
}
