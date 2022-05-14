package com.reviews_system.controller;

import com.reviews_system.domain.Film;
import com.reviews_system.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping(value = "upload")
public class FileUploadController {
    @Autowired
    private FilmService filmService;

    private static final String BASEDIR = "E:\\a\\";

    @RequestMapping(value = "singleFileUpload")
    @ResponseBody
    public String singleFileUpload(Film film, MultipartFile pictureFile) throws IOException {
        if (pictureFile != null) {
            String newFileName = saveFile(pictureFile);
            System.out.println(newFileName);
            film.setPicture(newFileName);
        }
        // 电影修改
//        filmService.updatefilm(film);
        return "success";
    }

    public String saveFile(MultipartFile pictureFile) throws IOException {
        String newFileName = null;
        if (pictureFile != null) {
            // 获取文件名称
            String originalFilename = pictureFile.getOriginalFilename();
            if (originalFilename != null && !"".contentEquals(originalFilename)) {
                // 获取扩展名
                String extName = originalFilename.substring(originalFilename.lastIndexOf("."));
                // 重新生成一个新的文件名
                newFileName = UUID.randomUUID().toString() + extName;
                // 指定存储文件的根目录
                File dirFile = new File(BASEDIR);
                if (!dirFile.exists()) {
                    dirFile.mkdirs();
                }
                // 将上传的文件复制到新的文件（完整路径）中
                pictureFile.transferTo(new File(BASEDIR + newFileName));
            }
        }
        return newFileName;
    }
}
