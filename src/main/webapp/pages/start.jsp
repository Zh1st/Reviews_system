<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/17
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link style="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mystyle.css">
    <style>


        .star{
            display: block;
            position: relative;
            width: 150px;
            height: 60px;
            padding:;
            border: none;
        }

        .star > input{
            position: absolute;
            margin-right: -100%;
            opacity:;
        }

        .star > label{
            position: relative;
            display: inline-block;
            float: right;
            width: 30px;
            height: 30px;
            color: transparent;
            background-image: url("../img/start.png");
            background-repeat: no-repeat;
        }



        .star > input:focus + label{
            outline: none;
        }

        .star > input:checked~label,
        .star > input:focus~label,
        .star > input:hover~label{
            background-position: 0 -30px;
        }



        .star > label:before{
            display: none;
            position: absolute;
            content: " ";
            width: 30px;
            height: 30px;
            background-image: url("../rotate-star/images/starIcon.png");
            background-repeat: no-repeat;
            bottom:;
        }

        .star > input:checked + label:before{
            display: block;
            animation-name: rotateStar;
            animation-duration: 1s;
            animation-fill-mode: forwards;
        }

        @keyframes rotateStar{
            0%{
                transform: scale(1) rotate(0);
            }

            95%{
                transform: scale(4) rotate(90deg);
                opacity:;
            }

            100%{
                transform: scale(1) rotate(0);
                opacity:;
            }
        }
    </style>
</head>
<body>


<form>
    <div class="star">
        <input type="radio" id="rate5" name="rating" value="5">
        <label for="rate5" title="Amazing"></label>

        <input type="radio" id="rate4" name="rating" value="4">
        <label for="rate4" title="Good"></label>

        <input type="radio" id="rate3" name="rating" value="3">
        <label for="rate3" title="Average"></label>

        <input type="radio" id="rate2" name="rating" value="2">
        <label for="rate2" title="Not good"></label>

        <input type="radio" id="rate1" name="rating" value="1">
        <label for="rate1" title="Terrible"></label>
    </div>
</form>

</body>
</html>
