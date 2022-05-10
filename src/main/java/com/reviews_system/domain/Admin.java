package com.reviews_system.domain;

public class Admin {
    private int id;
    private String admin_name;
    private String admin_password;

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", admin_name='" + admin_name + '\'' +
                ", admin_password='" + admin_password + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String user_name) {
        this.admin_name = user_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }
}
