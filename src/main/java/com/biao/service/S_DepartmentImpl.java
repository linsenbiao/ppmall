package com.biao.service;

import com.biao.dao.DepartmentMapper;
import com.biao.pojo.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public class S_DepartmentImpl implements S_Department{
    @Autowired
    private DepartmentMapper departmentMapper;

    public DepartmentMapper getDepartmentMapper() {
        return departmentMapper;
    }

    public void setDepartmentMapper(DepartmentMapper departmentMapper) {
        this.departmentMapper = departmentMapper;
    }

    @Override
    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
