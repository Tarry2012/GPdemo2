<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 16/4/26
  Time: 下午3:50
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
    <%--让页面在高分辨率的手机上显示正确的尺寸，防止因为屏幕像素高而使得页面元素变得很小--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/course.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <title>课程</title>
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
<div class="navigation">
    <ul class="nav nav-pills">
        <li role="presentation"><a href="<%=request.getContextPath()%>/index.jsp">首页</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/computer.jsp">计算机</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/literatrue.jsp">文学</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/science.jsp">科学</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/economy.jsp">经济</a></li>
        <li role="presentation" class="active"><a href="<%=request.getContextPath()%>/jsp/art.jsp">艺术</a></li>
        <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/mentality.jsp">心理</a></li>
    </ul>
</div>
<%--loge结束--%>

<div class="container">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="list-group">
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">IOS7 应用开发</h4>
                    <div class="tag"><span class="glyphicon glyphicon-heart"> 14</span>
                        <span class="glyphicon glyphicon-comment"> 15</span>
                    </div>
                    <div class="image"><img
                            src="<%=request.getContextPath()%>/resources/images/ios7.png"/></div>
                    <div class="list-group-item-tex">
                        适用于iOS7。本课程介绍了使用Xcode5建造iPhone平台上的应用程序所需的工具和应用程序接口；使用多点触控技术，为手机等终端设计用户互交界面等技术进行面向对象的设计。其他主题包括：内核动画、bonjour网络、移动终端电量管理和性能测评。
                    </div>
                </a>
            </div>
            <div class="list-group">
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">IOS7 应用开发</h4>
                    <div class="tag"><span class="glyphicon glyphicon-heart"> 14</span>
                        <span class="glyphicon glyphicon-comment"> 15</span>
                    </div>
                    <div class="image"><img
                            src="<%=request.getContextPath()%>/resources/images/index1.png"/></div>
                    <div class="list-group-item-tex">
                        老师旁征博引，讲课幽默引人入胜，不乏深刻的见地，对俄罗斯文学名著进行当代阐释，揭示其中永恒的美学价值和社会意义，注重文学和当代的联系。不会拘于文学，思想开放。
                    </div>
                </a>
            </div>
            <div class="list-group">
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">IOS7 应用开发</h4>
                    <div class="tag"><span class="glyphicon glyphicon-heart"> 14</span>
                        <span class="glyphicon glyphicon-comment"> 15</span>
                    </div>
                    <div class="image"><img
                            src="<%=request.getContextPath()%>/resources/images/index1.png"/></div>
                    <div class="list-group-item-tex">
                        老师旁征博引，讲课幽默引人入胜，不乏深刻的见地，对俄罗斯文学名著进行当代阐释，揭示其中永恒的美学价值和社会意义，注重文学和当代的联系。不会拘于文学，思想开放。
                    </div>
                </a>
            </div>
            <div class="list-group">
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">IOS7 应用开发</h4>
                    <div class="tag"><span class="glyphicon glyphicon-heart"> 14</span>
                        <span class="glyphicon glyphicon-comment"> 15</span>
                    </div>
                    <div class="image"><img
                            src="<%=request.getContextPath()%>/resources/images/index1.png"/></div>
                    <div class="list-group-item-tex">
                        老师旁征博引，讲课幽默引人入胜，不乏深刻的见地，对俄罗斯文学名著进行当代阐释，揭示其中永恒的美学价值和社会意义，注重文学和当代的联系。不会拘于文学，思想开放。
                    </div>
                </a>
            </div>
            <div class="list-group">
                <a href="#" class="list-group-item">
                    <h4 class="list-group-item-heading">IOS7 应用开发</h4>
                    <div class="tag"><span class="glyphicon glyphicon-heart"> 14</span>
                        <span class="glyphicon glyphicon-comment"> 15</span>
                    </div>
                    <div class="image"><img
                            src="<%=request.getContextPath()%>/resources/images/index1.png"/></div>
                    <div class="list-group-item-tex">
                        老师旁征博引，讲课幽默引人入胜，不乏深刻的见地，对俄罗斯文学名著进行当代阐释，揭示其中永恒的美学价值和社会意义，注重文学和当代的联系。不会拘于文学，思想开放。
                    </div>
                </a>
            </div>

            <div class="nav">
                <nav>
                    <ul class="pager">
                        <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
                        <li class="next"><a href="#">Newer <span aria-hidden="true">&rarr;</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>

</body>
</html>