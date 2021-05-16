package com.springboot;


import com.springboot.pojo.Student;
import com.springboot.service.StudentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {
    @Autowired
    private StudentService studentService;
    @Test
    public void contextLoads() {
        //StudentService studentService = new StudentServiceImpl();
        Student studentById = studentService.getStudentById("0811101");
        System.out.println("test");
        System.out.printf(studentById.getSname());
    }
}
