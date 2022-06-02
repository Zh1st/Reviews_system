package com.reviews_system.controller;

import com.reviews_system.domain.Comment;
import com.reviews_system.domain.Film;
import com.reviews_system.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.reviews_system.domain.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserInfoController {
    @Autowired
    private UserInfoService userInfoService;


    @RequestMapping("/userInfo")
    public ModelAndView test(HttpSession httpSession){
        String id=(String) httpSession.getAttribute("userid");
        int userid=Integer.parseInt(id);
        User user=userInfoService.selectById(userid);
        List<Comment> commentList=userInfoService.selectCommentByUserID(1);
        List<String> filmList = new ArrayList<String>();
        System.out.println(user);
        System.out.println("11111111111111111111111");
        for (Comment c:commentList
             ) {
            System.out.println(c);
            System.out.println(c.getFilm_id());
            String film_name=userInfoService.findFilmNameById(c.getFilm_id());
            System.out.println(film_name);
            filmList.add(film_name);
        }
        for (String f:filmList
             ) {
            System.out.println(f);
        }
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.addObject("commentList",commentList);
        modelAndView.addObject("filmList",filmList);
        modelAndView.setViewName("userinfo");

        return modelAndView;
    }

    @RequestMapping("/showUserInfo")
    public void showUserInfo(int id){
        User user=userInfoService.selectById(8);
        System.out.println(user);

    }
}
