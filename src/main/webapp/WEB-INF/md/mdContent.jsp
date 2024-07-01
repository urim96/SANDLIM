<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/contentOdMyList.css">
<style>
	 #contentMargin{
              margin-bottom: 40px;
         }
</style>
 
  <div class="modal-dialog" id="subModal">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel1_2">영양정보 보기</h4>
        <button type="button" id="contentClose" class="close" onclick="subModalClose()">×</button>
      </div>
      <div class="modal-no"></div>
      <div class="modal-body">
      <div id="contentMargin">
       <div id="sizediv">
       <div id="sCT">
         <button type="button" id="sizeContent_T" class="sizeContent" onclick="sizeContent('Tall')">Tall</button>
        </div>
        <div id="sCG">
         <button type="button" id="sizeContent_G" class="sizeContent" onclick="sizeContent('Grande')">Grande</button>
         </div>
      </div>
         <div>
         <h3 id="content_Size"></h3>
         </div>
         <div class="hrdiv">
         <span>칼로리:</span><input type="text" id="content_Kcal" size="7" class="content" value="" readonly>
         </div>
         
         <div class="hrdiv">
         <span>탄수화물:</span><input type="text" id="content_CarBo" size="7" class="content" value="" readonly>
         </div>
         
         <div class="hrdiv">
         <span>당류:</span><input type="text" id="content_Sugar" size="7" class="content" value="" readonly>
         </div>
         
         <div class="hrdiv">
         <span>나트륨:</span><input type="text" id="content_Nat" size="7" class="content" value="" readonly>
         </div>
         
         <div class="hrdiv">
         <span>단백질:</span><input type="text" id="content_Pro" size="7" class="content" value="" readonly>
         </div>
         
         <div class="hrdiv">
         <span>지방:</span><input type="text" id="content_Fat" size="7" class="content" value="" readonly>
         </div>
         
         <div class="hrdiv">
         <span>포화지방:</span><input type="text" id="content_Sfat" size="7" class="content" value="" readonly >
         </div>
         
         <div class="hrdiv" id="cafedivHi">
         <span>카페인:</span><input type="text" id="content_Cafe" size="7" class="content" value="" readonly>
         </div>
      </div>
      </div>
    </div>
  </div>
</body>