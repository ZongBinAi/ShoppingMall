<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/mango/product/list/1.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>商品列表</title>

    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css">

</head>
<body>

<%@ include file="header1.jsp" %>

<div class="container productList">
    <div class="span6">
        <div class="hotProductCategory">

            <%--==左边导航栏显示一级与二级分类==================================================================================================--%>

            <%--一级分类--%>
            <s:iterator value="categoryList" var="c">
                <dl>
                    <dt>
                        <a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property
                                value="#c.cname"/> </a>
                    </dt>

                        <%--二级分类--%>
                    <s:iterator value="#c.categorySeconds" var="cs">
                        <dd>
                            <a href="${pageContext.request.contextPath}/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1"><s:property value="#cs.csname"/> </a>
                        </dd>
                    </s:iterator>

                </dl>
            </s:iterator>

            <%--========================================================================================================================--%>

        </div>
    </div>
    <div class="span18 last">

        <form id="productForm" action="${pageContext.request.contextPath}/image/蔬菜 - Powered By Mango Team.htm"
              method="get">
            <input type="hidden" id="brandId" name="brandId" value="">
            <input type="hidden" id="promotionId" name="promotionId" value="">
            <input type="hidden" id="orderType" name="orderType" value="">
            <input type="hidden" id="pageNumber" name="pageNumber" value="1">
            <input type="hidden" id="pageSize" name="pageSize" value="20">

            <div id="result" class="result table clearfix">
                <ul>

                    <%--==单个商品预览=========================================================================================--%>

                    <s:iterator value="pageBean.list" var="p">
                        <li>
                            <a href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>">
                                <img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>"
                                     width="170" height="170" style="display: inline-block;">

                                <span style='color:green'>
											 <s:property value="#p.pname"/>
											</span>

                                <span class="price">
												参考价： ￥<s:property value="#p.shop_price"/>
											</span>

                            </a>
                        </li>
                    </s:iterator>
                </ul>

                <%--====================================================================================================--%>

            </div>

            <%--===分页显示下面角标======================================================================================--%>

            <div class="pagination">
                第  <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
                <s:if test="pageBean.page != 1">
                    <a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=1" class="firstPage">&nbsp;</a>
                    <a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
                </s:if>
                <s:iterator var="i" begin="1" end="pageBean.totalPage" step="1">
                    <s:if test="pageBean.page==#i">
                        <span class="currentPage"><s:property value="#i"/></span>
                    </s:if>
                    <s:else>
                        <a href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
                    </s:else>
                </s:iterator>

                <s:if test="pageBean.page != pageBean.totalPage">
                    <a class="nextPage" href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
                    <a class="lastPage" href="${ pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
                </s:if>
            </div>
            <%--==================================================================================================--%>
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>