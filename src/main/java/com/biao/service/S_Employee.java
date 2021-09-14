package com.biao.service;

import com.biao.pojo.Employee;

import java.util.List;

public interface S_Employee {

    List<Employee> getAll();

    void add(Employee employee);

    boolean check(String empname);

    Employee getEmp(Integer id);

    void updateEmp(Employee employee);

    void deleteByID(Integer id);

    void deleteBatch(List<Integer> del_ids);
}
