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
    <title>个人中心</title>
    <link rel="stylesheet" href="../css/bootstrap@4.6.min.css" >
    <link rel="stylesheet" href="../css/style2.css" type="text/css" media="all" />
    <link rel="stylesheet" href="../css/userinfo.css" type="text/css" media="all" />
    <link rel="stylesheet" href="../css/information.css" rel="stylesheet" type="text/css">
    <style>
    </style>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-expand-lg navbar-light " style="background-color:#CDE4DA;height: 65px;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="background-color: #CDE4DA;">
            <li class="breadcrumb-item active" aria-current="page"><a href="#" style="color: gray;">主页</li></a>
            <li class="breadcrumb-item"><a href="#" style="color: black;">
                <c:out value="${user.user_name}" default="<string>" escapeXml="<true|false>"/>的个人中心</a></li>
        </ol>
    </nav>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto" style="font-size: 26px; margin-left: 620px;font-family:'幼圆'">
            <li class="nav-item active" >
                <a class="nav-link" href="#"
                   style="margin-left: 20px;">主页</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#"
                   style="margin-left: 20px;">分类</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/userInfo"
                   style="margin-left: 20px;">个人中心</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="${pageContext.request.contextPath}/userInfo"
                   style="margin-left: 20px;">订单中心</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="点此搜索" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
        </form>
    </div>
</nav>


<div class="zong">
    <div class="name" >欢迎您：</div>
    <img src="../images/xiaolian.png" class="nametu"  height="16%">
    <div class="name1">
        <c:out value="${user.user_name}" default="<string>" escapeXml="<true|false>"/><br/>
    </div>
    <div class="dianhua">电话：<br/></div>
    <img src="../images/dianhua.png" class="dianhuatu"  height="12%">
    <div class="dianhua1">
        <c:out value="${user.user_phone}" default="<string>" escapeXml="<true|false>"/></div>
    <div class="youxiang" >绑定邮箱：<br/></div>
    <img src="../images/youjian.png" class="youxiangtu"  height="12%">
    <div class="youxiang1">
        <c:out value="${user.user_email}" default="<string>" escapeXml="<true|false>"/>
    </div>
<%--    <img class="tu" src="{{ url_for('static',filename='images/cool-background.png')}}"></a>--%>
</div>


<div class="row" style="margin-top: 30px;">
    <div class="col"></div>
    <div class="beijing" >
        <ul class="comment-group" >


            <!--			在这插入循环-->
            <c:forEach begin="0" end="${commentList.size()-1}" var="i">
            <li >
                <div class="user-info" >
                    <span class="username">${filmList[i]}</span>
                </div>
                <p class="comment-content">${commentList[i].comment_content}</p>
            </li>
            </c:forEach>
        </ul>
    </div>
    <div class="col"></div>
</div>

</body>
</html>
