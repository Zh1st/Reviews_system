package com.reviews_system.dao;

import com.reviews_system.domain.Admin;

public interface AdminDao {
    Admin findByUsernameAndPassword(String user_name,String pass_word);
}
