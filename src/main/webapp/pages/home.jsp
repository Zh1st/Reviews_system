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
    <title>影评</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/web.css">
    <link rel="stylesheet" href="../css/bootstrap@4.6.min.css" >
    <link href="../layui/css/layui.css" rel="stylesheet">
    <link href="../css/information.css" rel="stylesheet" type="text/css">
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

<body >

<!-- 导航条 -->
<nav class="navbar navbar-expand-lg navbar-light " style="background-color:#CDE4DA;height: 65px;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="background-color: #CDE4DA;">
            <li class="breadcrumb-item active" aria-current="page"><a href="#" style="color: black;">主页</li></a>
        </ol>
    </nav>


    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto" style="font-size: 26px; margin-left: 670px;font-family:'幼圆'">
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
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="点此搜索" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
        </form>
    </div>
</nav>

<!-- 横幅部分 -->
<div class="banner_ad" style="margin-top: -10px;">
</div>


<div class="section_film">

    <div class="wrapper_center">
        <div class="center_header">
            <h5>
                正在热映&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
                (&nbsp;
                <a href="#" class="time_a">更多</a>
                &nbsp;)
            </h5>
        </div>

        <div class="film_center">
            <ul>
                <c:forEach items="${filmList}" var="film">
                    <li>
                        <div class="pic"><a href="#"><img src="../images/${film.picture}" alt="film">

                        </a>
                        </div>
                        <div class="title"><a href="#">${film.film_name}</a></div>
<%--                        <div id="test9" style="position: absolute;margin-left:20px;" ></div>${film.score}--%>

                         <div class="rating" style="height: 11px;margin-left:20px;">
                            <span style="margin-left: 60px;color: orange;">
                                <p style="margin-left: 100px;margin-top: -60px;font-size:20px;position: absolute">${film.score}</p>
                            </span>
                        </div>

                        <a onclick="tosite(${film.film_id})"  class="purcharse" style="margin-left:87px;top: 50px;">选座购票</a>

                    </li>
                </c:forEach>
            </ul>
        </div>

    </div>
    <div class="wrapper_right">
        <div class="movie_right">
            <div class="movie_item">
                <h5>
                    影片分类&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
                    (&nbsp;
                    <a href="${pageContext.request.contextPath}/category/weblist" class="time_a">更多</a>
                    &nbsp;)
                </5>
            </div>
            <div class="movies">
                <ul>
                    <c:forEach items="${categoryList}" var="category">
                        <li><a onclick="testcategory(${category.category_id})">${category.category_name}</a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="movie_hot">
                <h5>
                    近期热门&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;&nbsp;&middot;
                    (&nbsp;
                    <a href="#" class="time_a">更多</a>
                    &nbsp;)
                </h5>
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

<%--<%--%>
<%--    int i =0;--%>
<%--    String s=${film.score};--%>
<%--%>--%>

<%--<script language="JavaScript">--%>
<%--        var a="<%=s%>";--%>
<%--</script>--%>

<%--<script language="JavaScript">--%>
<%--    function test() {--%>
<%--        var str=a;--%>
<%--        console.log("aaa"+str);--%>
<%--    }--%>
<%--</script>--%>



<script src="../layui/layui.js"></script>
<script src="../js/jquery-3.5.1/jquery-3.5.1.js"></script>

<script>

    // var str=a;
    // console.log("aaa"+str);
    <%--console.log("参数11：",${film});--%>
    layui.use(['rate'], function(){

        var rate = layui.rate;

        //自定义文本
        //只读
        rate.render({
            elem: '#test9'
            ,value: 3.5
            ,readonly: true
            ,half:true
            ,text: true
        });

        //自定义文本
        rate.render({
            elem: '#test5'
            ,value: 3
            ,text: true
            ,half:true
            ,setText: function(value){ //自定义文本的回调
                var arrs = {
                    '1': '极差'
                    ,'2': '差'
                    ,'3': '中等'
                    ,'4': '好'
                    ,'5': '极好'
                };
                this.span.text(arrs[value] || ( value + "星"));
            }
            ,choose: function(value){
//		document.getElementById("tan").style.display="block"
                $("#p").click(function () {
                    if($('#tan').is(':hidden')){
                        $("#tan").slideDown();
                    }else{
                    }
                });



            }
        })

        rate.render({
            elem: '#test6'
            ,value: 3
            ,text: true
            ,half: true
            ,setText: function(value){ //自定义文本的回调
                var arrs = {
                    '1': '极差'
                    ,'2': '差'
                    ,'3': '中等'
                    ,'4': '好'
                    ,'5': '极好'
                };
                this.span.text(arrs[value] || ( value + "星"));
            }
        })

    });
</script>



</body>

</html>

