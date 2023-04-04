<%--
  Created by IntelliJ IDEA.
  User: chaeyoung
  Date: 2023/04/04
  Time: 12:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" >
    <title>Document</title>
    <link href="/css/style.css" rel="stylesheet">
<%--    <script src="/webjars/jquery/3.6.2/jquery.min.js"></script>--%>

</head>

<body>
<div class="container">
    <div class="topMenu">
        <div id="logo" onclick="location.href='/'"><img src="/images/logo.png"></div>
        <div id="searchBox">
            <input type="text" id="searchKeyword">
            <button type="button" id="searchButton"><img src="/images/loupe.png" id="loupe"></button>
        </div>
        <div id="logInfo">
            <a href="#">로그인</a>
            &nbsp;&nbsp;
            <a href="#">회원가입</a>
        </div>
    </div>
    <div class="menuBar">
        <span><a href="#">일정계획</a></span>
        <span><a href="#">나의여행</a></span>
        <span><a href="#">커뮤니티</a></span>
        <span><a href="#">마이페이지</a></span>
    </div>

</div>
</body>

</html>
