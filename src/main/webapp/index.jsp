<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 反轮
  Date: 2017/12/4
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <%
        pageContext.setAttribute("app_path", request.getContextPath());
    %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${app_path}/static/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${app_path}/static/signin.css" rel="stylesheet">
</head>

<script type="text/javascript">
    
</script>

<body class="text-center">
<form class="form-signin" action="/loginServlet" method="post">
    <img class="mb-4" src="${app_path}/pic/1071150644.png" alt="吉珠中学" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    <label for="inputID" class="sr-only">Email address</label>
    <input type="text" id="username" name="username" class="form-control" placeholder="用户名" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="password" name="password" class="form-control" placeholder="密码" required>
    <div class="checkbox mb-3">
        <label>
            <input type="radio" value="student" name="user">学生&nbsp;&nbsp;
            <input type="radio" value="teacher" name="user">老师&nbsp;&nbsp;
            <input type="radio" value="admin" name="user">管理员&nbsp;&nbsp;
        </label>
    </div>
    <div>
        <c:if test="${requestScope.error != null}">
            <span style="color: red">${requestScope.error}</span>
        </c:if>
    </div>

    <button id="submit" class="btn btn-lg btn-primary btn-block" type="submit">登&nbsp;&nbsp;录</button>
    <p class="mt-5 mb-3 text-muted">&copy; 彩虹公司版权所有</p>
</form>
<div class="photo">
    <img src="${app_path}/pic/leftcartoon.jpg" width="800" height="430">

</div>
<div class="logo">
    <img src="${app_path}/pic/rainbow.jpg" alt="logo" height="100" width="100">
</div>
<div class="title">
    <img src="${app_path}/pic/rainbowFont.png" alt="title" height="75" width="370">
</div>

</body>
</html>
