<%--
  Created by IntelliJ IDEA.
  User: aizongbin
  Date: 2018/4/7
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>商务办公推荐配置</title>
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
                    <img src="${pageContext.request.contextPath}/images/businOff/5_sn.jpg">
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
                            <td><a href="http://product.pconline.com.cn/cpu/intel/607717.html" target="_blank">Inte至强E3-1230 V5</a></td>
                            <td>1</td>
                            <td><span class="price">￥2049</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p3.png"></td>
                            <td>主板</td>
                            <td><a href="http://product.pconline.com.cn/mb/gigabyte/608076.html" target="_blank">技嘉X150M-PLUS WS</a></td>
                            <td>1</td>
                            <td><span class="price">￥899</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p4.png"></td>
                            <td>内存</td>
                            <td><a href="http://product.pconline.com.cn/memory/kingston/631888.html" target="_blank">金士顿DDR4 2400 8G</a></td>
                            <td>2</td>
                            <td><span class="price">￥669</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p5.png"></td>
                            <td>机械硬盘</td>
                            <td><a href="http://product.pconline.com.cn/harddisk/seagate/637553.html" target="_blank">希捷酷鱼系列 3TB SATA3 64M</a></td>
                            <td>2</td>
                            <td><span class="price">￥649</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p18.jpg"></td>
                            <td>固态硬盘</td>
                            <td><a href="http://product.pconline.com.cn/dianziyingpan/sandisk/628974.html" target="_blank">闪迪Z410系列240G</a></td>
                            <td>1</td>
                            <td><span class="price">￥599</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p7.png"></td>
                            <td>显卡</td>
                            <td><a href="http://product.pconline.com.cn/vga/gigabyte/616809.html" target="_blank">技嘉GV-N710D3-2GL</a></td>
                            <td>1</td>
                            <td><span class="price">￥349</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p14.png"></td>
                            <td>机箱</td>
                            <td><a href="http://product.pconline.com.cn/case/antec/638794.html" target="_blank">ANTEC GX909</a></td>
                            <td>1</td>
                            <td><span class="price">￥299</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p15.png"></td>
                            <td>电源</td>
                            <td><a href="http://product.pconline.com.cn/power/antec/620549.html" target="_blank">安钛克EA450Platinum  450W</a></td>
                            <td>1</td>
                            <td><span class="price">￥499</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p11.png"></td>
                            <td>显示器</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><span class="price">&nbsp;</span></td>
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
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><span class="price">&nbsp;</span></td>
                        </tr>
                        <tr>
                            <td class="cent"><img src="${pageContext.request.contextPath}/images/businOff/p12.png"></td>
                            <td>鼠标</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><span class="price">&nbsp;</span></td>
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
                            <td><a href="http://product.pconline.com.cn/sanre/coolermaster/620992.html" target="_blank">酷冷至尊T400i</a></td>
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
                        <td colspan="5">价格总计：<span class="final"><span>￥</span>7429</span></td>
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
