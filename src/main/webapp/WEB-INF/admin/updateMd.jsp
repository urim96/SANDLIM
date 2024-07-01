<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.modal-footer{
    justify-content: center;
}
.modal-title {
    margin-left: 0px;
}
</style>
<div class="modal-dialog">
	    
	<div class="modal-content">
		      
		<div class="modal-header">
			        
			<h4 class="modal-title" id="myModalLabel">메뉴 수정</h4>
			      
		</div>
		<div class="modal-no"></div>
		        
		<form action="updateMd.san" method="POST" enctype="multipart/form-data">
			      
			<div class="modal-body">
				<div id="update_pop_up">

					<div class="inputs">
						<label for="no_input" class="labelp">상품 번호
						<input type="text" id="no_input" class="form-control" name="m_no" value="" readonly>
						</label>
					</div>
					
					<div class="inputs">
						<label for="name_input" class="labelp">상품 이름 
						<input type="text" id="name_input" class="form-control" name="m_name" value="" required>
						</label>
					</div>

					 <div class="inputs">
					 <p id="firstimg">기존 이미지 <span id="imgchange" style="margin-left: 44px;">
					  <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8"/>
</svg> <span style="margin-left: 50px;">변경 이미지</span> </span></p>
					     <img id="img_input"> 
					     <div id="image_container"></div>
					      <input type="text" id="img2_input" class="form-control" name="m_img" value="">   
					     <label for="img_input" class="labelp"> 이미지 파일 선택
					      <input type="file" id="img1_input" class="form-control innm" name="uploadfile"  accept="image/*" onchange="newimg(event)"> 
					      </label>
					 </div>

					<div class="inputs">
						<label for="price_input" class="labelp">상품 가격 
						<input type="number" id="price_input" class="form-control" name="m_price" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="content_input" class="labelp">상품 설명 
						<input type="text" id="content_input" class="form-control" name="m_content" value="" required>
						</label>
					</div>

					<div class="inputs">
						<p class="labelp">상품 키워드</p>
						<select name="m_kind" class="form-control" id="keyword_input">
							<option value="커피">커피</option>
							<option value="논커피">논커피</option>
							<option value="에이드">에이드</option>
							<option value="프라페">프라페</option>
							<option value="티">티</option>
							<option value="디저트">디저트/원두</option>
						</select>
					</div>

					<div class="inputs">
						<label for="carbo_input" class="labelp">탄수화물
						<input type="number" id="carbo_input" class="form-control" name="m_carbo" value="" required>
						</label>
					</div>
					
					<div class="inputs">
						<label for="sugar_input" class="labelp">당 
						<input type="number" id="sugar_input" class="form-control" name="m_sugar" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="sfat_input" class="labelp">포화 지방 
						<input type="number" id="sfat_input" class="form-control" name="m_sfat" value="" required>
						</label>
					</div>
					
					<div class="inputs">
						<label for="fat_input" class="labelp">지방 
						<input type="number" id="fat_input" class="form-control" name="m_fat" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="na_input" class="labelp">나트륨 
						<input type="number" id="na_input" class="form-control" name="m_nat" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="protin_input" class="labelp">단백질 
						<input type="number" id="protin_input" class="form-control" name="m_pro" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="cof_input" class="labelp">카페인 
						<input type="number" id="cof_input" class="form-control" name="m_cafe" value="" required>
						</label>
					</div>

					<div class="inputs">
						<label for="cal_input" class="labelp">칼로리 
						<input type="number" id="cal_input" class="form-control" name="m_kcal" value="" required>
						</label>
					</div>

					<div class="inputs">
						<p class="labelp">추천 여부</p>
						<select name="m_sel" class="form-control" id="best_input">
							<option value="일반">일반 메뉴</option>
							<option value="베스트">베스트 메뉴</option>
						</select>
					</div>
					
					<div class="inputs">
						<p class="labelp">메뉴 상태 변경</p>
						<select name="m_state" class="form-control" id="state_input">
							<option value="판매가능">판매가능</option>
							<option value="품절">품절</option>
							<option value="판매종료">판매종료</option>
						</select>
					</div>
				
				</div>
			</div>
			      
			<div class="modal-footer">
				<button type="button" class="btn" id="mddelete">메뉴 삭제</button>
				<button type="submit" class="btn" id="update">수정완료</button>
				<button type="button" class="btn" data-dismiss="modal" onclick="delimg()">취소</button>
			</div>
		</form>
		    
	</div>
	  
</div>
