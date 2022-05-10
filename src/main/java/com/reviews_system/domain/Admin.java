package com.reviews_system.domain;

public class Admin {
    private int id;
    private String user_name;
    private String pass_word;

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", user_name='" + user_name + '\'' +
                ", pass_word='" + pass_word + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPass_word() {
        return pass_word;
    }

    public void setPass_word(String pass_word) {
        this.pass_word = pass_word;
    }
}
