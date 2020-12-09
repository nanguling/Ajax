package com.mystudy.controller;

import com.mystudy.tool.BmiPrintCount;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class BmiPrintServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.通过请求对象获取请求参数信息
        String name = request.getParameter("name");
        String weight = request.getParameter("w");
        String high = request.getParameter("h");
        //2.计算bmi
        double w = Double.valueOf(weight);
        double h = Double.valueOf(high);
        String res = BmiPrintCount.bmiCount(w,h,request);
        //3.将结果直接通过响应对象打印
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(res);
        //清空缓存,目的让输出数据立刻输出给浏览器
        out.flush();
        //关闭
        out.close();
    }
}
