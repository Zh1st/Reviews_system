<%--
  Created by IntelliJ IDEA.
  User: 41388
  Date: 2022/6/1
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单详情</title>
    <link href="../css/bootstrap@4.6.min.css" rel="stylesheet">
    <link href="../css/information.css" rel="stylesheet" type="text/css">
    <link href="../css/style2.css" rel="stylesheet" type="text/css">
</head>
<body>
<%--导航条--%>
<nav class="navbar navbar-expand-lg navbar-light " style="background-color:#CDE4DA;height: 65px;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="background-color: #CDE4DA;">
            <li class="breadcrumb-item active" aria-current="page"><a href="#" style="color: gray;">主页</a></li>
            <li class="breadcrumb-item">${film.film_name} <a href="#" style="color: black;">
            </a></li>
        </ol>
    </nav>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto" style="font-size: 26px; margin-left: 640px;font-family:'幼圆'">
            <li class="nav-item ">
                <a class="nav-link" href="#"
                   style="margin-left: 20px;">主页</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="#"
                   style="margin-left: 20px;">分类</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="${pageContext.request.contextPath}/userInfo"
                   style="margin-left: 20px;">个人中心</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="${pageContext.request.contextPath}/order/findOrderByUserId"
                   style="margin-left: 20px;">订单中心</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="点此搜索" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
        </form>
    </div>
</nav>


<div class="row" style="margin-top: 30px;">
    <div class="col"></div>
    <div class="beijing">
        <ul class="comment-group">
            <!--在这插入循环-->

                        <c:forEach begin="0" end="${ordersList.size()-1}" var="i">
                        <li>
                            <div class="user-info">
                                <span class="avatar">${ordersList[i].order_id}</span>
                                <span class="username">${filmList[i]}</span>
                                <span class="create-time">${ordersList[i].time}</span>
                            </div>
                            <p class="comment-content">${ordersList[i].site_id}</p>

                        </li>
                        </c:forEach>

        </ul>
    </div>
    <div class="col"></div>
</div>
</body>
</html>
