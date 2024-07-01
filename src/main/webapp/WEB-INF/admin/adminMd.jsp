<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../css/header.jsp" %> --%>
<%@ include file="adminIndex.jsp" %>
<title>관리자 상품 관리 페이지</title>
<script>
$(document).ready(function() {
	let idxhdHeight = document.querySelector(".idxhd").getBoundingClientRect().height; //헤더 높이
	let idxbodyHeight = document.querySelector(".idxbody").getBoundingClientRect().height; //사이즈 돞이
	
	let ftHeight = $("footer").height();
	let bclHeight =document.querySelector(".bcl").getBoundingClientRect().height;
	
	
	let useHeight = idxhdHeight + idxbodyHeight; //가용 height값
	
	if(useHeight > bclHeight){
		$(".bcl").height(idxbodyHeight);
	}
	let bodyHeight =document.body.getBoundingClientRect().height;
	$(".idxbody").height(bclHeight+50);
	
});
//	검색 시 페이징 처리, 검색 결과 아작스 
var mdMaxPage = 0;
var mdCurrentPage11 = 1;
var mdPageLimit = 5;
var mdListDataAll;

//관리자 키워드별 메뉴
function adminkind(val){

	let objParams = {m_kind: val};
	let values = [];

	$.ajax({
		type : "POST",
		url : "kind.san", 
		data : objParams, 
		cache : false, 
		success : function(data){
			mdListDataAll = data;
			var totalDataCnt = data.length;
			mdMaxPage = Math.ceil(totalDataCnt / mdPageLimit);
			makeBtn(mdMaxPage);
			mdCurrentPage11Data(mdListDataAll, mdCurrentPage11);
		
		},
		error:function(request, status){
			alert("오류가 발생했습니다.");
		}
	});
 }
function adminsearch() {
	let seCon = document.getElementById("sel1").value;
	let seKey = document.getElementById("key1").value;
	
	 if (!seKey) {
	        alert('검색어를 입력해주세요.');
	        return;
	    }
	let search = {
		searchCondition : seCon,
		searchKeyword : seKey,
	};
	let values = [];

	$.ajax({
		url : "adminSearch.san",
		type : "post",
		data : search,
		cache : false,
		async : false,
		success : function(data) {
			mdListDataAll = data;
			var totalDataCnt = data.length;
			mdMaxPage = Math.ceil(totalDataCnt / mdPageLimit);
			makeBtn(mdMaxPage);
			mdCurrentPage11Data(mdListDataAll, mdCurrentPage11);
		},
		error : function() {
			alert('다시 시도해주세요.');
		}
	});
}
function makeBtn(mdMaxPage) {
	$("#pagediv").empty();
	$("#pagediv .page-num-list").remove();
	$("#pagediv").append("<div class='page-num-list'></div>");
	for (let i = 1; i <= mdMaxPage; i++) {
		if (i == 1)
			$("#pagediv .page-num-list").append(
					"<button type='button' id='pageBtn1'class='pagebtn'>"
							+ i + "</button>");
		else
			$("#pagediv .page-num-list").append(
					"<button type='button' class='pagebtn'>" + i
							+ "</button>");
	}
}
function mdCurrentPage11Data(data, mdCurrentPage11) {
	let viewData = [];
	if(data.searchList == null){
	viewData = data.kindList.slice((mdCurrentPage11 - 1) * mdPageLimit,
			mdCurrentPage11 * mdPageLimit);
	}else {
	viewData = data.searchList.slice((mdCurrentPage11 - 1) * mdPageLimit,
			mdCurrentPage11 * mdPageLimit);
	}
	 		$('#admdlist').empty();
           for (let i = 0; i < viewData.length; i++) {
			 let md = viewData[i];
				let m_state = "";
					if(md.m_state === "품절" ){
						m_state ='<span style="color:red; font-weight:bold;">SOLD OUT</span>';
					}else if(md.m_state === "판매종료"){
						m_state ='<span style="color:purple; font-weight:bold;">판매종료</span>';
					}else {
						m_state ='<span style="color:gray; font-weight:bold;">판매가능</span>';
					}
				
				let rowHtml = "<tr><td><img class='mdimg' src='/resources/img/" + md.m_img + "' alt='" + md.m_name + "' title='" + md.m_name + "' style='width:150px; height:150px'></td>" +
			    "<td>" + md.m_name + "</td>" +
			    "<td>" + md.m_price + " 원</td>" +
			    "<td>" + md.m_content + "</td>" +
			    "<td>" + m_state + "</td>" +
			    "<td><button type='button' class='btn' onclick=\"list('" + md.m_no + "', '" + md.m_kind + "')\" data-toggle='modal' data-target='#listModal'>상세보기</button></td>" +
			    "<td><button type='button' class='btn modify' data-toggle='modal' data-target='#myModal' value='" + md.m_no + "'>메뉴수정</button></td></tr>";
				
				$("#admdlist").append(rowHtml);
			 }
	}

$(document).ready(function() {
	document.querySelector("#mdContent").style.display="none";
	$("#pagediv").on("click", ".pagebtn", function() {
		mdCurrentPage11 = parseInt($(this).text());
		mdCurrentPage11Data(mdListDataAll, mdCurrentPage11);
	});
});
function enterkey() {
   if (window.event.keyCode == 13) {
      adminsearch();
    }
}

</script>
<style>
a{
   text-decoration: none !important;
    color: #f9f5f2 !important ;
}

.adminmd {
	max-width: 1300px;
}

.menubut {
	display: flex;
	justify-content: center;
}
.admin {
    padding: 0px 100px 0px 200px;
}
td{
padding: 3px !important;
}

</style>
<body>
	<div class="bcl">
		<div class="admin">
			<section class="header-container">
				<h3>상품 조회/수정</h3>
			</section>
			<div class="form-inline sch">
				<select class=" " id="sel1" name="searchCondition"
					style="display: inline-block !important; margin-right: 10px;">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}</option>
					</c:forEach>
					<option value="이름">이름</option>
					<option value="베스트">베스트상품</option>
					<option value="이상가격">~원 이상</option>
					<option value="이하가격">~원 이하</option>
				</select> <input class="search" type="text" id="key1" name="searchKeyword"
					placeholder="검색어를 입력하세요." onkeydown="JavaScript:enterkey();">
				<button class="mainbtn" type="button" onclick="adminsearch()">검색</button>
			</div>

			<div class="menubut">
				<button type="button" class="but1 but1start"
					onclick="allMd('adminMd.san')" value="전체 메뉴">전체 메뉴</button>
				<button type="button" class="but1" onclick="adminkind('커피')"
					value="커피">커피</button>
				<button type="button" class="but1" onclick="adminkind('논커피')"
					value="논커피">논커피</button>
				<button type="button" class="but1" onclick="adminkind('티')"
					value="티">티</button>
				<button type="button" class="but1" onclick="adminkind('에이드')"
					value="에이드">에이드</button>
				<button type="button" class="but1" onclick="adminkind('프라페')"
					value="프라페">프라페</button>
				<button type="button" class="but1" onclick="adminkind('디저트')"
					value="디저트">디저트/원두</button>
				<button type="button" class="but1" onclick="soldList('품절')"
					value="품절">품절/종료</button>
			</div>

			<div>
				<div class="container adminmd">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>상품 사진</th>
								<th>이름</th>
								<th>가격</th>
								<th>상품 설명</th>
								<th>판매 상태</th>
								<th>상세 보기</th>
								<th>수정 하기</th>
							</tr>
						</thead>
						<tbody id="admdlist">
							<c:forEach items="${mdList}" var="md">
								<tr>
									<td><img class="mdimg" id="mdimg"
										src="/resources/img/${md.m_img}" alt="${md.m_name}"
										title="${md.m_name}" style="width: 150px; height: 150px"></td>
									<td>${md.m_name}</td>
									<td>${md.m_price}원</td>
									<td>${md.m_content}</td>
									<td><c:choose>
											<c:when test="${md.m_state eq '품절'}">
												<span style="color: red; font-weight: bold;">SOLD OUT</span>
											</c:when>
											<c:when test="${md.m_state eq '판매종료'}">
												<span style="color: purple; font-weight: bold;">판매종료</span>
											</c:when>
											<c:otherwise>
												<span style="color: gray; font-weight: bold;">판매가능</span>
											</c:otherwise>
										</c:choose></td>
									<td><button type="button" id="List" class="btn"
											onclick="list('${md.m_no}', '${md.m_kind}' )"
											data-toggle="modal" data-target="#listModal">상세보기</button></td>
									<td><button type="button" class="btn modify" id="modify"
											data-toggle="modal" data-target="#myModal" value="${md.m_no}">메뉴수정</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="modal fade" id="listModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" data-backdrop='static'
				aria-hidden="true">
				<%@ include file="../md/getMd.jsp"%>
			</div>

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" data-backdrop='static'
				aria-hidden="true">
				<%@ include file="updateMd.jsp"%>
			</div>

			<div id="pagediv">
				<nav aria-label="Page navigation example" style="margin: auto;">
					<ul class="pagination justify-content-center">
						<c:if test="${pagination.prev}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
						</c:if>
						<c:forEach begin="${pagination.startPage}"
							end="${pagination.endPage}" var="idx">
							<li
								class="page-item <c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/> ">
								<button type=button class="pagebtn"
									onClick="fn_pagination('${idx}', '${pagination.range}')">
									${idx}</button>
							</li>
						</c:forEach>
						<c:if test="${pagination.next}">
							<li class="page-item"><a class="page-link" href="#"
								onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">다음</a></li>
						</c:if>
					</ul>
				</nav>
			</div>

			<div id="paginationData" data-searchType="${pagination.searchType}"
				data-keyword="${pagination.keyword}"></div>


			<script>
				function fn_prev(currPageNo, range, pageSize) {

					var searchType = document.getElementById('paginationData')
							.getAttribute('data-searchType');
					var keyword = document.getElementById('paginationData')
							.getAttribute('data-keyword');
					var currPageNo = (range - 1) * pageSize;
					var range = range - 1;

					var url = "/adminMd.san";
					url = url + "?currPageNo=" + currPageNo;
					url = url + "&range=" + range;
					url = url + "&searchType=" + searchType;
					url = url + "&keyword=" + keyword;
					location.href = url;

				}

				function fn_pagination(currPageNo, range) {

					var searchType = document.getElementById('paginationData')
							.getAttribute('data-searchType');
					var keyword = document.getElementById('paginationData')
							.getAttribute('data-keyword');
					var url = "/adminMd.san";

					url = url + "?currPageNo=" + currPageNo;
					url = url + "&range=" + range;
					url = url + "&searchType=" + searchType;
					url = url + "&keyword=" + keyword;
					location.href = url;

				}
				function fn_next(currPageNo, range, pageSize) {

					var searchType = document.getElementById('paginationData')
							.getAttribute('data-searchType');
					var keyword = document.getElementById('paginationData')
							.getAttribute('data-keyword');
					var currPageNo = (range * pageSize) + 1;
					var range = parseInt(range) + 1;

					var url = "/adminMd.san";
					url = url + "?currPageNo=" + currPageNo;
					url = url + "&range=" + range;
					url = url + "&searchType=" + searchType;
					url = url + "&keyword=" + keyword;
					location.href = url;
				}
			</script>
		</div>
	</div>
	<%@include file="../css/footer.jsp"%>
</body>
</html>
