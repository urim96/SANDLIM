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

#delBtn {
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

#delBtn:hover, #btn:hover {
	background-color: #f9f5f2 !important;
	color: #272727 !important;
}

#warningSamePw, #warningPwcheck {
	display: none;
	color: red;
	text-align: center;
}

#warningPwcheck {
	color: green;
}

.heightControl {
	margin-top: 35%;
}

#modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.1);
	z-index: 9999;
}

#modalBox {
	position: fixed;
	top: 50%;
	left: 50%;
	width: 450px;
	height: 320px;
	border-radius: 5px;
	background-color: #fff;
	transform: translate(-50%, -50%);
	text-align: center;
	justify-content: center;
	align-items: center;
	box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
}

#modalText {
	margin: 25% auto 10% auto;
}

#selectBtn {
	display: flex;
	margin: 30px auto;
	justify-content: center;
	align-items: center;
}

#lastSelectDel {
	background-color: #f9f5f2;
	color: #272727;
	margin-right: 30px;
	width: 30%;
	font-weight: 700;
	border: none;
	box-shadow: none;
	border-radius: 4px;
	padding: 12px;
}

#lastSelectDel:hover {
	background-color: #272727;
	color: #f9f5f2;
}

#lastSelectESC {
	background-color: #272727;
	color: #f9f5f2;
	width: 30%;
	font-weight: 700;
	border: none;
	box-shadow: none;
	border-radius: 4px;
	padding: 12px;
}

#lastSelectESC:hover {
	background-color: #f9f5f2;
	color: #272727;
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
        #modalBox {
                width: 400px;
                height: 270px;
        }
        #modalText {
                margin-top: 20%;
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
        #modalBox {
                width: 350px;
                height: 200px;
        }
        #modalText {
                margin-top: 12%;
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

		<div id="modal">
			<div id="modalBox">

				<div id="modalText">
					탈퇴를 진행할 경우 <span style="color: red;">'3개월'</span> 동안 <br> 재가입
					할 수 없습니다. 계속 하시겠습니까?
				</div>

				<div id="selectBnt">
					<button id="lastSelectDel">탈퇴하기</button>
					<button id="lastSelectESC" onclick="hideWarning('modal')">돌아가기</button>
				</div>

			</div>
		</div>

		<script>
			document.getElementById("lastSelectDel").addEventListener("click",
					function() {
						alert("탈퇴되었습니다.");
						document.getElementById("delBtn").click();
					});
		</script>

		<div class="heightControl">
			<div class="top">
				<h2 class="title">회원탈퇴</h2>
				<p id="text">고객님의 소중한 개인정보 보호를 위해</p>
				<p id="text">비밀번호를 다시 한번 입력해 주세요.</p>
			</div>

			<form action="delUser.do" method="post">
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
					<div id="warningPwcheck">
						확인되었습니다.<br> <br>
					</div>
					<button type="button" onclick="validateSamePw()" id="btn">비밀번호
						확인</button>
					<button type="submit" id="delBtn">탈퇴하기</button>
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
								// 								hideWarning("warningSamePw");
								// 								showWarning("warningPwcheck");
								// 								document.getElementById("delBtn").style.display = "block"; // 탈퇴 버튼을 보이게 합니다.
								// 								document.getElementById("btn").style.display = "none"; // 비밀번호 확인 버튼을 숨깁니다.
								showWarning("modal");
							} else {
								console.log("data 실패: ", data);
								hideWarning("warningPwcheck");
								showWarning("warningSamePw");
								document.getElementById("delBtn").style.display = "none"; // 탈퇴 버튼을 숨깁니다.
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