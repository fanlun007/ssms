package com.fanlun.service;

import com.fanlun.dao.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestJsonService {
    @Autowired
    private StudentDao studentDao;

    public int getStudentCount(){
        return studentDao.studentCount();
    }
}
