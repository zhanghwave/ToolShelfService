package com.springboot.utils;

import com.springboot.pojo.Course;

/**
 * @program: LearningServcice
 * @description:
 * @author: Mr.Wang
 * @create: 2021-06-03 15:06
 **/
public class FactoryInstance {

    public Course getCourse(String param01, String param02, Integer param03) {
        return new Course(param01,param02, param03);
    }
}
