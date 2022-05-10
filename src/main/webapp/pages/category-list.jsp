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
        function delCategory(categoryId) {
            if (confirm("您确认要删除吗")) {
                location.href = "${pageContext.request.contextPath}/category/delById/" + categoryId;
            }
        }

        function findCategoryById(id, method) {
            console.log(id)
            resetStyle()
            if (method == 'edit') {
                var url = "${pageContext.request.contextPath}/category/selectById?category_id=" + id;
                $.get(url, function (response) {
                    //如果是编辑图书，将获取的图书信息回显到编辑的窗口中
                    $("#category_id").val(response.data.category_id);
                    $("#category_name").val(response.data.category_name);
                })
            }
        }

        function addOrEdit() {
            //获取id
            var id = $("#category_id").val();
            //	如果有id的值，为修改，没有为添加
            if (id > 0) {

            } else {
                var url = "${pageContext.request.contextPath}/category/addCategory";
                $.post(url, $("#addOrEditUser").serialize(), function (response) {
                    alert(response.message)
                    if (response.success == true) {
                        window.location.href = "${pageContext.request.contextPath}/category/list";
                    }
                })
            }
        }

        function selectByName() {
            var name = $("#selectByName").val();
            if (name == null) {
                name = "";
            }
            console.log(name);
            location.href = "${pageContext.request.contextPath}/category/selectByName?category_name=" + name;
        }

        function delByIds() {
            var chk_value = [];
            obj = document.getElementsByName("ids")
            for (k in obj) {
                if (obj[k].checked)
                    chk_value.push(obj[k].value)
            }
            console.log(chk_value)
            location.href = "${pageContext.request.contextPath}/category/delByIds/" + chk_value;
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
        <%--		添加--%>
        <div id="adddiv" style="display: none">
            <h2 style="text-align: center;">添加类型</h2>
            <form id="addform" style="align-content: center" class="layui-form"
                  action="${pageContext.request.contextPath}/category/save" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">类型名</label>
                    <div class="layui-input-block">
                        <input type="text" name="category_name" required lay-verify="required" placeholder="请输入标题"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item" style="align-content: center">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn">立即提交</button>
                        <button type="reset" onclick="addCategory()" class="layui-btn layui-btn-primary">关闭</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                类型管理 <small>全部类型</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/category/findAll.do">类型管理</a></li>
                <li class="active">全部类型</li>
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
                                            <button type="button" data-toggle="modal"
                                                    data-target="#AddModal" onclick="resetFromAdd()"
                                                    class="layui-btn layui-btn-normal">新建
                                            </button>
                                        </div>
                                        <div class="layui-btn-container" style="float: left">
                                            <button data-type="auto" class="layui-btn layui-btn-normal"><a
                                                    style="color: white"
                                                    href="${pageContext.request.contextPath}/category/refresh">刷新</a>
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
                                <input id="selectByName" style="height: 40px" type="text" class="form-control input-sm"
                                       placeholder="根据类型模糊查询"/>
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
                                <th class="sorting_desc">类型名</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${categoryList}" var="category">
                                <tr>
                                    <th class="" style="padding-right: 0px">
                                        <input name="ids" id="ids" value="${category.category_id}" type="checkbox"
                                               class="icheckbox_square-blue">
                                    </th>
                                    <td>${category.category_id}</td>
                                    <td>${category.category_name}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                                data-target="#EditModal"
                                                onclick="findCategoryById('${category.category_id}','edit')"> 编辑
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <a onclick="delCategory('${category.category_id}')" class="btn bg-olive btn-xs">删除</a>
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
    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

</div>

<!-- 编辑类型的窗口 -->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 id="myModalLabel">类型</h3>
            </div>
            <div class="modal-body">
                <form id="editCategory" action="${pageContext.request.contextPath}/category/updateCategory" method="post">
                    <%--类型的id,不展示在页面--%>
                    <span><input type="hidden" id="category_id" name="category_id"></span>
                    <table id="addOrEditTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>类型名</td>
                            <td><input class="form-control" required placeholder="请输入类型名" name="category_name"
                                       id="category_name"></td>
                        </tr>
                    </table>
                    <div class="modal-footer">
                        <div class="modal-footer">
                            <button type="submit" class="layui-btn">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary" data-dismiss="modal"
                                    aria-hidden="true">关闭
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 添加类型的窗口 -->
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3>类型</h3>
            </div>
            <div class="modal-body">
                <form id="addCategory" action="${pageContext.request.contextPath}/category/save" method="post">
                    <table id="addTab" class="table table-bordered table-striped" width="800px">
                        <tr>
                            <td>类型名</td>
                            <td><input class="form-control" required placeholder="请输入类型名" name="category_name"></td>
                        </tr>
                    </table>
                    <div class="modal-footer">
                        <button type="submit" class="layui-btn">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary" data-dismiss="modal"
                                aria-hidden="true">关闭
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
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
