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
    <title>Yo! Plan</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>

    </style>
</head>

<body>
<%@include file="header.jsp"%>
    <div class="content">
        <div class="banner-wrapper">
            <ul class="banner">
                <li><img src="/images/slidetest1.jpg" alt="이미지 1"></li>
                <li><img src="/images/slidetest2.jpeg" alt="이미지 2"></li>
                <li><img src="/images/slidetest4.jpg" alt="이미지 3"></li>
            </ul>
            <div class="banner-nav">
                <img class="prev" src="/images/prev.png" alt="이전">
                <img class="next" src="/images/next.png" alt="다음">
            </div>
        </div>
        <h2>이번 주 BEST 여행기</h2>
        <div class="best-box-container">
            <div class="best-box">
                <img src="/images/slidetest1.jpg" alt="여행 이미지">
                <div class="best_text">
                    <h3>여행 제목</h3>
                    <p>여행 설명 여행 설명여행 설명여행 설명여행 설명여행 설명여행 설명</p>
                    <p>chaeng 님의 여행</p>

                </div>
            </div>
            <div class="best-box">
                <img src="/images/slidetest3.jpg" alt="여행 이미지">
                <div class="best_text">
                    <h3>여행 제목</h3>
                    <p>여행 설명 여행 설명여행 설명여행 설명여행 설명여행 설명여행 설명</p>
                    <p>chaeng 님의 여행</p>
                </div>
            </div>
            <div class="best-box">
                <img src="/images/slidetest4.jpg" alt="여행 이미지">
                <div class="best_text">
                    <h3>여행 제목</h3>
                    <p>여행 설명 여행 설명여행 설명여행 설명여행 설명여행 설명여행 설명</p>
                    <p>chaeng 님의 여행</p>
                </div>
            </div>
            <div class="best-box">
                <img src="/images/slidetest5.jpg" alt="여행 이미지">
                <div class="best_text">
                    <h3>여행 제목</h3>
                    <p>여행 설명 여행 설명여행 설명여행 설명여행 설명여행 설명여행 설명</p
                    <p>chaeng 님의 여행</p>
                </div>
            </div>
            <div class="best-box">
                <img src="/images/slidetest1.jpg" alt="여행 이미지">
                <div class="best_text">
                    <h3>여행 제목</h3>
                    <p>여행 설명 여행 설명여행 설명여행 설명여행 설명여행 설명여행 설명</p
                    <p>chaeng 님의 여행</p>

                </div>
            </div>
            <div class="best-box">
                <img src="/images/slidetest3.jpg" alt="여행 이미지">
                <div class="best_text">
                    <h3>여행 제목</h3>
                    <p>여행 설명 여행 설명여행 설명여행 설명여행 설명여행 설명여행 설명</p>
                    <p>chaeng 님의 여행</p>
                </div>
            </div>
            <div class="best-box">
                <img src="/images/slidetest4.jpg" alt="여행 이미지">
                <div class="best_text">
                    <h3>여행 제목</h3>
                    <p>여행 설명 여행 설명여행 설명여행 설명여행 설명여행 설명여행 설명</p>
                    <p>chaeng 님의 여행</p>
                </div>
            </div>
            <div class="best-box">
                <img src="/images/slidetest5.jpg" alt="여행 이미지">
                <div class="best_text">
                    <h3>여행 제목</h3>
                    <p>여행 설명 여행 설명여행 설명여행 설명여행 설명여행 설명여행 설명</p
                    <p>chaeng 님의 여행</p>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        footer
    </div>
<script>
    $(document).ready(function() {
        var banner = $('.banner');
        var prev = $('.prev');
        var next = $('.next');

        var slideWidth = 860;
        var currentIndex = 0;

        function moveToSlide(index) {
            banner.animate({ 'left': -index * slideWidth }, 500);
        }

        prev.click(function() {
            if (currentIndex > 0) {
                currentIndex -= 1;
            } else {
                currentIndex = banner.children().length - 1;
            }
            moveToSlide(currentIndex);
        });

        next.click(function() {
            if (currentIndex < banner.children().length - 1) {
                currentIndex += 1;
            } else {
                currentIndex = 0;
            }
            moveToSlide(currentIndex);
        });
    });


</script>
</body>

</html>
