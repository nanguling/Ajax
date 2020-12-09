package com.mystudy.tool;

import javax.servlet.http.HttpServletRequest;

public class BmiCount {
    public static void bmiCount(double w, double h, HttpServletRequest request) {
        String msg = "";
        double bmi = w/(h*h);
        if (bmi <= 18.5) {
            msg = "过轻";
        }else if (bmi > 18.5 && bmi <= 23.9) {
            msg = "正常";
        }else if (bmi >= 24 && bmi <= 27) {
            msg = "过重";
        }else {
            msg = "肥胖";
        }
        request.setAttribute("key",msg);
    }
}
