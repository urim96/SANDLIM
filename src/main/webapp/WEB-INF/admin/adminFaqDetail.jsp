<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="adminIndex.jsp"%>

<script>
	$(document).ready(function() {
		//사이드 메뉴 height조정
		let idxhdHeight = document.querySelector(".idxhd").getBoundingClientRect().height; //헤더 높이
		let idxbodyHeight = document.querySelector(".idxbody").getBoundingClientRect().height; //사이즈 돞이
		
		let ftHeight = $("footer").height();
		let bclHeight =document.querySelector(".bcl").getBoundingClientRect().height;
		console.log('bclHeight 전: '+ $(".bcl").height());
		
		let useHeight = idxhdHeight + idxbodyHeight; //가용 height값
		
		if(useHeight > bclHeight){
			$(".bcl").height(idxbodyHeight);
	// 		$("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
		}
		let bodyHeight =document.body.getBoundingClientRect().height;
		$(".idxbody").height(bodyHeight);
		
	});
</script>
<style>
* {
	box-sizing: border-box;
}
.fmcls{ width:100%; }
a{
	text-decoration: none !important;
    color: #f9f5f2 !important;
}
#b_cat, #b_status{
	margin:0;
}
</style>
<body>
		<div class="bcl">
			<div class="admin">
				<section class="header-container">
					<h3>자주 묻는 문의 상세</h3>
				</section>
			
			<section class="contents-container">
				<form class="fmcls" action="updateFaq.do" name="fm" method="post"
					enctype="multipart/form-data">
					<%--       	<span>${faq.b_title }</span> --%>
					<input type="hidden" id="num" name="num" value="${faq.b_num }">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">카테고리</span>
						</div>
						<select class="form-control" name="b_cat" id="b_cat">
							<!--       <select name="b_cat" id="b_cat" > -->
							<option value="메뉴"
								<c:if test="${faq.b_cat=='메뉴' }">selected</c:if>>메뉴</option>
							<option value="회원"
								<c:if test="${faq.b_cat=='회원' }">selected</c:if>>회원</option>
							<option value="배달"
								<c:if test="${faq.b_cat=='배달' }">selected</c:if>>배달</option>
							<option value="포인트"
								<c:if test="${faq.b_cat=='포인트' }">selected</c:if>>포인트</option>
						</select>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">제목</span>
						</div>
						<input type="text" class="form-control" id="b_title"
							name="b_title" value="${faq.b_title }">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">작성자</span>
						</div>
						<input type="text" class="form-control innm" id="b_nick"
							name="b_nick" value="${faq.b_nick }" readonly>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">내용</span>
						</div>
						<textarea class="form-control" rows="10" id="b_content"
							name="b_content">${faq.b_content }</textarea>
					</div>
					<div class="input-group mb-4">
						<div class="input-group-prepend">
							<span class="input-group-text">공개상태</span>
						</div>
						<%--       <textarea class="form-control" rows="2" id="b_status" name="b_status" >${faq.b_status }</textarea> --%>
						<select class="form-control" id="b_status" name="b_status">
							<option <c:if test="${faq.b_status=='공개' }">selected</c:if>>공개</option>
							<option <c:if test="${faq.b_status=='비공개' }">selected</c:if>>비공개</option>
						</select>
					</div>
					<div id="footer">
						<button id="conList" type="button" class="btn btn-primary">목록으로</button>
						<button id="conComplete" type="submit" class="btn btn-primary">수정하기</button>
						<button id="conFaqDel" type="button" class="btn btn-primary">삭제하기</button>
					</div>
				</form>
			</section>
			</div>
			</div>
<%@include file="../css/footer.jsp"%>
</body>

</html>