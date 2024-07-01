<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test.css">
  <script src="${pageContext.request.contextPath }/resources/js/san.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/test.js"></script>

<title>산들림</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
 * {
   font-family: 'Noto Sans KR', sans-serif !important;
   box-sizing: border-box !important;
   font-weight: 500 !important;
}
.bcl{
flex-grow:1;
}
.bodyDiv{
display:flex;
}
* {box-sizing: border-box;}
.idxbody {
	width: 200px;
	padding-left: 20px;
	float: left;
	display: flex;
	background-color: #272727;
	color: #f9f5f2;
	/* height:100vh; */
	font-size: 15px;
}

ul {
	list-style: none;
	padding: 0
}

.idxhd {
	
	display: flex;
	background-color: #272727;
	color: #f9c25c;
	align-items: center;
	padding: 8px;
	box-sizing: border-box;
	height: 50px !important;
	justify-content: center;
/* 	height: 65.59px !important; */
}

.move {
	padding-left: 100px;
	background-color: #272727;
	color: #f9f5f2;
}

.info {
	background-color: #272727;
	color: #f9f5f2;
	display:flex;
	margin-left:auto;
}

li {
	margin-top: 15px;
}

a {
	text-decoration: none;
	color: #f9f5f2;
}

.infoa {
	color:#f9f5f2;
}
.nick{
	padding-right:10px;
}
.infodiv{
	display:flex;
	text-align: center;
}
.idxlog{
    margin-top: 55px;
    height: 30px;
}
.menu{
/* 	opacity:70%; */
	color: #f9c25c;
}
</style>
</head>
<body>
<div class="idxhd">
	<h3 style="font-size:1.4rem;"> 산들림 관리자센터</h3>
</div>
<div class="idxbody">
	<div>
	<img class="idxlog" src="/resources/img/logo_w.png" alt="sandlim" title="sandlim" style="height: 30px; cursor:pointer;" onclick="javascript:newin=window.open('about:blank'); newin.location.href='main.jsp';" ><br>
	<div class="infodiv"><p class="infoa nick">${userName} 님</p>&nbsp;&nbsp;<a class="infoa" href="adminLogout.do">로그아웃</a></div>
	<ul>
	<li><br></li>
	<li><a href="adminWork.do">관리자 메인</a></li>
	<li></li>
	<li class="menu">회원관리></li>
	<li><a href="userList.do">- 회원관리</a></li>
	<li class="menu">상품관리></li>
	<li><a href="adminMd.san">- 상품조회/수정</a></li>
	<li><a href="insert.san">- 상품등록</a></li>
	<li class="menu">주문관리></li>
	<li><a href="odTodayList.san">- Today픽업주문</a></li>
	<li><a href="odtoDelivery.san">- Today배달주문</a></li>
	<li><a href="odAllList.san">- 픽업주문관리</a></li>
	<li><a href="odDelivery.san">- 배달주문관리</a></li>
	<li class="menu">게시판관리></li>
	<li><a href="adminGetBoardList.do">- 공지관리</a></li>
	<li><a href="adminGetFaq.do">- FAQ관리</a></li>
	<li><a href="adminGetReview.do">- 리뷰관리</a></li>
	<li class="menu">통계></li>
	<li><a href="adminStatistics.san">-매출통계</a></li>
	<li><a href="adminStatisticsOther.san">-월매출/회원</a></li>
	</ul>
	</div>
</div>
</body>
</html>