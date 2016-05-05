<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 16/4/27
  Time: 下午1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <%-- video.js--%>
    <link href="//cdn.bootcss.com/video.js/5.8.0/video-js.min.css" rel="stylesheet">
    <!-- If you'd like to support IE8 -->
    <script src="//cdn.bootcss.com/video.js/5.8.0/video.min.js"></script>
    <%--让页面在高分辨率的手机上显示正确的尺寸，防止因为屏幕像素高而使得页面元素变得很小--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/bottom.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/course.css" rel="stylesheet" type="text/css"/>
    <title>视频</title>
</head>
<body>
<div class="top_content">
    <ul>
        <%  if (session.getAttribute("username") == null) {
        %>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userLogin.jsp">登录</a></li>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userRegister.jsp">注册</a></li>
        <%  }
        else  {
        %>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userHomepage.jsp">我的主页</a></li>
        <li><a href="<%=request.getContextPath()%>/userLogout">退出</a></li>
        <%}
        %>
    </ul>
    <div class="top_title">
        欢迎 ${username} 来到 问道视频学习网站
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
<div class="top_content">
</div>
<div class="container">
    <div class="row">
        <div class="col-md-1">hello</div>
        <div class="col-md-7">
            <div class="video">
                <video id="my-video" class="video-js" controls preload="auto" width="350" height="208"
                       poster="<%=request.getContextPath()%>/resources/images/index1.png" data-setup="{}">
                    <source src="<%=request.getContextPath()%>/resources/video/test1.mp4" type="video/mp4"/>
                    <p class="vjs-no-js">
                        To view this video please enable JavaScript, and consider upgrading to a web browser that
                        <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                    </p>
                </video>
            </div>
        </div>
        <div class="col-md-3"></div>
        <div class="col-md-1">hello</div>
    </div>
</div>
<script type="text/javascript">
    var myPlayer = videojs('my-video');
    videojs("my-video").ready(function(){
        var myPlayer = this;
        myPlayer.play();
    });
</script>
</body>
</html>
