<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 16/4/28
  Time: 上午10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/resources/css/userLogin.css" rel="stylesheet" type="text/css"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/password.css" rel="stylesheet" type="text/css"/>

    <title>修改密码</title>

</head>
<body>
<div class="top_content">
    <ul>
        <% if (session.getAttribute("username") == null) {
        %>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userLogin.jsp">登录</a></li>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userRegister.jsp">注册</a></li>
        <% } else {
        %>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userHomepage.jsp">我的主页</a></li>
        <li><a href="<%=request.getContextPath()%>/userLogout">退出</a></li>
        <%
            }
        %>
    </ul>
    <div class="top_title">
        欢迎 ${username} 来到问道视频学习网站
    </div>
</div>
<%--top结束--%>
<div class="logo">
    <div class="logo_left">
        <img src="<%=request.getContextPath()%>/resources/images/wendaologo.png" alt="logoImage">
    </div>
    <div class="logo_middle"><img src="<%=request.getContextPath()%>/resources/images/sunny.png" height="80px"/></div>
    <div class="logo_right">
        <form action="" method="get">
            <div class="search_text">
                <input name="search" type="text" placeholder="请输入搜索内容"/>
                <button name="searchButton" type="button"><i class="glyphicon glyphicon-search"></i></button>
            </div>
        </form>
    </div>
</div>
<div class="top_content"></div>
<%--loge结束--%>
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-7"><img src="<%=request.getContextPath()%>/resources/images/password.png" width="105px"/>
            <form class="form-group" action="<%=request.getContextPath()%>/checkOldPassword" method="post">
                <div class="form-group">
                    <label for="InputPassword1">旧密码</label>
                    <input type="password" class="form-control" id="InputPassword1" name="InputPassword1" placeholder="旧密码">
                </div>
                <div class="form-group">
                    <label for="InputPassword2">新密码</label>
                    <input type="password" class="form-control" id="InputPassword2" name="InputPassword2" placeholder="新密码">
                </div>
                <div class="form-group">
                    <label for="InputPassword3">重复密码</label>
                    <input type="password" class="form-control" id="InputPassword3" name="InputPassword3" placeholder="重复密码">
                </div>
                <div class="submit">
                    <%--<button type="button" class="btn btn-default">修改</button>--%>
                    <input type="submit" value="修改"/>
                    <button type="button" class="btn btn-default">取消</button>
                </div>
            </form>
        </div>
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" ><a href="<%=request.getContextPath()%>/jsp/user/base.jsp">基本资料</a></li>
                <li role="presentation" class="active"><a href="#">修改密码</a></li>
            </ul>
        </div>
        <div class="col-md-1"></div>

    </div>
</div>
</body>
</html>
