<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.reviews_system.utils.*" %>
<%@ page import="javafx.scene.control.Pagination" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
	<title>Free CSS template--W3Cfuns.com</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="../css/style1.css" type="text/css" media="all" />
	<!--[if IE 6]>
		<link rel="stylesheet" href="../css/ie6.css" type="text/css" media="all" />
	<![endif]-->
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
<!-- Shell -->
<div id="shell">
	<!-- Header -->
	<div id="header">
		<h1 ><a href="#" style="color: green">电影分类</a></h1>
		
		<!-- Sub-menu -->
		<div id="sub-navigation" >
			<c:forEach items="${categoryList}" var="category">
			<ul style="margin-top: -25px">
				<li><a onclick="category_id(${category.category_id})">${category.category_name}</a></li>
			</ul>
			</c:forEach>
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
							<span onclick="tosite(${film.film_id})"  class="name3">选座购票</span>
						</a>
					</div>
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