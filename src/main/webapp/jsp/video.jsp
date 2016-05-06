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
    <link href="//cdn.bootcss.com/video.js/5.8.0/alt/video-js-cdn.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="//cdn.bootcss.com/video.js/5.8.0/video.js"></script>
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
        <div class="col-md-1"></div>
        <div class="col-md-8">
            <div class="video">
                <video id="my_video" class="video-js vjs-default-skin" controls preload="auto" width="820px" height="460px"
                       poster="http://video-js.zencoder.com/oceans-clip.png"
                       data-setup="{}">
                    <source src="http://vjs.zencdn.net/v/oceans.mp4" type='video/mp4'/>
                </video>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">Ocean</div>
                <div class="panel-body">
                    <p>海洋blablablabla</p>
                </div>
                <!-- List group -->
                <ul class="list-group">
                    <li class="list-group-item"><span type="button" class="glyphicon glyphicon-heart"> 14</span>
                        <span class="glyphicon glyphicon-play-circle"> 15</span></li>
                    <li class="list-group-item">类型：自然</li>
                    <li class="list-group-item"><a href="<%=request.getContextPath()%>/jsp/noteWrite.jsp">创建笔记</a></li>
                </ul>
            </div>

        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    var myPlayer = videojs('my_video');
    videojs("my_video").ready(function(){
        var myPlayer = this;
        myPlayer.play();
    });
</script>
</html>
