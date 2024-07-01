<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
 * {
   font-family: 'Noto Sans KR', sans-serif !important;
   box-sizing: border-box !important;
   font-weight: 500 !important;
}
.navbar{
	width: 100%;
	height:80px;
 	background-color: none !important;
}

</style>

<meta charset="UTF-8">
<title>산들림 홈페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/test.css">
<script src="${pageContext.request.contextPath }/resources/js/san.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/test.js"></script>
</head>

<nav id="stNav" class="navbar navbar-expand-sm">
	<ul class="navbar-nav navlogo">
		<li class="nav-item"><a href="/main.jsp"><img class="nvlog" id="nvlog" src="/resources/img/logo.png" alt="sandlim" title="sandlim" style="height: 40px; padding-left:120px;"></a></li>
	</ul>
	<div class="meme">
		<ul class="navbar-nav">
			<li class="nav-item">
				<span class="navmenu"><a class="nav-link" href="getAbout.do">ABOUT</a></span>
			</li>
			<li class="nav-item">
				<span class="navmenu"><a class="nav-link" href="selectList.san">MENU</a></span>
			</li>
			<li class="nav-item">
				<span class="navmenu"><a class="nav-link" href="getReview.do">REVIEW</a></span>
			</li>
			<li class="nav-item">
				<span class="navmenu"><a class="nav-link" href="getFaq.do">FAQ</a></span>
			</li>
			<li class="nav-item">
				<span class="navmenu"><a class="nav-link" href="getBoardList.do">NEWS</a></span>
			</li>
		</ul>
	</div>
	<ul class="navbar-nav navuser" style="width:200px !important; font-size:small;">
		<c:choose>
			<c:when test="${userId ne NULL}">
				<c:choose>
					<c:when test="${sessionScope.loginChk eq 'kakao'}">
						<li class="nav-item">
							<a class="nav-link" href="userMypage.do"><span id="name">${userNick} 님</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link nav-cart" href="getCartList.san">CART</a>
						</li>
						<li class="nav-item">
							<a class="logOut"><a class="nav-link" href="javascript: kakaoLogout()" id="logOutBtn">LOGOUT</a>
						</li>
					</c:when>
					<c:when test="${sessionScope.loginChk eq 'naver'}">
						<li class="nav-item">
							<a class="nav-link" href="userMypage.do"><span id="name">${userNick} 님</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="getCartList.san">CART</a>
						</li>
						<li class="nav-item">
							<a class="logOut"><a class="nav-link" href="javascript: naverLogout()" id="logOutBtn">LOGOUT</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<a class="nav-link" href="userMypage.do"><span id="name">${userNick} 님</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link nav-cart" href="getCartList.san">CART</a>
						</li>
						<li class="nav-item">
							<a class="logOut"><a class="nav-link" href="javascript: logout()">LOGOUT</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<ul class="navbar-nav log2" style="padding-right:100px !important; font-size:small;" >
					<li class="nav-item">
						<a class="navsi"><a class="nav-link" href="login.do">LOGIN</a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>

<nav id="subNav" class="navbar">
	<ul class="navbar-nav">
		<li class="nav-item">
			<a class="navbar-brand" href="main.jsp">
			<img class="nvlog" id="nvlog" src="resources/img/logo.png" alt="sandlim" title="sandlim" style="width: 120px; height: 30px; margin-left:1rem;">
			</a>
		</li>
	</ul>
	<c:choose>
		<c:when test="${userId ne NULL}">
			<ul class="navbar-nav">
				<li class="nav-item" style="margin-right: 80% !important;">
					<a class="nav-link" href="userMypage.do">
						<svg class="svgsize" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  						<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
						</svg>
					</a>
				</li>
			</ul>
				<li class="nav-item">
					<a class="nav-link" href="getCartList.san" >
						<svg class="svgsize" id="cart4" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-basket-fill" viewBox="0 0 16 16">
  						<path d="M5.071 1.243a.5.5 0 0 1 .858.514L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 6h1.717zM3.5 10.5a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0zm2.5 0a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0zm2.5 0a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0zm2.5 0a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0zm2.5 0a.5.5 0 1 0-1 0v3a.5.5 0 0 0 1 0z" />
						</svg>
					</a>
				</li>
		</c:when>
		<c:otherwise>
			<ul class="navbar-nav" >
				<li class="nav-item">
				<a class="nav-link" href="login.do"> 
				<svg class="svgsize" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
 				 <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
				 </svg>
				</a>
				</li>
			</ul>
		</c:otherwise>
	</c:choose>
		<li id="clMenu" class="nav-item">
			<div class="dropdown"></div>
			<button type="button" class=" dropdown-toggle" data-toggle="dropdown" style="background-color:#f9f5f2">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5" />
				</svg>
			</button>
			<div class="dropdown-menu" width="100%">
				<a class="dropdown-item" href="getAbout.do">ABOUT</a> 
				<a class="dropdown-item" href="selectList.san">MENU</a>
				<a class="dropdown-item" href="getReview.do">REVIEW</a>
				<a class="dropdown-item" href="getFaq.do">FAQ</a> 
				<a class="dropdown-item" href="getBoardList.do">NEWS</a>
			</div>
		</li>
</nav>
