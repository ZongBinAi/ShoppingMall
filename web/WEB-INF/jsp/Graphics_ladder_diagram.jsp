<%--
  Created by IntelliJ IDEA.
  User: aizongbin
  Date: 2018/4/7
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>显卡天梯图</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/stylecard.css">
    <style>
        p{
            color:#fff;
            font-size:15px;
            text-shadow: 0 0 10px #529DFF;
        }
    </style>

</head>
<body>
<div style="text-align:center;clear:both">
    <script src="${pageContext.request.contextPath}/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/follow.js" type="text/javascript"></script>
</div>
<div class="wrap about_page" id="wrap">
    <div class="wrapper">
        <div class="events_sec" id="events_sec">
            <div class="content">
                <div class="events_list">
                    <span class="ic_time png"></span>
                    <ul>
                        <li class="right_li">
                            <span class="ic_events png"></span>
                            <p class="txt_events"><strong>GeForce GTX 1080 Ti<br>NVIDIA TITAN Xp<br>NVIDIA TITAN X</strong></p>
                        </li>
                        <li class="left_li">
                            <span class="ic_events"><i class="png"></i></span>
                            <p class="txt_events"><strong>RADEON RX VEGA 64<br>Radeon Pro Duo</strong></p>
                        </li>
                        <li class="right_li">
                            <span class="ic_events png"></span>
                            <p class="txt_events"><strong>GeForce GTX 1080<br>GeForce GTX 1070 Ti</strong></p>
                        </li>
                        <li class="left_li">
                            <span class="ic_events"><i class="png"></i></span>
                            <p class="txt_events"><strong>Radeon R9 295X2<br>RADEON RX VEGA 56</strong></p>
                        </li>
                        <li class="right_li">
                            <span class="ic_events png"></span>
                            <p class="txt_events"><strong>GeForce GTX TITAN Z<br>GeForce GTX TITAN X<br>GeForce GTX 1070</strong></p>
                        </li>
                        <li class="left_li">
                            <span class="ic_events"><i class="png"></i></span>
                            <p class="txt_events"><strong>Radeon R9 Fury X<br>Radeon RX 580<br>Radeon R9 Fury</strong></p>
                        </li>
                    </ul>
                    <span class="ic_arr png"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<audio id="audios" controls="true" autoplay="autoplay" class="audio" style="display:none;"></audio>

<script>
    var url=["",""];
    var num = GetRandomNum(0,url.length-1);
    document.getElementById("audios").src="http://"+url[num];
    function GetRandomNum(Min,Max)
    {
        var Range = Max - Min;
        var Rand = Math.random();
        return(Min + Math.round(Rand * Range));
    }

    function play(){
        var div = document.getElementById('playbtn');
        var obj=document.getElementById("audios");
        if(obj.paused){
            obj.play();
            div.setAttribute("class", "btn_sound");
        }else{
            obj.pause();
            div.setAttribute("class", "btn_sound btn_no_sound");
        }

    }
</script>
<script src="${pageContext.request.contextPath}/js/canvas-nest.min.js"></script>

</body>
</html>

