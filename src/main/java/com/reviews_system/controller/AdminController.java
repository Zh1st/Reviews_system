package com.reviews_system.controller;

import com.reviews_system.domain.Admin;
import com.reviews_system.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@RequestMapping("/admin")
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/login")
    public String login(String user_name, String user_password, HttpSession session){
        Admin admin=adminService.login(user_name,user_password);
        if(admin!=null){
            session.setAttribute("admin",admin);
            return "redirect:/pages/main.jsp";
        }
        return "redirect:/login.jsp";
    }
}
