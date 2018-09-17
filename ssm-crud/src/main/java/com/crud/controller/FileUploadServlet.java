package com.crud.controller;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.Collection;

//@WebServlet("/fileUpload")
//@MultipartConfig
public class FileUploadServlet extends HttpServlet{
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        System.out.println(email);
        Collection<Part> parts = request.getParts();
        for (Part p:
             parts) {
            if(p.getName().equals("file1")){
                InputStream inputStream = p.getInputStream();
                p.write("d://ttt.jpg");
               // FileOutputStream out ;

            }

        }

       /* String email = request.getParameter("email");//普通的api的方式只对 application/x-www-form-urlencoded 有效的
        System.out.println(email);*/
    }
}
