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
    <link href="/css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .content {
            height: 630px;
        }

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

        #regiMemBox input[type='number'] {
            padding: 10px;
            border-bottom: 1px solid black;
        }

        /* Chrome, Safari, Edge, Opera */
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type="number"] {
            -moz-appearance: textfield;
        }

        #regiMemBox input[type='password'] {
            padding: 10px;
            border-bottom: 1px solid black;
        }

        #regiMemBox input[type='email'] {
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

        #profileZone{
            float: left;
            display: flex;
            flex-wrap: wrap;
            flex-direction: column; /*수직 정렬*/
            justify-content: center;
        }


        #profilePreView {
            background-color: #EEEEEE;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin: 20px 40px;
            position: relative;
            bottom: 10px;
        }

        #profileImg {
            width: 200px;
            height: 200px;
            border-radius: 50%;
        }

        #sendEmailBtn, input[type='submit'] {
            background-color: #FEC9DA;
            border-radius: 7px;
            box-shadow: 2px 2px 2px lightgray;
        }
        #sendEmailBtn{
        }
        #regiMemBox input[type='submit'] {
            font-size: 25px;
            height: 40px;
            box-shadow: 2px 2px 2px lightgray;
        }

        .subTitle img {
            width: 200px;
            margin: 5px;
        }
    </style>
</head>

<body>
<div class="subTitle" id="logo1"><a href="/"><img src="/images/logo.png"></a></div>
<div class="content" id="regiMemContent">
    <form action="/newMember" method="post" id="regiMemBox" enctype="multipart/form-data">
        <div class="regiSection" id="profileZone">
            <div id="profilePreView"></div>
            <input type="file" name="profile" id="profile"  accept="images/*"
                   onchange="setThumbnail(event)"/><br>

            <span class="required" id="inputName">이름</span>
            <input type="text" name="name" id="name" /><br>

            <span class="required" id="inputEmail">이메일인증</span><br>
            <div><input type="email" name="email" id="email" placeholder="예) yoplan@naver.com" style="width: 200px;"/>
            <input type="button" value="보내기" id="sendEmailBtn" style="width: 60px; float: right"></div>
            <br>
            <input type="text" name="certiNumber" id="certiNumber" placeholder="이메일 인증코드입력"/><br>
            <div id="certiCheck"></div>

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
            <input type="text" name="pw" id="pw"/><br>
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
            <br>
            <div id="pwCheckCondition">

            </div>
            <br>
            <span class="required">연락처</span><br>
            <input type="number" name="tel" id="tel"/>
            <div id="telCondition">
                <p>* "-"를 제외한 숫자를 입력해주세요</p>
            </div>
            <br>
            <span class="required"><input type="checkbox" name="agree" id="agree">
                <label for="agree">개인정보 이용약관에 동의합니다</label>
            </span><br><br><br>
        </div>
        <div style="text-align: center"><input type="submit" value="회원가입" id="regiMemBtn"
                                               onclick="return doubleCheck();"></div>
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
    $("#tel").keyup(function (event) {
        if (47 < event.keyCode < 58 || 95 < event.keyCode < 106) {
            if ($("#tel").val().length > 11) {
                let telValue = $("#tel").val();
                $("#tel").val(telValue.slice(0, telValue.length - 1));
                return false;
            } else {
                return true;
            }

        } else {
            $("#telCondition").text("숫자만 입력가능합니다").css("color", "red");
            return false;
        }
    });


    function isNumeric(input) {
        return !isNaN(parseFloat(input)) && isFinite(input);
    }

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

    function setThumbnail(event) {
        let reader = new FileReader();
        reader.onload = function (event) {
            let img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("id", "profileImg");
            $("#profilePreView").html(img);
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    function convertToEnglish(str) {
        const koToEngMap = {
            'ㅂ': 'q', 'ㅈ': 'w', 'ㄷ': 'e', 'ㄱ': 'r', 'ㅅ': 't',
            'ㅛ': 'y', 'ㅕ': 'u', 'ㅑ': 'i', 'ㅐ': 'o', 'ㅔ': 'p',
            'ㅁ': 'a', 'ㄴ': 's', 'ㅇ': 'd', 'ㄹ': 'f', 'ㅎ': 'g',
            'ㅗ': 'h', 'ㅓ': 'j', 'ㅏ': 'k', 'ㅣ': 'l', 'ㅋ': 'z',
            'ㅌ': 'x', 'ㅊ': 'c', 'ㅍ': 'v', 'ㅠ': 'b', 'ㅜ': 'n',
            'ㅡ': 'm'
        };

        const convertedStr = str.replace(/[ㄱ-ㅎㅏ-ㅣ]/g, function (match) {
            return koToEngMap[match] || match;
        });

        return convertedStr;
    }


    $("#pw").keyup(function (evt) {

        let inputVal = $("#pw").val();
        let check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
        let regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
        if (evt.keyCode === 32) {
            $(this).val("");
            $(this).focus();
            return false;
        } else if (check.test(inputVal)) {
            $('#pw').val(convertToEnglish(inputVal));
            return false;
        }

        //8자 이상인지 확인
        if (inputVal.length > 7) {
            $("#pwCondition p:nth-of-type(2)").css("color", "green");
        } else {
            $("#pwCondition p:nth-of-type(2)").css("color", "gray");
        }
        //영문을 포함하는지 확인
        if (containsLetters(inputVal)) {
            $("#pwCondition p:nth-of-type(3)").css("color", "green");
        } else {
            $("#pwCondition p:nth-of-type(3)").css("color", "gray");
        }
        //숫자를 포함하는지 확인
        if (containsNumbers(inputVal)) {
            $("#pwCondition p:nth-of-type(4)").css("color", "green");
        } else {
            $("#pwCondition p:nth-of-type(4)").css("color", "gray");
        }
        //특수문자를 포함하는지 확인
        if (containsSpecialChars(inputVal)) {
            $("#pwCondition p:nth-of-type(5)").css("color", "green");
        } else {
            $("#pwCondition p:nth-of-type(5)").css("color", "gray");
        }


    });

    function containsLetters(str) {
        var regex = /[a-zA-Z]/;
        return regex.test(str);
    }

    function containsNumbers(str) {
        var regex = /\d/;
        return regex.test(str);
    }

    function containsSpecialChars(str) {
        var regex = /[!@#$%^&*(),.?":{}|<>]/;
        return regex.test(str);
    }


    //비밀번호 확인
    $("#pwCheck").keyup(function (evt) {
        if ($(this).val() === $("#pw").val()) {
            $("#pwCheckCondition").text("일치").css("color", "green");
        } else {
            $("#pwCheckCondition").text("불일치").css("color", "red");
        }
    });

    //이메일 인증
    $("#sendEmailBtn").click(function () {
        let email = $("#email").val();
        if (email === "") {
            alert("email을 입력해주세요");
            return false;
        } else {
            $.ajax({
                url: "/emailConfirm/email/" + email,
                method: "post",
                success: function (data) {
                    $("#sendEmailBtn").val("발송완료").css("background-color", "#D8D8D8")
                    certiCheck(data);
                },
                error: function () {
                    alert("error!");
                }

            });
        }
    });

    function certiCheck(data) {
        $("#certiNumber").keyup(function () {
            if ($("#certiNumber").val() === data) {
                $("#sendEmailBtn").val("일치").css("background-color", "green");
            } else {
                $("#sendEmailBtn").val("불일치").css("background-color", "red");
            }
        });
    }

    //전체 유효성 검사
    function doubleCheck() {
        if ($("#name").val() === "") {
            alert("이름을 입력하세요");
            return false;
        }else if ($("#sendEmailBtn").val() !== "일치") {
            alert("이메일 인증이 필요합니다");
            return false;
        } else if ($("#idCheck").text() !== "사용가능한 아이디입니다") {
            alert("아이디를 다시 입력해주세요");
            return false;
        } else if ($("#nickCheck").text() !== "사용가능한 닉네임입니다") {
            alert("닉네임을 다시 입력해주세요");
            return false;
        } else if (document.querySelector("#pwCondition p:nth-of-type(2)").style.color!=='green') {
            alert("비밀번호를 다시 입력해주세요");
            return false;
        } else if (document.querySelector("#pwCondition p:nth-of-type(3)").style.color!=='green') {
            alert("비밀번호를 다시 입력해주세요");
            return false;
        } else if (document.querySelector("#pwCondition p:nth-of-type(4)").style.color!=='green') {
            alert("비밀번호를 다시 입력해주세요");
            return false;
        } else if (document.querySelector("#pwCondition p:nth-of-type(5)").style.color!=='green') {
            alert("비밀번호를 다시 입력해주세요");
            return false;
        } else if (document.querySelector("#pwCheckCondition").style.color!== 'green') {
            alert("비밀번호를 다시 한번 입력해주세요");
            return false;
        } else if ($("#tel").val() === "" || $("#tel").val().length !== 11) {
            alert("연락처를 다시 입력해주세요");
            return false;
        } else if ($('#agree').is(":checked") === false) {
            alert("개인정보 이용약관에 동의가 필요합니다.");
            return false;
        } else {
            return true;
        }
    }

</script>

</body>

</html>
