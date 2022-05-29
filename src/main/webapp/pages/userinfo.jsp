<%--
  Created by IntelliJ IDEA.
  User: jzf
  Date: 2022/5/28
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人信息</title>
    <style>
    </style>
</head>
<body>
<div>
    <div >
        id:
        <c:out value="${user.user_id}" default="<string>" escapeXml="<true|false>"/><br/>
        名字：
        <c:out value="${user.user_name}" default="<string>" escapeXml="<true|false>"/><br/>
        密码：
        <c:out value="${user.user_password}" default="<string>" escapeXml="<true|false>"/><br/>
        电话：
        <c:out value="${user.user_phone}" default="<string>" escapeXml="<true|false>"/><br/>
        邮箱：
        <c:out value="${user.user_email}" default="<string>" escapeXml="<true|false>"/><br/>
    </div>
    <div>
        <c:forEach begin="0" end="${commentList.size()-1}" var="i">
            电影：${commentList[i].comment_content}<br/>
            评论：${filmList[i]}<br/>
        </c:forEach>
        <br/>
<%--        <c:forEach items="${commentList}" var="comment">--%>
<%--            <td>${comment.comment_content}</td><br/>--%>
<%--            <td>${comment.comment_content}</td><br/>--%>
<%--        </c:forEach>--%>
    </div>
</div>



</body>
</html>
