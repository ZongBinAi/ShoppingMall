<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0080)http://localhost:8080/mango/login.jhtml?redirectUrl=%2Fmango%2Fcart%2Flist.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>管理员登陆</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">

        function change1() {
            var img = document.getElementById("checkImg");
            img.src = "${pageContext.request.contextPath}/checkImg.action?" + new Date().getTime();
        }

    </script>


</head>
<body>

</div>
<div class="container login">
    <div class="span12">
        <div class="ad">
            <img src="${pageContext.request.contextPath}/image/login.jpg" width="500" height="330" alt="会员登录"
                 title="会员登录">
        </div>
    </div>
    <div class="span12 last">
        <div class="wrap">
            <div class="main">
                <div class="title">
                    <strong>会员登录</strong>USER LOGIN
                </div>
                <div class="title">
                    <s:actionerror/>
                </div>
                <form id="loginForm" action="${pageContext.request.contextPath}/adminUser_login.action" method="post" novalidate="novalidate">
                    <table>
                        <tbody>
                        <tr>
                            <th>
                                管理员姓名:
                            </th>
                            <td>
                                <input type="text" id="username" name="username" class="text"
                                       maxlength="20"><span><s:fielderror fieldName="username"/> </span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                管理员密码:
                            </th>
                            <td>
                                <input type="password" id="password" name="password" class="text" maxlength="20"
                                       autocomplete="off"><span><s:fielderror fieldName="username"/> </span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                验证码:
                            </th>
                            <td>
										<span class="fieldSet">
											<input type="text" id="captcha" name="checkcode"
                                                   class="text captcha" maxlength="4" autocomplete="off">
											<img id="checkImg" class="captchaImage"
                                                 src="${pageContext.request.contextPath}/checkImg.action"
                                                 title="点击更换验证码" onclick="change1()">
										</span>
                            </td>
                        </tr>
                        <tr>
                            <th>&nbsp;

                            </th>
                            <td>
                                <input type="submit" class="submit" value="登 录">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>