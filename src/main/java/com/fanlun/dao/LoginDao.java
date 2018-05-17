package com.fanlun.dao;

import com.fanlun.bean.Student;
import com.fanlun.bean.Teacher;
import org.apache.ibatis.annotations.Param;

public interface LoginDao {

    public Teacher hasTeacher(@Param("tno") Integer tno, @Param("password") String password);
    public Student hasStudent(@Param("sno") Integer sno, @Param("password") String password);
    public Teacher hasManager(@Param("tno") Integer tno, @Param("password") String password);


}
