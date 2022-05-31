<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.reviews_system.utils.*" %>
<%@ page import="javafx.scene.control.Pagination" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="/css/mystyle.css">
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>影评网站后台管理系统</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">

    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

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
    <script src="/layui/layui.js"></script>
    <script src="/js/jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
    <script type="text/javascript">
        function delUser(film_id){
            console.log(film_id)
            if(confirm("您确认要删除吗")){
                location.href="${pageContext.request.contextPath}/film/delById/?film_id="+film_id;
            }
        }
        function findFilmById(id,method) {
            console.log(id);
            resetStyle();
            if (method=='edit')
            {
                location.href="${pageContext.request.contextPath}/film/selectById?film_id="+ id;
            }
        }
        function selectByName() {
            var name = $("#selectByName").val();
            if (name == null) {
                name = "";
            }
            console.log(name);
            location.href = "${pageContext.request.contextPath}/film/selectByName?film_name="+name;
        }
        function delByIds() {
            var chk_value=[];
            obj=document.getElementsByName("ids")
            for (k in obj){
                if (obj[k].checked)
                    chk_value.push(obj[k].value)
            }
            console.log(chk_value)
            location.href="${pageContext.request.contextPath}/user/delByIds/"+chk_value;
        }
        function nextpage() {
            var str="next";
            location.href="${pageContext.request.contextPath}/film/list?methods="+str;
        }

        function uppage() {
            var str="up";
            location.href="${pageContext.request.contextPath}/film/list?methods="+str;
        }
    </script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
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
                用户管理 <small>全部用户</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
                <li class="active">全部用户</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <!-- 正文区域 -->
        <section class="content"> <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>
                <div class="box-body">
                    <!-- 数据表格 -->
                    <div class="table-box">
                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <div id="layerDemo" style="margin-bottom: 0;">
                                        <div class="layui-btn-container" style="float: left">
                                            <a type="button" class="layui-btn layui-btn-normal" href="${pageContext.request.contextPath}/film/saveUI">新建</a>
                                        </div>
                                        <div class="layui-btn-container" style="float: left">
                                            <button data-type="auto" class="layui-btn layui-btn-normal"><a style="color: white" href="${pageContext.request.contextPath}/user/refresh">刷新</a></button>
                                        </div>
                                        <div class="layui-btn-container" style="float: left">
                                            <button type="button" onclick="delByIds()" class="layui-btn layui-btn-normal">新建</button>
                                        </div>
                                        <script src="/layui/layui.js" charset="utf-8"></script>
                                        <!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div style="display: flex" class="has-feedback">
                                <input id="selectByName" style="height: 40px" type="text" class="form-control input-sm"
                                       placeholder="根据电影名称模糊查询"/>
                                <button style="height: 40px" type="button" class="layui-btn" onclick="selectByName()">
                                    查询
                                </button>
                            </div>
                        </div>
                        <!--工具栏/-->
                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable"
                               data-pagination="true"
                               data-side-pagination="client"
                               data-page-size="3">
                            <thead>
                            <tr>
                                <th class="" style="padding-right: 0px">
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting_asc">ID</th>
                                <th class="sorting_desc">电影名称</th>
                                <th class="sorting_asc sorting_asc_disabled">电影介绍</th>
                                <th class="sorting_desc sorting_desc_disabled">图片</th>
                                <th class="sorting sorting_desc_disabled">价格</th>
                                <th class="sorting sorting_desc_disabled">类型</th>
                                <th class="sorting sorting_desc_disabled">类型</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${filmList}" var="film">
                                <tr>
                                    <th class="" style="padding-right: 0px">
                                        <input name="ids" id="ids" value="${film.film_id}" type="checkbox" class="icheckbox_square-blue">
                                    </th>
                                    <td>${film.film_id}</td>
                                    <td>${film.film_name}</td>
                                    <td>
                                        <textarea name="desc" readonly class="layui-textarea">${film.brief_introduction}</textarea>
                                    </td>
                                    <td><img style="width: 100px;height: 100px;" src="../images/${film.picture}" alt="图片"></td>
                                    <td>${film.price}</td>
                                    <td class="text-center">
                                        <c:forEach items="${film.categories}" var="category">
                                            &nbsp;&nbsp;${category.category_name}
                                        </c:forEach>
                                    </td>
                                    <td>${film.score}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" onclick="findFilmById('${film.film_id}','edit')"> 编辑
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <a onclick="delUser('${film.film_id}')" class="btn bg-olive btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>

                <!-- /.box-body -->
            </div>
        </section>
        <!-- 正文区域 /-->
        <div align="center">
            <button class="layui-btn" onclick="uppage()">上一页</button>
            当前第${pagenum}页，总共${pagetotal}页
            <button class="layui-btn" onclick="nextpage()">下一页</button>
        </div>
    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

</div>

<!-- 编辑用户的窗口 -->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">用户</h3>
            </div>
            <div class="modal-body">
                <form id="editUser" action="${pageContext.request.contextPath}/film/updateFilm" method="post">
                    <%--用户的id,不展示在页面--%>
                    <span><input type="hidden" id="film_id" name="film_id"></span>
                    <table id="addOrEditTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>电影名称</td>
                            <td><input class="form-control" required placeholder="请输入用户名" name="film_name" id="film_name"></td>
                        </tr>
                        <tr>
                            <td>简介</td>
                            <td><textarea class="form-control" required placeholder="请输入密码" name="brief_introduction" id="brief_introduction"></textarea></td>
                        </tr>
                        <tr>
                            <td>图片</td>
                            <td><img style="width: 50px;height: 50px;" id="picture"alt=""></td>
                        </tr>
                        <tr>
                            <td>价格</td>
                            <td><input class="form-control" placeholder="请输入邮箱" name="price" id="price"></td>
                        </tr>
                    </table>
                    <div class="modal-footer">
                        <div class="modal-footer">
                            <button type="submit" class="layui-btn">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary" data-dismiss="modal" aria-hidden="true">关闭</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 添加用户的窗口 -->
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>用户</h3>
            </div>
            <div class="modal-body">
                <form id="addUser" action="${pageContext.request.contextPath}/user/save" method="post">
                    <table id="addTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>用户名</td>
                            <td><input class="form-control" required placeholder="请输入用户名" name="user_name"></td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td><input class="form-control" required placeholder="请输入密码" name="user_password"></td>
                        </tr>
                        <tr>
                            <td>电话</td>
                            <td><input class="form-control" placeholder="请输入电话" name="user_phone"></td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td><input class="form-control" placeholder="请输入邮箱" name="user_email"></td>
                        </tr>
                    </table>
                    <div class="modal-footer">
                        <button type="submit" class="layui-btn">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary" data-dismiss="modal" aria-hidden="true">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
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
    $(document)
        .ready(
            function() {
                // 激活导航位置
                setSidebarActive("admin-datalist");
                // 列表按钮
                $("#dataList td input[type='checkbox']")
                    .iCheck(
                        {
                            checkboxClass : 'icheckbox_square-blue',
                            increaseArea : '20%'
                        });
                // 全选操作
                $("#selall")
                    .click(
                        function() {
                            var clicks = $(this).is(
                                ':checked');
                            if (!clicks) {
                                $(
                                    "#dataList td input[type='checkbox']")
                                    .iCheck(
                                        "uncheck");
                            } else {
                                $(
                                    "#dataList td input[type='checkbox']")
                                    .iCheck("check");
                            }
                            $(this).data("clicks",
                                !clicks);
                        });
            });
</script>
<script>
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        //触发事件
        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();
                layer.open({
                    type: 1
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,content: '<div style="padding: 20px 100px;">'+ text +'</div>'
                    ,btn: '关闭全部'
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                    }
                });
            }
        };
        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        //多窗口模式 - esc 键
        $(document).on('keyup', function(e){
            if(e.keyCode === 27){
                layer.close(layer.escIndex ? layer.escIndex[0] : 0);
            }
        });
    });
</script>



<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
</body>
</html>
