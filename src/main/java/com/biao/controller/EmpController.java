package com.biao.controller;

import com.biao.pojo.Employee;
import com.biao.pojo.Msg;
import com.biao.service.S_Employee;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmpController {

    @Autowired
    S_Employee s_employee;

    //检查用户名是否可用
    @RequestMapping("/check")
    @ResponseBody
    public Msg check(@RequestParam("empname") String empname){
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
        if(!empname.matches(regx)){
            return Msg.fail().add("va_msg","用户名应为6-16位字符或2-5位中文!");
        }
        boolean b = s_employee.check(empname);
        if(b){
            return Msg.success();
        }
        return Msg.fail().add("va_msg","用户名不可用");
    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsInfo(@RequestParam(value = "pn",defaultValue = "1") int pn){
        //在查询之前调用，传入页码，以及每页大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的就是一个分页查询
        List<Employee> employees = s_employee.getAll();
        //使用pageinfo包装查询后的结果，只需将pageinfo交给页面即可
        //封装了详细的分页信息，包括连续显示的页数
        PageInfo pageInfo = new PageInfo(employees,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping("/add")
    @ResponseBody
    //@Valid 代表封装以后的数据要进行校验
    //BindingResult 封装校验结果
    public Msg saveAdd(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            //提取错误信息在模态框中显示
            List<FieldError> fieldErrors = result.getFieldErrors();
            Map<String,Object> errors = new HashMap<>();
            for (FieldError fieldError : fieldErrors) {
                System.out.println(fieldError.getField());
                System.out.println(fieldError.getDefaultMessage());
                errors.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorfields",errors);
        }else{
            s_employee.add(employee);
            return Msg.success();
        }
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id){
        Employee emp = s_employee.getEmp(id);
        System.out.println(emp);
        return Msg.success().add("emp",emp);
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveupdate(Employee employee){
        System.out.println(employee);
        s_employee.updateEmp(employee);
        return Msg.success();
    }

    //单删多删二合一
    @RequestMapping(value = "/delete/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delete(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            String[] del_ids = ids.split("-");
            List<Integer> list = new ArrayList<>();
            for (String del_id : del_ids) {
                list.add(Integer.parseInt(del_id));
            }
            s_employee.deleteBatch(list);
        }else{
            Integer id = Integer.parseInt(ids);
            s_employee.deleteByID(id);
        }
        return Msg.success();
    }

    //@RequestMapping("/emps")
    public String getAllemps(@RequestParam(value = "pn",defaultValue = "1") int pn, Model model){
        //在查询之前调用，传入页码，以及每页大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的就是一个分页查询
        List<Employee> employees = s_employee.getAll();
        for (Employee employee : employees) {
            System.out.println(employee.toString());
        }
        //使用pageinfo包装查询后的结果，只需将pageinfo交给页面即可
        //封装了详细的分页信息，包括连续显示的页数
        PageInfo pageInfo = new PageInfo(employees,5);
        model.addAttribute("pageInfo",pageInfo);

        return "list";
    }
}
