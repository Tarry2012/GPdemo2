<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 16/4/27
  Time: 下午1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
    <%-- video.js--%>
    <link href="//cdn.bootcss.com/video.js/5.10.1/video-js.min.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/video.js/5.10.1/video.min.js"></script>
    <!-- jquery-comments文件 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/jquery-comments.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"><!-- Data -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/data/comments-data.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-comments.js"></script>

    <style type="text/css">
        body {
            padding: 20px;
            margin: 0px;
            font-size: 14px;
            font-family: "Arial", Georgia, Serif;
        }
    </style>

    <%--让页面在高分辨率的手机上显示正确的尺寸，防止因为屏幕像素高而使得页面元素变得很小--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/bottom.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/video.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/course.css" rel="stylesheet" type="text/css"/>

    <title>视频</title>
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
        欢迎 <c:out value="${username}"/> 来到 问道视频学习网站
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
        <div class="col-md-1">
        </div>
        <div class="col-md-7">
            <div class="video">
                <video id="my_video" class="video-js" controls preload="auto" width="350" height="208"
                       poster="<%=request.getContextPath()%>/resources/images/index3.png" data-setup="{}">
                    <source src="<%=request.getContextPath()%>/${videoUrl}" type="video/mp4"/>
                    <p class="vjs-no-js">
                        To view this video please enable JavaScript, and consider upgrading to a web browser that
                        <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                    </p>
                </video>
            </div>
            <div class="blank">
            </div>
            <div class="comments">
                <div id="comments-container"></div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading"><c:out value="${videoName}"/></div>
                <div class="panel-body">
                    <p><c:out value="${videoDescribe}"/></p>
                </div>
                <!-- List group -->
                <ul class="list-group">
                    <li class="list-group-item"><span type="button" class="glyphicon glyphicon-heart"> <c:out value="${videoLikes}"/></span>
                        <span class="glyphicon glyphicon-play-circle"> <c:out value="${videoPlays}"/> </span></li>
                    <li class="list-group-item">类型： <c:out value="${videoType}"/></li>
                    <li class="list-group-item"><a href="<%=request.getContextPath()%>/${noteUrl}">创建笔记</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    $(document).ready(function () {
        $('#comments-container').comments({
            getComments: function (success, error) {
                $.post("<%=request.getContextPath()%>/video/getComment",
                        {
                            videoId: "123"
                        },
                        function (jsonArray) {
//                            obj = JSON.parse(jsonArray);
                            success(jsonArray['data']);
                        });
            },
            postComment: function (commentJSON, success, error) {
                $.ajax({
                    type: 'post',
                    url: '<%=request.getContextPath()%>/video/{videoId}/addComment',
                    data: {'comment': JSON.stringify(commentJSON)},
                    success: function () {
                        success(commentJSON);
                    },
                    error: error
                });
            }

        });
        $('#comments-container').comments({
            refresh: function () {
                $('#comments-container').addClass('rendered');
            }
        });

    });

</script>

</html>
