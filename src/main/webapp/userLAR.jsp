<%--
  Created by IntelliJ IDEA.
  User: 41388
  Date: 2022/5/12
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css/login.css" >
    <script src="js/jquery-3.5.1/jquery-3.5.1.js" charset="utf-8"></script>
</head>
<body >

<!--登录-->
<form action="${pageContext.request.contextPath}/user/login" class="login-form" id="login">
    <h1>登 录</h1>
    <div class="txtb" style="top: 40px;">
        <input type="text" name="user_name">
        <span data-placeholder="用户名"></span>
    </div>

    <div class="txtb" style="top: 90px;">
        <input type="password" name="user_password">
        <span data-placeholder="密码"></span>
    </div>

    <input type="submit" class="logbtn" style="margin-top: 245px;" value="点此登录">

    <div class="bottom-text">
        没有账户? <a  id="toRegister" style="cursor: pointer;color:#727272">点这里</a>
        <!--		没有账户? <a href="userRegister.html" id="toRegister">点这里</a>-->
        <!--路径要修改-->
    </div>
</form>

<!--注册-->
<form action="${pageContext.request.contextPath}/user/register" class="login-form" onsubmit="return check()"  id="register">
    <h1>注 册</h1>
    <div class="txtb">
        <input type="text" name="user_name" id="user_name">
        <span data-placeholder="用户名" ></span>
    </div>

    <div class="txtb">
        <input type="password" name="user_password" id="user_password">
        <span data-placeholder="密码"></span>
        <p class="warnpsd" id="strength-output">请输入密码</p>

    </div>

    <div class="txtb">
        <input type="password" name="user_passwordAgain" id="user_passwordAgain">
        <span data-placeholder="请再次输入密码"></span>
    </div>

    <div class="txtb">
        <input type="text" name="user_phone" id="user_phone">
        <span data-placeholder="手机号码"></span>
    </div>

    <div class="txtb">
        <input type="email" name="user_email" id="user_email">
        <span data-placeholder="邮箱"></span>
    </div>

    <input type="submit" class="logbtn" value="点此注册">

    <div class="bottom-text">
        有账户了? <a  id="toLogin" style="cursor: pointer;color: #727272">点这里</a>
        <!--		有账户了? <a href="userLogin.html" id="toLogin">点这里</a>-->
    </div>
</form>


<div class="poster" style="background-image:url(img/login_background.jpg)" ></div>
<div class="" style="background-image:url(img/login_background.jpg)" ></div>


<div class="canvas-wrap">
    <canvas></canvas>
</div>




<script type="text/javascript">

    /*文字上浮*/
    $(".txtb input").on("focus", function(){
        $(this).addClass("focus");
    });

    $(".txtb input").on("blur", function(){
        if($(this).val() == "")
            $(this).removeClass("focus");
    });


    /*登录注册切换*/
    $(function () {
        /*注册切换到登录*/
        $("#toRegister").click(function () {
            if($('#login').is(':hidden')){
                /*console.log("展开",$('#secondMenu').is(':hidden'))*/
                $("#login").fadeIn();
                $("#register").fadeOut();

            }else{
                /*console.log("收起",$('#secondMenu').is(':hidden'))*/
                $("#login").fadeOut();
                $("#register").fadeIn();

            }
        });

        /*登录切换到注册*/
        $("#toLogin").click(function () {
            if($('#register').is(':hidden')){
                /*register.log("展开",$('#secondMenu').is(':hidden'))*/
                $("#register").fadeIn();
                $("#login").fadeOut();

            }else{
                /*console.log("收起",$('#secondMenu').is(':hidden'))*/
                $("#register").fadeOut();
                $("#login").fadeIn();

            }
        });
    })

    /*文本框内容检查*/
    function check() {
        var userName = document.getElementById("user_name").value;
        var userPassword = document.getElementById("user_password").value;
        var userPasswordAgain = document.getElementById("user_passwordAgain").value;
        var userPhone = document.getElementById("user_phone").value;
        var userEmaile = document.getElementById("user_email").value;

        if(userPassword!=userPasswordAgain){
            alert("两次输入的密码不一致");
            return false;
        }else{
            if (userName == "")//如果用户输入的用户名为空
            {
                alert("请输入用户名");
                return false;
            } else {
                if (userPassword.length<6) {
                    alert("请输入不小于6位数的密码");
                    return false;
                } else {
                    if (userPhone.length!=11) {
                        alert("请输入正确的手机号");
                        return false;
                    } else {
                        if (userEmaile == "") {
                            alert("请输入邮箱");
                            return false;
                        }
                    }
                }
            }
        }
        alert("注册成功！");
    }
</script>



<!--路径要修改-->
<script src="js/imagesloaded.pkgd.min.js"></script>
<script src="js/demo1.js"></script>
<script src="js/zxcvbn.js"></script>










</body>
</html>



