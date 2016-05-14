<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css">
  <%--让页面在高分辨率的手机上显示正确的尺寸，防止因为屏幕像素高而使得页面元素变得很小--%>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link href="<%=request.getContextPath()%>/resources/css/top.css" rel="stylesheet" type="text/css"/>
  <link href="<%=request.getContextPath()%>/resources/css/navigation.css" rel="stylesheet" type="text/css"/>
  <link href="<%=request.getContextPath()%>/resources/css/bottom.css" rel="stylesheet" type="text/css"/>
  <link href="<%=request.getContextPath()%>/resources/css/guess.css" rel="stylesheet" type="text/css"/>
  <link href="<%=request.getContextPath()%>/resources/css/all.css" rel="stylesheet" type="text/css"/>

    <%--<link rel="apple-touch-icon" href="//mindmup.s3.amazonaws.com/lib/img/apple-touch-icon.png" />--%>
    <link rel="shortcut icon" href="http://mindmup.s3.amazonaws.com/lib/img/favicon.ico" >
    <link href="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/css/note.css" rel="stylesheet">


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
    欢迎<c:out value="${username}"/>来到问道视频学习网站
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

<div class="container">
    <div class="jumbotron" style="margin-top: 20px;">
        <div class="pull-right">
            <div class="fb-like" data-href="http://facebook.com/mindmupapp" data-send="false" data-layout="button_count" data-width="100" data-show-faces="false"></div><br/>
        </div>
        <%--<h2>我的笔记--%>
        <img src="<%=request.getContextPath()%>/resources/images/notewrite.png" /> <br/> <small>&nbsp;&nbsp;记录点滴......</small></h2>
        <hr/>
        <form action="" method="">
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">title</span>
            <input type="text" class="form-control" placeholder="title" aria-describedby="basic-addon1" id="title">
        </div>
        </form>
        <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
            <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
                <ul class="dropdown-menu">
                </ul>
            </div>
            <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
                    <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
                    <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
                </ul>
            </div>
            <div class="btn-group">
                <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
                <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
                <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
                <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
            </div>
            <div class="btn-group">
                <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
                <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
                <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
                <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
            </div>
            <div class="btn-group">
                <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
                <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
                <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
                <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
            </div>
            <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
                <div class="dropdown-menu input-append">
                    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
                    <button class="btn" type="button">Add</button>
                </div>
                <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

            </div>

            <div class="btn-group">
                <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
                <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
            </div>
            <div class="btn-group">
                <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
                <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
            </div>
            <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
        </div>
        <form action="" method="">
        <div id="editor" name="editor">
            Go ahead...&hellip;
        </div>
        <div class="btn-submit">
            <button type="button" class="btn btn-default" id="submit" >Submit</button>
        </div>
            </form>
    </div>
</div>
<div class="guessYouLike">
  <div class="guess_title">
    <img src="<%=request.getContextPath()%>/resources/images/guessyoulike.png" style="height: 45px"/>
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

<div class="bottom_base">
  <h4>版权归问道视频学习网站所有</h4>
  <input type="button" onclick="aboutUs()" value="关于我们">
  <input type="button" onclick="contactUs()" value="联系我们">
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.hotkeys.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap-wysiwyg.js"></script>
<script>
    $(function(){
        function initToolbarBootstrapBindings() {
            var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                        'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                        'Times New Roman', 'Verdana'],
                    fontTarget = $('[title=Font]').siblings('.dropdown-menu');
            $.each(fonts, function (idx, fontName) {
                fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
            });
            $('a[title]').tooltip({container:'body'});
            $('.dropdown-menu input').click(function() {return false;})
                    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
                    .keydown('esc', function () {this.value='';$(this).change();});

            $('[data-role=magic-overlay]').each(function () {
                var overlay = $(this), target = $(overlay.data('target'));
                overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
            });
            $('#voiceBtn').hide();
        };
        initToolbarBootstrapBindings();
        $('#editor').wysiwyg();
        window.prettyPrint && prettyPrint();
    });
</script>
<script type="text/javascript">
    $(document).ready(function () {

        $("#submit").click(function () {
            /*提交验证，异步传输*/
            var title = document.getElementById("title").value;
            var myText = document.getElementById("editor").innerText;
            var url = window.location.pathname;
            var arr = url.split("/");

            $.ajax({
                type: 'post',
                url: '<%=request.getContextPath()%>/video/addNote',
                data: {
                    "title":title,
                    "videoId":arr[3],
                    "note": myText
                },
                success: function (msg) {
                    alert("已保存到我的笔记");
                }
            });
            return false;
        });
        return false;
    });
</script>

</body>
</html>
