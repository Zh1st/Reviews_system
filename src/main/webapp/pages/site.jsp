<%@ page import="com.reviews_system.domain.Orders" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Bool" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            margin: 5px;

        }
        .dapi{
            width:300px;
            height:100px;
            background: #00acd6;
            margin-bottom: 70px;
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
        .centent{
            float: left;
            width:50%;
            height: 50%;
            margin-left: 210px;
        }
        .cententbody{
        }
        .right_film{
            float: left;
            width: 20%;
            height: 645px;
            margin-right: 70px;
            background-color: lightgrey;
        }
        .right_film img{
            margin-left: 30px;
            margin-top: 20px;
            border: 4px solid white;
            width: 230px;
            height: 290px;
        }
        .film_title{
            position: relative;
            margin-left: 30px;
            margin-top: 20px;
            font-size: 25px;
            width: 200px;
            /* 强制不换行 */
            white-space: nowrap;
            /* 文字用省略号代替超出的部分 */
            text-overflow: ellipsis;
            /* 匀速溢出内容，隐藏 */
            overflow: hidden;
        }
        .film_catrgory{
            position: relative;
            margin-left: 30px;
            margin-top: 10px;
        }
        .film_time{
            position: relative;
            margin-left: 30px;
            margin-top: 10px;
        }
        .film_cinema{
            position: relative;
            margin-left: 30px;
            margin-top: 10px;
        }
        .film_screen{
            position: relative;
            margin-left: 30px;
            margin-top: 10px;
        }
        .buy_film{
            position: relative;
            margin-top: 30px;
            align-items: center;
        }
        .buy_film input{
            width: 100px;
            height: 40px;
            border: 0px;
            background-color: whitesmoke;
            border-radius: 20px;
            margin-left: 30px;
        }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/order/save" method="get">
        <div class="centent">
                <%--    ${sites}--%>
                <input type="hidden" value="${film.film_id}" name="film_id"/>
                <input type="hidden" value="${cinema.cinema_id}" name="cinema_id"/>
                <input type="hidden"  name="time"/>
                <input type="hidden" value="<%=session.getAttribute("userid")%>"name="user_id"/>
                <center>
                    <div class="cententbody">
                    <div class="left">大门</div>
                    <div class="right">大门</div>
                    <div class="dapi">电影大屏幕</div>
                    <%
                        for (int x = 0; x < 6; x++){
                    %>
                    <%--        显示第几列--%>
                    <%--        <%=x%>--%>
                    <%
                        for (int y = 0; y < 10; y++){
                    %>
                    <div style="display: inline-block;">
                        <%
                            int c = x*10+y+1;
                            String flag = "check";
                            String flag1 = "checked";
                            String disable = "d";
                        %>
                        <%--做判断是否是已选中座位，是的话flag= checked不是的话flag= check--%>
                        <c:set var="isDoing" value="0"/>
                        <c:forEach items="${sites}" var="site" varStatus="i">
                            <c:set value="<%=c%>" var="siteq"/>
                            <c:if test="${siteq==site.site_id}">
                                <%
                                    flag = "checked";
                                    disable = "disabled";
                                %>
                                <%--                    <input type="checkbox" id="site_id" class="site" value="<%=c%>" name="site_ids" checked disabled/>--%>
                            </c:if>
                            <c:set var="flag" value="<%=flag%>"/>
                            <c:set var="disable" value="<%=disable%>"/>
                            <c:if test="${flag==flag1}">
                                <c:set var="isDoing" value="1"/>
                            </c:if>
                        </c:forEach>
                        <input type="checkbox" id="site_ids" class="site" value="<%=c%>"  name="site_ids" ${flag}  ${disable}/>
                        <br>
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
            </div>

        </div>
        <div class="right_film">
            <img src="../images/${film.picture}"/>
            <div class="film_title"><label >${film.film_name}</label></div>
            <div class="film_catrgory"><label>类型：
                <c:forEach items="${film.categories}" var="categort">
                    ${categort.category_name}&nbsp;&nbsp;
                </c:forEach>
            </label></div>
            <div class="film_time"><label>时长：${film.film_time}</label></div>
            <div class="film_cinema"><label>影院：${cinema.cinema_name}</label></div>
            <div class="film_screen"><label>场次：${time}</label></div>
            <div class="film_screen"><label>票价：￥${film.price}/张</label></div>
            <hr style="width: 450px;height:5px;border:none;border-top:2px dotted whitesmoke;">
            <div class="buy_film">
                <input type="submit" value="购票" onmouseover="this.style.backgroundColor='orangered'"; onmouseout="this.style.backgroundColor='whitesmoke'"></input>
                <input type="submit" formaction="${pageContext.request.contextPath}/order/orderback" value="返回" onmouseover="this.style.backgroundColor='orangered'"; onmouseout="this.style.backgroundColor='whitesmoke'"></input>
            </div>
        </div>
    </form>
<script>
    function show() {
        if(confirm("确定购买")){
            alert("购买成功")
        }
    }
</script>
</body>
</html>
