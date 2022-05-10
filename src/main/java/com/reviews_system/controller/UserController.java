package com.reviews_system.controller;

import com.alibaba.fastjson.JSON;
import com.reviews_system.domain.User;
import com.reviews_system.service.PageService;
import com.reviews_system.service.UserService;
import entity.PageResult;
import entity.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    PageService classifyService;

////    分页
//    @RequestMapping("/list")
//    public String list(HttpServletRequest request) {
//        String pageNum=request.getParameter("p")==null?"1":request.getParameter("p");//获取页码，默认1
//        request.setAttribute("page", classifyService.getClassifyPage(Integer.valueOf(pageNum)));
//        return "redirect:/user/list";
//    }

//    查询所有
    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView=new ModelAndView();
        List<User>userList=userService.list();
        modelAndView.addObject("userList",userList);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }
//    根据name查询
//    @RequestMapping("/selectByName/{user_name}")
    @RequestMapping("/selectByName")
    public ModelAndView selectByName(String user_name){
        System.out.println(user_name);
        List<User>userList=userService.selectByName(user_name);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("userList",userList);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

//    插入
    @RequestMapping("/save")
    public String save(User user){
        int i=userService.save(user);
        return "redirect:/user/list";
    }

//    刷新
    @RequestMapping("/refresh")
    public String refresh(){
        return "redirect:/user/list";
    }

//  根据id删除
    @RequestMapping("/delById/{user_id}")
    public String delById(@PathVariable("user_id") int user_id){
        userService.delById(user_id);
        return "redirect:/user/list";
    }

//    根据id查询
    @ResponseBody
    @RequestMapping("/selectById")
    public Result<User> selectById(int user_id){
        try{
            User user=userService.selectById(user_id);
            System.out.println(user);
            if(user==null){
                return new Result(false,"查询失败！");
            }
            return new Result(true,"查询成功",user);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"查询失败！");
        }
    }

//    根据id更新
    @RequestMapping("/updateUser")
    public String updateUser(User user){
        int i=userService.updateUser(user);
        return "redirect:/user/list";
    }

//    批量删除
    @RequestMapping("/delByIds/{user_ids}")
    public String delByIds(@PathVariable("user_ids")int[]ids){
        for (int i:ids) {
            System.out.println(i);
        }
        int i=userService.delByIds(ids);
        if(i==ids.length)
        {
            return "redirect:/user/list";
        }
        else
            return null;
    }
}
