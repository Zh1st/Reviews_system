package com.reviews_system.service;

import com.reviews_system.domain.Admin;

public interface AdminService {
    Admin login(String user_name,String user_password);
}
