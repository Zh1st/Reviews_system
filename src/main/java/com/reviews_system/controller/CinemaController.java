package com.reviews_system.controller;

import com.reviews_system.domain.Category;
import com.reviews_system.domain.Cinema;
import com.reviews_system.service.CinemaService;
import entity.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
    @Autowired
    private CinemaService cinemaService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView modelAndView=new ModelAndView();
        List<Cinema> cinemaList=cinemaService.findAll();
        modelAndView.addObject("cinemaList",cinemaList);
        modelAndView.setViewName("cinema-list");
        return modelAndView;
    }

    //    根据name查询
    @RequestMapping("/selectByName")
    public ModelAndView selectByName(String cinema_name){
        System.out.println(cinema_name);
        List<Cinema>cinemaList=cinemaService.selectByName(cinema_name);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("cinemaList",cinemaList);
        modelAndView.setViewName("cinema-list");
        return modelAndView;
    }

    //    插入
    @RequestMapping("/addCinema")
    public String addCinema(Cinema cinema){
        int i=cinemaService.addCinema(cinema);
        return "redirect:/cinema/list";
    }

    //    刷新
    @RequestMapping("/refresh")
    public String refresh(){
        return "redirect:/cinema/list";
    }

    //  根据id删除
    @RequestMapping("/delById/{cinema_id}")
    public String delById(@PathVariable("cinema_id") int cinema_id){
        cinemaService.delById(cinema_id);
        return "redirect:/cinema/list";
    }

    //    根据id查询
    @ResponseBody
    @RequestMapping("/selectById")
    public Result<Cinema> selectById(int cinema_id){
        try{
            Cinema cinema=cinemaService.findById(cinema_id);
            System.out.println(cinema_id);
            if(cinema==null){
                return new Result(false,"查询失败！");
            }
            return new Result(true,"查询成功",cinema);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"查询失败！");
        }
    }

    //    根据id更新
    @RequestMapping("/updateCinema")
    public String updateCinema(Cinema cinema){
        int i=cinemaService.updateCinema(cinema);
        return "redirect:/cinema/list";
    }

    //    批量删除
    @RequestMapping("/delByIds/{cinema_ids}")
    public String delByIds(@PathVariable("cinema_ids")int[]ids){
        for (int i:ids) {
            System.out.println(i);
        }
        int i=cinemaService.delByIds(ids);
        if(i==ids.length)
        {
            return "redirect:/cinema/list";
        }
        else
            return null;
    }
}
