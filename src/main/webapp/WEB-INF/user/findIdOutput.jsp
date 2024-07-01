<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="/resources/css/terms.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<style>
* {
	font-family: "Noto Sans KR", sans-serif !important;
	color: #272727 !important;
	word-break: keep-all;
}

.small-title {
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

#text {
    margin: 10px 0;
    text-align: center;
}

.container {
	width: 440px;
	height: 700px;
	padding-left: 0px;
	padding-right: 0px;
	box-shadow: none;
	margin: 0 auto;
	padding: 0;
}

.login-tit {
	font-weight: 600;
	line-height: 1.5 !important;
}

.form-group, .join-btn {
	margin: 16px 0;
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
#text {
    margin: 10px 0;
    text-align: center;
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
<title>산들림</title>
</head>
<body>
    <div class="container">
    	<br><br>
    	<p id="text">${msg}</p>
        <br><br>
        <button onclick="window.location.href='/login.do'" class="btn btn-primary" id="btn">로그인 페이지로</button>
    </div>
</body>
</html>