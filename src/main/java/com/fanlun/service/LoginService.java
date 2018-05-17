package com.fanlun.service;

import com.fanlun.bean.Student;
import com.fanlun.bean.Teacher;
import com.fanlun.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {


    @Autowired
    private LoginDao loginDao;

    public Student hasStudent(Integer username, String password){

        Student student = loginDao.hasStudent(username,password);

        return student;
    }

    public Teacher hasTeacher(Integer username, String password){

        Teacher teacher = loginDao.hasTeacher(username, password);

        return teacher;
    }

    public Teacher hasManager(Integer username, String password){

        Teacher teacher = loginDao.hasManager(username, password);

        return teacher;
    }

}
