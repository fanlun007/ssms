package com.fanlun.controller;

import com.fanlun.bean.Student;
import com.fanlun.bean.Teacher;
import com.fanlun.service.LoginService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @RequestMapping("loginServlet")
    public String login(HttpServletRequest request, HttpServletResponse response) {

        //判断是否可以转化为数字
        if (!StringUtils.isNumeric(request.getParameter("username"))) {
            request.setAttribute("error", "输入账号应为数字");
            return "forward:/index.jsp";
        }

        Integer username = Integer.parseInt(request.getParameter("username"));
        String password = request.getParameter("password");
        String user = request.getParameter("user");

//        String path = request.getContextPath() + "/index.jsp";

        if (user.equals("student")) {
            Student student = loginService.hasStudent(username, password);
            if (student != null) {
                request.getSession().setAttribute("student", student);
                return "main_student";
            } else {
                request.setAttribute("error", "用户名或密码不正确");
                return "forward:/index.jsp";
            }
        }

        if (user.equals("teacher") && username != null && password != null) {
            Teacher teacher = loginService.hasTeacher(username, password);
            if (teacher != null) {
                request.getSession().setAttribute("teacher", teacher);
                return "main";
            } else {
                request.setAttribute("error", "用户名或密码不正确");
                return "forward:/index.jsp";
            }
        }
        return "redirect:/index.jsp";
    }


    @RequestMapping("/logoutServlet")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/index.jsp";
    }
}
