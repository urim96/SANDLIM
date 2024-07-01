<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.one.view.controller.UserController" %>
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/getMdpayodAll.css">

<%
   String id = (String) session.getAttribute("userId");
%>
  <div class="modal-dialog" id="mainModal">
    <div class="modal-content" >
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel1">메뉴 상세</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="mainModalClose()">×</button>
      </div>
      <div class="modal-body">
      <div>
            <img id="Mdimg" style="width: 100%; height: 340px;">
            <input type="text" class="in_hidden" value="" id="getKind">
            <input type="text" class="in_hidden" id="getName" name="getName" value="" readonly>
            <input type="text" id="getPrice_hide" value="" style="display:none;">
            <input type="text" id="getMenuState" value="" style="display:none;">
            <p id="getContent"></p>
            
         <div id="getPriceLeftText">
            <input type="text" size="6" class="in_hidden" id="getPrice" name="getPrice" value="" readonly>
         </div>
            <div id="getPriceRightText">
               <button type="button" id="contentList" onclick="content()">영양정보</button>
            </div>
            
         <div id="selectSize">
            <input type="radio" id="HOT" name="opt" value="HOT" checked><label for="HOT" id="label_HOT">HOT</label> 
            <input type="radio" id="ICE" name="opt" value="ICE"><label for="ICE" id="label_ICE">ICE</label>
            </div>
            <!-- 온리 아이스일때 파르페, 에이드 -->
          <div id="selectSize2">
            <input type="radio" id="ICE2" name="opt2" value="ICE" checked><label for="ICE2" id="label2_ICE">ONLY ICE</label>
            </div>
            
          <div id="selectOption">
            <input type="radio" id="Tall" name="sel" value="Tall" checked><label for="Tall" id="label_Tall">Tall</label>
            <input type="radio" id="Grande" name="sel" value="Grande"><label for="Grande" id="label_Grande">Grande</label>
          </div> 
            <div id="d_totalprice" <c:if test="${(userStatus eq '관리자')}">hidden</c:if> >
            <button type="button" class="tomiPlbtn" onclick="toMiu()">-</button>
            <input type="text" size="2" class="in_hidden" name="c_total" value="1" id="total" readonly>
            <button type="button" class="tomiPlbtn" onclick="toPlus()">+</button>
            </div>
            <div id="d_totalprice_2" <c:if test="${(userStatus eq '관리자')}">hidden</c:if> >
            <input id="totalprice" size="7" class="in_hidden" value="" readonly>
            </div>
            <div id="cart_insertDiv" <c:if test="${(userStatus eq '관리자')}">hidden</c:if>>
            <button type="button" id="cart_insert" onclick="cartInsert('<%= id%>')">장바구니 담기</button>
            </div>
            
           <div class="action-sheet" id="actionSheet" onclick="CloseSheet()">
                 <div class="action-options">
                    <div id="cartInsertOk">장바구니에 추가되었습니다.</div>
                       <div id="MoveInsertCart">
                            <button id="otherMenu" onclick="othermenu()">다른 메뉴 더보기</button>
                            <button id="ctMove" onclick="cartMove()">장바구니 이동</button>
                     </div>
                  <div id="closeShtDi">
                        <button id="closeSh" onclick="CloseSheet()">Close</button>
                     </div>
                 </div>
           </div>
            </div></div></div>
     </div>

<div id="mdContent" tabindex="-1">
<%@ include file='mdContent.jsp' %>
</div>