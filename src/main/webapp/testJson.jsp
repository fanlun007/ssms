<%--
  Created by IntelliJ IDEA.
  User: fanlun
  Date: 2018/4/19
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>testjson</title>
</head>
<body>
    <a href="/testjson">test Json</a>

    <a href="/getAllScore">getAllScore</a>

    <br/>
    <a href="/teacher/teacherInfo">teacherInfo</a>

    <br/>
    <br/>

    <form id="import" action="import.go" method="post" enctype="multipart/form-data">
        文件：<input type="file" name="uploadFile" id=""/>
        <input type="submit" value="导入"/>
    </form>

</body>
</html>
