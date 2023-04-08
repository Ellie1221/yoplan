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
    <style>

        .loginBox {
            width: 350px;
            height: 500px;
            border-radius: 10px;
            position: relative;
            top: 70px;
            margin: 0 auto;
        }

        #loginLine {
            border-top: thin solid #c0c0c0;
            width: 88%;
            margin-top: 10px;
        }

        .loginBox img {
            position: relative;
            margin-top: 30px;
            left: 35px;
        }

        .loginBox input {
            width: 280px;
            height: 30px;
        }

        .loginBox form {
            margin-left: 35px;
        }

        .loginBox input[type='text'], input[type='password'] {
            border: none;
            border-bottom: 1px solid black;
            padding: 10px;
        }

        .loginBox input[type='text']:focus {
            outline: none;
        }

        .loginBox input[type='password']:focus {
            outline: none;
        }

        .loginBox input[type='button'] {
            color: skyblue;
            border-radius: 7px;
            border: 1px solid skyblue;
            background: rgba(0, 0, 0, 0);
            margin: 5px 0;
        }

        .loginBox input[type='submit'] {
            background-color: skyblue;
            border-radius: 7px;
            border: none;
            color: white;
            margin: 5px 0;
        }

    </style>

</head>
<body>
<div class="content">
    <div class="loginBox">
        <a href="/"><img src="/images/logo.png"></a>
        <form action="/member" method="post">
            <br>
            <span>아이디</span><br>
            <input type="text" id="id" name="id"/><br><br>
            <span>비밀번호</span><br>
            <input type="password" id="pw" name="pw"/><br><br>
            <input type="submit" value="로그인" id="loginButton"/><br>
            <input type="button" value="회원가입" id="regiButton" onclick="location.href='/newMember'"/>
            <div id="loginLine"></div>
        </form>
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
