package com.fanlun.dao;


import com.fanlun.bean.Student;
import com.fanlun.bean.Teacher;

import java.util.List;

public interface TeaAccoDao {

    public List<Teacher> getTeaAcco();
    public int TeaCount();

    public List<Student> getStuAcco();
    public int StuCount();

}
