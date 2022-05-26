<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改商品信息</title>

</head>
<body>
<!-- 上传图片是需要指定属性 enctype="multipart/form-data" -->
<!-- <form id="itemForm" action="" method="post" enctype="multipart/form-data"> -->
<form id="itemForm" action="${pageContext.request.contextPath }/upload/singleFileUpload"
      method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${film.id }"/> 修改商品信息：
    <table width="100%" border=1>
        <tr>
            <td>电影图片</td>
            <td><c:if test="${item.pic !=null}">
                <img src="http://localhost:8080/pic/${film.pic}" width=100 height=100/>
                <br/>
            </c:if> <input type="file" name="pictureFile"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="提交"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>