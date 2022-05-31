<%--
  Created by IntelliJ IDEA.
  User: 41388
  Date: 2022/5/26
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>示例演示</title>

    <link href="../css/bootstrap@4.6.min.css" rel="stylesheet">
    <link href="../layui/css/layui.css" rel="stylesheet">
    <link href="../css/information.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="PfZong">

    <div class="Pftitle">
        <p style="margin-left: 20px;">误杀瞒天记 Drishyam (2015) </p>
    </div>

    <img src="../img/haibao.jpg" class="Pfimg" height="30%">

    <div class="pinfo">
        <p style="color: gray">导演：</p>
        <p style="margin-left:50px;margin-top: -25px">xxxx</p>
        <p style="color: gray;margin-top: 10px;">类型：</p>
        <p style="margin-left:50px;margin-top: -24px;">剧情</p>
        <p style="margin-top: 12px;margin-left: 0px;">当前评分：</p>
    </div>

    <!--评分-->
    <div id="p">
        <div id="test5" style="margin-top: 290px;margin-left: 20px;"></div>
        <hr style="border: 5px solid red;"/>
    </div>


    <div class="pjieshao">
        <p style="color: green;">误杀满天记</p>
        <p style="color: green;margin-top: -23.5px;margin-left:81px;">的剧情介绍……</p>
        <p>维杰（阿贾耶·德乌干 Ajay Devgan 饰）和妻子娜蒂尼（施芮娅·萨兰 Shreya 饰）结婚多年，将两个女儿安久（伊西塔·杜塔 Ishita Dutta 饰）和安努（莫伦诺·贾达夫 Mrunal Jadhav 饰）抚养长大，一家人过着宁静的生活，平淡之中自有真味 。某日，安久去参加野营，结识了名为萨姆（Rishabh Chaddha 饰）的男生，此时的她并不知道的是，这位看上去文质彬彬的男孩，会彻底粉碎她的生活。
            　　撕下了伪善面具的萨姆竟然想要强暴安久，在激烈的挣扎反抗之中，安久失手杀死萨姆。维杰决定挺身而出保护他无辜的家人，自小热爱看电影的他利用从电影里学到的知识对萨姆的尸体进行了处理和掩埋，但警察的来访让这个家庭再一次陷入了危机之中。</p>
    </div>

    <!--当前评分-->
    <div id="test9" style="position: absolute;margin-left: 160px;margin-top: -170px;"></div>


</div>



<!--	评论-->
<div class="row" style="margin-top: 30px;">
    <div class="col"></div>
    <div class="" style="background-color:#BBBBBB;padding: 20px;width: 700px;margin-left: 35px;">




        <ul class="comment-group" >


            <!--在这插入循环-->
            <li >
                <div class="user-info" >
                    <img class="avatar" src="">
                    <span class="username">这里是名字</span>
                    <span class="create-time">这里是日期</span>
                </div>
                <p class="comment-content">这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容这里是内容</p>
            </li>
            <li >
                <div class="user-info" >
                    <img class="avatar" src="">
                    <span class="username">aaaaaa</span>
                    <span class="create-time">12156-163-485</span>
                </div>
                <p class="comment-content">啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>
            </li>
            <li >
                <div class="user-info" >
                    <img class="avatar" src="">
                    <span class="username">aaaaaa</span>
                    <span class="create-time">12156-163-485</span>
                </div>
                <p class="comment-content">啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>
            </li>



        </ul>
    </div>
    <div class="col"></div>
</div>



<!--	弹窗评论-->
<div class="pltan" id="tan">
    <div class="pltantop">
        <a href="" class="btn-close" >×</a>
    </div>
    <form>
        <p style="margin-left: 22px;margin-top: 10px; font-family:'思源黑体 CN Light';font-size: 16px">给个评价吧：</p>
        <div id="test6" style="margin-left: 20px;"></div>
        <hr style="border: 5px solid red;"/>
        <p style="margin-left: 22px;font-family: '黑体';color: gray">简短评论:</p>
        <textarea rows="4" cols="72" placeholder="点此评论" class="pltank"></textarea>

        <div class="pltanbot">
            <button type="submit" class="btn btn-outline-secondary btn-sm" style="float:right;margin-top: 2px;margin-right:5px;">确认</button>
        </div>
    </form>


</div>


<script src="../layui/layui.js"></script>
<script src="../js/jquery-3.5.1/jquery-3.5.1.js"></script>

<script>
    layui.use(['rate'], function(){
        var rate = layui.rate;

        //自定义文本
        //只读
        rate.render({
            elem: '#test9'
            ,value: 3.5
            ,readonly: true
            ,half:true
            ,text: true
        });

        //自定义文本
        rate.render({
            elem: '#test5'
            ,value: 3
            ,text: true
            ,half:true
            ,setText: function(value){ //自定义文本的回调
                var arrs = {
                    '1': '极差'
                    ,'2': '差'
                    ,'3': '中等'
                    ,'4': '好'
                    ,'5': '极好'
                };
                this.span.text(arrs[value] || ( value + "星"));
            }
            ,choose: function(value){
//		document.getElementById("tan").style.display="block"
                $("#p").click(function () {
                    if($('#tan').is(':hidden')){
                        $("#tan").slideDown();
                    }else{
                    }
                });



            }
        })

        rate.render({
            elem: '#test6'
            ,value: 3
            ,text: true
            ,half: true
            ,setText: function(value){ //自定义文本的回调
                var arrs = {
                    '1': '极差'
                    ,'2': '差'
                    ,'3': '中等'
                    ,'4': '好'
                    ,'5': '极好'
                };
                this.span.text(arrs[value] || ( value + "星"));
            }
        })

    });
</script>

</body>
</html>
