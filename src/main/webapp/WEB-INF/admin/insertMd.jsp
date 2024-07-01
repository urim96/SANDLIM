<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="adminIndex.jsp" %>
<style>
.container-fluid{
margin-top: 5%;
}
a{
   text-decoration: none !important;
    color: #f9f5f2 !important ;
}
.mdins{
margin-right:0px;
}
input::placeholder{
color: darkgray;
font-size: smaller;
font-weight:nomal;
}
.input-group>.form-control{
    color: #5d5d5d;}

</style>

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
	$(".idxbody").height(bclHeight+100);

});
</script>
<body>
<div class = "bod">
<div class="bcl">
<div class="admin">
				<section class="header-container">
					<h3>상품 등록</h3>
				</section>

<div class="container-fluid">
  <form action="insertmd.san" method="post" enctype="multipart/form-data">
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">상품 번호</span>
      </div>
      <input type="number" class="form-control" name="m_no" value="${mdno}" placeholder="${mdno}" readonly>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">상품 이름</span>
      </div>
      <input type="text" class="form-control" name="m_name" placeholder="상품이름을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">파일 선택</span>
      </div>
      <input type="file" class="form-control innm" name="uploadfile">      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">상품 가격</span>
      </div>
      <input type="number" class="form-control" name="m_price" placeholder="상품가격을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">상품 설명</span>
      </div>
      <input type="text" class="form-control" name="m_content" placeholder="상품설명을 입력하세요." required>     
    </div>  
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">상품 키워드</span>
      </div>
 		 <select name="m_kind" class="form-control mdins">
		    <option value="커피" >커피</option>
		    <option value="논커피">논커피</option>
		    <option value="에이드">에이드</option>
		    <option value="프라페">프라페</option>
		    <option value="티">티</option>
		    <option value="디저트">디저트/원두</option>
		  </select>   
    </div>
            <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">HOT/ICE</span>
      </div>
 		 <select name="m_hi" class="form-control mdins">
		    <option value="HOT/ICE" >HOT/ICE</option>
		    <option value="HOT">HOT</option>
		    <option value="ICE">ICE</option>
		    <option value="-">-</option>
		  </select>   
    </div>
        <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">사이즈</span>
      </div>
 		 <select name="m_size" class="form-control mdins">
		    <option value="Tall" >Tall</option>
		    <option value="Grande">Grande</option>
		    <option value="-">-</option>
		  </select>   
    </div>
        <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">판매 상태</span>
      </div>
 		 <select name="m_state" class="form-control mdins">
		    <option value="판매가능" >판매가능</option>
		    <option value="품절">품절</option>
		  </select>   
    </div>
        <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">상품 추천</span>
      </div>
 		 <select name="m_sel" class="form-control mdins">
		    <option value="일반">일반 메뉴</option>
		    <option value="베스트">베스트 메뉴</option>
		  </select>   
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">탄수화물</span>
      </div>
      <input type="number" class="form-control" name="m_carbo" placeholder="탄수화물을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">당류</span>
      </div>
      <input type="number" class="form-control" name="m_sugar" placeholder="당류를 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">총 칼로리</span>
      </div>
      <input type="number" class="form-control" name="m_kcal" placeholder="총칼로리를 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">포화지방</span>
      </div>
      <input type="number" class="form-control" name="m_sfat" placeholder="포화지방을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">지방</span>
      </div>
      <input type="number" class="form-control" name="m_fat" placeholder="지방을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">나트륨</span>
      </div>
      <input type="number" class="form-control" name="m_nat" placeholder="나트륨을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">단백질</span>
      </div>
      <input type="number" class="form-control" name="m_pro" placeholder="단백질을 입력하세요." required>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">카페인</span>
      </div>
      <input type="number" class="form-control" name="m_cafe" placeholder="카페인을 입력하세요." required>      
    </div>

    <div id="footer">
	  	<button id="conComplete" type="submit" class="btn btn-primary">메뉴 등록</button>
	  	<button id="mdList" type="button" class="btn btn-primary" onclick="mdList()">메뉴 목록</button>
	 </div>
</form>
</div>
</div>
</div>
</div>
  <%@include file="../css/footer.jsp"%>
 </body>
</html>
