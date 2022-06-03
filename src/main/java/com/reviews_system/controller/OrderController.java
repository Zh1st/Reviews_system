package com.reviews_system.controller;

import com.reviews_system.domain.Category;
import com.reviews_system.domain.Cinema;
import com.reviews_system.domain.Comment;
import com.reviews_system.domain.Orders;
import com.reviews_system.service.CommentService;
import com.reviews_system.service.OrderService;
import com.reviews_system.service.PageService;
import com.reviews_system.service.UserInfoService;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RequestMapping("/order")
@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserInfoService userInfoService;
    @Autowired
    PageService classifyService;
//获取电影id
@RequestMapping("/site")
public ModelAndView site(int filmid){
    ModelAndView modelAndView=new ModelAndView();
    modelAndView.addObject("filmid",filmid);
//    System.out.println("获得电影id是"+filmid);
    List<Orders> sites=orderService.selectOrder(filmid);
    System.out.println("座位是"+sites);
    System.out.println(sites);
    modelAndView.addObject("sites", sites);
    modelAndView.setViewName("site");
    return modelAndView;
}
    //    添加订单
    @RequestMapping("save")
    public String save(Orders order,int[]site_ids) {
        int result = order.getFilm_id();
//        System.out.println("座位的长度"+site_ids.length);
        if (site_ids!=null){
            int i = orderService.save(order,site_ids);
//        System.out.println(order);
            return "redirect:/order/orderback";
        }
        System.out.println("地址是site?filmid="+result);
        return "redirect:/order/site?filmid="+result;
    }


    //#提交订单后转入界面
    @RequestMapping("/orderback")
    public String orderback() {
        return "redirect:/film/weblist";
    }

    //    分页查询
    static int count=0;
    @RequestMapping("/list")
    public ModelAndView list(String methods){
        if(methods==null)
        {
            methods="one";
        }
        int size=10;
        int total=orderService.selectOrdersCount();
        int page=0;
        if(total%size!=0)
        {
            page=total/size;
            page++;
        }
        else
        {
            page=total/size;
        }
        if(methods.equals("next")&&count<page)
        {
            count++;
        }
        else if(methods.equals("up")&&count!=0)
        {
            count--;
        }
        else
        {
            count=0;
        }
        int start=size*count;
        ModelAndView modelAndView=new ModelAndView();
        List<Orders>ordersList=orderService.listByPage(start,size);
        List<String> filmList = new ArrayList<String>();
        List<String> userList = new ArrayList<String>();
        for (Orders o:ordersList
        ) {
            String film_name=userInfoService.findFilmNameById(o.getFilm_id());
            filmList.add(film_name);
            String user_name=orderService.findUserNameById(o.getUser_id());
            userList.add(user_name);
        }
        modelAndView.addObject("ordersList", ordersList);
        modelAndView.addObject("filmList", filmList);
        modelAndView.addObject("userList", userList);
        modelAndView.addObject("pagenum",count+1);
        modelAndView.addObject("pagetotal",page);
        modelAndView.setViewName("orders-list");
        return modelAndView;
    }

//    //查询所有订单
//    @RequestMapping("/list")
//    public ModelAndView list() {
//        ModelAndView modelAndView = new ModelAndView();
//        List<Orders> ordersList = orderService.findAll();
//        List<String> filmList = new ArrayList<String>();
//        List<String> userList = new ArrayList<String>();
//        for (Orders o:ordersList
//        ) {
//            String film_name=userInfoService.findFilmNameById(o.getFilm_id());
//            filmList.add(film_name);
//            String user_name=orderService.findUserNameById(o.getUser_id());
//            userList.add(user_name);
//        }
//        modelAndView.addObject("ordersList", ordersList);
//        modelAndView.addObject("filmList", filmList);
//        modelAndView.addObject("userList", userList);
//        System.out.println(11111);
//        modelAndView.setViewName("orders-list");
//        System.out.println(22222);
//        return modelAndView;
//    }


    //    刷新
    @RequestMapping("/refresh")
    public String refresh() {
        return "redirect:/order/list";
    }

    //  根据id删除
    @RequestMapping("/delById/{order_id}")
    public String delById(@PathVariable("order_id") int order_id) {
        orderService.delById(order_id);
        return "redirect:/order/list";

    }
    //    批量删除
    @RequestMapping("/delByIds/{order_id}")
    public String delByIds(@PathVariable("order_id") int[] ids) {
        for (int i : ids) {
            System.out.println(i);
        }
        int i = orderService.delByIds(ids);
        if (i == ids.length) {
            return "redirect:/order/list";
        } else
            return null;
    }


    @RequestMapping("/findOrderByName")
    public ModelAndView findOrderByName(String  film_name) {
        System.out.println(film_name);
        List<Orders> ordersList=orderService.findOrderByName(film_name);
        ModelAndView modelAndView = new ModelAndView();
        List<String> filmList = new ArrayList<String>();
        List<String> userList = new ArrayList<String>();
        for (Orders o:ordersList
        ) {
            String filmName=userInfoService.findFilmNameById(o.getFilm_id());
            filmList.add(filmName);
            System.out.println(filmName);
            String user_name=orderService.findUserNameById(o.getUser_id());
            userList.add(user_name);
        }
        modelAndView.addObject("ordersList", ordersList);
        modelAndView.addObject("filmList", filmList);
        modelAndView.addObject("userList", userList);
        modelAndView.setViewName("orders-list");
        return modelAndView;
    }

    @RequestMapping("/findOrderByUserId")
    public ModelAndView findOrderByUserId(HttpSession httpSession){
        String id=(String) httpSession.getAttribute("userid");
        int userid=Integer.parseInt(id);
        ModelAndView modelAndView = new ModelAndView();
        List<Orders> ordersList=orderService.findOrderByUserId(userid);
        List<String> filmList = new ArrayList<String>();
        for (Orders o:ordersList
        ) {
            String filmName=userInfoService.findFilmNameById(o.getFilm_id());
            filmList.add(filmName);
        }
        modelAndView.addObject("ordersList", ordersList);
        modelAndView.addObject("filmList", filmList);
        modelAndView.setViewName("order-info");
        return modelAndView;
    }


}
