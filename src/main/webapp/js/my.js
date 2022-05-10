//获取当前项目的名称
function getProjectPath() {
    //获取主机地址之后的目录，如： cloudlibrary/admin/books.jsp
    var pathName = window.document.location.pathname;
    //获取带"/"的项目名，如：/cloudlibrary
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return  projectName;
}
//重置添加和编辑窗口中输入框的样式
function resetStyle() {
    $("#aoe").attr("disabled",false)
    var $vals=$("#addOrEdit input");
    $vals.each(function(){
        $(this).attr("style","")
    });
}

//重置添加和编辑窗口中输入框的内容
function resetFrom() {
    $("#aoe").attr("disabled",true)
    var $vals=$("#addOrEditBook input");
    $vals.each(function(){
        $(this).attr("style","").val("")
    });
}
function resetFromAdd() {
    $("#aoeAdd").attr("disabled",true)
    var $vals=$("#addUser input");
    $vals.each(function(){
        $(this).attr("style","").val("")
    });
}