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
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        .wrap {
            margin: 0 auto;
            width: 800px;
        }

        input[type=text] {
            border: none;
            border-bottom: 1px solid grey;
            margin-bottom: 15px;
            width: 700px;
            height: 50px;
            font-size: 24px;
        }

        input[type=text]:focus {
            outline: none;
        }

        #editor {
            margin-bottom: 20px;
        }

        button {
            width: 150px;
            height: 50px;
            float: right;
            border: none;
            background-color: skyblue;
            border-radius: 7px;
            color: white;
            font-size: 20px;
        }

        input[type=submit] {
            display: none;
        }

    </style>
</head>
<body>
<%@include file="header.jsp" %>
<div class="wrap">
    <form action="regBoard.do" method="post" name="frm">
        <input type="hidden" id="id" value="${sessionScope.logId }" name="id">
        <input type="hidden" id="boardNumber" name="boardNumber">
        <input type="text" name="boardTitle" placeholder="제목을 입력해 주세요">
        <div id="editor"></div>
        <input type="hidden" name="boardContents" id="boardContents">
    </form>
    <button id="regBtn">등록하기</button>
</div>

<script>
    const editor = new toastui.Editor({
        el: document.querySelector('#editor'),
        previewStyle: 'vertical',
        height: 'auto',
        viewer: true,
        initialValue: ''

    });


    $('#regBtn').on('click', function () {
        console.log(editor.getHTML());
        document.getElementById('boardNumber').value = parseInt(new Date().getTime(), 10);
        document.getElementById('boardContents').value = editor.getHTML();
        document.frm.submit();
    });


</script>

</body>
</html>
