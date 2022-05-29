package com.reviews_system.service;

import com.reviews_system.domain.Comment;
import com.reviews_system.domain.User;

import java.util.List;

public interface UserInfoService {


    User selectById(int user_id);


    List<Comment> selectCommentByUserID(int user_id);

    String findFilmNameById(int film_id);
}
