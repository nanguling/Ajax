package com.mystudy.controller;

import com.mystudy.dao.ProvinceDao;
import com.mystudy.entity.Province;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class OneServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.通过请求对象读取请求参数信息
        String id = request.getParameter("id");
        //2.调用Dao类通过省份表的id查询省份信息
        Province p = null;
        if (id != null && id != "") {
            p = ProvinceDao.select(Integer.valueOf(id));
        }
        //3.通过响应对象将结果写入响应体
        String res = "省份名称:"+p.getName()+" 省份简称:"+p.getJiancheng();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(p.getName());
        out.flush();
        out.close();
    }
}
