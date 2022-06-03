package com.reviews_system.dao;

import com.reviews_system.domain.Cinema;
import com.reviews_system.domain.Orders;

import java.util.List;

public interface OrderDao {
    int save(Orders orders, int[] site_ids);

    List<Orders> selectOrder(int film_id,int cinema_id);

    List<Orders> findAll();

    void delById(int orders_id);

    int delByIds(int[] ids);

    List<Orders> findByFilmId(int film_id);

    String findUserNameById(int user_id);

    String findCinemaNameById(int user_id);

    List<Orders> findOrderByName(String film_name);

    List<Orders> findOrderByUserId(int user_id);

    public Integer selectOrdersCount();

    public List<Orders> listByPage(Integer start, Integer end);
}
