<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../css/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산들림</title>
<style>
/* * { */
/* 	font-family: "Noto Sans KR", sans-serif; */
/* 	font-family: "Roboto", sans-serif; */
/* 	color: #272727; */
/* } */

.small-title {
	margin-top: 30px;
    font-size: 1.5rem;   /* 원하는 크기를 지정 */
    text-align: center;
    font-weight: bold;
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
	line-height: 3;
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

#btn {
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

#btn:hover {
	background-color: #f9f5f2 !important;
	color: #272727 !important;
}
</style>
</head>
<body>
<div class="container">
	<h6 class="small-title">산들림에서 사용할 닉네임을<br>입력해주세요.</h6>
	<br>
	<form action="/insertUser.do" method="post" onsubmit="return validateForm();">
		<input type="hidden" name="u_id" value="${user.u_id}">
		<input type="hidden" name="u_pw" value="${user.u_pw}">
		<input type="hidden" name="u_name" value="${user.u_name}">
		<input type="hidden" name="u_phno" value="${user.u_phno}">
		<input type="hidden" name="u_birth" value="${user.u_birth}">
		<input type="hidden" name="u_email" value="${user.u_email}">
		<input type="hidden" name="u_social" value="${user.u_social}">
		
		<div class="form-group">
		    <div class="label-and-error">
		        <label for="u_nick" class="login-tit">사용자 닉네임:</label>
		        <span id="warningNick" class="error-text hidden">닉네임은 1글자 이상 10글자 미만의<br>한글, 영문, 숫자로 가능합니다.</span>
		    </div>
		    <input type="text" class="form-control" id="u_nick" name="u_nick" placeholder="ex) 산들림fan" required>
		</div>
		<button type="submit" id="btn">회원가입</button>
	</form>
</div>
</body>
<script>
document.getElementById("u_nick").addEventListener("blur", validateNick);

function validateForm() {
    var isValid = true;
    isValid = isValid && validateNick();
    // 다른 필드에 대한 유효성 검사를 여기에 추가할 수 있습니다.
    return isValid;
}


function validateNick() {
	var userNick = document.getElementById("u_nick").value;
	var nickPattern = /^[가-힣a-zA-Z0-9_]{1,10}$/;
	if (!nickPattern.test(userNick)) {
		document.getElementById("warningNick").style.display = "block";
		return false;
	} else {
        document.getElementById("warningNick").style.display = "none";
        return true;
    }
}


</script>
</html>