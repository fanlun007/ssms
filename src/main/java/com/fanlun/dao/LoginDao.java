package com.fanlun.dao;

import com.fanlun.bean.Teacher;
import org.apache.ibatis.annotations.Param;

public interface LoginDao {

    public Teacher hasTeacher(@Param("tno") Integer tno, @Param("password") String password);


}
