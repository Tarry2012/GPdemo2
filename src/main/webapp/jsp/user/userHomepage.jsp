<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 15-12-14
  Time: 下午8:47
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
    <%-- video.js--%>
    <link href="//cdn.bootcss.com/video.js/5.10.1/video-js.min.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/video.js/5.10.1/video.min.js"></script>
    <!--datatable-->
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/userHomepage.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/bottom.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/guess.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <title>问道 用户主页</title>

    <script>
        function aboutUs() {
            alert("软件1204 汤秋媛 \n软件1203 宋润雨")
        }
        function contactUs() {
            alert("宋润雨邮箱：songrunyu1993@gmail.com \n" +
                    "汤秋媛邮箱：njtangqy@163.com")
        }
    </script>
</head>

<body>
<div class="top_content">
    <ul>
        <li><a href="<%=request.getContextPath()%>/baseInfo">修改信息</a></li>
        <li><a href="<%=request.getContextPath()%>/userLogout">退出</a></li>
    </ul>
    </ul>

    <div class="top_title">
        欢迎 <c:out value="${username}"/>来到问道视频学习网站
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
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/computer.jsp">计算机</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/literatrue.jsp">文学</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/science.jsp">科学</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/economy.jsp">经济</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/art.jsp">艺术</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/mentality.jsp">心理</a></li>
    </ul>
</div>

<div class="conta-iner">
    <div class="row">
        <div class="col-md-3">
            <aside>
                <div class="avatar">
                    <img src="<%=request.getContextPath()%>/resources/upload/${picture}"
                         class="img-circle" width="105px"/>
                </div>
                <h5 class="text-center">${username}</h5>
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/user/looked.jsp"><img
                            src="<%=request.getContextPath()%>/resources/images/Looked.png"/></a></li>
                    <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/user/note.jsp"><img
                            src="<%=request.getContextPath()%>/resources/images/note.png"/></a></li>
                    <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/user/comments.jsp"><img
                            src="<%=request.getContextPath()%>/resources/images/comment.png"/></a></li>
                    <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/user/interest.jsp"><img
                            src="<%=request.getContextPath()%>/resources/images/interest.png"/></a></li>
                </ul>
            </aside>
        </div>
        <div class="col-md-9">
            <h2>没有历史记录</h2>
        </div>
    </div>

</div>
</div>

<div class="guess_title">
    <img src="<%=request.getContextPath()%>/resources/images/guessyoulike.png" height="45px"/>
</div>
<div class="guess_content clearfix">
    <div class="add_convenient">
        <video id="my-video1" class="video-js" controls preload="auto" width="350" height="208"
               poster="<%=request.getContextPath()%>/resources/images/index1.png" data-setup="{}">
            <source src="http://www.w3school.com.cn/i/movie.ogg" type="video/ogg"/>
            <source src="MY_VIDEO.webm" type="video/webm"/>
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
            <source src="MY_VIDEO.webm" type='video/webm'>
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
            <source src="MY_VIDEO.webm" type='video/webm'>
            <p class="vjs-no-js">
                To view this video please enable JavaScript, and consider upgrading to a web browser that
                <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
            </p>
        </video>
    </div>
</div>
</div>
<script>
    $('ul.nav-stacked>li>a').click(function () {
        $href = $(this).attr('href');
        $('.tab-content ul' + $href).show().siblings().hide();
    })
</script>
</body>
</html>
