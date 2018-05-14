package com.fanlun.controller;


import com.fanlun.bean.Course;
import com.fanlun.bean.Page;
import com.fanlun.bean.Score;
import com.fanlun.service.KechengService;
import com.fanlun.service.ScoreService;
import com.fanlun.service.TestJsonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class testController {

    @Autowired
    private TestJsonService testJsonService;

    @Autowired
    private ScoreService scoreService;

    @Autowired
    private KechengService kechengService;

    /*@RequestMapping("loginServlet")
    public String test() {
        System.out.println("loginservlet");
        return "main";
    }*/

    //还是需要通过控制器来获取WEB-INF 下资源
    @RequestMapping("teacher/cjcx")
    public String testcjcx() {
        return "teacher/cjcx";
    }


    @RequestMapping("testjson")
    public String testjson() {
        System.out.println("testjson。jsp");
        int stuCount = testJsonService.getStudentCount();
        System.out.println(stuCount);
        return "test/testJson";
    }

    @RequestMapping("teacher/scoreServlet")
    @ResponseBody
    public Map testgetAllScore(Score score, HttpServletRequest request) {
        System.out.println(score);
        String page1 = request.getParameter("page");
        String rows = request.getParameter("rows");

        Page page = new Page(Integer.parseInt(page1), Integer.parseInt(rows));
        List<Score> scores = scoreService.getListScore(score);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("rows", scores);
        result.put("total", scoreService.scoreCount(score));

        return result;
    }

    @RequestMapping("/import.go")
    public ModelAndView importTest(@RequestParam(value = "uploadFile") MultipartFile mFile, HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv = new ModelAndView("success");
        String rootPath = request.getSession().getServletContext().getRealPath(File.separator);

        List<Course> courseLists = kechengService.insertCourseByXLS(mFile, rootPath);

        mv.addObject("type", "import");
        mv.addObject("courseLists", courseLists);
        System.out.println("rootPath:" + rootPath);

        return mv;
    }
}
