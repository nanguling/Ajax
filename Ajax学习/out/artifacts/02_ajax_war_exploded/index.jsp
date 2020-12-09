
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>局部刷新-ajax</title>
    <script type="text/javascript">
        //使用内存中的异步对象，代替浏览器发起请求。异步对象使用js创建和管理的
        function doAjax() {
            //1.创建异步对象
            var xmlObj = new XMLHttpRequest();

            //2.为异步对象绑定onreadystatechange事件
            xmlObj.onreadystatechange = function () {
                //得到处理结果，更新页面
                if (xmlObj.readyState == 4 && xmlObj.status == 200) {
                    //得到响应体中的数据
                    var mes = xmlObj.responseText;
                    //1.直接弹窗显示数据
                    //alert(mes)

                    //2.更新dom对象，更新页面数据
                    document.getElementById("one").innerHTML = mes;
                }
            };

            //3.初始化异步对象
            var name = document.getElementById("name").value;
            var w = document.getElementById("w").value;
            var h = document.getElementById("h").value;
            //http://localhost:8080/myweb/bmi?name=xx&w=xx&h=xx
            var param = "bmi?name="+name+"&w="+w+"&h="+h;

            xmlObj.open("get",param,true);

            //4.使用异步对象代替浏览器向服务器发送请求
            xmlObj.send();
        }
    </script>
  </head>
  <body>
      <P>局部刷新计算bml</P>
      <div>
        <!--没有使用form表单-->
        姓名：<input type="text" id="name"><br>
        体重：<input type="text" id="w"><br>
        身高：<input type="text" id="h"><br>
        <input type="button" value="提交" onclick="doAjax()">
          <br>
          <br>
          <div id="one">等待加载数据...</div>
      </div>
  </body>
</html>
