<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fanlun
  Date: 2018/5/1
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成功</title>
</head>
<body>
<c:if test="${type == 'import'}">
    <div>导入成功</div>
    <c:forEach items="${courseLists}" var="course">
        <div>
            CNO: ${course.cno} | CN: ${course.cn} | <br/>
        </div>
    </c:forEach>
</c:if>
</body>
</html>
