
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>ajax根据省份id获取名称</title>
    <script type="text/javascript">
      function doAjax() {
        //1.创建异步请求对象
        var xmlObj = new XMLHttpRequest();

        //2.给异步请对象绑定onreadystatechange事件
        xmlObj.onreadystatechange = function () {
          //处理结果，更新页面数据
          if (xmlObj.readyState == 4 && xmlObj.status == 200) {
            var data = xmlObj.responseText;
            // alert(data);
            //更新页面，就是更新dom
            document.getElementById("name").value = data;
          }
        }

        //3.初始化异步请求对象
        var id = document.getElementById("id").value;
        var param = "one?id="+id;
        xmlObj.open("get",param,true);

        //4.代替浏览器发送请求
        xmlObj.send();
      }
    </script>
  </head>
  <body>
        <center>
          <P>ajax根据省份id获取名称</P>
          <table border="2">
            <tr>
              <td>省份编号</td>
              <td><input type="text" id="id"></td>
              <td><input type="button" value="搜索" onclick="doAjax()"></td>
            </tr>
            <tr>
              <td>省份名称</td>
              <td><input type="text" id="name"></td>
            </tr>
            <tr>
              <td>省份简称</td>
              <td><input type="text" id="jiancheng"></td>
            </tr>
          </table>
        </center>
  </body>
</html>
