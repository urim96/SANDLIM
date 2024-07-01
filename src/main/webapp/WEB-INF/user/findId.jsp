<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
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
	margin-bottom: 0;
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

#btn2 {
	width: 100% !important;
	height: 50px;
	font-weight: 700 !important;
	background-color: #f9f5f2 !important;
	color: #272727 !important;
	border: none !important;
	box-shadow: none !important;
	border-radius: 4px;
	padding: 12px 12px;
}

#btn2:hover {
	background-color: #272727 !important;
	color: #f9f5f2 !important;
}

#btn:hover {
	background-color: #f9f5f2 !important;
	color: #272727 !important;
}

.verification-section {
    display: flex;
    align-items: center; /* vertically align items */
}

#timer {
    margin-left: 10px; /* Add some space between the label and timer */
    line-height: 1;
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
		        <label for="u_name" class="login-tit">사용자 이름</label>
		        <span id="warningName" class="error-text hidden">올바른 이름을 입력하세요.</span>
		    </div>
		    <input type="text" class="form-control" id="u_name" name="u_name" placeholder="ex) 김산들" required>
		</div>
		
		<div class="form-group">
		    <div class="label-and-error">
		        <label for="u_email" class="login-tit">사용자 이메일</label>
		        <span id="warningEmail" class="error-text hidden">이메일을 올바른 형식으로 작성해주세요.</span>
		    </div>
		    <div class="input-group mb-3">
		        <input type="email" class="form-control" id="u_email" name="u_email" placeholder="ex) example@domain.com" required>
		        <button type="button" id="btn" class="btn btn-outline-secondary" onclick="event.preventDefault(); requestEmailVerification();">이메일 인증</button>
		    </div>
		</div>
		
		<div class="verification-section">
			<label for="verification_code" class="login-tit">인증 코드</label>
			<div id="timer"></div>
		</div>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="verification_code" name="verification_code" placeholder="인증코드 입력 (인증완료시 다음페이지로 넘어갑니다)">
			<button type="button" id="btn2" class="btn btn-outline-secondary" onclick="verifyCode()">인증 확인</button>
		</div>
		
	    
</div>



<script>
	var verCode = null;
	var timeoutId;
	var countdownId;
	var remainingTime;
	var chkEmail = false;
	
	document.getElementById("u_name").addEventListener("blur", validateName);
	document.getElementById("u_email").addEventListener("blur", validateEmail);
	
	function validateForm() {
        var isValid = true;
        isValid = isValid && validateName();
        isValid = isValid && validateEmail();
        // 다른 필드에 대한 유효성 검사를 여기에 추가할 수 있습니다.
        return isValid;
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
	
	function resetRemTime(){
		remainingTime = 300;
	}
	
	function requestEmailVerification() {
		
		let btnEmail = document.getElementById('btn');
		
		btnEmail.disabled = true;
		
		if (!validateForm()){
	    	alert('올바른 이름, 이메일을 입력해주세요');
	    	btnEmail.disabled = false;
	    	return;
	    }
	    // 이전 요청이 있다면 취소
	    if(timeoutId) clearTimeout(timeoutId);
	    if(countdownId) clearInterval(countdownId);

	    var email = document.getElementById('u_email').value;

	    // 이메일 필드가 비어있는지 확인
	    if (email === '') {
	        alert('이메일을 입력해주세요.');
	        btnEmail.disabled = false;
	    } else {
	        // 서버에 이메일 인증 코드 요청
	        btnEmail.innerText = "이메일 발송중...";
	        $.ajax({
	            url : "EmailVerification.do",
	            type : "post",
	            data : JSON.stringify({u_email : email}),
	            contentType : 'application/json; charset=utf-8',
	            cache : false,
	            success : function(data) {
	                alert('인증 코드를 발송했습니다. 이메일을 확인해주세요.');
	                resetRemTime();
	                verCode = data;
	                document.getElementById('timer').textContent = "5:00";
	                // 인증 코드 요청이 성공했을 때 시간제한 설정
	                startTimer();
	                btnEmail.disabled = false;
	                btnEmail.innerText = "이메일 인증";
	            },
	            error : function() {
	                alert('인증 코드 발송에 실패했습니다.');
	                btnEmail.disabled = false;
	                btnEmail.innerText = "이메일 인증";
	            }
	        });
	    }
	}
	
	function verifyCode() {
	    if (!verCode) {
	        alert('인증 코드를 먼저 요청해주세요.');
	        return;
	    }
	
	    var code = verCode;
	    var userCode = document.getElementById('verification_code').value;
	
	    // 서버에 이메일 인증 요청
	    $.ajax({
	        url : "verifyCode.do",
	        type : "post",
	        data : JSON.stringify({ emailCode : code, inputCode :  userCode}),
	        contentType : 'application/json; charset=utf-8',
	        success : function(data) {
	            if(data) {
	                alert('인증에 성공했습니다.');
	                clearTimeout(timeoutId); // 시간제한 해제
	                clearInterval(countdownId); // 타이머 해제
	                document.getElementById('timer').textContent = "";
	                chkEmail = true;
	                requestUserId();
	            } else {
	                alert('입력하신 인증 코드가 일치하지 않습니다.');
	            }
	        },
	        error : function(xhr, status, error) {
	            alert('인증에 실패했습니다: ' + error);
	        }
	    });
	}

    
    function startTimer() {
        // 인증 코드가 만료되면 실행될 콜백 함수
        var onTimeout = function() {
            verCode = null;
            alert('인증 시간이 만료되었습니다.');
        };

        // 인증 코드 요청 후 5분 후에 onTimeout 실행
        timeoutId = setTimeout(onTimeout, 5 * 60 * 1000);

        // 매 초마다 타이머 업데이트
        countdownId = setInterval(function() {
        	remainingTime--;
            var minutes = Math.floor(remainingTime / 60);
            var seconds = remainingTime % 60;
            document.getElementById('timer').textContent = minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
            if (remainingTime <= 0) {
                clearInterval(countdownId);
                resetRemTime();
            }
        }, 1000);
    }
    
    
    // 유저아이디 반환
    function requestUserId() {

    if(chkEmail){
        var userName = document.getElementById('u_name').value;
        var userEmail = document.getElementById('u_email').value;
        // 서버에 아이디 요청
        $.ajax({
            url : "FindIdOutput.do",
            type : "post",
            data : JSON.stringify({u_name : userName, u_email : userEmail}),
            contentType : 'application/json; charset=utf-8',
            cache : false,
            success : function(data) {
                console.log("userName: "+userName);  // userName 값 확인
                console.log("data: "+data);
                if(userName == "" || data == ""){
                    alert('이름을 확인해주세요');
                }else{

                    if(data === "kakao"){
                        msg = '해당 이메일은 카카오 소셜계정 입니다.<br>소셜계정으로 로그인해주세요';
                    }else if(data === "naver"){
                        msg = '해당 이메일은 네이버 소셜계정 입니다.<br>소셜계정으로 로그인해주세요';
                    }else {
                        var maskedId = data.substring(0, 3) + data.substring(3).replace(/./g, '*');
                        msg = '아이디는 ' + maskedId + ' 입니다.'
                    }

                    // 결과창으로 던져주는 ajax
                    $.ajax({
                        url: 'findIdResult.do',
                        type: 'POST',
                        data: { msg },
                        success: function(response) {
                            $('.content').html(response);
                        }
                    });
                } // This is where the closing brace is added
            },
            error : function() {
                alert('아이디 찾기에 실패했습니다.');
            }
        });
    }else {
        alert('이메일 인증을 먼저 진행해주세요');
    }

}
    
</script>
</body>
</html>