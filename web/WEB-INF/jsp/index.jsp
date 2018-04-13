<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>主机在线diy</title>
    <link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <%--主机幻灯片css--%>
    <link href="${pageContext.request.contextPath}/css/slideshow.css" rel="stylesheet" />
</head>
<body>
<%--==============================鼠标css/javascript  start==================================--%>
<style type="text/css">
    * {
        margin: 0;
        padding: 0;
        list-style-type: none;
    }

    a, img {
        border: 0;
        text-decoration: none;
    }

    body {
        font: 12px/180% Arial, Helvetica, sans-serif, "新宋体";
        background: #E1E7E8;
    }

    /* imageFlow */
    #imageFlow {
        width: 1050px;
        height: 390px;
        overflow: hidden;
        position: relative;
        margin: 30px auto 0 auto;
    }

    #imageFlow .diapo {
        position: absolute;
        left: -1000px;
        cursor: pointer;
        overflow: hidden;
    }

    #imageFlow .bank {
        visibility: hidden;
        overflow: hidden;
    }

    #imageFlow ul {
        height: 20px;
        margin: 0 auto;
        width: 100%;
        text-align: center;
    }

    #imageFlow ul li {
        color: #333;
        font-size: 12px;
        text-align: left;
        margin-left: 30%;
        height: 20px;
        line-height: 20px;
        overflow: hidden;
        width: 100%;
        vertical-align: bottom;
    }

    #imageFlow .text {
        position: absolute;
        left: 0px;
        width: 80px;
        bottom: 1%;
        text-align: center;
        color: #333;
        font-family: verdana, arial, Helvetica, sans-serif;
        z-index: 1000;
    }

    #imageFlow .title {
        font-size: 0.9em;
        font-weight: bold;
    }

    #imageFlow .legend {
        font-size: 0.8em;
    }

    #imageFlow .scrollbar {
        position: absolute;
        left: 10%;
        top: 0;
        width: 80%;
        height: 16px;
        z-index: 1;
    }

    #imageFlow .scrollbar img {
        cursor: pointer;
    }

    #imageFlow .track {
        position: absolute;
        left: -55px;
        width: 950px;
        height: 16px;
        top: 0px;
    }

    #imageFlow .arrow-left {
        position: absolute;
        left: -105px;
        z-index: 1;
    }

    #imageFlow .arrow-right {
        position: absolute;
        right: -105px;
        z-index: 1;
    }

    #imageFlow .bar {
        position: absolute;
        height: 16px;
        left: 25px;
        top: 0px;
        cursor: pointer;
    }

    #imageFlow .ProTi {
        color: #ff6600;
        font-weight: bold;
    }

    #imageFlow .ProRmb {
        font-weight: bold;
    }

    #imageFlow .ProMo {
        color: #ff6600;
        cursor: pointer;
    }
</style>
<!--[if IE 6]>
<script src="${pageContext.request.contextPath}/js/DDPngMin.js"></script>
<script>DD_belatedPNG.fix('#imageFlow .diapo');</script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Flow.js"></script>
<script type="text/javascript">
    /* ==== create imageFlow ==== */
    if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
        imf.create("imageFlow", 0.78, 1, 5);
        $(document).ready(function () {
            $(".bar").attr("src", "images/clear.gif");
            $(".bar").attr("style", "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, src='images/sc.png')");
            $(".arrow-left").attr("src", "images/clear.gif");
            $(".arrow-left").attr("style", "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, src='images/btn_Pro_show_left.png')");
            $(".arrow-right").attr("src", "images/clear.gif");
            $(".arrow-right").attr("style", "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true, src='images/btn_Pro_show_right.png')");
        });
    } else {
        imf.create("imageFlow", 0.5, 1.5, 5);
    }
</script>
<script src="${pageContext.request.contextPath}/adsense.js" type="text/javascript"></script>
<%--==============================鼠标css/javascript  end==================================--%>


<%@ include file="header1.jsp" %>
<%--========================================主机幻灯片 start=====================================--%>
<!-- 代码 开始 -->
<div id="yc-mod-slider">
    <div class="wrapper">
        <div id="slideshow" class="box_skitter fn-clear">
            <ul>
                <li><img class="cubeRandom" src="images/slider1.jpg" /></li>
                <li><img class="cubeRandom" src="images/slider2.jpg" /></li>
                <li><img class="cubeRandom" src="images/slider3.jpg" /></li>
                <li><img class="cubeRandom" src="images/slider4.jpg" /></li>
                <li><img class="cubeRandom" src="images/slider5.jpg" /></li>
            </ul>
        </div>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/slideshow.js"></script>
    </div>
</div>
<!-- 代码 结束 -->
<div style="text-align: center">
    <script src="${pageContext.request.contextPath}/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/follow.js" type="text/javascript"></script>
</div>
<%--===================================主机幻灯片 end======================================--%>

<%--热门/最新商品列表--%>
<div class="container index">
    <div class="span24">
        <div id="hotProduct" class="hotProduct clearfix">
            <div class="title">
                <strong>最热配件</strong>
                <!-- <a  target="_blank"></a> -->
            </div>
            <ul class="tab">
                <li class="current">
                    <a href="./list.jsp?tagIds=1" target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
            </ul>

            <%--=遍历出热门商品======================================================================================================--%>

            <ul class="tabContent" style="display: block;">
                <s:iterator value="hotList">
                    <li>
                        <a href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="pid"/>"><img
                                src="${pageContext.request.contextPath}/<s:property value="image"/>"
                                style="display: block;"></a>
                    </li>
                </s:iterator>
            </ul>

            <%--=======================================================================================================================--%>


        </div>
    </div>
    <div class="span24">
        <div id="newProduct" class="newProduct clearfix">
            <div class="title">
                <strong>最新发布</strong>
                <a target="_blank"></a>
            </div>
            <ul class="tab">
                <li class="current">
                    <a href="./list.jsp?tagIds=2" target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
                <li>
                    <a target="_blank"></a>
                </li>
            </ul>

            <ul class="tabContent" style="display: block;">

                <%--====遍历出最新商品==================================================================================--%>

                <s:iterator value="newList">
                    <li>
                        <a href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="pid"/>"><img
                                src="${pageContext.request.contextPath}/<s:property value="image"/>"
                                style="display: block;"></a>
                    </li>
                </s:iterator>

                <%--=================================================================================================================--%>

            </ul>

        </div>
    </div>
    <div class="span24">
        <div class="friendLink">
            <dl>
                <dt>攒机指南</dt>
                <dd>
                    <a target="_blank">模拟攒机</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">我的方案</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">网友方案</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">配置排行</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">网友首选配件</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">攒机问答</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">显卡天梯图</a>
                    |
                </dd>
                <dd>
                    <a target="_blank">装机论坛</a>
                    |
                </dd>

                <dd class="more">
                    <a>更多</a>
                </dd>
            </dl>
        </div>
    </div>
</div>

<%--===========================鼠标div start==========================================--%>
<div id="imageFlow">
    <div class="bank">
        <a rel='${pageContext.request.contextPath}/images/1090.png' href='#'>
            <ul>
                <li class="ProTi">1090笔记本型光学无线鼠标</li>
                <li>高精度光学寻迹引擎</li>
                <li>无线自由</li>
                <li>NANO接收器，即插即忘</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/1090jzb.png' href='#'>
            <ul>
                <li class="ProTi">1090精致版笔记本型光学无线鼠标</li>
                <li>高精度光学寻迹引擎</li>
                <li>无线自由</li>
                <li>NANO接收器，即插即忘</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/1030.png' href='#'>
            <ul>
                <li class="ProTi">1030无线光学鼠标</li>
                <li>高精度光学寻迹引擎</li>
                <li>无线自由</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/1100X.png' href='#'>
            <ul>
                <li class="ProTi">1100X光学无线鼠标</li>
                <li>高精度光学寻迹引擎</li>
                <li>舒适贴心</li>
                <li>无线自由</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/1200.png' href='#'>
            <ul>
                <li class="ProTi">1200光学无线鼠标</li>
                <li>高精度光学寻迹引擎</li>
                <li>无线自由</li>
                <li>纤薄外观</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/3100.png' href='#'>
            <ul>
                <li class="ProTi">3100光学无线鼠标</li>
                <li>高精度蓝光寻迹引擎</li>
                <li>动感流线，时尚魅力</li>
                <li>无线自由</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/7100.png' href='#'>
            <ul>
                <li class="ProTi">7100光学无线鼠标</li>
                <li>高精度蓝光寻迹引擎</li>
                <li>精巧独到、舒适贴心</li>
                <li>无线自由</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/3000.png' href='#'>
            <ul>
                <li class="ProTi">3000光学无线鼠标</li>
                <li>高精度蓝光寻迹引擎</li>
                <li>精巧独到、舒适贴心</li>
                <li>无线自由</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/3710.png' href='#'>
            <ul>
                <li class="ProTi">3710无线激光鼠标</li>
                <li>更长电池使用寿命</li>
                <li>2.4G无线自由</li>
                <li>激光定位精准，移动灵敏</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/6310.png' href='#'>
            <ul>
                <li class="ProTi">6310光学无线鼠标</li>
                <li>高精度蓝光寻迹引擎</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/3180.png' href='#'>
            <ul>
                <li class="ProTi">3180光学无线鼠标</li>
                <li>高精度蓝光寻迹引擎</li>
                <li>舒适手感</li>
                <li>无线自由</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
        <a rel='${pageContext.request.contextPath}/images/3090.png' href='#'>
            <ul>
                <li class="ProTi">3090笔记本型无线光学鼠标</li>
                <li>高精度光学寻迹引擎</li>
                <li>人体工学设计</li>
                <li>无线自由</li>
                <li class="ProMo">了解更多...</li>
            </ul>
        </a>
    </div>

    <div class="scrollbar">
        <img class="track" src="${pageContext.request.contextPath}/images/sb.png" alt=""/>
        <img class="arrow-left" src="${pageContext.request.contextPath}/images/btn_Pro_show_left.png" alt=""/>
        <img class="arrow-right" src="${pageContext.request.contextPath}/images/btn_Pro_show_right.png" alt=""/>
        <img class="bar" src="${pageContext.request.contextPath}/images/sc.png" alt=""/>
    </div>

</div>
<!--演示内容结束-->
<br><br><br>
<div style="text-align:center;clear:both">
    <script src="${pageContext.request.contextPath}/gg_bd_ad_336x280.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/follow.js" type="text/javascript"></script>
</div>
<%--==========================鼠标div end===========================================================--%>

<%@ include file="footer.jsp" %>
</body>
</html>