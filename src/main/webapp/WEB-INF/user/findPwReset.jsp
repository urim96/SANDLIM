<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<style>
* {
    word-break: keep-all;
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

.container {
	width: 440px;
	height: 700px;
	padding-left: 0px;
	padding-right: 0px;
}

#changePw {
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
		<input type="hidden" id="u_id" value="${u_id}">
	    <div class="label-and-error">
	        <label for="u_pw" class="login-tit">새 비밀번호</label>
	        <span id="warningPw1" class="error-text hidden">8~16자의 영문 대/소문자, 숫자,<br>특수문자를 사용해주세요.</span>
	    </div>
	    <input type="password" class="form-control" id="u_pw" name="u_pw" required>
	</div>
	
	<div class="form-group">
	    <div class="label-and-error">
	        <label for="u_pw2" class="login-tit">새 비밀번호 확인</label>
	        <span id="warningPw2" class="error-text hidden">비밀번호가 일치하지 않습니다.</span>
	    </div>
	    <input type="password" class="form-control" id="u_pw2" name="u_pw2" required>
	</div>

	<button id="changePw" class="btn btn-primary">변경</button>
	
</div>


<script>
document.getElementById("u_pw").addEventListener("blur", validatePassword);
document.getElementById("u_pw2").addEventListener("blur", validatePasswordMatch);

function validateForm() {
    var isValid = true;
    isValid = isValid && validatePassword();
    isValid = isValid && validatePasswordMatch();
    // 다른 필드에 대한 유효성 검사를 여기에 추가할 수 있습니다.
    return isValid;
}


function validatePassword() {
    var userPw = document.getElementById("u_pw").value;
    var pwdPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\^\w]).{8,16}$/;
    if (!pwdPattern.test(userPw)) {
        document.getElementById("warningPw1").style.display = "block";
        return false;
    } else {
        document.getElementById("warningPw1").style.display = "none";
        return true;
    }
}

function validatePasswordMatch() {
    var pw = document.getElementById("u_pw").value;
    var pw2 = document.getElementById("u_pw2").value;
    if (pw !== pw2) {
        document.getElementById("warningPw2").style.display = "block";
        return false;
    } else {
        document.getElementById("warningPw2").style.display = "none";
        return true;
    }
}

document.getElementById("changePw").addEventListener("click", function(e) {
	if (!validateForm()){
    	alert('새 비밀번호, 새 비밀번호 확인을 입력해주세요.');
    	return;
    }
    $.ajax({
        url: 'resetPw.do',
        type: 'POST',
        data: {
            'u_id': document.getElementById("u_id").value,
            'u_pw': document.getElementById("u_pw").value
        },
        success: function(response) {
            if(response) {
                alert('비밀번호가 성공적으로 변경되었습니다.');
                location.href = 'login.do';
            } else {
                alert('비밀번호 변경에 실패했습니다.');
            }
        },
        error: function() {
            alert('서버 요청에 실패했습니다.');
        }
    });
});
</script>
</body>
</html>