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
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/userHomepage.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/bottom.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/guess.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <title>问道 用户主页</title>

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
        <li><a href="#">修改信息</a></li>
        <li><a href="<%=request.getContextPath()%>/jsp/user/userHomepage.jsp">我的主页</a></li>
    </ul>
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
<div class="navigation">
    <ul class="nav nav-pills">
        <li role="presentation" ><a href="<%=request.getContextPath()%>/index.jsp">首页</a></li>
        <li role="presentation" ><a href="#">计算机</a></li>
        <li role="presentation" ><a href="#">文学</a></li>
        <li role="presentation" ><a href="#">科学</a></li>
        <li role="presentation" ><a href="#">经济</a></li>
        <li role="presentation" ><a href="#">艺术</a></li>
        <li role="presentation" ><a href="#">心理</a></li>

    </ul>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <aside>
                <div class="avatar">
                    <img src="<%=request.getContextPath()%>/resources/images/defaultHeadPortrait.png" class="img-circle"/>
                </div>
                <h5 class="text-center">${username}</h5>
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="#history"><img
                            src="<%=request.getContextPath()%>/resources/images/Looked.png"/></a></li>
                    <li role="presentation"><a href="#note"><img
                            src="<%=request.getContextPath()%>/resources/images/note.png"/></a></li>
                    <li role="presentation"><a href="#comments"><img
                            src="<%=request.getContextPath()%>/resources/images/comment.png"/></a></li>
                    <li role="presentation"><a href="#interest"><img
                            src="<%=request.getContextPath()%>/resources/images/interest.png"/></a></li>
                </ul>
            </aside>
        </div>
        <div class="col-md-9">
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- Tab history -->
                <ul role="tabpanel" class="tab-pane fade" id="history" name="history">
                    <div class="no-item">还没有看过视频</div>
                </ul>
                <!-- Tab note -->
                <ul role="tabpanel" class="tab-pane fade" id="note" href="#note" name="note">
                    <h5>笔记0</h5>
                    <div class="seg">
                        <div class="row">
                        </div>
                    </div>
                    <h5>笔记1</h5>
                    <div class="seg">
                        <div class="row">
                        </div>
                    </div>
                    <h5>笔记2</h5>
                    <div class="seg">
                        <div class="row">
                        </div>
                    </div>
                </ul>
                <!-- Tab comment -->
                <ul role="tabpanel" class="tab-pane fade" id="comments" href="#comments" name="comments">
                    <div class="row">
                        <div class="no-item">还没有评价</div>
                    </div>
                </ul>
                <!-- Tab interest -->
                <ul role="tabpanel" class="tab-pane fade" id="interest" href="#interest" name="interest">
                    <div class="row">
                        <div class="no-item">暂无兴趣</div>
                    </div>
                </ul>
            </div>
        </div>

    </div>
</div>

<div class="guess_title">
    <img src="<%=request.getContextPath()%>/resources/images/guessyoulike.png" height="45px"/>
</div>
<div class="guess_content clearfix">
    <div class="add_convenient">
        <video id="my-video" class="video-js" controls preload="auto" width="350" height="208"
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
        <video id="my-video" class="video-js" controls preload="auto" width="350" height="208"
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
        <video id="my-video" class="video-js" controls preload="auto" width="350" height="208"
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
    $('ul.nav-stacked>li>a').click(function(){
        $href = $(this).attr('href');
        $('.tab-content ul' + $href).show().siblings().hide();
    })
</script>
</body>
</html>
