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
    <link href="../layui/css/layui.css" rel="stylesheet">
    <link href="../css/information.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="PfZong">

    <div class="Pftitle">
        <p style="margin-left: 20px;">${film.film_name} </p>
    </div>

    <img src="../img/haibao.jpg" class="Pfimg" height="30%">

    <div class="pinfo">
        <p style="color: gray">导演：</p>
        <p style="margin-left:50px;margin-top: -25px">${film.film_name}</p>
        <p style="color: gray;margin-top: 10px;">类型：</p>
        <p style="margin-left:50px;margin-top: -24px;">
                <c:forEach items="${film.categories}" var="category">
                    ${category.category_name}&nbsp;
                </c:forEach>
        </p>
        <p style="margin-top: 12px;margin-left: 0px;">当前评分：</p>
    </div>

    <!--评分-->
    <div id="p">
        <div id="test5" style="margin-top: 290px;margin-left: 20px;"></div>
        <hr style="border: 5px solid red;"/>
    </div>


    <div class="pjieshao">
        <p style="color: green;margin-top: -23.5px;margin-left:81px;">${film.film_name}的剧情介绍……</p>
        <p>${film.brief_introduction}</p>
    </div>

    <!--当前评分-->
    <div id="test9" style="position: absolute;margin-left: 160px;margin-top: -170px;"></div>


</div>



<!--	评论-->
<div class="row" style="margin-top: 30px;">
    <div class="col"></div>
    <div class="" style="background-color:#BBBBBB;padding: 20px;width: 700px;margin-left: 35px;">
        <ul class="comment-group" >
            <!--在这插入循环-->
            <c:forEach items="${commentlist}" var="comment">
                <li>
                    <div class="user-info">
                        <c:if test="${comment.watch==1}">
                            <span class="username" style="color: yellow;">${comment.user_name}</span>
                        </c:if>
                        <c:if test="${comment.watch!=1}">
                            <span class="username" style="color: black;">${comment.user_name}</span>
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
    <form>
        <input hidden id="startscores" name="startscores">
        <p style="margin-left: 22px;margin-top: 10px; font-family:'思源黑体 CN Light';font-size: 16px">给个评价吧：</p>
        <div id="test6" style="margin-left: 20px;"></div>
        <hr style="border: 5px solid red;"/>
        <p style="margin-left: 22px;font-family: '黑体';color: gray">简短评论:</p>
        <textarea rows="4" cols="72" placeholder="点此评论" class="pltank"></textarea>

        <div class="pltanbot">
            <button  type="submit" class="btn btn-outline-secondary btn-sm" style="float:right;margin-top: 2px;margin-right:5px;">确认</button>
            <button type="reset" onclick="addComment()">ff</button>
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
                   $("#startscores").attr("value",scorestart);
               }
            }
        });
    });
    function addComment() {
        $("#startscores").attr("value",scorestart);
        console.log(scorestart);
    }
</script>

</body>
</html>
