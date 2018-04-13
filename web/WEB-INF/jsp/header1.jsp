<%--
  Created by IntelliJ IDEA.
  User: 艾宗斌
  Date: 2017/08/06
  Time: 下午 05:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container header">
    <div class="span5">
        <div class="logo">
            <a href="http://mydiy.pconline.com.cn/">
                <img src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.png" alt="主机diy" width="280">
            </a>
        </div>
    </div>
    <div class="span9">
        <div class="headerAd">
            <img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障"
                 title="正品保障">
        </div>
    </div>

    <%--===header=====================================================================================--%>
    <div class="span10 last">
        <div class="topNav clearfix">
            <ul>

                <%--=登陆后显示用户名===================================================--%>
                <s:if test="#session.existUser !=null">
                    <li id="headerLogin" class="headerLogin" style="display: list-item;">
                        <s:property value="#session.existUser.username"/>
                    </li>
                    <li id="headerLogin" class="headerLogin" style="display: list-item;">
                        <a href="${pageContext.request.contextPath}/order_findByUid.action">我的配置单</a>|
                    </li>
                    <li id="headerRegister" class="headerRegister" style="display: list-item;">
                        <a href="${pageContext.request.contextPath}/user_quit.action">退出</a>|
                    </li>
                </s:if>
                <s:else>
                    <li id="headerLogin" class="headerLogin" style="display: list-item;">
                        <a href="${pageContext.request.contextPath}/user_loginPage.action">登录</a>|
                    </li>
                    <li id="headerRegister" class="headerRegister" style="display: list-item;">
                        <a href="${pageContext.request.contextPath}/user_registPage.action">注册</a>|
                    </li>
                </s:else>
                <%--===================================================================--%>

                <li id="headerUsername" class="headerUsername"></li>
                <li id="headerLogout" class="headerLogout">
                    <a>[退出]</a>|
                </li>
                <li>
                    <a href="http://detail.zol.com.cn/">硬件报价</a>
                    |
                </li>
                <li>
                    <a href="http://bbs.zol.com.cn/diybbs/d231.html">diy攒机论坛</a>
                    |
                </li>
                <li>
                    <a href="http://pcdiy.jd.com/">京东配件</a>

                </li>
            </ul>
        </div>
        <div class="cart">
            <a href="${pageContext.request.contextPath}/cart_myCart.action">配置单</a>
        </div>
        <div class="phone">
            客服热线:
            <strong>96008/53277764</strong>
        </div>
    </div>


    <%--==menu================================================================================================--%>

    <div class="span24">
        <ul class="mainNav">
            <li>
                <a href="${pageContext.request.contextPath}/recom_graLaDi.action">显卡天梯图</a>
                |
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/recom_businOff.action">商务配置</a>
                |
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/recom_homeEnj.action">家用娱乐</a>
                |
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/recom_gamePower.action">游戏发烧</a>
                |
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/recom_profeDes.action">专业办公</a>
                |
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/recom_EX.action">豪华配置</a>
                |
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/recom_simple.action">极简配置</a>
                |
            </li>
        </ul>
    </div>


    <div class="span24">
        <ul class="mainNav">
            <li>
                <a href="${pageContext.request.contextPath}/index.action">首页</a>
                |
            </li>

            <s:iterator value="#session.categoryList" var="c">
                <li>
                    <a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property
                            value="#c.cname"/></a>
                    |
                </li>
            </s:iterator>
        </ul>
    </div>

</div>
