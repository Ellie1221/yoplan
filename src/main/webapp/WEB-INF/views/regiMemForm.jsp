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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Yo! Plan</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .required::after {
            content: " *";
            color: red;
        }

        #regiMemBox input {
            width: 280px;
            height: 30px;
            border: none;
        }

        #regiMemBox input[type='checkbox'] {
            width: 20px;
            height: 20px;
            margin-right: 10px;
            position: relative;
            top: 5px;

        }

        #regiMemBox input:focus {
            outline: none;
        }

        #regiMemBox input[type='text'] {
            padding: 10px;
            border-bottom: 1px solid black;
        }

        #regiMemBox input[type='password'] {
            padding: 10px;
            border-bottom: 1px solid black;
        }

        #idCheck, #nickCheck, #pwCondition, #telCondition {
            color: gray;
            font-size: smaller;
            margin-top: 5px;
        }

        #regiMemContent {
            display: flex;
            min-height: 500px;
            width: 1000px;
            margin-bottom: 20px;
            justify-content: center;

        }

        .regiSection {
            display: inline-block;
            height: 500px;
            padding: 30px;
            margin: 0 40px;
        }

        #profileZone {
            float: left;
            display: flex;
            flex-wrap: wrap;
            flex-direction: column; /*수직 정렬*/
            align-items: center;
            justify-content: center;
        }

        #profilePreView {
            background-color: pink;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin: 20px;
            position: relative;
            bottom: 50px;
        }

        input[type='file'] {
            position: relative;
            left: 55px;

        }

    </style>
</head>

<body>
<%@include file="header.jsp" %>
<div class="subTitle">회원정보</div>
<div class="content" id="regiMemContent">
    <form action="" method="post" id="regiMemBox">
        <div class="regiSection" id="profileZone">
            <div id="profilePreView"></div>
            <input type="file" enctype="multipart/form-data"/>

        </div>
        <div class="regiSection">
            <span class="required">아이디</span><br>
            <input type="text" name="id" id="id" style="text-transform: lowercase;" spellcheck="false"/>
            <div id="idCheck">아이디를 입력해주세요</div>
            <br>

            <span class="required">닉네임</span><br>
            <input type="text" name="nickname" id="nickname" spellcheck="false"/><br>
            <div id="nickCheck">닉네임을 입력해주세요</div>
            <br>

            <span class="required">비밀번호</span><br>
            <input type="password" name="pw" id="pw"/><br>
            <div id="pwCondition">
                <p>* 영문, 숫자, 특수기호를 포함한 8~16자리</p>
                <p> &nbsp;&nbsp;&nbsp;&nbsp;- 8자이상 </p>
                <p> &nbsp;&nbsp;&nbsp;&nbsp;- 영문 1개 이상</p>
                <p> &nbsp;&nbsp;&nbsp;&nbsp;- 숫자 1개 이상</p>
                <p> &nbsp;&nbsp;&nbsp;&nbsp;- 특수문자 1개 이상</p>
            </div>
            <br>

            <span class="required">비밀번호확인</span><br>
            <input type="password" name="pwCheck" id="pwCheck"/>
            <br><br>
            <span class="required">연락처</span><br>
            <input type="text" name="tel" id="tel"/>
            <div id="telCondition">
                <p>* "-"를 제외한 숫자를 입력해주세요</p>
            </div>
            <br>
            <span class="required"><input type="checkbox" name="agree" id="agree"><label
                    for="agree">개인정보 이용약관에 동의합니다</label></span><br>

        </div>
    </form>
</div>

<script>
    $("#id").keyup(function (evt) {
        //점검 해야할 것 : 공백 / 한글 / 특수문자 / 대문자
        let inputVal = $(this).val();
        let check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        let regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
        if (evt.keyCode === 32) {
            $(this).val("");
            $(this).focus();
            $("#idCheck").text("아이디를 다시 입력해주세요 [공백입력불가]").css("color", "red");
            return false;
        } else if (check.test(inputVal)) {
            $(this).val("");
            $(this).focus();
            $("#idCheck").text("아이디를 다시 입력해주세요 [한글입력불가]").css("color", "red");
            return false;
        } else if (regExp.test(inputVal)) {
            $("#id").val("");
            $("#idCheck").text("아이디를 다시 입력해주세요 [특수기호 입력불가]").css("color", "red");
            return false;
        } else if (inputVal === "") {
            $("#idCheck").text("아이디를 입력해주세요").css("color", "red");
            return false;
        } else {
            //아이디 점검
            $.ajax({
                url: "/identification/id/" + $("#id").val(),
                method: "get",
                success: function (data) {
                    if (data === 1) {
                        $("#idCheck").text("사용불가능한 아이디입니다").css("color", "red");
                    } else {
                        $("#idCheck").text("사용가능한 아이디입니다").css("color", "green");
                    }
                },
                error: function () {
                    alert("error!")
                }
            });
        }
    });


    //수정중
    $("#tel").keyup(function (evt) {
        alert(evt.keyCode);
        if (!(95<evt.keyCode<106) &&!(47<evt.keyCode<58)) {
            alert("오류나야해...");
            $("#tel").val($(this).val().slice(0, -1));
            $("#telCondition").text("숫자만 입력가능합니다").css("color", "red");
            return false;
        } else if ($("#tel").val() === "") {
            $("#telCondition").text("연락처를 입력해주세요").css("color", "red");
            return false;
        } else if ($("#tel").val().length > 11) {
            $("#tel").val($(this).val().slice(0, -1));
            $("#telCondition").text("");
            return false;
        }
    });


    $("#nickname").keyup(function (evt) {
        let inputVal = $(this).val();
        let regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
        if (evt.keyCode === 32) {
            $(this).val("");
            $(this).focus();
            $("#nickCheck").text("닉네임을 다시 입력해주세요 [공백입력불가]").css("color", "red");
            return false;
        } else if (regExp.test(inputVal)) {
            $(this).val("");
            $(this).focus();
            $("#nickCheck").text("닉네임을 다시 입력해주세요 [특수기호 입력불가]").css("color", "red");
            return false;
        } else if (inputVal === "") {
            $("#nickCheck").text("닉네임을 입력해주세요").css("color", "red");
            return false;
        } else {

            $.ajax({
                url: "/nickname/nickname/" + $("#nickname").val(),
                method: "get",
                success: function (data) {
                    if (data === 1) {
                        $("#nickCheck").text("사용불가능한 닉네임입니다").css("color", "red");
                    } else {
                        $("#nickCheck").text("사용가능한 닉네임입니다").css("color", "green");
                    }
                },
                error: function () {
                    alert("error!")
                }
            });
        }
    });
</script>

</body>

</html>
