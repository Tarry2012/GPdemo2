<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 15-12-13
  Time: 下午4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问道 用户注册</title>
    <link href="<%=request.getContextPath()%>/resources/css/userRegister.css" rel="stylesheet" type="text/css"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">
    function match(info, expression){
            var regExp = new RegExp(expression)
            if (regExp.test(info)){
                return true;
            }else{
                return false;
            }
    }

    $(document).ready(function(){
      $("#username").onblur(function(){
      if ($("#username").val() == '' || !match($("#username").val(),"^[\u4e00-\u9fa5]{1,7}$|^[\dA-Za-z_]{1,14}$")) {
            alert("最长不得超过7个汉字，或14个字节(数字，字母和下划线)") }
      else {
             $.ajax({
                     url: '<%=request.getContextPath()%>/userIsExist', //处理测试页面,注意返回内容，成功返回OK
                     dataType: 'text',
                     type: 'POST',
                     data: $("form").serialize(),
                     success: function (msg) {
                     msg = msg.replace(/rn/g, '');
                     if (msg == "error") {
                        alert("用户名已被注册");
                      }
                          }
                       });
                       return false;
             }
             return false;
      });
    });

</script>
</head>
<body>
<div class="container page-container">
    <img src="<%=request.getContextPath()%>/resources/images/register.png"/>

    <div class="panel panel-default panel-signin">
        <div class="panel-heading">用户注册</div>
        <div class="panel-body">
            <form action="" method="">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon1">用户名&nbsp&nbsp:&nbsp&nbsp</span>
                    <input type="text" class="form-control" placeholder="Username" aria-describedby="sizing-addon1"
                           name="username" id="username">
                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon1">密&nbsp&nbsp&nbsp&nbsp&nbsp码&nbsp&nbsp:&nbsp</span>
                    <input type="password" class="form-control" placeholder="Password" aria-describedby="sizing-addon1"
                           name="password1" id="password1">
                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon1">确认密码&nbsp:</span>
                    <input type="password" class="form-control" placeholder="Password" aria-describedby="sizing-addon1"
                           name="password2" id="password2">
                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon1">邮&nbsp&nbsp&nbsp&nbsp&nbsp箱&nbsp&nbsp:&nbsp</span>
                    <input type="text" class="form-control" placeholder="Mail" aria-describedby="sizing-addon1"
                           name="usermail" id="usermail">
                </div>
                <div class="button btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-default">注册</button>
                    <a href="index.jsp">
                        <button type="button" class="btn btn-default">取消</button>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
