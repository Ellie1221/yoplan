<%--
  Created by IntelliJ IDEA.
  User: chaeyoung
  Date: 2023/04/04
  Time: 12:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .container {
            width: 1300px;
            border: 1px solid red;
            margin: 0 auto;
        }

        div {
            border: 1px solid rgb(152, 157, 250);
        }

        .topMenu {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 70px;
        }

        .content {
            min-height: 700px;
        }

        .footer {
            height: 80px;
        }

        .menuBar {
            height: 40px;
        }
        #logo img{
            width: 200px;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="topMenu">
        <div id="logo"><img src="logo.png"></div>
        <div id="searchBar">searchBar</div>
        <div id="logInfo">로그인정보</div>
    </div>
    <div class="menuBar">메뉴바</div>
    <div class="content">내용</div>
    <div class="footer">footer</div>
</div>
</body>

</html>