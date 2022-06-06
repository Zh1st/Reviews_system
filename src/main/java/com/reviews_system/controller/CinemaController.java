package com.reviews_system.controller;

import com.reviews_system.domain.Category;
import com.reviews_system.domain.Cinema;
import com.reviews_system.domain.Film;
import com.reviews_system.service.CinemaService;
import com.reviews_system.service.FilmService;
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
    @Autowired
    private FilmService filmService;

    //    分页查询
    static int count=0;
    @RequestMapping("/list")
    public ModelAndView list(String methods){
        if(methods==null)
        {
            methods="one";
        }
        int size=10;
        int total=cinemaService.selectCinemaCount();
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
        List<Cinema>cinemaList=cinemaService.listByPage(start,size);
        modelAndView.addObject("cinemaList",cinemaList);
        modelAndView.addObject("pagenum",count+1);
        modelAndView.addObject("pagetotal",page);
        modelAndView.setViewName("cinema-list");
        return modelAndView;
    }

//    @RequestMapping("/list")
//    public ModelAndView list(){
//        ModelAndView modelAndView=new ModelAndView();
//        List<Cinema> cinemaList=cinemaService.findAll();
//        modelAndView.addObject("cinemaList",cinemaList);
//        modelAndView.setViewName("cinema-list");
//        return modelAndView;
//    }

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

    @RequestMapping("/weblist")
    public ModelAndView weblist(int film_id){
        ModelAndView modelAndView=new ModelAndView();
        List<Cinema> cinemaList=cinemaService.findAll();
        Film film=filmService.selectById(film_id);
        modelAndView.addObject("film",film);
        modelAndView.addObject("cinemaList",cinemaList);
        modelAndView.setViewName("choose");
        return modelAndView;
    }

}
