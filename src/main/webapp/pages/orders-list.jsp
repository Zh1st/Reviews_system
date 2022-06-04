<%--
  Created by IntelliJ IDEA.
  User: jzf
  Date: 2022/5/30
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.reviews_system.utils.*" %>
<%@ page import="javafx.scene.control.Pagination" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/css/mystyle.css">
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>影评网站后台管理系统</title>
    <meta name="description" content="影评网站后台管理系统">
    <meta name="keywords" content="影评网站后台管理系统">

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
        function delCategory(OrderId) {
            if (confirm("您确认要删除吗")) {
                location.href = "${pageContext.request.contextPath}/order/delById/" + OrderId;
            }
        }
        <%--function selectByFilmId() {--%>
        <%--    var id = $("#selectByFilmId").val();--%>
        <%--    if (id == null) {--%>
        <%--        id = "";--%>
        <%--    }--%>
        <%--    console.log(id);--%>
        <%--    location.href = "${pageContext.request.contextPath}/order/selectByFilmId?film_id=" + id;--%>
        <%--}--%>
        function findOrderByName() {
            var name = $("#findOrderByName").val();
            if (name == null) {
                name = "";
            }
            console.log(name);
            location.href = "${pageContext.request.contextPath}/order/findOrderByName?film_name=" + name;
        }
        function delByIds() {
            var chk_value = [];
            obj = document.getElementsByName("ids")
            for (k in obj) {
                if (obj[k].checked)
                    chk_value.push(obj[k].value)
            }
            console.log(chk_value)
            location.href = "${pageContext.request.contextPath}/order/delByIds/" + chk_value;
        }
        function nextpage() {
            var str="next";
            location.href="${pageContext.request.contextPath}/order/list?methods="+str;
        }

        function uppage() {
            var str="up";
            location.href="${pageContext.request.contextPath}/order/list?methods="+str;
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
                订单管理 <small>全部订单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a></i> 首页</a></li>
                <li><a>订单管理</a></li>
                <li class="active">全部订单</li>
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
                                            <button data-type="auto" class="layui-btn layui-btn-normal"><a
                                                    style="color: white"
                                                    href="${pageContext.request.contextPath}/order/refresh">刷新</a>
                                            </button>
                                        </div>
                                        <div class="layui-btn-container" style="float: left">
                                            <button type="button" onclick="delByIds()"
                                                    class="layui-btn layui-btn-normal">批量删除
                                            </button>
                                        </div>
                                        <script src="/layui/layui.js" charset="utf-8"></script>
                                        <!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div style="display: flex" class="has-feedback">
                                <input id="findOrderByName" style="height: 40px" type="text" class="form-control input-sm"
                                       placeholder="根据电影名称模糊查询"/>
                                <button style="height: 40px" type="button" class="layui-btn" onclick="findOrderByName()">
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
                                <th class="sorting_asc">订单号</th>
                                <th class="sorting_desc">用户ID</th>
                                <th class="sorting_desc">电影ID</th>
                                <th class="sorting_desc">座位号</th>
                                <th class="sorting_desc">影院ID</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach begin="0" end="${ordersList.size()-1}" var="i">
                                <tr>
                                    <th class="" style="padding-right: 0px">
                                        <input name="ids" id="ids" value="${ordersList[i].order_id}" type="checkbox"
                                               class="icheckbox_square-blue">
                                    </th>
                                    <td>${ordersList[i].order_id}</td>
                                    <td>${userList[i]}</td>
                                    <td>${filmList[i]}</td>
                                    <td>${ordersList[i].site_id}</td>
                                    <td>${ordersList[i].cinema_id}</td>
                                    <td class="text-center">
                                    </td>
                                    <td class="text-center">
                                        <a onclick="delCategory('${ordersList[i].order_id}')" class="btn bg-olive btn-xs">删除</a>
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
        <div align="center">
            <button class="layui-btn" onclick="uppage()">上一页</button>
            当前第${pagenum}页，总共${pagetotal}页
            <button class="layui-btn" onclick="nextpage()">下一页</button>
        </div>
        <!-- 正文区域 /-->
    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

</div>

<script>
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
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
            function () {
                // 激活导航位置
                setSidebarActive("admin-datalist");
                // 列表按钮
                $("#dataList td input[type='checkbox']")
                    .iCheck(
                        {
                            checkboxClass: 'icheckbox_square-blue',
                            increaseArea: '20%'
                        });
                // 全选操作
                $("#selall")
                    .click(
                        function () {
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
    layui.use('layer', function () { //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        //触发事件
        var active = {
            offset: function (othis) {
                var type = othis.data('type')
                    , text = othis.text();
                layer.open({
                    type: 1
                    , offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'layerDemo' + type //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + text + '</div>'
                    , btn: '关闭全部'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                    }
                });
            }
        };
        $('#layerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        //多窗口模式 - esc 键
        $(document).on('keyup', function (e) {
            if (e.keyCode === 27) {
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
