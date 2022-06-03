<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: 41388
  Date: 2022/5/26
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>示例演示</title>

    <link href="../css/bootstrap@4.6.min.css" rel="stylesheet">
    <link href="../css/style2.css" rel="stylesheet" type="text/css">
    <link href="../layui/css/layui.css" rel="stylesheet">
    <link href="../css/information.css" rel="stylesheet" type="text/css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light " style="background-color:#CDE4DA;height: 65px;">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="background-color: #CDE4DA;">
            <li class="breadcrumb-item active" aria-current="page"><a href="#" style="color: gray;">主页</a></li>
            <li class="breadcrumb-item">${film.film_name} <a href="#" style="color: black;">
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



<div class="PfZong">

    <div class="Pftitle">
        <p style="margin-left: 20px;">${film.film_name} </p>
    </div>

    <img src="../images/${film.picture}" class="Pfimg" style="width: 150px;height:200px;">

    <div class="pinfo">
        <p style="color: gray">导演：</p>
        <p style="margin-left:50px;margin-top: -22px">${film.film_director}</p>
        <p style="color: gray;margin-top: 15px;">类型：</p>
        <p style="margin-left:50px;margin-top: -22px;">
                <c:forEach items="${film.categories}" var="category">
                    ${category.category_name}&nbsp;
                </c:forEach>
        </p>
        <p style="color: gray;margin-top: 10px;">时长：</p>
        <p style="margin-left:50px;margin-top: -21px">${film.film_time}</p>
        <p style="margin-top: 12px;margin-left: 0px;">当前评分：</p>
    </div>

    <!--评分-->
    <div id="p">
        <div id="test5" style="margin-top: 320px;margin-left: 20px;"></div>
        <hr style="border: 5px solid red;"/>
    </div>
    <div class="pjieshao">
        <p style="color: green;margin-top: -23.5px;margin-left:27px;">${film.film_name}的剧情介绍……</p>
        <p style="margin-top: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${film.brief_introduction}</p>
    </div>
    <!--当前评分-->
    <div id="test9" style="position: absolute;margin-left: 200px;margin-top: -180px;"></div>
</div>



<!--	评论-->
<div class="row" style="margin-top: 30px;">
    <div class="col"></div>
    <div class="beijing" >
        <ul class="comment-group" >
            <!--在这插入循环-->
            <c:forEach items="${commentlist}" var="comment">
                <li>
                    <div class="user-info">
                        <c:if test="${comment.watch==1}">
                            <span class="username" style="color: black;">${comment.user_name}</span>
                        </c:if>
                        <c:if test="${comment.watch!=1}">
                            <span class="username" style="color: gray;">${comment.user_name}</span>
                        </c:if>
                        <span class="create-time">${comment.comment_time}</span>
                    </div>
                    <p class="comment-content">${comment.comment_content}</p>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="col"></div>
</div>

<!--	弹窗评论-->
<div class="pltan" id="tan">
    <div class="pltantop">
        <a href="" class="btn-close" >×</a>
    </div>
    <form action="${pageContext.request.contextPath}/comment/addComment" method="post">
        <input hidden id="film_score" name="film_score">
        <input hidden name="film_id" value="${film.film_id}">
        <p style="margin-left: 22px;margin-top: 10px; font-family:'思源黑体 CN Light';font-size: 16px">给个评价吧：</p>
        <div id="test6" style="margin-left: 20px;"></div>
        <from style="margin-left: 50px;margin-top: 5px;">
            <label><input type="radio" name="watch" value="1">看过</label>
            <label><input type="radio" name="watch" value="0">没看过</label>
        </from>
        <hr style="border: 5px solid red;"/>
        <p style="margin-left: 22px;font-family: '黑体';color: gray">简短评论:</p>
        <textarea rows="4" cols="72" placeholder="点此评论" class="pltank" name="comment_content"></textarea>
        <div class="pltanbot">
            <button  type="submit" class="btn btn-outline-secondary btn-sm" style="float:right;margin-top: 2px;margin-right:5px;">确认</button>
        </div>
    </form>
</div>


<script src="../layui/layui.js"></script>
<script src="../js/jquery-3.5.1/jquery-3.5.1.js"></script>

<script>
    var scorestart;
    layui.use(['rate'], function(){
        var rate = layui.rate;
        var score=${film.score}
        //自定义文本
        //只读
        rate.render({
            elem: '#test9'
            ,value: score
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
        });
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
            },choose:function (value) {
               if (value>0)
               {
                   scorestart=value;
                   $("#film_score").attr("value",scorestart);
               }
            }
        });
    });

</script>

</body>
</html>
