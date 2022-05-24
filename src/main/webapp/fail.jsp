<%--
  Created by IntelliJ IDEA.
  User: 41388
  Date: 2022/5/12
  Time: 17:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户名密码错误</title>
    <style>

        .btn {
            background: #428bca;
            border: #357ebd solid 1px;
            border-radius: 3px;
            color: #fff;
            display: inline-block;
            font-size: 14px;
            padding: 8px 15px;
            text-decoration: none;
            text-align: center;
            min-width: 60px;
            position: relative;
            transition: color 0.1s ease;
        }



        .modal:before {
            content: "";
            display: none;
            background: rgba(0, 0, 0, 0.6);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 10;
        }
        .modal:target:before {
            display: block;
        }
        .modal:target .modal-dialog {
            -webkit-transform: translate(0, 0);
            -ms-transform: translate(0, 0);
            transform: translate(0, 0);
            top: 20%;
        }
        .modal-dialog {
            background: #fefefe;
            border: #333 solid 1px;
            border-radius: 5px;
            margin-left: -200px;
            position: fixed;
            left: 50%;
            top: -100%;
            z-index: 11;
            width: 360px;
            /* -webkit-transform: translate(0, -500%);
            -ms-transform: translate(0, -500%);
            transform: translate(0, -500%); */
            -webkit-transition: -webkit-transform 0.3s ease-out;
            -moz-transition: -moz-transform 0.3s ease-out;
            -o-transition: -o-transform 0.3s ease-out;
            transition: transform 0.3s ease-out;
        }
        .modal-body {
            padding: 20px;
        }
        .modal-header,
        .modal-footer {
            padding: 10px 20px;
        }
        .modal-header {
            border-bottom: #eee solid 1px;
        }
        .modal-header h2 {
            font-size: 20px;
        }
        .modal-footer {
            border-top: #eee solid 1px;
            text-align: right;
        }
    </style>

</head>

<body translate="no" >






<!-- Modal -->
<div class="modal" id="modal-one" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-header">
            <h2>账号或密码错误</h2>
        </div>
        <div class="modal-body">
            <p style="text-align: center">请输入正确的账号或者密码！！</p>
        </div>
        <div class="modal-footer">
            <a href="userLAR.jsp" class="btn">确认</a>
        </div>
    </div>
</div>
<script src="js/jquery-3.5.1/jquery-3.5.1.js"></script>

<script type="text/javascript">
    // window.onload = function() {
    // 	document.getElementById('modal-one').style.display="block"
    // }
    $(function () {
        $(".modal-dialog").animate({top:'50px'});
        // $("#modal-one").show();
    });

</script>
</body>

</html>





