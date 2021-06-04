package com.springboot;


import com.springboot.pojo.Course;
import com.springboot.pojo.Student;
import com.springboot.service.StudentService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {
    Logger logger = Logger.getLogger(DemoApplicationTests.class);
    @Autowired
    private StudentService studentService;
    @Test
    public void contextLoads() {
        logger.debug(">>>>开始");
        Student studentById = studentService.getStudentById("0811101");
        logger.debug(studentById.getSname());
        logger.debug(">>>>结束");
    }
    /**
    * @Description: spring创建实例bean测试
    * @Param:
    * @return:
    * @Author: zhanghww
    * @Date: 2021/6/3
    */
    @Test
    public void createBeans() {
        /*构造器法*/
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("bean.xml");
        Course course01 = (Course) context.getBean("course01");
        Course course02 = (Course) context.getBean("course02");
        System.out.println(course01);
        System.out.println(course02);
        logger.debug(course01);
        logger.debug(course02.getCname());
        /*静态工厂方法实例化*/
        ClassPathXmlApplicationContext factory = new ClassPathXmlApplicationContext("bean.xml");
        Course course03 = (Course)factory.getBean("course03");
        System.out.println(course03.getCname());
    }
}
