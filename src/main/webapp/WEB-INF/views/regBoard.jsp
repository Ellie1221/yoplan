
<%--
  Created by IntelliJ IDEA.
  User: beomsu
  Date: 2023/04/06
  Time: 1:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <!-- TOAST UI Editor CDN(JS) -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <!-- TOAST UI Editor CDN(CSS) -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .wrap{
            margin: 0 auto;
            width: 800px;
        }
        input[type=text]{
            border: none;
            border-bottom: 1px solid grey;
            margin-bottom: 15px;
            width: 700px;
            height: 50px;
            font-size: 24px;
        }
        input[type=text]:focus{
            outline: none;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div class="wrap">
    <input type="text" name="title" placeholder="제목을 입력해 주세요">
    <div id="editor"></div>
</div>

<script>
    const editor = new toastui.Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        height: '500px',
        viewer: true,
        initialValue: ''
    });
</script>

</body>
</html>
