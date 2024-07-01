<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
* {
	font-family: "Noto Sans KR", sans-serif;
	font-family: "Roboto", sans-serif;
	color: #272727;
	word-break: keep-all;
}

.form-control {
	border: 1.5px solid #eee !important;
	border-radius: 8px !important;
	padding: 22px 12px !important;
	color: #b8b8b8;
	box-shadow: none !important;
}

.login-tit {
	font-weight: 600;
	line-height: 1.5 !important;
}

.form-group, .join-btn {
	margin: 16px 0;
}

.container {
	width: 440px;
	height: 700px;
	padding-left: 0px;
	padding-right: 0px;
}

.title {
	text-align: center;
}

.hidden {
    display: none;
}

.error-text {
    color: red;
}

.label-and-error {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

#findId {
	width: 100% !important;
	height: 50px;
	font-weight: 700 !important;
	background-color: #272727 !important;
	color: #f9f5f2 !important;
	border: none !important;
	box-shadow: none !important;
	border-radius: 4px;
	padding: 12px 12px;
}

#findId:hover {
	background-color: #f9f5f2 !important;
	color: #272727 !important;
}

@media screen and (max-width: 576px) {
    .container {
        width: 380px;
    }
}

@media screen and (max-width: 400px) {
    .container {
        width: 350px;
    }
}

</style>
</head>
<body>
<div class="container">
    <div class="form-group">
        <div class="label-and-error">
            <label for="u_id" class="login-tit">사용자 아이디</label>
            <span id="error-message" class="error-text hidden">아이디는 5~20자의 영문 소문자, 숫자와<br>특수기호(-,_)만 사용 가능합니다.</span>
        </div>
        <input type="text" class="form-control" id="u_id" name="u_id" placeholder="ex) sandlim" required>
    </div>
    <button id="findId" class="btn btn-primary" >다음</button>
</div>

<script>
function validateId() {
    var userId = document.getElementById("u_id").value;
    var idPattern = /^[a-z0-9_-]{5,20}$/;
    if (!idPattern.test(userId)) {
        document.getElementById("error-message").classList.remove("hidden");
        return false;
    } else {
        document.getElementById("error-message").classList.add("hidden");
        return true;
    }
}

// 유효성 검사를 blur 이벤트에 연결
document.getElementById("u_id").addEventListener("blur", validateId);

document.getElementById("findId").addEventListener("click", function(e) {
    if (validateId()) {
        var user = {
            u_id: document.getElementById("u_id").value
        };
        $.ajax({
            url: 'checkSameId.do',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(user),
            success: function(response) {
                if(!response){
                    findPassword();
                }else {
                    alert('아이디가 존재하지 않습니다.');
                }
            },
            error: function() {
                alert('아이디 찾기를 실패했습니다.');
            }
        });
    }
});

function findPassword() {
	var u_id = document.getElementById("u_id").value; // u_id 값을 가져옵니다.
	
    $.ajax({
        url: 'findPw.do',
        type: 'GET',
        data: { u_id: u_id },
        success: function(resp) {
            $('.content').html(resp);
        },
        error: function() {
            alert('비밀번호 찾기 페이지 로드에 실패했습니다.');
        }
    });
}

</script>
</body>
</html>