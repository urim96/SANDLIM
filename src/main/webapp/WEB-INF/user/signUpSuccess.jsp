<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../css/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
* {
	font-family: "Noto Sans KR", sans-serif;
	font-family: "Roboto", sans-serif;
	color: #272727;
}

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
	margin-bottom: 25px;
}

#text {
	margin: 3px;
	text-align: center;
}

#btn {
	width: 100% !important;
	margin-top: 10px;
	padding: 12px 12px;
	font-weight: 700 !important;
	color: #f9f5f2 !important;
	background-color: #272727 !important;
	border: none !important;
	border-radius: 4px;
	box-shadow: none !important;
}

#btn:hover {
	background-color: #f9f5f2 !important;
	color: #272727 !important;
}

.content {
	margin-top: 30px;
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
</head>
<body>
	<div class="container">
		<div class="heightControl">
			<div class="top">
				<h2 class="title">
					<c:out value="${userNick}" />
					님 환영합니다.
				</h2>
				<p id="text">저희 산들림멤버십에 가입해주셔서 감사드립니다.</p>
				<p id="text">로그인하시어, 편히 쉬어가는 시간 가지시길 바랍니다.</p>
			</div>
			<div class="content">
				<button type="button" onclick="location.href='login.do';" id="btn">로그인</button>
			</div>
			<div class="bottom"></div>
		</div>
	</div>
	<script>
	window.onload = function() {
	    var loginChk = "<%= session.getAttribute("loginChk") %>"; // 세션에서 loginChk 값을 가져옵니다.
	    var btn = document.getElementById("btn"); // 버튼을 찾습니다.
	
	    console.log("logChk의 값: "+loginChk);
	    
	    // loginChk 값이 있는지 확인합니다.
	    if (loginChk !== "null") {
	        console.log("조건문 안쪽 logChk의 값: "+loginChk);
	        // loginChk 값이 있으면 버튼의 클릭 이벤트를 변경합니다.
	        btn.onclick = function() {
	            location.href = '/main.jsp'; // 메인 페이지로 이동합니다.
	        };
	        btn.textContent = '메인 페이지로'; // 버튼의 텍스트를 변경합니다.
	    }
	};
	</script>
	<%@include file="../css/footer.jsp"%>
</body>
</html>
