<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ include file="../css/header.jsp"%>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>


.form-control {
	border: 1.5px solid #eee !important;
	border-radius: 8px !important;
	padding: 22px 12px !important;
	color: #b8b8b8;
	box-shadow: none !important;
}

.container {
	width: 440px;
	height: 700px;
	margin: auto;
}

.title {
	text-align: center;
}

#text {
	text-align: center;
	margin: 0;
}

.form-group, .join-btn {
	margin: 16px 0
}

.login-tit {
	font-weight: 600;
}

#updateBtn {
	width: 100% !important;
	font-weight: 700 !important;
	background-color: #272727 !important;
	color: #f9f5f2 !important;
	border: none !important;
	box-shadow: none !important;
	border-radius: 4px;
	padding: 12px;
	display: none;
}

#btn {
	width: 100% !important;
	font-weight: 700 !important;
	background-color: #272727 !important;
	color: #f9f5f2 !important;
	border: none !important;
	box-shadow: none !important;
	border-radius: 4px;
	padding: 12px;
}

#updateBtn:hover, #btn:hover {
	background-color: #f9f5f2 !important;
	color: #272727 !important;
}

#gobackBtn {
	width: 100% !important;
	font-weight: 700 !important;
	background-color: #f9f5f2 !important;
	color: #272727 !important;
	border: none !important;
	box-shadow: none !important;
	border-radius: 4px;
	padding: 12px;
}

#gobackBtn:hover {
	background-color: #272727 !important;
	color: #f9f5f2 !important;
}

#warningSamePw{
	display: none;
	color: red;
	text-align: center;
}

.heightControl {
	margin-top: 35%;
}

/* 반응형 */
@media screen and (max-width: 1140px) {
}

@media screen and (max-width: 992px) {
}

@media screen and (max-width: 768px) {
}

/* 반응형 */
@media screen and (max-width: 1140px) {
}

@media screen and (max-width: 992px) {
}

@media screen and (max-width: 768px) {
}

@media screen and (max-width: 576px) {
        .container {
                width: 400px;
        max-width: 100%;
        }
}

@media screen and (max-width: 400px) and (min-width: 375px) {
        .container {
                max-width: 100%;
                width: 100%;
                padding: 15px;
                margin: 0 auto;
                word-break: keep-all;
        }
}
</style>
<script>
	window.onload = function() {
		if (getOutResult() > 0) {
			noBack();
		}
	};

	window.onpageshow = function(event) {
		if (getOutResult() > 0) {
			if (event.persisted) {
				noBack();
			}
		}
	};

	function noBack() {
		window.history.forward();
	}

	function getOutResult() {
		return 1; // 예시로 항상 1을 반환합니다.
	}
</script>
<body>
	<div class="container">
		<div class="heightControl">
			<div class="top">
				<h2 class="title">비밀번호 확인</h2>
				<p id="text">고객님의 소중한 개인정보 보호를 위해</p>
				<p id="text">비밀번호를 다시 한번 입력해 주세요.</p>
			</div>

			<form action="updateUserForm.do" method="post">
				<div class="content">
					<div class="form-group">
						<label for="pwd" class="login-tit">현재 비밀번호</label> <input
							type="hidden" class="form-control" id="u_id" name="u_id"
							value="${userId}"> <input type="password"
							class="form-control" onkeydown="preventFormSubmit(event)"
							id="u_pw" name="u_pw" placeholder="비밀번호를 입력해 주세요." required>
					</div>
					<div id="warningSamePw">
						비밀번호가 일치하지 않습니다.<br> <br>
					</div>
					
					<button type="button" onclick="validateSamePw()" id="btn">비밀번호
						확인</button>
					<br>
					<button type="button" id="updateBtn">정보수정</button>
					<br>
					<button type="button" id="gobackBtn"
						onclick="javascript:location.href='selUser.do';">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
	<%@include file="../css/footer.jsp"%>
	<script>
		function preventFormSubmit(event) {
			// 엔터 키일 때 기본 동작(폼 제출)을 막음
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		}

		var validateSamePwCheck = false;
		function validateSamePw() {
			var userId = document.getElementById("u_id").value;
			var userPw = document.getElementById("u_pw").value;
			$
					.ajax({
						url : "checkSamePw.do",
						type : "post",
						data : JSON.stringify({
							u_id : userId,
							u_pw : userPw
						}),
						contentType : 'application/json; charset=utf-8',
						cache : false,
						success : function(data) {
							console.log("data: ", data);
							if (data) {
								console.log("data 성공: ", data);
								hideWarning("warningSamePw");
								
								//	document.getElementById("updateBtn").style.display = "block"; // 수정 버튼을 보이게 합니다.
								//	document.getElementById("btn").style.display = "none"; // 비밀번호 확인 버튼을 숨깁니다.
								alert('확인되었습니다.'); // 알림창 표시
								window.location.href = 'updateUserForm.do'; // 페이지 이동

							} else {
								console.log("data 실패: ", data);
								
								showWarning("warningSamePw");
								document.getElementById("updateBtn").style.display = "none"; // 수정 버튼을 숨깁니다.
							}
						},
						error : function() {
							alert('비밀번호 확인 중 오류가 발생했습니다.');
						}
					});
		}
		function hideWarning(id) {
			document.getElementById(id).style.display = "none";
		}

		function showWarning(id) {
			document.getElementById(id).style.display = "block";
		}
	</script>
</body>
</html>