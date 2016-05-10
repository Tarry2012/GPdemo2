<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 15-12-12
  Time: 下午3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问道 用户登录</title>
    <link href="<%=request.getContextPath()%>/resources/css/userLogin.css" rel="stylesheet" type="text/css"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#subuser").click(function () {
                /*提交验证，异步传输*/
                if ($("#loginName").val() == '' || $("#password").val() == '') {
                    return false;
                }
                else {
                    $.ajax({
                        url: '<%=request.getContextPath()%>/userLogin', //处理测试页面,注意返回内容，成功返回OK
                        dataType: 'text',
                        type: 'POST',
                        data: $("form").serialize(),
                        success: function (msg) {
                            msg = msg.replace(/rn/g, '');
                            if (msg == "ok") {
                                window.location.href = "<%=request.getContextPath()%>/index.jsp";
                            }
                            else {
                                alert("您输入的用户名或密码不相符，请您重新输入");
                                return;
                            }
                        }
                    });
                }
                return false;
            });
            return false;
        });
    </script>
</head>
<body>

<div class="container page-container">
    <img src="<%=request.getContextPath()%>/resources/images/login.png"/>
    <div class="panel panel-default panel-signin">
        <div class="panel-heading">用户登录</div>
        <div class="panel-body">
            <form action="" method="">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon1">用户名:</span>
                    <input type="text" class="form-control" placeholder="username/mail" aria-describedby="sizing-addon1"
                           name="loginName" id="loginName">
                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon2">密&nbsp&nbsp&nbsp码:</span>
                    <input type="password" class="form-control" placeholder="password" aria-describedby="sizing-addon2"
                           name="password" id="password">
                </div>
                <div class="button btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-default" id="subuser">登录</button>
                    <a href="<%=request.getContextPath()%>/index.jsp">
                        <button type="button" class="btn btn-default">取消</button>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>