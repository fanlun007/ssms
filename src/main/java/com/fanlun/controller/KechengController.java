package com.fanlun.controller;

import com.fanlun.service.KechengService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class KechengController {

    @Autowired
    private KechengService kechengService;

    @RequestMapping("*/queryKechengServlet")
    @ResponseBody
    public List<Map<String, Object>> getAllKecheng(){

        return kechengService.queryKecheng();

    }
}
