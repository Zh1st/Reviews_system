package com.reviews_system.domain;

import java.util.List;

public class Film {
    private int film_id;
    private String film_name;
    private String brief_introduction;
    private String picture;
    private float price;
    //  当前电影都有什么类型
    private List<Category> categories;
    private float score;
    private String film_time;
    private String film_director;

    @Override
    public String toString() {
        return "Film{" +
                "film_id=" + film_id +
                ", film_name='" + film_name + '\'' +
                ", brief_introduction='" + brief_introduction + '\'' +
                ", picture='" + picture + '\'' +
                ", price=" + price +
                ", score=" + score +
                ", film_time='" + film_time + '\'' +
                ", film_director='" + film_director + '\'' +
                '}';
    }

    public int getFilm_id() {
        return film_id;
    }

    public void setFilm_id(int film_id) {
        this.film_id = film_id;
    }

    public String getFilm_name() {
        return film_name;
    }

    public void setFilm_name(String film_name) {
        this.film_name = film_name;
    }

    public String getBrief_introduction() {
        return brief_introduction;
    }

    public void setBrief_introduction(String brief_introduction) {
        this.brief_introduction = brief_introduction;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getFilm_time() {
        return film_time;
    }

    public void setFilm_time(String film_time) {
        this.film_time = film_time;
    }

    public String getFilm_director() {
        return film_director;
    }

    public void setFilm_director(String film_director) {
        this.film_director = film_director;
    }
}
