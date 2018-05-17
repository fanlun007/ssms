package com.fanlun.controller;

import com.fanlun.service.DanyuanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class DanyuanController {

    @Autowired
    private DanyuanService danyuanService;

    @RequestMapping("*/queryDanyuanServlet")
    @ResponseBody
    public List<Map<String, Object>> getAllDanyuan(){
        return danyuanService.queryKecheng();
    }
}
