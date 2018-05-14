package com.fanlun.dao;

import com.fanlun.bean.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface KechengDao {

    public List<Integer> queryKecheng();

    public int insertCourse(@Param("courseList") List<Course> courseList);

}
