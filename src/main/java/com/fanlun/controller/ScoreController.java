package com.fanlun.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.fanlun.bean.Score;
import com.fanlun.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ScoreController {

    @Autowired
    private ScoreService scoreService;


    @RequestMapping("teacher/scoreModifyServlet")
    @ResponseBody
    public Map scoreModify(HttpServletRequest request) throws UnsupportedEncodingException {

        String sno = request.getParameter("sno");
        String cno = request.getParameter("cno");
        String year = request.getParameter("year");
        String semester = request.getParameter("semester");
        semester = URLDecoder.decode(semester, "UTF-8");
        String chapter = request.getParameter("chapter");
        String grade = request.getParameter("grade");
        String tno = request.getParameter("tno");

        Score score = new Score(Integer.parseInt(sno), Integer.parseInt(cno), Integer.parseInt(tno), Integer.parseInt(year), semester, Integer.parseInt(chapter), Integer.parseInt(grade));

        Map<String, Object> result = new HashMap<String, Object>();
        int saveNums = 0;
        saveNums = scoreService.scoreModify(score);

        if (saveNums > 0) {
            result.put("success", "true");
        } else{
            result.put("success", "false");
            result.put("errorMsg", "保存失败");
        }
        return result;
    }

    @RequestMapping("*/scoreListAddServlet")
    @ResponseBody
    public Map scoreAddList(HttpServletRequest request){
        String addSnos = request.getParameter("addSnos");
        JSONObject json = JSONObject.parseObject(addSnos);

        JSONArray jsonArray = json.getJSONArray("data");

        System.out.println(jsonArray.toString());
        List<Score> scoreList = jsonArray.toJavaList(Score.class);
        System.out.println(scoreList);

        Map<String, Object> result = new HashMap<String, Object>();
        int addNums = scoreService.scoreListAdd(scoreList);

        if (addNums > 0) {
            result.put("success", "true");
            result.put("addNums", addNums);
        }else{
            result.put("errorMsg", "上传失败");
        }
        return result;
    }

    @RequestMapping("teacher/scoreDeleteServlet")
    @ResponseBody
    public Map scoreDelete(HttpServletRequest request){
        String deleteSnos = request.getParameter("deleteSnos");
        JSONObject json = JSONObject.parseObject(deleteSnos);

        JSONArray jsonArray = json.getJSONArray("data");

        System.out.println(jsonArray.toString());

        List<Score> scoreList = jsonArray.toJavaList(Score.class);
        System.out.println(scoreList);

        Map<String, Object> result = new HashMap<>();
        int delNums = scoreService.scoreDelete(scoreList);

        if (delNums > 0) {
            result.put("success", "true");
            result.put("delNums", delNums);
        } else{
            result.put("errorMsg", "删除失败");
        }
        return result;
    }

}
