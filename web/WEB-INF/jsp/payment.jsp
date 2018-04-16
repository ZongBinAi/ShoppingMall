<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0080)http://localhost:8080/mango/login.jhtml?redirectUrl=%2Fmango%2Fcart%2Flist.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<%@ include file="header1.jsp" %>

<div class="container index">
    <%
        if ("ICBC-NET-B2C".equals(request.getAttribute("pd_FrpId"))) {%>
            <img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle"/>
            <h2>请输入工商银行卡账号与密码</h2>
    <%}else if ("BOC-NET-B2C".equals(request.getAttribute("pd_FrpId"))){%>
            <img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle"/>
            <h2>请输入中国银行卡账号与密码</h2>
    <%}else if ("ABC-NET-B2C".equals(request.getAttribute("pd_FrpId"))){%>
            <img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle"/>
            <h2>请输入农业银行卡账号与密码</h2>
    <%}else if ("BOCO-NET-B2C".equals(request.getAttribute("pd_FrpId"))){%>
            <img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle"/>
            <h2>请输入交通银行卡账号与密码</h2>
    <%}else if ("PINGANBANK-NET".equals(request.getAttribute("pd_FrpId"))){%>
            <img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle"/>
            <h2>请输入平安银行卡账号与密码</h2>
    <%}else if ("CCB-NET-B2C".equals(request.getAttribute("pd_FrpId"))){%>
            <img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle"/>
            <h2>请输入建设银行卡账号与密码</h2>
    <%}else if ("CEB-NET-B2C".equals(request.getAttribute("pd_FrpId"))){%>
            <img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle"/>
            <h2>请输入光大银行卡账号与密码</h2>
    <%}else if ("CMBCHINA-NET-B2C".equals(request.getAttribute("pd_FrpId"))){%>
            <img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle"/>
            <h2>请输入招商银行卡账号与密码</h2>
    <%}
    %>

    <form action="order_callBack.action" method="post">
        卡号：<input type="text" name="cardId"/><br>
        密码：<input type="password" name="password"/><br>
        <input type="hidden" name="oid" value="<s:property value="order.oid"/>"/>
        <input type="submit" value="付款"/>
    </form>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>