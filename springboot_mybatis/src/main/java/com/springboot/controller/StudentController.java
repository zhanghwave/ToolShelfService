package com.springboot.controller;

import com.springboot.pojo.Student;
import com.springboot.pojo.StudentExample;
import com.springboot.service.StudentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @program: myspring
 * @description: 查询业务
 * @author: zhanghww
 * @create: 2021-05-04 10:32
 **/
@Controller
@RequestMapping(value = "/student")
public class StudentController {

    private static final String INDEX_PAGE = "index";
    private static Logger log = LoggerFactory.getLogger(StudentController.class);

    @Autowired
    StudentService studentService;

    @GetMapping(value = "/getStudent/{id}")
    @ResponseBody
    public Student getStudentById(@PathVariable String id) {
        return studentService.getStudentById(id);
    }

   @RequestMapping(value = "/listStudent", method = RequestMethod.POST)
   @ResponseBody
   public List<Student> studentList(@RequestBody Student student) {
       StudentExample studentExample = new StudentExample();
       StudentExample.Criteria criteria = studentExample.createCriteria();
       criteria.andDeptEqualTo(student.getDept());
       criteria.andSnameIsNotNull();
       studentExample.setDistinct(true);
       List<Student> students = studentService.selectByExample(studentExample);
       log.debug(students.toString());
       return students;
   }

    @GetMapping(value = "/test")
    @ResponseBody
    public String test(@RequestParam(value = "sname", required = false) String name) {
        return "hello!";
    }

    /**
    * @Description: thymeleaf 测试
    * @Param: [map]
    * @return: java.lang.String
    * @Author: zhanghww
    * @Date: 2021/5/17
    */
    @RequestMapping(value = "/thymeleaf", method = RequestMethod.GET)
    public String thymeleafTest(@RequestParam String sno, Model model){
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andSnoGreaterThan(sno);
        List<Student> students = studentService.selectByExample(studentExample);
        model.addAttribute("students", students);
        return INDEX_PAGE;
    }
}
