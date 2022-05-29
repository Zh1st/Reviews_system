<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/23
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.reviews_system.utils.*" %>
<%@ page import="javafx.scene.control.Pagination" %>
<html>

<head>
    <title>豆瓣</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/web.css">
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
</head>

<body style="width: 100%">
<!-- header部分 -->
<div class="header_up">
    <a href="${pageContext.request.contextPath}/userInfo" class="time_a">个人信息</a>
    <h1><a href="http://www.douban.com">影评</a></h1>
    <form action="https://www.douban.com/search" method="get">
            <span class="input">
                <input type="text" name="search" placeholder="书籍、电影、音乐、小站、成员">
            </span>

        <span class="search_button">
                <input type="submit" name="submit">
            </span>
    </form>

    <ul>
        <li><a href="https://book.douban.com" target="_blank" class="link_book">读书</a></li>
        <li><a href="https://movie.douban.com" target="_blank" class="link_movie">电影</a></li>
        <li><a href="https://music.douban.com" target="_blank" class="link_music">音乐</a></li>
        <li><a href="https://www.douban.com/group" target="_blank" class="link_group">小组</a></li>
        <li><a href="https://www.douban.com/location" target="_blank" class="link_location">同城</a></li>
        <li><a href="https://douban.fm" target="_blank" class="link_fm">FM</a></li>
        <li><a href="#" class="link_time">时间</a></li>
        <li><a href="#" class="link_market">市集</a></li>
    </ul>

</div>
<!-- header部分结束 -->
<!-- 横幅部分 -->
<div class="banner_ad"></div>
<!-- 横幅部分结束 -->


<div class="section_film">

    <div class="wrapper_center">
        <div class="center_header">
            <h2>
                正在热映&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
                (&nbsp;
                <a href="#" class="time_a">更多</a>
                &nbsp;)
            </h2>
        </div>

        <div class="film_center">
            <ul>
                <c:forEach items="${filmList}" var="film">
                    <li>
                        <div class="pic"><a href="#"><img src="../images/${film.picture}" alt="film"></a>
                        </div>
                        <div class="title"><a href="#">${film.film_name}</a></div>
                        <div class="rating" style="background: url('../images/ic_rating_s.png') no-repeat 0 -33px;height: 11px;margin-left:20px;"><span style="margin-left: 60px;color: orange;">9</span></div>
                        <a onclick="tosite(${film.film_id})"  class="purcharse">选座购票</a>

                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="wrapper_right">
        <div class="movie_right">
            <div class="movie_item">
                <h2>
                    影片分类&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
                    (&nbsp;
                    <a href="${pageContext.request.contextPath}/category/weblist" class="time_a">更多</a>
                    &nbsp;)
                </h2>
            </div>
            <div class="movies">
                <ul>
                    <c:forEach items="${categoryList}" var="category">
                        <li><a onclick="testcategory(${category.category_id})">${category.category_name}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="movie_hot">
                <h2>
                    近期热门&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
                    (&nbsp;
                    <a href="#" class="time_a">更多</a>
                    &nbsp;)
                </h2>
            </div>
            <div class="hotMovie">
                <ol start="1">
                    <li><a href="#">小戏骨：红楼梦之刘姥姥进大观园</a></li>
                    <li><a href="#">极寒之城</a></li>
                    <li><a href="#">猩球崛起3：终极之战</a></li>
                    <li><a href="#">杀破狼·贪狼</a></li>
                    <li><a href="#">大护法</a></li>
                    <li><a href="#">小丑回魂</a></li>
                    <li><a href="#">猎凶风河谷</a></li>
                    <li><a href="#">双面情人</a></li>
                    <li><a href="#">美国行动</a></li>
                    <li><a href="#">辣手保姆</a></li>
                </ol>
            </div>
        </div>
    </div>
</div>


</body>

</html>

