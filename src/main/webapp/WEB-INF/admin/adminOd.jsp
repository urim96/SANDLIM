<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="adminIndex.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 주문 관리 페이지</title>
</head>
<script>
$(document).ready(function() {
	//사이드 메뉴 height조정
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

// 	검색 시 페이징 처리, 검색 결과 아작스 
	var odMaxPage = 0;
	var odCurrentPage11 = 1;
	var odPageLimit = 10;
	var odListDataAll;

	function getodList() {
		let seCon = document.getElementById("sel2").value;
		let seKey = document.getElementById("key2").value;
		let oddate = document.getElementById("oddate").value;
		
		 if (!seKey && !oddate) {
		        alert('검색어나 날짜를 입력해주세요.');
		        return;
		    }
		
		let search = {
			searchCondition : seCon,
			searchKeyword : seKey,
			o_date : oddate
		};
		let values = [];

		$.ajax({
			url : "odSelect.san",
			type : "post",
			data : search,
			cache : false,
			async : false,
			success : function(data) {
				odListDataAll = data;
				var totalDataCnt = data.length;

				odMaxPage = Math.ceil(totalDataCnt / odPageLimit);
				makeBtn(odMaxPage);
				odCurrentPage11Data(odListDataAll, odCurrentPage11);
			},
			error : function() {
				alert('다시 시도해주세요.');
			}
		});
	}

	function makeBtn(odMaxPage) {
		$("#pagediv").empty();
		$("#pagediv .page-num-list").remove();
		$("#pagediv").append("<div class='page-num-list'></div>");
		for (let i = 1; i <= odMaxPage; i++) {
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

	function odCurrentPage11Data(data, odCurrentPage11) {
		let viewData = data.odsearch.slice((odCurrentPage11 - 1) * odPageLimit,
				odCurrentPage11 * odPageLimit);
		$("#paylist").empty();
		for (let i = 0; i < viewData.length; i++) {
			let od = viewData[i];
			let allname = od.o_name;
			let nameparts = allname.split(',');
			let menu1 = nameparts[0].trim(); 
			
			let ggg = od.o_no;
			let o_state = od.o_state;
		    let o_savepoint = od.o_savepoint;
		    let o_id = od.o_id;
		    let o_usepoint = od.o_usepoint;
			let bbb = '';
			let aaa = '';
			let ccc = '<button type="button" class="btn" id="all_module_' + ggg
					+ '" onclick="cancelPayment(\'' + ggg + '\', \'' + o_state + '\', \'' + o_savepoint + '\', \'' + o_id + '\', \'' + o_usepoint + '\')">취소</button>';
			let ddd = '<button id="but__'
					+ ggg
					+ '" type="button" class="btn" data-toggle="modal" data-target="#payModal" onclick="paymo(\''
					+ ggg + '\')">전자영수증</button>';
			console.log(od.o_state);
			switch (od.o_state) {
			case '취소':
				bbb = '<span style="color: red; font-weight: bold;">주문취소</span>';
				break;
			case '주문진행중':
				bbb = '<span style="color: black; font-weight: bold;">주문진행중</span>';
				break;
			case '완료':
				bbb = '<span style="color: blue; font-weight: bold;">완료</span>';
				break;
			case '픽업완료':
				bbb = '<span style="color: gray; font-weight: bold;">픽업완료</span>';
				break;
			case '제조완료':
				bbb = '<span style="color: green; font-weight: bold;">제조완료</span>';
				break;
			default:
				bbb = '<span style="color: hotpink; font-weight: bold;">주문확인중</span>';
			}
			switch (od.o_state) {
			case '주문 확인중':
				aaa = '<button type="button" class="btn modiod-button" id="modiod_'
						+ od.o_no
						+ '" onclick="modiod(\'주문접수\', \''
						+ od.o_no
						+ '\')">주문접수</button>';
				break;
			case '주문진행중':
				aaa = '<button type="button" class="btn modiod-button" id="modiod_'
						+ od.o_no
						+ '" onclick="modiod(\'제조완료\', \''
						+ od.o_no
						+ '\')">제조완료</button>';
				break;
			case '제조완료':
				aaa = '<button type="button" class="btn modiod-button" id="modiod_'
						+ od.o_no
						+ '" onclick="modiod(\'픽업완료\', \''
						+ od.o_no
						+ '\')">픽업완료</button>';
				break;
			case '픽업완료':
				aaa = '<button type="button" class="btn modiod-button" id="modiod_' 
			      		  + od.o_no
			       		 + '" onclick="pointUp(\''
			       		 + od.o_id 
			       		 + '\', \'' 
			       		 + od.o_savepoint
			       		 + '\', \'완료\', \''  
			       		 + od.o_no
			       		 + '\')">완료</button>';
				break;
			}
			let rowHtml = "<tr>" + "<td>" + od.o_date + "</td>" + "<td>"
					+ od.o_id + "</td>" + "<td>" + menu1 + " ..." + "</td>" + "<td>"
					+ od.o_toprice + "</td>" + "<td>" + ddd + "</td>" + "<td>"
					+ bbb + "</td>" + "<td>" + aaa + "</td>" + "<td>" + ccc
					+ "</td>" + "</tr>";
			$("#paylist").append(rowHtml);
		}
	}

	$(document).ready(function() {
		$("#pagediv").on("click", ".pagebtn", function() {
			odCurrentPage11 = parseInt($(this).text());
			odCurrentPage11Data(odListDataAll, odCurrentPage11);
		});
	});
	
	function enterkey() {
		if (window.event.keyCode == 13) {
			getodList();
	    }
	}
</script>
<style>
a{
    color: #f9f5f2 !important;
     text-decoration: none !important;
}

.adminmd {
	max-width: 1300px;
}
.admin {
    padding: 0px 100px 0px 200px;
}
td{
padding: 3px !important;
}
</style>
<body>
<!-- <div class = "bodyDiv"> -->
<div class="bcl">
			<div class="admin">
				<section class="header-container">
					<h3>전체기간 픽업 주문 내역</h3>
				</section>
				
	<div class="form-inline sch" >
		<select class="form-control" id="sel2" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
			<c:forEach items="${conditionMap}" var="option">
				<option value="${option.value}">${option.key}</option>
			</c:forEach>
			<option value="주문자">주문자ID</option>
			<option value="주문번호">주문번호</option>
			<option value="주문상태">주문상태</option>
		</select> <input class="form-control mr-sm-2" type="text" id="key2"
			name="searchKeyword" placeholder="검색어를 입력하세요." onkeydown="JavaScript:enterkey();">
		<button class="btn btn-success search-btn" type="button"
			onclick="getodList()">검색</button>
	</div>

	<div class="datediv">
		<input type="date" id="oddate" style="margin: 10px;">
		<button class="btn btn-success" type="button" style="height: 30px;"
			onclick="getodList()">검색</button>
	</div>

	<table class="table table-hover adminmd" id="odtable">
		<thead>
			<tr>
				<th>주문 일자</th>
				<th>주문자 아이디</th>
				<th>주문 상품</th>
				<th>결제 금액</th>
				<th>상세 보기</th>
				<th>주문 상태</th>
				<th>상태 변경</th>
				<th>취소 버튼</th>
			</tr>
		</thead>

		<tbody id="paylist">
			<c:forEach items="${odList}" var="od">
				<tr>
					<td>${od.o_date}</td>
					<td>${od.o_id}</td>
					<td>${od.o_name.split(',')[0].trim()}  ... </td>
					<td>${od.o_toprice}</td>
					<td><button id="but__${od.o_no}" type="button" class="btn" data-toggle="modal" data-target="#payModal" onclick="paymo('${od.o_no}')">전자영수증</button></td>
					<td id="status_${od.o_no}"><c:choose>
							<c:when test="${od.o_state eq '취소'}">
								<span id="sta_${od.o_no}" style="color: red; font-weight: bold;">주문취소</span>
							</c:when>
							<c:when test="${od.o_state eq '주문진행중'}">
								<span id="sta_${od.o_no}"
									style="color: black; font-weight: bold;">주문진행중</span>
							</c:when>
							<c:when test="${od.o_state eq '완료'}">
								<span id="sta_${od.o_no}"
									style="color: blue; font-weight: bold;">완료</span>
							</c:when>
							<c:when test="${od.o_state eq '픽업완료'}">
								<span id="sta_${od.o_no}"
									style="color: gray; font-weight: bold;">픽업완료</span>
							</c:when>
							<c:when test="${od.o_state eq '제조완료'}">
								<span id="sta_${od.o_no}"
									style="color: green; font-weight: bold;">제조완료</span>
							</c:when>
							<c:otherwise>
								<span id="sta_${od.o_no}"
									style="color: hotpink; font-weight: bold;">주문확인중</span>
							</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${od.o_state eq '주문 확인중'}">
								<button type='button' class='btn modiod-button'
									id="modiod_${od.o_no}" onclick="modiod('주문접수', '${od.o_no}')">주문접수</button>
							</c:when>
							<c:when test="${od.o_state eq '주문진행중'}">
								<button type='button' class='btn modiod-button'
									id="modiod_${od.o_no}" onclick="modiod('제조완료', '${od.o_no}')">제조완료</button>
							</c:when>
							<c:when test="${od.o_state eq '제조완료'}">
								<button type='button' class='btn modiod-button'
									id="modiod_${od.o_no}" onclick="modiod('픽업완료', '${od.o_no}')">픽업완료</button>
							</c:when>
							<c:when test="${od.o_state eq '픽업완료'}">
								<button type='button' class='btn modiod-button'
									id="modiod_${od.o_no}" onclick="pointUp('${od.o_id}', '${od.o_savepoint}','완료', '${od.o_no}')">완료</button>
							</c:when>
							<c:otherwise>
								<span></span>
							</c:otherwise>
						</c:choose></td>
					<td>
						<button type='button' class='btn' id="all_module_${od.o_no}"
							onclick="cancelPayment('${od.o_no}','${od.o_state}', '${od.o_savepoint}', '${od.o_id}', '${od.o_usepoint}')">취소</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop='static' data-keyboard='false'>
			<%@ include file="../md/order.jsp" %>
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

			var url = "/odAllList.san";
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
			var url = "/odAllList.san";

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

			var url = "/odAllList.san";
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