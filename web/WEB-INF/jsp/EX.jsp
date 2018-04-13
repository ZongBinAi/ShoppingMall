<%--
  Created by IntelliJ IDEA.
  User: aizongbin
  Date: 2018/4/7
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>豪华配置推荐配置</title>
    <link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <link href="${pageContext.request.contextPath}/css/zzzj.css" rel="stylesheet" type="text/css">
    <style>
        body {background: #fff;padding: 5px 100px}
        .layAB { padding: 1px }
        .main { border-top: none }
        .thead {border-bottom: none;padding:10px 0; height:58px; margin-bottom:10px; border-bottom:1px solid #becae2}
        .tfoot a {display: block;display: inline-block;margin: 0 10px}
        h1 { float: left }
        h2 {float: left;padding-left: 18px;line-height: 62px;color: #c00;font-family: \9ED1\4f53;font-size: 20px;}
    </style>
    <script class=" defer" src="${pageContext.request.contextPath}/js/common.js" charset="gbk"></script>
</head>
<body>
<%@ include file="header1.jsp" %>

<div class="container index">
    <div class="layAB">
        <div class="show">
            <ul class="summary">
                <li class="sec">
                    <strong>配置外观</strong>： <br>
                    <img src="${pageContext.request.contextPath}/images/businOff/CG318-4K_sn.jpg">
                    <img src="${pageContext.request.contextPath}/images/businOff/5aa9c24aa1e886584.jpg_e600_sn.jpg">
                    <img src="${pageContext.request.contextPath}/images/businOff/AEAX01_1_sn.jpg">
                    <img src="${pageContext.request.contextPath}/images/businOff/G900_Z11_sn.jpg">
                    <img src="${pageContext.request.contextPath}/images/businOff/30_sn.jpg">
                </li>
            </ul>
            <div class="info modBoxF1">
                <div class="thF">配置方案清单</div>
                <div class="tbF">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody><tr>
                            <th width="9%" scope="col">&nbsp;</th>
                            <th width="11%" scope="col">配件</th>
                            <th width="64%" scope="col">品牌型号</th>
                            <th width="8%" scope="col">数量</th>
                            <th width="8%" scope="col">单价</th>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p1.png"></td>
                            <td>CPU</td>
                            <td>英特尔铂金8180</td>
                            <td>1</td>
                            <td><span class="price">￥89999</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p3.png"></td>
                            <td>主板</td>
                            <td>超微X10DRi</td>
                            <td>1</td>
                            <td><span class="price">￥4250</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p4.png"></td>
                            <td>内存</td>
                            <td>三星ECC 64G</td>
                            <td>9</td>
                            <td><span class="price">￥4800</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p5.png"></td>
                            <td>机械硬盘</td>
                            <td>HGST 12T</td>
                            <td>6</td>
                            <td><span class="price">￥3199</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p18.jpg"></td>
                            <td>固态硬盘</td>
                            <td>英特尔P3700 2T</td>
                            <td>4</td>
                            <td><span class="price">￥9999</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p7.png"></td>
                            <td>显卡</td>
                            <td><a href="http://product.pconline.com.cn/vga/nvidia/1093471.html" target="_blank">Nvidia Quadro GV100</a></td>
                            <td>2</td>
                            <td><span class="price">￥56599</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p14.png"></td>
                            <td>机箱</td>
                            <td><a href="http://product.pconline.com.cn/case/inwin/1091147.html" target="_blank">迎广WINBOT个性机箱</a></td>
                            <td>1</td>
                            <td><span class="price">￥23600</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p15.png"></td>
                            <td>电源</td>
                            <td><a href="http://product.pconline.com.cn/power/corsair/616733.html" target="_blank">海盗船AX1500i 额定功率1500W</a></td>
                            <td>1</td>
                            <td><span class="price">￥3499</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p11.png"></td>
                            <td>显示器</td>
                            <td><a href="http://product.pconline.com.cn/lcd/eizo/610034.html" target="_blank">艺卓CG318-4K专业级</a></td>
                            <td>1</td>
                            <td><span class="price">￥48000</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p10.png"></td>
                            <td>键鼠套装</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><span class="price">&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p13.png"></td>
                            <td>键盘</td>
                            <td><a href="http://product.pconline.com.cn/keyboard/realforce/685407.html" target="_blank">韧锋AEAX01 108U</a></td>
                            <td>1</td>
                            <td><span class="price">￥2399</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p12.png"></td>
                            <td>鼠标</td>
                            <td><a href="http://product.pconline.com.cn/mouse/logitech/616689.html" target="_blank">罗技G900 Chaos Spectrum</a></td>
                            <td>1</td>
                            <td><span class="price">￥1099</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p16.png"></td>
                            <td>音箱</td>
                            <td><a href="http://product.pconline.com.cn/soundbox/bose/603610.html" target="_blank">BOSE SoundTouch 30 III</a></td>
                            <td>1</td>
                            <td><span class="price">￥4580</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p2.png"></td>
                            <td>散热器</td>
                            <td><a href="http://product.pconline.com.cn/sanre/corsair/536752.html" target="_blank">海盗船H100I</a></td>
                            <td>1</td>
                            <td><span class="price">￥999</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p8.png"></td>
                            <td>声卡</td>
                            <td><a href="http://product.pconline.com.cn/sound/creative/554859.html" target="_blank">创新Sound Blaster ZxR 声卡</a></td>
                            <td>1</td>
                            <td><span class="price">￥2199</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p9.png"></td>
                            <td>光驱</td>
                            <td><a href="http://product.pconline.com.cn/writer/asus/623240.html" target="_blank">华硕SBW-S1 PRO</a></td>
                            <td>1</td>
                            <td><span class="price">￥1399</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p17.png"></td>
                            <td>耳机</td>
                            <td><a href="http://product.pconline.com.cn/earphone/sennheiser/609757.html" target="_blank">森海塞尔HD800S</a></td>
                            <td>1</td>
                            <td><span class="price">￥11000</span></td>
                        </tr>
                        </tbody><tfoot>
                    <tr>
                        <td colspan="5">价格总计：<span class="final"><span>￥</span>408611</span></td>
                    </tr>
                    </tfoot>
                    </table>
                </div>
            </div>
            <div class="clear"></div>

            <div class="tfoot" id="tfoot">
                <a href="index.action" class="btn bGray">返回首页</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
