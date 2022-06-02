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
			<div class="box">
				<c:forEach items="${filmList}" var="film">
				<div class="movie">
					<div class="movie-image" style="margin-top:40px;">
						<a href="${pageContext.request.contextPath}/pages/film-info.jsp">
							<span class="play">
								<span class="name">${film.film_name}</span>
							</span>
							<img src="../images/${film.picture}" alt="movie" >
							<span class="name2">${film.film_name}</span>
						</a>
					</div>
					<a onclick="tosite(${film.film_id})"  class="name3" style="margin-top:285px; margin-left:-115px;position: absolute">选座购票</a>
				</div>
				</c:forEach>
				<div class="cl">&nbsp;</div>
			</div>
			<!-- end Box -->
		</div>

		

</div>
<!-- end Shell -->
</body>
</html>