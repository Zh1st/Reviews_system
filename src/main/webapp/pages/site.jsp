<%--
  Created by IntelliJ IDEA.
  User: fyc
  Date: 2022/5/26
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /*复选框样式重写*/
        input[type='checkbox']{
            -webkit-appearance:none;
            background:#fff url("../images/site1.png");
            background-size:cover;
            height: 50px;
            width:50px;
            vertical-align:middle;
        }
        input[type='checkbox']:checked{
            background: #fff url('../images/site2.png');
            background-size: cover;
        }
        .site{
            background-color: aquamarine;
            width:50px;
            height:50px;
            list-style-type: none;
            margin: 30px;

        }
        .dapi{
            width:300px;
            height:100px;
            background: #00acd6;
            margin-bottom: 100px;
        }
        .left{
            width:100px;
            height:100px;
            float: left;
            background: #0f74a8;
        }
        .right{
            width:100px;
            height:100px;
            float: right;
            background: #0f74a8;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/order/save" method="get">
    <input type="hidden" value="${filmid}" name="film_id"/>
    <input type="text" value="<%=session.getAttribute("userid")%>"/>
    <center>
        <div class="left">大门</div>
        <div class="right">大门</div>
        <div class="dapi">电影大屏幕</div>
        <%
            for (int x = 0; x < 10; x++){
        %>
<%--        显示第几列--%>
<%--        <%=x%>--%>
        <%
            for (int y = 0; y < 10; y++){
        %>
        <div style="display: inline-block">
            <input type="checkbox" id="site_id" class="site" value="<%=x%><%=y%>" name="sites">
        <br>
            <%
            int c = x*10+y+1;
            %>
            <%=c%>
        </div>
        <%
            }
        %>
        <br/>
        <%
            }
        %>
    </center>
    <input type="submit" value="购买" style="width:200px;height:50px;background-color:ghostwhite;border-color:#ff590a;border-width:3px;font-size: 20px;position:fixed;bottom: 0px;right: 0px "/>
</form>

</body>
</html>
