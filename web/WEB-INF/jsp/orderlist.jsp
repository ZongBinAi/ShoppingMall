<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <title>配置单页面</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<%@ include file="header1.jsp" %>

<div class="container cart">

    <div class="span24">

        <div class="step step1">
            <ul>

                <li class="current"></li>
                <li>配置单列表</li>
            </ul>
        </div>
        <table>
            <tbody>
            <s:iterator value="oList" var="order">
                <tr>
                    <th colspan="5">
                        订单号：<s:property value="#order.oid"/> &nbsp;&nbsp;&nbsp;
                        金额：<font color="green"><s:property value="#order.total"/></font>&nbsp;&nbsp;&nbsp;
                        状态：<s:if test="#order.state==1">
                            <a href="${pageContext.request.contextPath}/order_findByOid.action?oid=<s:property value="#order.oid"/>"><font color="red">付款</font></a>
                        </s:if>
                        <s:elseif test="#order.state==2">
                            已付款
                        </s:elseif>
                        <s:elseif test="#order.state==3">
                            <a href="${pageContext.request.contextPath}/order_updateState.action?oid=<s:property value="#order.oid"/>"><font color="blue">确认收货</font></a>
                        </s:elseif>
                        <s:elseif test="#order.state==4">
                            订单完成
                        </s:elseif>
                    </th>
                </tr>

                <tr>
                    <th>图片</th>
                    <th>商品</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                <s:iterator value="#order.orderItems" var="orderItem">
                    <tr>
                        <td width="60">
                            <input type="hidden" name="id" value="22"/>
                            <img src="${pageContext.request.contextPath}/<s:property value="#orderItem.product.image"/>"/>
                        </td>
                        <td>
                            <a target="_blank"><s:property value="#orderItem.product.pname"/></a>
                        </td>
                        <td>
                            <s:property value="#orderItem.product.shop_price"/>
                        </td>
                        <td class="quantity" width="60">
                            <s:property value="#orderItem.count"/>
                        </td>
                        <td width="140">
                            <span class="subtotal">￥<s:property value="#orderItem.subtotal"/></span>
                        </td>
                    </tr>
                </s:iterator>

            </s:iterator>

            </tbody>
        </table>


    </div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>