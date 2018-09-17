package com.crud.controller;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/file")
public class FileUpladController {
    private  static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm_ssSSS");
    @RequestMapping("/submitUpload")
    public String fileUpload(String email, MultipartFile file1,HttpServletRequest request) throws UnsupportedEncodingException {
        String dir = request.getSession().getServletContext().getRealPath("/fileupload");//取tomcat 对应部署真实路径
        String file1Name = file1.getName();
        String originalFilename = file1.getOriginalFilename();//中国.jpg    -->
        String fileName2Save = dateFormat.format(new Date())+(int)(Math.random()*10000000)+originalFilename.substring(originalFilename.lastIndexOf(".")).trim();

        try {
            file1.transferTo(new File(dir,fileName2Save));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }

    public static void main(String[] args) {
        String originalFilename ="中国.jpg   ";// file1.getOriginalFilename();//中国.jpg    -->
        String fileName = dateFormat.format(new Date())+(int)(Math.random()*10000000)+originalFilename.substring(originalFilename.lastIndexOf(".")).trim();
        System.out.println(fileName);
    }
}
