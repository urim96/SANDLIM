<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../css/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/md.css">
<title>손님 메뉴 리스트 페이지</title>
<script>
	window.onload = function() {
		document.querySelector("#mdContent").style.display = "none";
		var scrollBtn = document.getElementById("scrollBtn");

		window.onscroll = function() {
			if (document.body.scrollTop > 300
					|| document.documentElement.scrollTop > 300) {
				scrollBtn.style.display = "block";
			} else {
				scrollBtn.style.display = "none";
			}
		};

		scrollBtn.onclick = function() {
			window.scrollTo({
				top : 0,
				behavior : 'smooth'
			});
		};
	};

	function enterkey() {
		if (window.event.keyCode == 13) {
			search();
		}
	}
</script>
<style>
hr {
	margin-top: 0px;
	margin-bottom: 1rem;
	width: 40px;
	border-top: 1px solid #272727;
}
</style>
<body>
	<div class="bod" style="margin-top: 90px;">

		<h3>메뉴</h3>
		<div class="form-inline sch">
			<select class="form-control" id="sel1" name="searchCondition"
				style="display: inline-block !important; margin-right: 10px;">
				<c:forEach items="${conditionMap}" var="option">
					<option value="${option.value}">${option.key}</option>
				</c:forEach>
				<option value="이름">이름</option>
				<option value="이상가격">~원 이상</option>
				<option value="이하가격">~원 이하</option>
			</select>
			 <input class="form-control mr-sm-2" type="text" id="key1" name="searchKeyword" placeholder="검색어를 입력하세요." onkeydown="JavaScript:enterkey();">
			<button class="btn1 btn-success" id="seabt" type="button" onclick="search()">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
    			</svg>
			</button>
		</div>


		<div id="best5div">
			<p id="best5">BEST 5</p>
			<div class='slider'>
				<div class='slide-track'>
					<div class="cardall">
						<div id="cardall2"></div>
						<div id="cardall3"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="menubut">
			<button type="button" class="but1 but1start"
				onclick="allMd('selectList.san')" value="전체 메뉴">전체 메뉴</button>
			<button type="button" class="but1" onclick="selectkind('커피')"
				value="커피">커피</button>
			<button type="button" class="but1" onclick="selectkind('논커피')"
				value="논커피">논커피</button>
			<button type="button" class="but1" onclick="selectkind('티')"
				value="티">티</button>
			<button type="button" class="but1" onclick="selectkind('에이드')"
				value="에이드">에이드</button>
			<button type="button" class="but1" onclick="selectkind('프라페')"
				value="프라페">프라페</button>
			<button type="button" class="but1" onclick="selectkind('디저트')"
				value="디저트">디저트/원두</button>
			<button type="button" class="but1" onclick="okList('판매가능')"
				value="판매가능">품절제외</button>
		</div>

		<div class="dropdown" id="mdMenu">
			<button type="button" class="btn-primary dropdown-toggle mddrop"
				data-toggle="dropdown">MENU</button>
			<div class="dropdown-menu">
				<button type="button" class="dropdown-item but1start"
					onclick="allMd('selectList.san')" value="전체 메뉴">전체 메뉴</button>
				<button type="button" class="dropdown-item" onclick="okList('판매가능')"
					value="판매가능">품절제외</button>
				<button type="button" class="dropdown-item"
					onclick="selectkind('커피')" value="커피">커피</button>
				<button type="button" class="dropdown-item"
					onclick="selectkind('논커피')" value="논커피">논커피</button>
				<button type="button" class="dropdown-item"
					onclick="selectkind('티')" value="티">티</button>
				<button type="button" class="dropdown-item"
					onclick="selectkind('에이드')" value="에이드">에이드</button>
				<button type="button" class="dropdown-item"
					onclick="selectkind('프라페')" value="프라페">프라페</button>
				<button type="button" class="dropdown-item"
					onclick="selectkind('디저트')" value="디저트">디저트/원두</button>
			</div>
		</div>

		<div id="serNo_div"></div>


		<div class="cardall" id="cardall">
			<div class="card1">
				<c:forEach items="${mdList}" var="md">
					<div class="col-lg-3 col-md-6 col-sm-10 mdcard">
						<div class="card">
							<img class="mdimg" id="mdimg" src="resources/img/${md.m_img}"
								alt="${md.m_name}" title="${md.m_name}">
							<div class="card-body">
								<h5 class="card-title" id="card_h4">${md.m_name}</h5>
								<p class="card-text">${md.m_price}원</p>
								<c:choose>
									<c:when test="${md.m_state eq '품절'}">
										<span style="color: red; font-weight: bold;">SOLD OUT</span>
									</c:when>
									<c:otherwise>
										<span></span>
									</c:otherwise>
								</c:choose>
								<button type="button" id="List" class="btn"
									onclick="list('${md.m_no}', '${md.m_kind}' )"
									data-toggle="modal" data-target="#listModal">주문하기</button>
							</div>
						</div>
					</div>
				</c:forEach>
				<br>
			</div>
		</div>
		<button id="scrollBtn">
			<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
  				<path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0m-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707z" />
			</svg>
		</button>
		<div class="modal fade" id="listModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			data-backdrop='static' data-keyboard='false'>
			<%@ include file="getMd.jsp"%>
		</div>
	</div>
	<%@include file="../css/footer.jsp"%>
</body>
</html>