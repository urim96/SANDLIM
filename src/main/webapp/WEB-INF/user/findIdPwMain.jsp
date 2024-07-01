<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>   
<%@ include file="../css/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>산들림</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
html, body{
width:100%;
overflow-x:hidden;
}

* {
	font-family: "Noto Sans KR", sans-serif;
	font-family: "Roboto", sans-serif;
	color: #272727;
	word-break: keep-all;
}

.login-tit{
        line-height: 1.5 !important;
	font-weight: 600;
}

.small-title {
margin-top:30px;
    font-size: 1.5rem;   /* 원하는 크기를 지정 */
    text-align: center;
    font-weight: bold;
}

.btn-group {
    width: 100%;
    display: flex; 
}

label.btn {
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.btn-group label {
    flex: 1; 
}

.btn-group label input[type="radio"] {
    display: none;
}

.btn.btn-outline-primary {
    width: 100%;
    background-color: white !important;
    color: black !important;
    border: none;
    border-bottom: #f5f5f5 1px solid;
}

.btn.btn-outline-primary:hover {
    background-color: white !important;
}

.btn.btn-outline-primary.active {
    border-bottom: black 2px solid !important;
}

input[type="radio"] {
    display: none;
}

#text {
    margin: 10px 0;
    text-align: center;
}

#container{
	padding-left: 0px;
	padding-right: 0px;
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

.form-control {
	border: 1.5px solid #eee !important;
	border-radius: 8px !important;
	padding: 22px 12px !important;
	color: #b8b8b8;
	box-shadow: none !important;
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

	<h6 class="small-title" >가입정보 확인</h6>
	<p id="text">가입 시 입력한 정보를 확인합니다.</p>
	
	<br><br>
	<div class="text-center d-flex justify-content-center">
		<div class="btn-group">
		  <label class="btn btn-outline-primary">
		    <input type="radio" class="form-control" name="options" id="option1" autocomplete="off" onclick="updateContent('findId.do')"> 아이디 찾기
		  </label>
		  <label class="btn btn-outline-primary">
		    <input type="radio" class="form-control" name="options" id="option2" autocomplete="off" onclick="updateContent('findPwInputId.do')"> 비밀번호 찾기
		  </label>
		</div>
	</div>
	  
	<div class="content">
	
	    
	    
    </div>
</div>
<script>

$(document).ready(function() {
    updateContent('findId.do');
    $("#option1").parent().addClass("active"); // 초기 로드 시 첫 번째 옵션에 active 클래스 추가
});

function updateContent(option) {
    $.ajax({
        url: option,
        async: false,
        success: function(data) {
            $('.content').html(data);
            updateActiveButton(option); // 컨텐츠 업데이트 후 활성화된 버튼 업데이트
        }
    });
}

function updateActiveButton(option) {
    $('.btn-group label').removeClass('active'); // 모든 버튼에서 active 클래스 제거
    if (option === 'findId.do') {
        $("#option1").parent().addClass('active'); // 아이디 찾기 버튼에 active 클래스 추가
    } else if (option === 'findPwInputId.do') {
        $("#option2").parent().addClass('active'); // 비밀번호 찾기 버튼에 active 클래스 추가
    }
}

</script>
</body>
</html>