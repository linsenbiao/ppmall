package com.biao.service;

import com.biao.pojo.Department;
import org.springframework.stereotype.Service;

import java.util.List;

public interface S_Department {

    List<Department> getDepts();
}
