<%--
  Created by IntelliJ IDEA.
  User: tqy
  Date: 15-12-13
  Time: 下午4:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>问道 用户注册</title>
    <link href="<%=request.getContextPath()%>/resources/css/userRegister.css" rel="stylesheet" type="text/css"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        function checkEmail() {
            var re = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
            var email = document.getElementById('usermail').value;
            if (email != null && email.length > 0) {
                if (!re.test(email)) {
                    alert("你输入的email不合法");
                }
            }
            else {
                alert("请输入Email!");
            }
        }

        function checkPassword1(){
            var re = /^[a-zA-Z]\w{5,17}$/;
            var password = document.getElementById('password1').value;
            if (password != null && password.length > 0){
                if(!re.test(password)){
                    alert("以字母开头，长度在6~18之间，只能包含字母、数字和下划线")
                }
            }
        }

    </script>
</head>
<body>
<div class="container page-container">
    <img src="<%=request.getContextPath()%>/resources/images/register.png"/>

    <div class="panel panel-default panel-signin">
        <div class="panel-heading">用户注册</div>
        <div class="panel-body">
            <form action="" method="">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon1">用户名&nbsp&nbsp:&nbsp&nbsp</span>
                    <input type="text" class="form-control" placeholder="字母开头，允许5-16字节，允许字母数字下划线" aria-describedby="sizing-addon1"
                           name="username" id="username"/>
                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon"
                          id="sizing-addon1">密&nbsp&nbsp&nbsp&nbsp&nbsp码&nbsp&nbsp:&nbsp</span>
                    <input type="password" class="form-control" placeholder="以字母开头，长度在6~18之间，只能包含字母、数字和下划线" aria-describedby="sizing-addon1"
                           name="password1" id="password1"/>

                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon" id="sizing-addon1">确认密码&nbsp:</span>
                    <input type="password" class="form-control" placeholder="以字母开头，长度在6~18之间，只能包含字母、数字和下划线" aria-describedby="sizing-addon1"
                           name="password2" id="password2"/>
                </div>
                <div class="input-group input-group-lg" onmouseout="checkEmail()">
                    <span class="input-group-addon"
                          id="sizing-addon1">邮&nbsp&nbsp&nbsp&nbsp&nbsp箱&nbsp&nbsp:&nbsp</span>
                    <input type="text" class="form-control" placeholder="Mail" aria-describedby="sizing-addon1"
                           name="usermail" id="usermail"/>
                </div>
                <div class="button btn-group" role="group" aria-label="...">
                    <button type="button" class="btn btn-default">注册</button>
                    <a href="index.jsp">
                        <button type="button" class="btn btn-default">取消</button>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
