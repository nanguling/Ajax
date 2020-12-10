
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
            //alert(data);
            //更新页面，就是更新dom
            var obj = eval("("+data+")");//eval是执行括号中的代码，把json字符串转为json对象
            callback(obj);
          }
        }

        //3.初始化异步请求对象
        var id = document.getElementById("id").value;
        var param = "one?id="+id;
        //true表示异步处理请求。使用异步对象发起请求后，不用等待数据处理完毕，就可以执行其他的操作
        //false表示同步。异步对象必须处理完成请求，从服务器端获取数据后，才能执行send之后的代码，任意时刻只能同时处理一个请求
        xmlObj.open("get",param,false);

        //4.代替浏览器发送请求
        xmlObj.send();


        //也可以创建其他的异步对象，发送其他的请求处理


        alert("====在send之后的代码====")
      }
      function callback(obj) {
        document.getElementById("name").value = obj.name;
        document.getElementById("jiancheng").value = obj.jiancheng;
        document.getElementById("shenghui").value = obj.shenghui;
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
            <tr>
              <td>省会</td>
              <td><input type="text" id="shenghui"></td>
            </tr>
          </table>
        </center>
  </body>
</html>
