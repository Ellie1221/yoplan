<%--
  Created by IntelliJ IDEA.
  User: beomsu
  Date: 2023/04/06
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Yo! Plan 커뮤니티</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .wrap {
            width: 1000px;
            margin: 0 auto;
        }

        .regBoard {
            margin-top: 25px;
            margin-right: 20px;
            font-size: 20px;
            text-align: right;
        }


    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div class="wrap">
    <input type="hidden" id="id" value="${sessionScope.logId }">
    <div class="regBoard">글쓰기</div>

</div>

<script>
    $(".regBoard").click(function() {
        const id = document.getElementById("id").value;
        if (id == "") {
            if (confirm("로그인이 필요합니다. 로그인 하시겠습니까?")) {
                window.location.href = "loginForm";
            }
        } else {
            window.location.href = "regBoard";
        }
    });
</script>
</body>
</html>
