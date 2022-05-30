package com.reviews_system.controller;

import com.reviews_system.domain.Category;
import com.reviews_system.domain.Comment;
import com.reviews_system.domain.Orders;
import com.reviews_system.service.CommentService;
import com.reviews_system.service.OrderService;
import com.reviews_system.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

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
//    System.out.println("电影id是"+filmid);
    List<Orders> sites=orderService.selectOrder();
    System.out.println("座位是"+sites);
    System.out.println(sites);
    modelAndView.addObject("sites", sites);
    modelAndView.setViewName("site");
    return modelAndView;
}
    //    添加订单
    @RequestMapping("save")
    public String save(Orders order,int[]site_ids) {
        int i = orderService.save(order,site_ids);
        System.out.println(order);
        return "redirect:/order/orderback";
    }


    //#提交订单后转入界面
    @RequestMapping("/orderback")
    public String orderback() {
        return "redirect:/film/weblist";
    }
}
