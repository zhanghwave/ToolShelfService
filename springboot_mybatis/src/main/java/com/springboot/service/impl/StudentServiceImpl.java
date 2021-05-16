package com.springboot.service.impl;

import com.springboot.mapper.StudentMapper;
import com.springboot.pojo.Student;
import com.springboot.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: myspring
 * @description: 实现层
 * @author: zhanghww
 * @create: 2021-05-04 11:37
 **/

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public Student getStudentById(String id) {
        System.out.println("---");
        return studentMapper.selectByPrimaryKey(id);
    }
}
