package com.fanlun.service;

import com.fanlun.bean.Score;
import com.fanlun.bean.Student;
import com.fanlun.bean.Teacher;
import com.fanlun.dao.ScoreDao;
import com.fanlun.dao.StudentDao;
import com.fanlun.dao.TeaAccoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeaAccoService {
    @Autowired
    private TeaAccoDao teaAccoDao;


    public List<Teacher> getTeaAcco(){
        return teaAccoDao.getTeaAcco();
    }
    public int TeaCount(){
        return teaAccoDao.TeaCount();
    }

    public List<Student> getStuAcco(){
        return teaAccoDao.getStuAcco();
    }
    public int StuCount(){ return teaAccoDao.StuCount(); }
}
