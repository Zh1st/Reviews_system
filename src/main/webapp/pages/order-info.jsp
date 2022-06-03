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
            <li class="breadcrumb-item "><a href="#" style="color: gray;">主页</a></li>
            <li class="breadcrumb-item"><a href="#" style="color: black;">
                订单中心
            </a></li>
        </ol>
    </nav>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <div style="width: 100%;position:absolute;display: flex;align-items: center;justify-content: center;z-index: 0;left: 0px;">
            <ul class="navbar-nav mr-auto" style="width: max-content; font-size: 26px; margin-left: 640px;font-family:'幼圆'">
                <li class="nav-item " >
                    <a class="nav-link" href="${pageContext.request.contextPath}/film/weblist"
                       style="margin-left: 20px;">主页</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="${pageContext.request.contextPath}/category/weblist?category_id=1&&methods=one"
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
        </div>
    </div>
</nav>


<div class="row" style="margin-top: 30px;">
    <div class="col"></div>
<%--    <div class="jianju">订单id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电影名--%>
<%--        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下单时间--%>
<%--    </div>--%>
    <c:if test="${ordersList.size()-1>0}">
        <div class="beijing">
            <ul class="comment-group">
                <p style="font-family: 幼圆">订单号</p>
                <p style="margin-left: 90px;margin-top: -40px;font-family: 幼圆">电影名</p>
                <p style="margin-left: 520px;margin-top: -40px;font-family: 幼圆">下单时间</p>
                <hr>
                <c:forEach begin="0" end="${ordersList.size()-1}" var="i">
                    <li>
                        <div class="user-info">
                            <span class="avatar">${ordersList[i].order_id}</span>
                            <span class="username">${filmList[i]}</span>
                            <span class="create-time">${ordersList[i].time}</span>
                        </div>
                        <p class="comment-content">座位号：${ordersList[i].site_id}</p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <div class="col"></div>
</div>
</body>
</html>
