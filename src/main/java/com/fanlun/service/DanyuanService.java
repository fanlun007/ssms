package com.fanlun.service;

import com.fanlun.dao.DanyuanDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DanyuanService {

    @Autowired
    private DanyuanDao danyuanDao;

    public List<Map<String, Object>> queryKecheng(){
        List<Integer> chapters = danyuanDao.queryDanyuan();

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        for (int chapter : chapters){
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("chapter_key", chapter);
            map.put("chapter_value", chapter);
            list.add(map);
        }
        return list;
    }

}
