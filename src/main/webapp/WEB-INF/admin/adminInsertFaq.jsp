<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="adminIndex.jsp" %>
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
// 		$("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
	}
	let bodyHeight =document.body.getBoundingClientRect().height;
	$(".idxbody").height(bclHeight);
// 	$(".bcl").height(bodyHeight-65.59);
	
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
<style>
.frmcls{width:100%}
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
					<h3>자주 묻는 문의 등록</h3>
				</section>
				
<section class="container-flui">
  <form class="frmcls" action="insertFaq.do" method="post" enctype="multipart/form-data">
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">카테고리</span>
      </div>
      <select class="form-control" name="b_cat" id="b_cat">
      	<option value="메뉴">메뉴</option>
      	<option value="회원">회원</option>   
      	<option value="배달">배달</option>
      	<option value="포인트">포인트</option>
      </select>
      	
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" name="b_title" placeholder="제목을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">작성자</span>
      </div>
      <input type="text" class="form-control innm" name="b_nick" value="관리자" readonly>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control" rows="10" id="b_comment" name="b_content"></textarea>      
    </div>  
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">공개상태</span>
      </div>
      <select class="form-control" id="b_status" name="b_status">
      	<option value="공개">공개</option>
      	<option value="비공개">비공개</option>
      </select>      
    </div>  
    <div id="footer">
        <button id="conComplete" type="submit" class="btn btn-primary">등록하기</button>
        <button id="conList" type="button" class="btn btn-primary">목록으로</button>
    </div>
  </form>  
</section>
</div>
</div>
<%@include file="../css/footer.jsp"%>
</body>

</html>