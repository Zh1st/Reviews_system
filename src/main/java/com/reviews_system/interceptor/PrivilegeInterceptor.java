package com.reviews_system.interceptor;

import com.reviews_system.domain.Admin;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PrivilegeInterceptor implements HandlerInterceptor {
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
////        判断用户是否登录，判断session中是否有user
//        HttpSession session = request.getSession();
//        Admin admin= (Admin) session.getAttribute("admin");
////        没有登录
//        if(admin==null)
//        {
//            response.sendRedirect(request.getContextPath()+"/login.jsp");
//            return false;
//        }
////        放行，访问目标资源
//        return true;
//    }
}
