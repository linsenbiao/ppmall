package com.biao.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Employee implements Serializable {
    private Integer id;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)",message = "用户名应为6-16位字符或2-5位中文!")
    private String name;

    private String gender;
    //@Email
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message = "邮箱格式不正确！")
    private String email;

    private Integer did;

    private Department department;

    public Employee(Integer id, String name, String gender, String email, Integer did) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.did = did;
    }

}