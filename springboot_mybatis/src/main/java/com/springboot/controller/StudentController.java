package com.springboot.controller;

import com.springboot.pojo.Student;
import com.springboot.pojo.StudentExample;
import com.springboot.service.StudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program: myspring
 * @description: 查询业务
 * @author: zhanghww
 * @create: 2021-05-04 10:32
 **/
@RestController
@RequestMapping(value = "/student")
public class StudentController {

    Logger logger = Logger.getLogger(StudentController.class);

    @Autowired
    StudentService studentService;

    @GetMapping(value = "/getStudent/{id}")
    public Student getStudentById(@PathVariable String id) {
        return studentService.getStudentById(id);
    }

   @RequestMapping(value = "/listStudent", method = RequestMethod.POST)
   public List<Student> studentList(@RequestBody Student student) {
       StudentExample studentExample = new StudentExample();
       StudentExample.Criteria criteria = studentExample.createCriteria();
       criteria.andDeptEqualTo(student.getDept());
       criteria.andSnameIsNotNull();
       studentExample.setDistinct(true);
       List<Student> students = studentService.selectByExample(studentExample);
       logger.debug(students.toString());
       return students;
   }

    @GetMapping(value = "/test")
    public String test(@RequestParam(value = "sname", required = false) String name) {
        return "hello!";
    }
}
