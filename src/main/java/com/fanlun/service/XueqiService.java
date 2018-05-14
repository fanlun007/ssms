package com.fanlun.service;

import com.fanlun.dao.XueqiDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class XueqiService {

    @Autowired
    private XueqiDao xueqiDao;

    public List<Map<String, Object>> getSemester(){
        List<String> semesters = xueqiDao.queryXueqi();

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        for (String semester : semesters){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("semester_key", semester);
            map.put("semester_value", semester);
            list.add(map);
        }
        return list;
    }

}
