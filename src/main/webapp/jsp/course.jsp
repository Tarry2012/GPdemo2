<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 16/4/26
  Time: 下午3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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
    <!-- If you'd like to support IE8 -->
    <%--让页面在高分辨率的手机上显示正确的尺寸，防止因为屏幕像素高而使得页面元素变得很小--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/course.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <title>计算机</title>
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
        <li><a href="<%=request.getContextPath()%>/userHomepage">我的主页</a></li>
        <li><a href="<%=request.getContextPath()%>/userLogout">退出</a></li>
        <%
            }
        %>
    </ul>
    <div class="top_title">
        欢迎 <c:out value="${username}"/> 来到问道视频学习网站
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
<div class="navigation">
    <ul class="nav nav-pills">
        <li role="presentation"><a href="<%=request.getContextPath()%>/index.jsp">首页</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/video/type?limit=0&offset=5&interestid=1">计算机</a>
        </li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/video/type?limit=0&offset=5&interestid=2">文学</a>
        </li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/video/type?limit=0&offset=5&interestid=3">科学</a>
        </li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/video/type?limit=0&offset=5&interestid=4">经济</a>
        </li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/video/type?limit=0&offset=5&interestid=5">艺术</a>
        </li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/video/type?limit=0&offset=5&interestid=6">心理</a>
        </li>
    </ul>
</div>
<%--loge结束--%>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="listVideo" id="parentDiv">
            </div>
            <div class="nav">
                <nav>
                    <ul class="pager">
                        <li class="previous" id="previousId"><a href="">上一页<span aria-hidden="true"></span></a></li>
                        <li class="next" id="nextId"><a href="">下一页<span aria-hidden="true"></span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>

<script>
    $(document).ready(function () {
        var data = ${videoDOList};
        if (data.videoDOList.length == 0) {
            var divParent = $('#parentDiv');
            divParent.append("该类目下没有数据");
        } else {
            var msg = data['videoDOList'];
            var divParent = $('#parentDiv');
            for (var i = 0; i < data.videoDOList.length; i++) {
                var videoName = data.videoDOList[i]['videoName'];
                var videoLikes = data.videoDOList[i]['videoLike'];
                var videoPlay = data.videoDOList[i]['videoPlay'];
                var videoPictureUrl = "<%=request.getContextPath()%>" + "/resources/images/video/" + msg[i]['videoPicture'];
                var videoUrl = "<%=request.getContextPath()%>" + "/video/" + msg[i]["videoId"];
                var videoDescribe = data.videoDOList[i]['videoDescribe'];
                var obj = "<div class='list-group'> <a href='" + videoUrl + "' class='list-group-item'> <h4 class='list-group-item-heading'>" + videoName +
                        "</h4> <div class='tag'><span class='glyphicon glyphicon-heart'>" + videoLikes + "</span> <span class='glyphicon glyphicon-play-circle'>" + videoPlay +
                        "</span> </div> <div class='image'><img src='" + videoPictureUrl + "'/></div> <div class='list-group-item-tex'>" + videoDescribe + "</div> </a> </div>"
                divParent.append(obj);
            }
        }
    });

    $('#previousId').click(function(){
        var  = window.location.search;

    });
</script>
</body>
</html>
