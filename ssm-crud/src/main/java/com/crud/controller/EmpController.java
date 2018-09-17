package com.crud.controller;

import com.crud.entity.Emp;
import com.crud.service.EmpService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmpController {
    @Autowired
    private EmpService empService;
   //添加员工
    @RequestMapping(value = "/addEmp",method= RequestMethod.POST)
    @ResponseBody
    public void addEmp(Emp emp){
        empService.addEmp(emp);
    }
    //修改表单回显数据
    @RequestMapping(value = "/getEmp/{id}",method= RequestMethod.GET)
    @ResponseBody
    public Emp getEmp(@PathVariable("id")Integer id){
        Map<String,Object> rs = new HashMap<>();
        Emp emp= empService.getEmp(id);
        return emp;
    }

    //修改员工
    @RequestMapping(value = "/updateEmp/{empId}",method= RequestMethod.PUT)
    @ResponseBody
    public String updateEmp(Emp emp){
        empService.updateEmp(emp);
        return "success";
    }

    //验证员工是否存在
    @RequestMapping("/findEmpByname")
    @ResponseBody
    public String findEmpByname(@RequestParam(value = "empName")String empName){
        boolean flag= empService.findEmpByname(empName);
        if(flag){
            return "success";
        }else {
            return "fail";
        }
    }


    //查询所有员工分页显示
    @RequestMapping("/findAllemp")
    public String findAll(@RequestParam(value = "pageno",defaultValue ="1" )Integer pageno, Model model, HttpServletRequest request, HttpServletResponse response){//pageno =null
        PageHelper.startPage(pageno,10);
        List<Emp> list= empService.findAll();
        PageInfo pageInfo=new PageInfo(list,5);
        model.addAttribute("pageInfo",pageInfo);

        return "list";
    }

    //单一/批量删除员工
    @RequestMapping(value = "/deleteEmp/{ids}",method= RequestMethod.DELETE)
    @ResponseBody
    public String deleteEmp(@PathVariable("ids") String ids){
        List<Integer> list=new ArrayList<>();
        if(ids.contains("-")){
            String[] idlist = ids.split("-");
            for(String s:idlist){
                list.add(Integer.parseInt(s));
            }
            empService.deleteEmps(list);
        }else {
            Integer id=Integer.parseInt(ids);
            empService.deleteEmp(id);
        }
        return "success";
    }
}
