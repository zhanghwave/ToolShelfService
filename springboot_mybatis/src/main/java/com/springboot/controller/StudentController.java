package com.springboot.controller;

import com.springboot.pojo.Student;
import com.springboot.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @program: myspring
 * @description: 查询业务
 * @author: zhanghww
 * @create: 2021-05-04 10:32
 **/
@Controller
@RequestMapping(value = "/student")
public class StudentController {
    @Autowired
    StudentService studentService;

    @GetMapping(value = "/getStudent/{id}")
    public Student getStudentById(@PathVariable String id) {
        return studentService.getStudentById(id);
    }
    @GetMapping(value = "/test")
    @ResponseBody
    public String test() {
        return "hello";
    }
}
