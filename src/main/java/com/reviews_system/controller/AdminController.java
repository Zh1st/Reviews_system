package com.reviews_system.controller;

import com.reviews_system.domain.Admin;
import com.reviews_system.domain.User;
import com.reviews_system.service.AdminService;
import entity.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/admin")
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/login")
    public String login(String admin_name, String admin_password, HttpSession session){
        Admin admin=adminService.login(admin_name,admin_password);
        if(admin!=null){
            session.setAttribute("admin",admin);
            return "redirect:/pages/main.jsp";
        }
        return "redirect:/login.jsp";
    }
    static int count=0;
    @RequestMapping("/list")
    public ModelAndView list(String methods){
        if(methods==null)
        {
            methods="one";
        }
        int size=5;
        int total=adminService.selectAdminCount();
        int page=0;
        if(total%size!=0)
        {
            page=total/size+1;
        }
        else
        {
            page=total/size;
        }
        if(methods.equals("next")&&count<page-1)
        {
            count++;
        }else if(methods.equals("next")&&count==page-1){
            count=page-1;
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
        List<Admin>adminList=adminService.listByPage(start,size);
        modelAndView.addObject("adminList",adminList);
        modelAndView.addObject("pagenum",count+1);
        modelAndView.addObject("pagetotal",page);
        modelAndView.setViewName("admin-list");
        return modelAndView;
    }
    //    根据name查询
    @RequestMapping("/selectByName")
    public ModelAndView selectByName(String admin_name){
        System.out.println(admin_name);
        List<Admin>adminList=adminService.selectByName(admin_name);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("adminList",adminList);
        modelAndView.setViewName("admin-list");
        return modelAndView;
    }
    //    插入
    @RequestMapping("/save")
    public String save(Admin admin){
        int i=adminService.save(admin);
        return "redirect:/admin/list";
    }
    //    刷新
    @RequestMapping("/refresh")
    public String refresh(){
        return "redirect:/admin/list";
    }
    //  根据id删除
    @RequestMapping("/delById/{id}")
    public String delById(@PathVariable("id") int id){
        adminService.delById(id);
        return "redirect:/admin/list";
    }
    //    根据id查询
    @ResponseBody
    @RequestMapping("/selectById")
    public Result<Admin> selectById(int id){
        try{
            Admin admin=adminService.selectById(id);
            System.out.println(admin);
            if(admin==null){
                return new Result(false,"查询失败！");
            }
            return new Result(true,"查询成功",admin);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"查询失败！");
        }
    }
    //    根据id更新
    @RequestMapping("/updateAdmin")
    public String updateAdmin(Admin admin){
        int i=adminService.updateAdmin(admin);
        return "redirect:/admin/list";
    }
    //    批量删除
    @RequestMapping("/delByIds/{admin_ids}")
    public String delByIds(@PathVariable("admin_ids")int[]ids){
        for (int i:ids) {
            System.out.println(i);
        }
        int i=adminService.delByIds(ids);
        if(i==ids.length)
        {
            return "redirect:/admin/list";
        }
        else
            return null;
    }
}
