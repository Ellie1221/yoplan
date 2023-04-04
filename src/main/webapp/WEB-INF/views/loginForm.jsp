<%--
  Created by IntelliJ IDEA.
  User: chaeyoung
  Date: 2023/04/04
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="content">
        <div class="loginBox">
            <a href="/"><img src="/images/logo.png"></a>
            <form action="/login" method="post">
                <br>
                <span>아이디</span><br>
                <input type="text" id="id" name="id"/><br><br>
                <span>비밀번호</span><br>
                <input type="password" id="pw" name="pw"/><br><br>
                <input type="submit" value="로그인" id="loginButton"/><br>
                <input type="button" value="회원가입" id="regiButton"/>
                <div id="loginLine"></div>
            </form>
        </div>
    </div>
</div>

<script>
    let loginMsg = "${loginMsg}";
    if (loginMsg != "") {
        alert(loginMsg);
    }
</script>
</body>
</html>
