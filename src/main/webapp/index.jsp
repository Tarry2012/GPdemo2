<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="http://vjs.zencdn.net/5.3.0/video-js.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/video.js/5.8.0/video.js"></script>
    <%--让页面在高分辨率的手机上显示正确的尺寸，防止因为屏幕像素高而使得页面元素变得很小--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<%=request.getContextPath()%>/resources/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/bottom.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/guess.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>

    <title>问道学习视频网站</title>
    <script>
        function aboutUs(){
            alert("软件1204 汤秋媛 \n软件1203 宋润雨")
        }
        function contactUs(){
            alert("宋润雨邮箱：songrunyu1993@gmail.com \n" +
                    "汤秋媛邮箱：njtangqy@163.com")
        }
    </script>
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
         <li><a href="<%=request.getContextPath()%>/userHomepage">我的主页</a></li>
         <li><a href="<%=request.getContextPath()%>/userLogout">退出</a></li>
        <%}
        %>
    </ul>
    <div class="top_title">
        欢迎来到 问道视频学习网站
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
        <li role="presentation" class="active"><a href="<%=request.getContextPath()%>/index.jsp">首页</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/computer.jsp">计算机</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/literatrue.jsp">文学</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/science.jsp">科学</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/economy.jsp">经济</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/art.jsp">艺术</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/mentality.jsp">心理</a></li>
    </ul>
</div>
<%--loge结束--%>

<div class="clearfix">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="<%=request.getContextPath()%>/resources/images/index1.png"/>
                <div class="carousel-caption">
                    <h3>这是图片标题1</h3>
                </div>
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/resources/images/index2.png"/>
                <div class="carousel-caption">
                    <h3>这是图片标题2</h3>
                </div>
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/resources/images/index3.png"/>
                <div class="carousel-caption">
                    <h3>这是图片标题3</h3>
                </div>
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <%--图片结束--%>

    <div class="rank">
        <img src="<%=request.getContextPath()%>/resources/images/hotvideo.png" height="60px"/>
        <span class="list-group">
            <a href="<%=request.getContextPath()%>/jsp/video.jsp" class="list-group-item list-group-item-success">视频1</a>
            <a href="<%=request.getContextPath()%>/jsp/video.jsp" class="list-group-item list-group-item-info">视频2</a>
            <a href="<%=request.getContextPath()%>/jsp/video.jsp" class="list-group-item list-group-item-success">视频3</a>
            <a href="<%=request.getContextPath()%>/jsp/video.jsp" class="list-group-item list-group-item-info">视频3</a>
            <a href="<%=request.getContextPath()%>/jsp/video.jsp" class="list-group-item list-group-item-success">视频4</a>
            <a href="<%=request.getContextPath()%>/jsp/video.jsp" class="list-group-item list-group-item-info">视频5</a>
            <a href="<%=request.getContextPath()%>/jsp/video.jsp" class="list-group-item list-group-item-success">视频6</a>
        </span>
    </div>
</div>

<div class="guessYouLike">
    <div class="guess_title">
        <img src="<%=request.getContextPath()%>/resources/images/guessyoulike.png" height="45px"/>
    </div>
    <div class="guess_content clearfix">
        <div class="add_convenient">
            <video id="my-video" class="video-js" controls preload="auto" width="350" height="208"
                   poster="<%=request.getContextPath()%>/resources/images/index1.png" data-setup="{}">
                <source src="http://www.w3school.com.cn/i/movie.ogg" type="video/ogg"/>
                <p class="vjs-no-js">
                    To view this video please enable JavaScript, and consider upgrading to a web browser that
                    <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                </p>
            </video>
        </div>
        <div class="add_convenient">
            <video id="my-video2" class="video-js" controls preload="auto" width="350" height="208"
                   poster="<%=request.getContextPath()%>/resources/images/index2.png" data-setup="{}">
                <source src="http://www.w3school.com.cn/i/movie.ogg" type='video/ogg'>
                <p class="vjs-no-js">
                    To view this video please enable JavaScript, and consider upgrading to a web browser that
                    <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                </p>
            </video>
        </div>
        <div class="add_convenient">
            <video id="my-video3" class="video-js" controls preload="auto" width="350" height="208"
                   poster="<%=request.getContextPath()%>/resources/images/index3.png" data-setup="{}">
                <source src="http://www.w3school.com.cn/i/movie.ogg" type='video/ogg'>
                <p class="vjs-no-js">
                    To view this video please enable JavaScript, and consider upgrading to a web browser that
                    <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                </p>
            </video>
        </div>
    </div>
</div>

<div class="bottom_base">
    <h4>版权归问道视频学习网站所有</h4>
    <input type="button" onclick="aboutUs()" value="关于我们">
    <input type="button" onclick="contactUs()" value="联系我们">
</div>
</body>
</html>
