package com.reviews_system.domain;

import java.util.Arrays;

public class Orders {
    private int order_id;
    private int user_id;
    private int film_id;
    private int site_id;
    private String time;

    @Override
    public String toString() {
        return "Orders{" +
                "order_id=" + order_id +
                ", user_id=" + user_id +
                ", film_id=" + film_id +
                ", site_id=" + site_id +
                ", time='" + time + '\'' +
                '}';
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getFilm_id() {
        return film_id;
    }

    public void setFilm_id(int film_id) {
        this.film_id = film_id;
    }

    public int getSite_id() {
        return site_id;
    }

    public void setSite_id(int site_id) {
        this.site_id = site_id;
    }
}
