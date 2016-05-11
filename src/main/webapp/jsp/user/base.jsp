<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 16/4/27
  Time: 下午5:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/resources/css/userLogin.css" rel="stylesheet" type="text/css"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件,务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/ajaxfileupload.js"></script>
    <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>
    <link href="<%=request.getContextPath()%>/resources/css/base.css" rel="stylesheet" type="text/css"/>
    <title>修改信息</title>
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
<div class="top_content"></div>
<%--loge结束--%>
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-7"><img src="<%=request.getContextPath()%>/resources/images/base.png" width="105px"/>

            <form class="form-group" action="" method="" enctype="multipart/form-data">
                <label for="exampleInputName2">Name</label>
                <input type="text" class="form-control" id="exampleInputName2" readonly="readonly" value=${username}>

                <div class="sex">
                    <label for="exampleInputName2">Sex</label>

                    <div class="select" id="sexSelect">
                        <label class="checkbox-inline">
                            <input type="radio" name="optionsRadiosinline" id="optionsRadios3"
                                   value="0" checked> 男 male
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="optionsRadiosinline" id="optionsRadios4"
                                   value="1"> 女 female
                        </label>
                    </div>
                </div>
                <div class="portrait">
                    <img src="<%=request.getContextPath()%>/resources/images/portrait.png" width="105px"/>

                    <div class="defaultPortrait">
                        <img src="<%=request.getContextPath()%>/resources/upload/${picture}"
                             class="img-circle" width="105px"/>
                    </div>
                    <div class="upload">
                        <label for="file">上传头像</label>
                        <input type="file" id="file" name="file">
                    </div>
                </div>
                <div class="submit">
                    <button type="button" class="btn btn-default" id="modsubmit">修改</button>
                    <a href="<%=request.getContextPath()%>/userHomepage"><button type="button" class="btn btn-default">取消</button></a>
                </div>
            </form>
        </div>
        <div class="col-md-3">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="#">基本资料</a></li>
                <li role="presentation"><a href="<%=request.getContextPath()%>/jsp/user/password.jsp">修改密码</a></li>
            </ul>
        </div>
        <div class="col-md-1"></div>

    </div>
</div>
</body>
<script type="text/javascript">
    $("#modsubmit").click(function () {
        $.post("<%=request.getContextPath()%>/modifySex",
                {
                    sex: $('#sexSelect input:radio:checked').val(),
                },
                function (data, status) {
                    if (data !== "ok") {
                        alert("修改失败")
                    }
                });
    });

    $("#modsubmit").click(function () {
        $.ajaxFileUpload
        (
                {
                    url: '<%=request.getContextPath()%>/modifyHead', //你处理上传文件的服务端
                    secureuri: false,
                    fileElementId: 'file',
                    dataType: 'text',
                    success: function (data) {
                        alert("图片上传成功");
                    }
                }
        )
        return false;
    });

</script>
</html>
