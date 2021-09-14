package com.biao.controller;

import com.biao.pojo.Department;
import com.biao.pojo.Msg;
import com.biao.service.S_Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptController {

    @Autowired
    private S_Department s_department;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDeptsInfo(){
        List<Department> depts = s_department.getDepts();
        return Msg.success().add("depts",depts);
    }
}
