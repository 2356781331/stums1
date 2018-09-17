package com.crud.controller;

import com.crud.entity.Dept;
import com.crud.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class DeptController {

    @Autowired//根据类型去查找
    /*@Resource()//根据名称去查找
    @Qualifier("deptServiceImpl")*/
    private DeptService deptService;


    @RequestMapping("/getAllDepts")
    @ResponseBody
    public List<Dept> getDepts(){
        List<Dept> list=deptService.selectByExample();
        return  list;
    }
}
