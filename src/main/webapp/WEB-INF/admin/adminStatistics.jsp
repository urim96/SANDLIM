<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script>
$(document).ready(function() {
	//사이드 메뉴 height조정
	let idxhdHeight = document.querySelector(".idxhd").getBoundingClientRect().height; //헤더 높이
	let idxbodyHeight = document.querySelector(".idxbody").getBoundingClientRect().height; //사이즈 돞이
	
	let ftHeight = $("footer").height();
	let bclHeight =document.querySelector(".bcl").getBoundingClientRect().height;
	console.log('bclHeight 전 찍어보기: '+ bclHeight);
	
	
	let useHeight = idxhdHeight + idxbodyHeight; //가용(인덱스) height값
	
	if(useHeight > bclHeight){
		$(".bcl").height(idxbodyHeight);
// 		$("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
	}
	let bodyHeight =document.body.getBoundingClientRect().height;
	$(".idxbody").height(bclHeight);
	
	console.log('idxheader: '+idxhdHeight);
	console.log('idxbody: '+idxbodyHeight);
	console.log('footer: '+ ftHeight);
	console.log('useHeight: '+useHeight);
	console.log('useHeight: '+useHeight);
	console.log('body 전: '+ bodyHeight);
	console.log('body 후: '+  document.body.getBoundingClientRect().height);
	console.log('bclHeight 후: '+ $(".bcl").height());
});
</script>
<script>
	function exportExcel(id) {
		$.ajax({
			url : 'adminWeeklyStatistics.san',
			type : 'post',
			success : function(jsonData) {

				var wb = XLSX.utils.book_new();
				var newWorksheet = excelHandler.getWorksheet(id);
				XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler
						.getSheetName());
				var wbout = XLSX.write(wb, {
					bookType : 'xlsx',
					type : 'binary'
				});
				saveAs(new Blob([ s2ab(wbout) ], {
					type : "application/octet-stream"
				}), excelHandler.getExcelFileName(id));

			},
			error : function(jqXHR, textStatus, errorThrown) {
			}
		});
	}
	var excelHandler = {
		getExcelFileName : function(id) {
			let filenm;
			switch (id) {
			case 'tab11':
				filenm = '주간매출현황.xlsx';
				break;
			case 'tab22':
				filenm = '이달의매출현황.xlsx';
				break;
			case 'tab33':
				filenm = '지정기간매출현황.xlsx';
				break;
			case 'tab44':
				filenm = '월별매출현황.xlsx';

			}
			return filenm;
		},
		getSheetName : function() {
			return '매출현황';
		},
		getExcelData : function(id) {
			let idnm;
			switch (id) {
			case 'tab11':
				idnm = 'odtableWeek';
				break;
			case 'tab22':
				idnm = 'odtableMonth';
				break;
			case 'tab33':
				idnm = 'odtableMoney';
				break;
			case 'tab44':
				idnm = 'odtableMonthMoney';
				break;
			}
			return document.getElementById(idnm);
		},
		getWorksheet : function(id) {
			return XLSX.utils.table_to_sheet(this.getExcelData(id));
		}
	}

	function s2ab(s) {
		var buf = new ArrayBuffer(s.length); // convert s to arrayBuffer
		var view = new Uint8Array(buf); // create uint8array as viewer
		for (var i = 0; i < s.length; i++)
			view[i] = s.charCodeAt(i) & 0xFF; // convert to octet
		return buf;
	}
</script>
<style>
button {
	border: none;
	background-color: #f9f5f2;
	color: #272727;
	margin: 10px;
	padding: 10px;
}

.excelFileExport {
	display: flex;
	margin-left: auto;
}

input {
	width: 23px;
	border: none;
}

.subtitle {
	color: darkslateblue;
	    font-size: 20px;
	    text-align: left !important
}
a{
	text-decoration: none !important;
    color: #f9f5f2 !important;
}
.btncls{
	text-align: right;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="bcl">
		<div class="admin">
			<div class="header-container">
				<h3>매출현황</h3>
			</div>
			<div class="btncls">
				<button class="tab1" id="tab1" onclick="tab('tab1')">주간 매출현황</button>
				<button class="tab2" id="tab2" onclick="tab('tab2')">이 달의 매출현황</button>
				<input type="date" id="beforeDate"> ~ <input type="date"
					id="afterDate">
				<button class="tab3" id="tab3" onclick="tab('tab3')">기간설정</button>
				<input type="month" id="yr_mon">
				<button class="tab4" id="tab4" onclick="tab('tab4')">월별조회</button>
				<br>
			</div>
			<hr>
			<div class="pannel tab1">
				<!-- 엑셀 다운로드 버튼 -->
				<h3 class="subtitle">주간 매출현황</h3>
				<button type="button" class="excelFileExport" id="tab11"
					onclick="exportExcel('tab11')">파일 내려받기</button>
				<table class="table table-hover" id="odtableWeek">
					<thead>
						<tr>
							<th>날짜</th>
							<th>매출건수</th>
							<th>총 매출</th>
						</tr>
					</thead>
					<tbody id="panlist">
						<c:forEach items="${odStaList}" var="od">
							<tr>
								<td>${od.o_day}</td>
								<td>${od.o_cnt}</td>
								<td>${od.o_sum}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="pannel tab2">
				<!-- 엑셀 다운로드 버튼 -->
				<h3 class="subtitle">이 달의 매출현황</h3>
				<button type="button" class="excelFileExport" id="tab22"
					onclick="exportExcel('tab22')">파일 내려받기</button>
				<table class="table table-hover" id="odtableMonth">
					<thead>
						<tr>
							<th>날짜</th>
							<th>매출건수</th>
							<th>총 매출</th>
						</tr>
					</thead>
					<tbody id="panlist2">
						<c:forEach items="${odStaList2}" var="od2">
							<tr>
								<td>${od2.o_day}</td>
								<td>${od2.o_cnt}</td>
								<td>${od2.o_sum}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="pannel tab3">
				<!-- 엑셀 다운로드 버튼 -->
				<h3 class="subtitle">매출현황</h3>
				<button type="button" class="excelFileExport" id="tab33"
					onclick="exportExcel('tab33')">파일 내려받기</button>
				<table class="table table-hover" id="odtableMoney">
					<thead>
						<tr>
							<th>날짜</th>
							<th>매출건수</th>
							<th>총 매출</th>
						</tr>
					</thead>
					<tbody id="panlist3">
						<c:forEach items="${odStaList3}" var="od3">
							<tr>
								<td>${od3.o_day}</td>
								<td>${od3.o_cnt}</td>
								<td>${od3.o_sum}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="pannel tab4">
				<!-- 엑셀 다운로드 버튼 -->
				<h3 class="subtitle">월별 매출현황</h3>
				<button type="button" class="excelFileExport" id="tab44"
					onclick="exportExcel('tab44')">파일 내려받기</button>
				<table class="table table-hover" id="odtableMonthMoney">
					<thead>
						<tr>
							<th>날짜</th>
							<th>매출건수</th>
							<th>총 매출</th>
						</tr>
					</thead>
					<tbody id="panlist4">
						<c:forEach items="${odStaList4}" var="od4">
							<tr>
								<td>${od4.o_day}월</td>
								<td>${od4.o_cnt}</td>
								<td>${od4.o_sum}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<script>
				$(document).ready(function() {
					// 첫 번째 버튼을 선택하고 해당하는 패널을 보여줍니다.
					tab('tab1');
				});

				function tab(a) {

					$(".pannel").hide();
					$("." + a).show();
					if (a === 'tab1') {
						$("." + a).show();
					} else if (a === 'tab2') {
						$("." + a).show();
					}
					if (a === 'tab3') {
						$("." + a).show();
						let bDate = $("#beforeDate").val();
						let aDate = $("#afterDate").val();

						let value = {
							o_bdate : bDate,
							o_adate : aDate
						}
						$.ajax({
							url : "getDateList.san",
							type : "POST",
							data : value,
							success : function(data) {
								let table = "";
								$("#panlist3").empty();
								$.each(data.odStaList3, function(index, item) {
									table += "<tr><td>" + item.o_day
											+ "</td><td>" + item.o_cnt
											+ "</td><td>" + item.o_sum
											+ "</td></tr>";
								});
								console.log("table : " + table);
								$("#panlist3").append(table);
							},
							error : function() {
								alert("해당 기간동안 매출이 없습니다.");
							}
						});
					}
					if (a === 'tab4') {
						$("." + a).show();

						let yearMonth = $("#yr_mon").val();
						let year = yearMonth.substring(0, 4); // 첫 4글자는 연도
						let month = yearMonth.substring(5, 7); // 그 다음 2글자는 월
						console.log("연도: " + year);
						console.log("월: " + month);
						let value = {
							o_yr : year,
							o_mon : month
						}
						$.ajax({
							url : "getMonList.san",
							type : "POST",
							data : value,
							success : function(data) {
								let date = data.odStaList4;
								let table = "";
								console.log("줄 수  : " + data.length);
								$("#panlist4").empty();
								$.each(data.odStaList4, function(index, item) {
									console.log("date  : ", item);
									console.log("function안쪽 " + item.o_date);
									table += "<tr><td>" + item.o_day
											+ "</td><td>" + item.o_cnt
											+ "</td><td>" + item.o_sum
											+ "</td></tr>";
								});
								$("#panlist4").append(table);
								console.log("table : " + table);
							},
							error : function() {
								alert("해당 기간동안 매출이 없습니다.");
							}
						});
					}
				}
			</script>
		</div>
	</div>

	<%@include file="../css/footer.jsp"%>
</body>
</html>