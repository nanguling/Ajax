package com.mystudy.controller;

import com.mystudy.tool.BmiCount;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BmiServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.通过请求对象获取请求参数信息
        String name = request.getParameter("name");
        String weight = request.getParameter("w");
        String high = request.getParameter("h");
        //2.计算bmi
        double w = Double.valueOf(weight);
        double h = Double.valueOf(high);
        BmiCount.bmiCount(w,h,request);
        //3.通过请求转发向tomcat申请调用info.jsp将结果写入响应体中
        request.getRequestDispatcher("/info.jsp").forward(request,response);
    }
}
