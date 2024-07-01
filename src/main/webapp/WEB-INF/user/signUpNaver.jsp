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
	<h6 class="small-title">필수 입력정보을 입력해주세요.</h6>
	<br>
	<form action="/insertUser.do" method="post" onsubmit="return validateForm();">
	
		<input type="hidden" name="u_id" value="${user.u_id}">
		<input type="hidden" name="u_pw" value="${user.u_pw}">
		<input type="hidden" name="u_phno" value="${user.u_phno}">
		<input type="hidden" name="u_birth" value="${user.u_birth}">
		<input type="hidden" name="u_social" value="${user.u_social}">
	
		<div class="form-group">
		    <div class="label-and-error">
		        <label for="u_name" class="login-tit">사용자 이름:</label>
		        <span id="warningName" class="error-text hidden">올바른 이름을 입력해주세요.</span>
		    </div>
		    <input type="text" class="form-control" id="u_name" name="u_name" placeholder="ex) 김산들" required>
		</div>
		
		<div class="form-group">
		    <div class="label-and-error">
		        <label for="u_nick" class="login-tit">사용자 닉네임:</label>
		        <span id="warningNick" class="error-text hidden">닉네임은 1글자 이상 10글자 미만의<br>한글, 영문, 숫자로 가능합니다.</span>
		    </div>
		    <input type="text" class="form-control" id="u_nick" name="u_nick" placeholder="ex) 산들림팬" required>
		</div>
		
		<div class="form-group">
		    <div class="label-and-error">
		        <label for="u_email" class="login-tit">사용자 이메일:</label>
		        <span id="warningEmail" class="error-text hidden">이메일을 올바른 형식으로 작성해주세요.</span>
		        <span id="warningSameEmail" class="error-text hidden">이미 등록된 이메일입니다.</span>
		    </div>
		    <input type="text" class="form-control" id="u_email" name="u_email" placeholder="ex) sandlim@gmail.com" required>
		</div>
		<br>
		<button type="submit" id="btn">회원가입</button>
	</form>
</div>
</body>
<script>
var validateSameEmailCheck;

document.getElementById("u_nick").addEventListener("blur", validateNick);
document.getElementById("u_name").addEventListener("blur", validateName);
document.getElementById("u_email").addEventListener("blur", validateEmail);
document.getElementById("u_email").addEventListener("blur", validateSameEmail);

function validateForm() {
    var isValid = true;
    isValid = isValid && validateNick();
    isValid = isValid && validateName();
    isValid = isValid && validateEmail();
    isValid = isValid && validateSameEmailCheck;
    
    console.log("isValid: "+isValid);
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

function validateName() {
	var userName = document.getElementById("u_name").value;
	var namePattern = /^[a-zA-Z가-힣\s'-]{1,50}$/;
	if (!namePattern.test(userName)) {
		document.getElementById("warningName").style.display = "block";
		return false;
	} else {
        document.getElementById("warningName").style.display = "none";
        return true;
    }
}

function validateEmail() {
	var userEmail = document.getElementById("u_email").value;
	var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	if (!emailPattern.test(userEmail)) {
		document.getElementById("warningEmail").style.display = "block";
		return false;
	} else {
        document.getElementById("warningEmail").style.display = "none";
        return true;
    }
}


function validateSameEmail() {
	var userEmail = document.getElementById("u_email").value;
	$.ajax({
			url : "/checkSameEmail.do",
			type : "post",
			data : JSON.stringify({
				u_email : userEmail
			}),
			contentType : 'application/json; charset=utf-8',
			cache : false,
			success : function(data) {
				if (data) {
					document.getElementById("warningSameEmail").style.display = "none";
					validateSameEmailCheck = true;
				} else {
					document.getElementById("warningSameEmail").style.display = "block";
					validateSameEmailCheck = false;
				}
			},
			error : function() {
				alert('error');
			}
		});

}

</script>
		

</html>

