package com.crud.controller;

import com.crud.entity.Emp;
import com.crud.entity.User;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/demo")//名称空间
public class DemoController {
    @RequestMapping("/getDate")
    @ResponseBody //json 返回是数据一般采用键值对的形式,如Map
    //yyyy-MM-dd  可是这个格式可能只在中国地方受欢迎
    //spring mvc 对于日期类型没有默认的格式
    public Object getDateDemo(User user){//400 的错误,就是 参数解释报错,根本没有到达控制层的具体 方法
        System.out.println(user.getBirthday());
        Map<String,Object> rs = new HashMap<>();
        rs.put("success",true);
        return rs;
    }
}
