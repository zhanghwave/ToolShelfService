package com.springboot.service;

import com.springboot.pojo.Student;
import com.springboot.pojo.StudentExample;
import java.util.List;


public interface StudentService {

    Student getStudentById(String id);

    List<Student> selectByExample(StudentExample studentExample);
}
