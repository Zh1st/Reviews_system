package com.reviews_system.controller;

import com.reviews_system.dao.CommentDao;
import com.reviews_system.domain.Comment;
import com.reviews_system.service.CommentService;
import com.reviews_system.service.PageService;
import entity.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/comment")
@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    PageService classifyService;
    //sb
    //    查询所有
    //    分页查询
    static int count=0;
    @RequestMapping("/list")
    public ModelAndView list(String methods){
        if(methods==null)
        {
            methods="one";
        }
        int size=2;
        int total=commentService.selectUserCount();
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
        List<Comment> CommentList=commentService.listByPage(start,size);
        modelAndView.addObject("commentList",CommentList);
        modelAndView.addObject("pagenum",count+1);
        modelAndView.addObject("pagetotal",page);

        modelAndView.setViewName("comment-list");
        return modelAndView;
    }
    @RequestMapping("/selectByName")
    public ModelAndView selectByName(String comment_content){
//        System.out.println("找不到"+comment_content);
        List<Comment>commentlist=commentService.selectByName(comment_content);
//        System.out.println(commentlist);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("commentList",commentlist);
        modelAndView.setViewName("comment-list");
        return modelAndView;
    }
    //   插入
    @RequestMapping("/save")
    public String save(Comment comment){
        int i=commentService.save(comment);
        return "redirect:/comment/list";
    }

    //    刷新
    @RequestMapping("/refresh")
    public String refresh(){
        return "redirect:/comment/list";
    }

    //  根据id删除
    @RequestMapping("/delById/{comment_id}")
    public String delById(@PathVariable("comment_id") int comment_id){
        commentService.delById(comment_id);
        return "redirect:/comment/list";
    }

    //    根据id查询
    @ResponseBody
    @RequestMapping("/selectById")
    public Result<Comment> selectById(int comment_id){
        try{
            Comment comment=commentService.selectById(comment_id);
//            System.out.println(comment);
            if(comment==null){
                return new Result(false,"查询失败！");
            }
            return new Result(true,"查询成功",comment);
        }catch (Exception e){
            e.printStackTrace();
            return new Result(false,"查询失败！");
        }
    }

    //    根据id更新
    @RequestMapping("/updateComment")
    public String updateComment(Comment comment){
        int i=commentService.updateComment(comment);
        return "redirect:/comment/list";
    }

    //    批量删除
    @RequestMapping("/delByIds/{comment_ids}")
    public String delByIds(@PathVariable("comment_ids")int[]ids){
        for (int i:ids) {
            System.out.println(i);
        }
        int i=commentService.delByIds(ids);
        if(i==ids.length)
        {
            return "redirect:/comment/list";
        }
        else
            return null;
    }

//    用户添加评论
//    @ResponseBody
//    @RequestMapping("/addComment")
//    public String
}
