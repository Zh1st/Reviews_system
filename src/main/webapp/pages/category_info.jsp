<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.reviews_system.utils.*" %>
<%@ page import="javafx.scene.control.Pagination" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>

	<title>电影分类</title>

	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link href="../css/bootstrap@4.6.min.css" rel="stylesheet"  >
	<link href="../layui/css/layui.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/style1.css" type="text/css" media="all" />
	<link rel="stylesheet" href="../css/ie6.css" type="text/css" media="all" />
	<link rel="stylesheet" href="../css/style2.css" type="text/css" media="all" />




	<script type="text/javascript">
		function category_id(id) {
			console.log(id);
			location.href = "${pageContext.request.contextPath}/category/weblist?category_id=" + id;
		}
	</script>
	<script type="text/javascript">
		function testcategory(id) {
			console.log(id);
		}
		function tosite(filmid){
			// if(confirm("购买成功")){
			location.href="${pageContext.request.contextPath}/order/site?filmid="+filmid;
			// }
		}
		function tofilm(filmid){
			location.href="${pageContext.request.contextPath}/film/filmDetails?filmid="+filmid;
		}
        function nextpage(id) {
            var str="next";
            var a="category_id="+id+"&&methods="+str;
            location.href="${pageContext.request.contextPath}/category/weblist?"+a;
        };
        function uppage(id) {
            var str="up";
			var a="category_id="+id+"&&methods="+str;
			location.href="${pageContext.request.contextPath}/category/weblist?"+a;
        };
	</script>
	<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="../js/jquery-func.js"></script>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-expand-lg navbar-light " style="background-color:#CDE4DA;height: 65px;">
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb" style="background-color: #CDE4DA;">
			<li class="breadcrumb-item "><a href="#" style="color: gray;">主页</a></li>
			<li class="breadcrumb-item"><a href="#" style="color: black;">电影分类
			</a></li>
		</ol>
	</nav>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<div style="width: 100%;position:absolute;display: flex;align-items: center;justify-content: center;z-index: 0;left: 0px;">
			<ul class="navbar-nav mr-auto" style="width: max-content; font-size: 26px; margin-left: 640px;font-family:'幼圆'">
				<li class="nav-item " >
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
					<a class="nav-link" href="${pageContext.request.contextPath}/userInfo"
					   style="margin-left: 20px;">订单中心</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- Shell -->
<div id="shell">
	<!-- Header -->
	<div id="header">
		<h1 ><a href="#" style="color: green;font-size: 45px">电影分类</a></h1>
		
		<!-- Sub-menu -->
		<div id="sub-navigation" >
			<ul style="margin-top: -30px">
				<c:forEach items="${categoryList}" var="category">
					<li><a onclick="category_id(${category.category_id})">${category.category_name}</a></li>
				</c:forEach>
			</ul>
		</div>
		<!-- end Sub-Menu -->

	</div>
	<!-- end Header -->
	
	<!-- Main -->
	<div id="main">
		<!-- Content -->
		<div id="content">

			<!-- Box -->
			<div class="box" >
				<c:forEach items="${filmList}" var="film">
				<div class="movie"style="margin-right: 90px">
					<div class="movie-image" style="margin-top:40px;">
						<a onclick="tofilm(${film.film_id})">
							<img src="../images/${film.picture}" alt="movie" >
							<span class="name2">${film.film_name}</span>
						</a>
					</div>
					<button onmouseover="this.style.backgroundColor='orangered'"; onmouseout="this.style.backgroundColor='lightslategray'" style="margin-top:270px; margin-left:-110px;position: absolute;width: 70px;height: 30px;text-align: center;font-size: 10px;background-color:lightslategray;-webkit-border-radius: 10px;border: 0px;" onclick="tosite(${film.film_id})">
						选座购票
					</button>
				</div>
				</c:forEach>
				<div class="cl">&nbsp;</div>
			</div>
			<!-- end Box -->
		</div>
        <div align="center" style="margin-top:40px; margin-left:310px;position: absolute">
            <button class="layui-btn" onclick="uppage(${category_id})">上一页</button>
            当前第${pagenum}页，总共${pagetotal}页
            <button class="layui-btn" onclick="nextpage(${category_id})">下一页</button>
        </div>
		

</div>
<!-- end Shell -->
</body>
</html>