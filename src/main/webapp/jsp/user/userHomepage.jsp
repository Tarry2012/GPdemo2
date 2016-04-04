<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 15-12-14
  Time: 下午8:47
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
    <!--datatable-->
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/userHomepage.css" rel="stylesheet" type="text/css"/>
    <title>问道 用户主页</title>
</head>
<body>
<div class="top_content">
    <ul>
        <li><a href="#">修改信息</a></li>
        <li><a href="<%=request.getContextPath()%>/userLogin.jsp">我的主页</a></li>
    </ul>
    </ul>

    <div class="top_title">
        欢迎(替换成用户名)来到 问道视频学习网站
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
        <li role="presentation" class="disabled"><a href="#">首页</a></li>
        <li role="presentation" class="disabled"><a href="#">计算机</a></li>
        <li role="presentation" class="disabled"><a href="#">哲学</a></li>
        <li role="presentation" class="disabled"><a href="#">历史</a></li>
        <li role="presentation" class="disabled"><a href="#">心理</a></li>
        <li role="presentation" class="disabled"><a href="#">数学</a></li>
        <li role="presentation" class="disabled"><a href="#">文学</a></li>
    </ul>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <aside>
                <div class="avatar">
                    <img src="<%=request.getContextPath()%>/resources/images/defaultHeadPortrait.png"/>
                </div>
                <h5 class="text-center">替换成用户名</h5>
                <ul class="list-group">
                    <li class="list-group-item">
                        <button onclick=""><img src="resources/images/Looked.png"/></button>
                    </li>
                    <li class="list-group-item">
                        <button onclick=""><img src="resources/images/note.png"/></button>
                    </li>
                    <li class="list-group-item">
                        <button onclick=""><img src="resources/images/comment.png"/></button>
                    </li>
                    <li class="list-group-item">
                        <button onclick=""><img src="resources/images/interest.png"/></button>
                    </li>
                </ul>
            </aside>
        </div>
        <div class="col-md-9">
        </div>
    </div>

    <div s="guessYouLike">
        <div class="guess_title">
            <img src="<%=request.getContextPath()%>/resources/images/guessyoulike.png" height="45px"/>
        </div>
        <div class="guess_content clearfix">
            <div class="add_convenient">
                <video id="myvideo" class="video-js" controls preload="auto" width="350" height="208"
                       poster="<%=request.getContextPath()%>/resources/images/2a.jpg" data-setup="{}">
                    <source src="http://www.w3school.com.cn/i/movie.ogg" type="video/ogg"/>
                    <source src="MY_VIDEO.webm" type="video/webm"/>
                    <p class="vjs-no-js">
                        To view this video please enable JavaScript, and consider upgrading to a web browser that
                        <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                    </p>
                </video>
            </div>
            <div class="add_convenient">
                <video id="myvideo" class="video-js" controls preload="auto" width="350" height="208"
                       poster="<%=request.getContextPath()%>/resources/images/2a.jpg" data-setup="{}">
                    <source src="<%=request.getContextPath()%>/resources/video/李易峰-请跟我联络.mp4" type='video/ogg'>
                    <source src="MY_VIDEO.webm" type='video/webm'>
                    <p class="vjs-no-js">
                        To view this video please enable JavaScript, and consider upgrading to a web browser that
                        <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                    </p>
                </video>
            </div>
            <div class="add_convenient">
                <video id="myvideo" class="video-js" controls preload="auto" width="350" height="208"
                       poster="<%=request.getContextPath()%>/resources/images/2a.jpg" data-setup="{}">
                    <source src="<%=request.getContextPath()%>/resources/video/李易峰-请跟我联络.mp4" type='video/ogg'>
                    <source src="MY_VIDEO.webm" type='video/webm'>
                    <p class="vjs-no-js">
                        To view this video please enable JavaScript, and consider upgrading to a web browser that
                        <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                    </p>
                </video>
            </div>
        </div>
    </div>
</div>
</body>
</html>
