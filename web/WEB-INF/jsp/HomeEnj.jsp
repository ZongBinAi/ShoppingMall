<%--
  Created by IntelliJ IDEA.
  User: aizongbin
  Date: 2018/4/7
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>家用娱乐</title>
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
                    <img src="${pageContext.request.contextPath}/images/homeEnj/4_sn.jpg">
                    <img src="${pageContext.request.contextPath}/images/homeEnj/h23_sn.jpg">
                    <img src="${pageContext.request.contextPath}/images/homeEnj/V500HJ_Z_sn.jpg">
                    <img src="${pageContext.request.contextPath}/images/homeEnj/lj-g90-Q_sn.jpg">
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
                            <td><a href="http://product.pconline.com.cn/cpu/intel/631794.html" target="_blank">Intel酷睿i5 7400</a></td>
                            <td>1</td>
                            <td><span class="price">￥1269</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p3.png"></td>
                            <td>主板</td>
                            <td><a href="http://product.pconline.com.cn/mb/gigabyte/1095041.html" target="_blank">技嘉B360M-D3V</a></td>
                            <td>1</td>
                            <td><span class="price">￥649</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p4.png"></td>
                            <td>内存</td>
                            <td><a href="http://product.pconline.com.cn/memory/kingston/631888.html" target="_blank">金士顿DDR4 2400 8G</a></td>
                            <td>1</td>
                            <td><span class="price">￥669</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p5.png"></td>
                            <td>机械硬盘</td>
                            <td><a href="http://product.pconline.com.cn/harddisk/seagate/593063.html" target="_blank">希捷ST1000VM002</a></td>
                            <td>1</td>
                            <td><span class="price">￥399</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p18.jpg"></td>
                            <td>固态硬盘</td>
                            <td><a href="http://product.pconline.com.cn/dianziyingpan/kingston/572415.html" target="_blank">金士顿HyperX FURY SHFS37A/240G</a></td>
                            <td>1</td>
                            <td><span class="price">￥669</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p7.png"></td>
                            <td>显卡</td>
                            <td><a href="http://product.pconline.com.cn/vga/nvidia/1073463.html" target="_blank">NVIDIA GTX1050 TI 4GB</a></td>
                            <td>1</td>
                            <td><span class="price">￥1199</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p14.png"></td>
                            <td>机箱</td>
                            <td><a href="http://product.pconline.com.cn/case/greatwall/589790.html" target="_blank">长城H-23</a></td>
                            <td>1</td>
                            <td><span class="price">￥148</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p15.png"></td>
                            <td>电源</td>
                            <td><a href="http://product.pconline.com.cn/power/greatwall/620605.html" target="_blank">长城ATX-300P4节能版</a></td>
                            <td>1</td>
                            <td><span class="price">￥149</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p11.png"></td>
                            <td>显示器</td>
                            <td><a href="http://product.pconline.com.cn/lcd/greatwall/630483.html" target="_blank">长城L2078WP</a></td>
                            <td>1</td>
                            <td><span class="price">￥539</span></td>
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
                            <td><a href="http://product.pconline.com.cn/keyboard/rapoo/637383.html" target="_blank">雷柏V500合金版游戏机械键盘</a></td>
                            <td>1</td>
                            <td><span class="price">￥99</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p12.png"></td>
                            <td>鼠标</td>
                            <td><a href="http://product.pconline.com.cn/mouse/logitech/568291.html" target="_blank">罗技G90</a></td>
                            <td>1</td>
                            <td><span class="price">￥99</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p16.png"></td>
                            <td>音箱</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><span class="price">&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p2.png"></td>
                            <td>散热器</td>
                            <td><a href="http://product.pconline.com.cn/sanre/jonsbo/643270.html" target="_blank">乔思伯FR-201P</a></td>
                            <td>1</td>
                            <td><span class="price">￥99</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p8.png"></td>
                            <td>声卡</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><span class="price">&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p9.png"></td>
                            <td>光驱</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><span class="price">&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p17.png"></td>
                            <td>耳机</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><span class="price">&nbsp;</span></td>
                        </tr>
                        </tbody><tfoot>
                    <tr>
                        <td colspan="5">价格总计：<span class="final"><span>￥</span>5987</span></td>
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

<%@ include file="footer.jsp" %>
</body>
</html>
