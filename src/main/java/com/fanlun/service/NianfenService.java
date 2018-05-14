package com.fanlun.service;

import com.fanlun.dao.NianfenDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class NianfenService {

    @Autowired
    private NianfenDao nianfenDao;

    public List<Map<String, Object>> queryNianfen(){
        List<Integer> years = nianfenDao.queryNianfen();

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        for (int year : years) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("year_key", year);
            map.put("year_value", year);
            list.add(map);
        }
        return list;
    }

}
