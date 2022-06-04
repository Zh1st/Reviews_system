<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>影评网站后台管理系统</title>
    <meta name="description" content="影评网站后台管理系统">
    <meta name="keywords" content="影评网站后台管理系统">

    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mystyle.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->
    <!-- 导航侧栏 -->
    <jsp:include page="aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->
    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                影片管理 <small>影片表单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/user/findAll.do">影片管理</a></li>
                <li class="active">影片表单</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <form action="${pageContext.request.contextPath}/film/updateFilm" method="post" enctype="multipart/form-data">
            <!-- 正文区域 -->
            <section class="content"> <!--产品信息-->
                <div class="panel panel-default">
                    <input name="film_id" value="${film.film_id}" hidden="true">
                    <input hidden name="oldicture" value="${film.picture}">
                    <div class="panel-heading">电影信息</div>
                    <div class="row data-type">
                        <div class="col-md-2 title">电影名称</div>
                        <div class="col-md-9 data">
                            <input required type="text" class="form-control" name="film_name" placeholder="电影名称" value="${film.film_name}">
                        </div>
                        <div class="col-md-2 title">简介</div>
                        <div class="col-md-9">
                            <textarea required placeholder="请输入内容" class="layui-textarea" name="brief_introduction">${film.brief_introduction}</textarea>
                        </div>
                        <div class="col-md-2 title">价格</div>
                        <div class="col-md-9 data">
                            <input required type="text" class="form-control" name="price" placeholder="电影价格 " value="${film.price}">
                        </div>
                        <div class="col-md-2 title">影片类型</div>
                        <div class="col-md-9 data">
                            <c:forEach items="${categoryList}" var="catrgory">
                                <input class="" type="checkbox" name="catrgoryIds" value="${catrgory.category_id}">${catrgory.category_name}
                            </c:forEach>
                        </div>
                        <div class="col-md-2 title">评分</div>
                        <div class="col-md-9 data">
                            <input required type="text" class="form-control" name="score" placeholder="电影评分 " value="${film.score}">
                        </div>
                        <div class="col-md-2 title">时长</div>
                        <div class="col-md-9 data">
                            <input required type="text" class="form-control" name="film_time" placeholder="电影时长 " value="${film.film_time}">
                        </div>
                        <div class="col-md-2 title">导演</div>
                        <div class="col-md-9 data">
                            <input required type="text" class="form-control" name="film_director" placeholder="电影导演 " value="${film.film_director}">
                        </div>
                        <div style="" class="col-md-2 title">图片</div>
                        <div style="height: 200px" class="col-md-10 data">
                            <input type="file" id="pictureFile" name="pictureFile" onchange="selectAvatar()">
                            <img name="uploadImg" id="uploadImg" style="width: 20rem;height: 15rem;" alt="图片预览" src="../images/${film.picture}"/>
                        </div>
                    </div>
                </div>
                <!--订单信息/--> <!--工具栏-->
                <div class="box-tools text-center">
                    <button type="submit" class="btn bg-maroon">更新</button>
                    <button type="button" class="btn bg-default"
                            onclick="history.back(-1);">返回</button>
                </div>
                <!--工具栏/--> </section>
            <!-- 正文区域 /-->
        </form>
    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <!-- 底部导航 /-->

</div>
<script type="text/javascript">
    var avatar = document.getElementById('pictureFile');
    var preview = document.getElementById('uploadImg');
    function selectAvatar () {
        // .files 拿到的是用户选中的图片的一个数组
        const file = avatar.files[0]
        // 使用fileReader对象可以读取文件信息 ---- 将图片转换为 base64
        const reader = new FileReader()
        // 将选中的文件转换为base64 --- 异步操作
        reader.readAsDataURL(file)
        // 转换完成执行 this.result 就表示 转换成的结果
        reader.onload = function () {
            preview.src = this.result
        }
        console.log(file)
    }
</script>
<script>
    layui.use(['rate'], function(){
        var rate = layui.rate;
        //基础效果
        rate.render({
            elem: '#scoreDiv'
        })
    });
</script>

<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale : 'zh-CN'
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }
</script>


</body>

</html>