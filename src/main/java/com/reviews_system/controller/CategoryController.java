package com.reviews_system.controller;

import com.reviews_system.domain.Category;
import com.reviews_system.domain.Film;
import com.reviews_system.domain.User;
import com.reviews_system.service.CategoryService;
import com.reviews_system.service.PageService;
import entity.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/category")
@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    PageService classifyService;


    //    分页查询
    static int count=0;
    @RequestMapping("/list")
    public ModelAndView list(String methods){
        if(methods==null)
        {
            methods="one";
        }
        int size=10;
        int total=categoryService.selectUserCount();
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
        List<Category>categoryList=categoryService.listByPage(start,size);
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.addObject("pagenum",count+1);
        modelAndView.addObject("pagetotal",page);
        modelAndView.setViewName("category-list");
        return modelAndView;
    }

//    @RequestMapping("/list")
//    public ModelAndView list(){
//        ModelAndView modelAndView=new ModelAndView();
//        List<Category> categoryList=categoryService.list();
//        modelAndView.addObject("categoryList",categoryList);
//        modelAndView.setViewName("category-list");
//        return modelAndView;
//    }

    //    根据name查询
    @RequestMapping("/selectByName")
    public ModelAndView selectByName(String category_name){
        System.out.println(category_name);
        List<Category>categoryList=categoryService.selectByName(category_name);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.setViewName("category-list");
        return modelAndView;
    }

    //    插入
    @RequestMapping("/save")
    public String save(Category category){
        int i=categoryService.save(category);
        return "redirect:/category/list";
    }

    //    刷新
    @RequestMapping("/refresh")
    public String refresh(){
        return "redirect:/category/list";
    }

    //  根据id删除
    @RequestMapping("/delById/{category_id}")
    public String delById(@PathVariable("category_id") int category_id){
        categoryService.delById(category_id);
        return "redirect:/category/list";
    }

    //    根据id查询
    @ResponseBody
    @RequestMapping("/selectById")
    public Result<Category> selectById(int category_id){
        try{
            Category category=categoryService.selectById(category_id);
            System.out.println(category);
            if(category==null){
                return new Result(false,"查询失败！");
            }
            return new Result(true,"查询成功",category);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"查询失败！");
        }
    }

    //    根据id更新
    @RequestMapping("/updateCategory")
    public String updateUser(Category category){
        int i=categoryService.updateCategory(category);
        return "redirect:/category/list";
    }

    //    批量删除
    @RequestMapping("/delByIds/{category_ids}")
    public String delByIds(@PathVariable("category_ids")int[]ids){
        for (int i:ids) {
            System.out.println(i);
        }
        int i=categoryService.delByIds(ids);
        if(i==ids.length)
        {
            return "redirect:/category/list";
        }
        else
            return null;
    }
    static int film_count=0;
    @RequestMapping("/weblist")
    public ModelAndView weblist(int category_id,String methods){
        int size=12;
        int total=categoryService.selectFilmCount(category_id);
        int page=0;
        if(methods==null)
        {
            methods="one";
        }

        if(total%size!=0)
        {
            page=total/size;
            page++;
        }
        else
        {
            page=total/size;
        }
        if(methods.equals("next")&&film_count<page)
        {
            film_count++;
        }
        else if(methods.equals("up")&&film_count!=0)
        {
            film_count--;
        }
        else
        {
            film_count=0;
        }
        int start=size*film_count;
        ModelAndView modelAndView=new ModelAndView();
//        List<Film>filmList=filmService.findAll();
        List<Film>filmList=categoryService.listByPage(start,size,category_id);
        modelAndView.addObject("category_id",category_id);
        modelAndView.addObject("filmList",filmList);
        modelAndView.addObject("pagenum",film_count+1);
        modelAndView.addObject("pagetotal",page);
        List<Category>categoryList=categoryService.list();
        modelAndView.addObject("categoryList",categoryList);
        modelAndView.setViewName("category_info");
        return modelAndView;
    }

}
