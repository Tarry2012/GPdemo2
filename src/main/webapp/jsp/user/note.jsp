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
    <!--datatable-->
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.10/js/jquery.dataTables.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/userHomepage.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/bottom.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/guess.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/course.css" rel="stylesheet" type="text/css"/>
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

<div class="conta-iner">
    <div class="row">
        <div class="col-md-3">
            <aside>
                <div class="avatar">
                    <img src="<%=request.getContextPath()%>/resources/upload/${picture}" class="img-circle"/>
                </div>
                <h5 class="text-center"><c:out value="${username}"/></h5>
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="<%=request.getContextPath()%>/userHomepage?limit=0&offset=3"><img
                            src="<%=request.getContextPath()%>/resources/images/Looked.png"/></a></li>
                    <li role="presentation"><a href="<%=request.getContextPath()%>/note"><img
                            src="<%=request.getContextPath()%>/resources/images/note.png"/></a></li>
                    <li role="presentation"><a href="<%=request.getContextPath()%>/comments"><img
                            src="<%=request.getContextPath()%>/resources/images/comment.png"/></a></li>
                    <li role="presentation"><a href="<%=request.getContextPath()%>/interest"><img
                            src="<%=request.getContextPath()%>/resources/images/interest.png"/></a></li>
                </ul>
            </aside>
        </div>
        <div class="col-md-9" id="parentDiv">
        </div>
    </div>
</div>
</div>

<div class="guessYouLike">
    <div class="guess_title">
        <img src="<%=request.getContextPath()%>/resources/images/guessyoulike.png" height="45px"/>
    </div>
    <div class="guess_content clearfix" id="videoParent">
    </div>
</div>
<script>
    $('ul.nav-stacked>li>a').click(function () {
        $href = $(this).attr('href');
        $('.tab-content ul' + $href).show().siblings().hide();
    })
</script>
<script>
    $(document).ready(function () {
        var url = "<%=request.getContextPath()%>/note/getNote";
        $.get(url, function (data, status) {

            var parentdiv = $('#parentDiv');
            for (var i = 0; i <= data.note.length; i++) {
                var noteId = data.note[i]['noteId'];
                var noteName = data.note[i]['noteName'];
                var videoId = data.note[i]['videoId'];
                var noteContent = data.note[i]['noteContent'];
                var dateObj = new Date(data.note[i]['noteTime']);
                var UnixTimeToDate = dateObj.getUTCFullYear() + '年' + (dateObj.getUTCMonth() + 1 ) + '月' + dateObj.getUTCDate() + '日  ' + dateObj.getHours() + ':' + dateObj.getUTCMinutes() + ':' + dateObj.getUTCSeconds();
                var obj = "<div class='list-group'> <a href='<%=request.getContextPath()%>/note/" + noteId + "/editNote' class='list-group-item'> <h4 class='list-group-item-heading'>"
                        + noteName + "</h4> <div class='tag'><span class='glyphicon glyphicon-time'>"
                        + UnixTimeToDate + "</span></div> <div class='list-group-item-tex'>" + noteContent + "</div> </a> </div>";
                parentdiv.append(obj);
            }
        });
    })

    $(document).ready(function () {
        var url = "<%=request.getContextPath()%>/video/recommend";
        var parentDiv = ('#videoParent');
        $.get(url, function (data, status) {
            for (var i = 0; i < data.videoDOList.length; i++) {
                var msg = data['videoDOList'];
                var videoUrl = "<%=request.getContextPath()%>/resources/video/" + msg[i]["videoUrl"];
                var videoPictureUrl = "<%=request.getContextPath()%>/resources/images/video/" + msg[i]["videoPicture"];
                var videoId = "video" + data['videoDOList'][i]['videoId'];
                var videoName = data['videoDOList'][i]['videoName'];
                //alert("videoUrl: " + videoUrl + " videoPictureUrl: " + videoPictureUrl + " videoId: " + videoId);
                var obj = "<div class='add_convenient'> <video id='" + videoId + "' class='video-js vjs-big-play-centered' controls preload='auto' width='350px' height='208px' poster='" + videoPictureUrl + "' data-setup='{}'> <source src='" + videoUrl + "' type='video/mp4'/> " +
                        "</video> <h4 class='textName' style='text-align: center'>" + videoName + "</h4></div>";
                $('#videoParent').append(obj);
                //parentDiv.append(obj);
            }
        });
    });
</script>
</body>
</html>
