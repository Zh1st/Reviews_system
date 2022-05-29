package com.reviews_system.controller;

import com.reviews_system.domain.Comment;
import com.reviews_system.domain.Order;
import com.reviews_system.domain.Orders;
import com.reviews_system.service.CommentService;
import com.reviews_system.service.OrderService;
import com.reviews_system.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/order")
@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    PageService classifyService;
//获取电影id
@RequestMapping("/site")
public ModelAndView site(int filmid){
    ModelAndView modelAndView=new ModelAndView();
    modelAndView.addObject("filmid",filmid);
    System.out.println("电影id是"+filmid);
    modelAndView.setViewName("site");
    return modelAndView;
}
//    添加订单
@RequestMapping("/save")
public String save(Orders order){
    int i=orderService.save(order);
    System.out.println(order);
    return "redirect:/order/list";
}
//#提交订单后转入界面
@RequestMapping("/list")
public ModelAndView list(){
    ModelAndView modelAndView=new ModelAndView();
    modelAndView.setViewName("home");
    return modelAndView;
}
}
