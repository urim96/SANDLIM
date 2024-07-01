<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../css/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/cartRoom.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<title>장바구니 페이지</title>
<script>
var chk = false;
$(document).ready(function(){
    $.ajax({
         url : "pay",
         type : "POST",
         success: function(data){
            let init = data.impKey;
            IMP.init(init);
         },error: function(){
            alert("실패");
         }
      });
var IMP = window.IMP;
// IMP.init('${impKey}');
var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
   
if(!isMobile) {
   //모바일이 아닌 경우 스크립트
   $("#check_module").click(function () {
      
         let o_toprice = $("#totalPayPrice").val();
         o_toprice =o_toprice.replace("원","").replace(",","");
      
         let o_address = $("#o_address").val();
         let o_id = $("#order_id").val();
         let o_phone = $("#o_phone").val();
         let o_email = $("#order_email").val();
         
      IMP.request_pay({
          pg:'danal_tpay', 
         pay_method: 'card',
         merchant_uid: 'merchant_' + new Date().getTime(),
         name: '주문명:결제테스트',
         amount: o_toprice,
         buyer_email: o_email,
         buyer_name:  o_id,
         buyer_tel: o_phone ,
         buyer_addr: o_address ,
         buyer_postcode: '123-456',
         }, function (rsp) {
            if (rsp.success) {
               $("#imp_uid").val(rsp.imp_uid);
               $("#merchant_uid").val(rsp.merchant_uid);
               chk = true;
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '\n에러내용 : ' + rsp.error_msg;
            }
            if(chk==true) {
             orderList();
            }
      });
   });
    
} else {
   $("#check_module").click(function () {
      
      let o_toprice = $("#totalPayPrice").val();
       o_toprice =o_toprice.replace("원","").replace(",","");
    
       let o_address = $("#o_address").val();
       let o_id = $("#order_id").val();
       let o_phone = $("#o_phone").val();
       let o_email = $("#order_email").val();
       
      IMP.request_pay({
          pg: 'danal_tpay',
         pay_method: 'card',
         merchant_uid: 'merchant_' + new Date().getTime(),
         name: '주문명:결제테스트',
 
         amount: o_toprice,
         buyer_email: o_email,
         buyer_name: o_id,
         buyer_tel: o_phone ,
         buyer_addr: o_address ,
         buyer_postcode: '123-456',
         m_redirect_url: 'http://localhost:8090/payments/complete',
         }, function (rsp) {
             if (rsp.success) {
                  $("#imp_uid").val(rsp.imp_uid);
                  $("#merchant_uid").val(rsp.merchant_uid);
                  chk = true;
               } else {
                  var msg = '결제에 실패하였습니다.';
                  msg += '\n에러내용 : ' + rsp.error_msg;
               }
               if(chk==true) {
                orderList();
               }
      });
   });
}  
});
//결제완료 서브밋
function orderList(){
   
   let merchant_uid = $("#merchant_uid").val();
   let o_toprice = $("#allTotalPrice").val();
   o_toprice =o_toprice.replace("원","").replace(",","");
   
      let o_buy = $('input[name=o_buy]:checked').val();
    let o_way = '카드결제';
    let o_id = $("#order_id").val();
    let o_usepoint = $("#usePoint").val();
    o_usepoint = parseInt(o_usepoint);
    let o_savepoint = "";
    let o_name = "";
    let o_num = "";
    let o_total = "";
    let name = document.getElementsByName("cartMenuName");
    let o_delivery = "";
    let o_phone = $("#o_phone").val();
    let o_size ="";
    let o_option ="";
    let o_eachprice = "";
    let o_address = "";
    if(o_usepoint <= 0 ){
       o_toprice = parseInt(o_toprice);
       o_savepoint = o_toprice * 0.1;
    }else if(o_usepoint >= 1){
       o_savepoint = 0;
    }
    if($("input:radio[name=o_buy]:checked").val()=='배달') {
             o_delivery = "3000";
             
             if($("input:radio[name=o_address]:checked").attr('id') === 'o_address'){
                o_address += $("#radioAddress").text()+", ";
                o_address += $("#radioAddress_2").text();
             }else if($("input:radio[name=o_address]:checked").attr('id') === 'plusAddressPost'){
                o_address += $("#radioAddress2").text()+", ";
                o_address += $("#radioAddress2_2").text();
             }else if($("input:radio[name=o_address]:checked").attr('id') === 'sub_address'){
                o_address += $("#radioAddress3").text()+", ";
                o_address += $("#radioAddress3_2").text();
             }else if($("input:radio[name=o_address]:checked").attr('id') === 'sub_address2'){
                o_address += $("#radioAddress4").text()+", ";
                o_address += $("#radioAddress4_2").text();
             }
             
      }else if($("input:radio[name=o_buy]:checked").val()=='픽업'){
            
             o_delivery = "0";
      }
    for (let i = 0; i < name.length; i++) {
        let oName = name[i].value;
        o_name += oName;
        if (i !== name.length - 1) {
            o_name += ", ";
        }
    }
    let num = document.getElementsByName("o_num");
    for(let i=0 ; i< num.length; i++){
       let oNum = num[i].value;
       o_num += oNum;
       if(i !== num.length -1){
          o_num += ", ";
       }
    }
    let price = document.getElementsByClassName("cartMenuPrice"); 
    for(let i=0; i< price.length; i++){
       let oPrice = price[i].value;
       o_total += oPrice;
       if(true){
          o_total += ", ";
       }
    }
    let option = document.getElementsByName("cartOption");
    for(let i =0; i<option.length; i++){
          let oOption = option[i].value;
          o_option += oOption;
           if(i !== num.length -1){
              o_option += ", ";
           }
        }
    let size = document.getElementsByName("cartSize");
    for(let i =0; i<size.length; i++){
          let oSize = size[i].value;
          o_size += oSize;
           if(i !== num.length -1){
              o_size += ", ";
           }
        }
    let eachPrice = document.getElementsByName("eachPrice");
    for(let i =0; i<eachPrice.length; i++){
          let oEachPrice = eachPrice[i].value;
          o_eachprice += oEachPrice;
           if(true){
              o_eachprice += ", ";
           }
        }
   let orderVal =  {   
      o_no : merchant_uid,
      o_id : o_id,
      o_name : o_name,
      o_num : o_num,
      o_total : o_total,
      o_toprice : o_toprice,
      o_way : o_way,
      o_usepoint : o_usepoint,
      o_savepoint : o_savepoint,
      o_buy : o_buy,
      o_address : o_address,
      o_phone : o_phone,
      o_delivery: o_delivery,
      o_option : o_option,
      o_size : o_size,
      o_eachprice : o_eachprice,
   }
   $.ajax({
      url : "putOder.san",
      type : "POST",
      data : orderVal,
      success: function(){
         let userList ={
            u_id : o_id,
         }
         $.ajax({
           url : "getUserPoint.san",
           type : "POST",
           data : userList,
           success: function(data){
              if(o_usepoint >= 1){ // 포인트 사용했을 때 차감
              let uPoint = data.u_point;
              uPoint = parseInt(uPoint);
              let lastPoint = uPoint - o_usepoint;
              let U_Point = {
                    u_id : o_id,
                    u_point : lastPoint
              }
              $.ajax({
                url : "updatePoint.san",
                type : "POST",
                data : U_Point,
                success: function(){
                   location.href="payList.san";
                },error: function(){
                }
              });
              }else if(o_usepoint <= 0){ // 포인트 사용 안했을 때 바로 전자영수증
                 location.href="payList.san";
              }
           },error: function(){
              alert("실패");
           }
         });
      },error: function(){
         
      }
   });
}
$(function(){
    $("#o_addressLabel4").css("display" , "none");
   $("#picUpLabel").css({"background-color" : "black" , "color" : "white"});
   $("#moveUpLabel").css({"background-color" : "white" , "color" : "black"});
   $("#reUsePoint").css("display", "none");
   $("#o_address4").css("display", "none");
   $("#o_address5").css("display", "none");
   $("#plusAddressPost2").css("display", "none");
   $("#address_plus").css("display", "none");
   $("#addressOk").css("display", "none");
   $("#o_address3").css("display", "none");
   $("#o_address2").css("display", "none");
   
   let buyWay = false;
   <% String userId = (String) session.getAttribute("userId");%>
   let userId = '<%= userId%>';
   let value = {
         u_id : userId
   }
   $.ajax({
      url : 'cartSelectUser.san',
      type : "POST",
      data : value,
   success: function(data){
      
    if(data.u_addr && data.u_addr !== ""){
       console.log("처음 데이터 넣음");
      $("#o_address").val(data.u_addr);
         let address_u = data.u_addr.split(",");
         for(let i = 0 ; i < address_u.length; i++){
            if(i == 0){
               $("#radioAddress").text(address_u[i]);
            }else if(i == 1){
               $("#radioAddress_2").text(address_u[i]);
            }
         }
    }else{
       $("#o_address2").css("display", "none");
    }
         if(data.u_addr2 && data.u_addr2 !== "" ){
              $("#sub_address").val(data.u_addr2);
              let address_u2 = data.u_addr2.split(",");
              for(let i = 0; i < address_u2.length; i++){
                  if(i === 0){
                      $("#radioAddress3").text(address_u2[i]);
                  } else if(i === 1){
                      $("#radioAddress3_2").text(address_u2[i]);
                  }
              }
          }else{
             $("#o_address4").css("display", "none");
          }
         
         if(data.u_addr3 && data.u_addr3 !== ""){
              $("#sub_address2").val(data.u_addr3);
              let address_u3 = data.u_addr3.split(",");
              for(let i = 0; i < address_u3.length; i++){
                  if(i === 0){
                      $("#radioAddress4").text(address_u3[i]);
                  } else if(i === 1){
                      $("#radioAddress4_2").text(address_u3[i]);
                  }
              }
          }else{
             $("#o_address5").css("display", "none");
          }
     
     $("#savePoint").val(data.u_point);
      $("#o_phone").val(data.u_phno);
      $("#order_email").val(data.u_email);
      $("#order_nick").text(data.u_nick);
      let totalPrice_2 = 0;
      let cartMenuPrice = document.getElementsByClassName("cartMenuPrice");
      for(let i = 0 ; i < cartMenuPrice.length; i++){
         let total = cartMenuPrice[i].value;
          total = total.replace("원","").replace("," , "");
         total = parseInt(total);
           if (!isNaN(total)) {
              totalPrice_2  += total;
             }
      }
      totalPrice_2 = totalPrice_2.toLocaleString();
      $("#allTotalPrice").val(totalPrice_2+"원");
      $("#payPrice").val(totalPrice_2+"원");
      $("#totalPayPrice").val(totalPrice_2+"원");
      $("#payPrice_2").val(totalPrice_2+"원");
      },error: function(){
         alert("실패");
      }
});
   
   $("input:radio[name=o_buy]").click(function(){
      
      if($("input:radio[name=o_buy]:checked").val()=='배달' && buyWay == false) {
         $("#plusPrice").val("+3,000원");
         $("#o_addressLabel").css("display", "inline-block");
         $("#picUpLabel").css({"background-color" : "white" , "color" : "black"});
         $("#moveUpLabel").css({"background-color" : "black" , "color" : "white"});
         
         
         if($("#o_address").val() != ""){
            console.log("주소 if문 ");
            $("#o_address2").css("display", "block");
            $("#o_addressLabel").css("display", "inline-block");
         }else{
            console.log("else문 ");
            $("#o_address2").css("display", "none");
         }
         
         /* address 에 데이터가 있으면 address 2번 보이기 */
         if($("#sub_address").val() != ""  && $("#sub_address").val() != " " ){
            $("#o_address4").css("display", "block");
            $("#o_addressLabel2").css("display", "inline-block");
         }else{
            $("#o_address4").css("display", "none");
         }
         
         /* address2 가 데이터가 있으면 address3 번 보이기 */
         if($("#sub_address2").val() != "" && $("#sub_address2").val() != " "){
            $("#o_address5").css("display", "block");
            $("#o_addressLabel3").css("display" ,"inline-block");
         }else{
            $("#o_address5").css("display", "none");
         }

         /*  추가주소 */
         if($("#radioAddress2").text() === ""){
            $("#address_plus").css("display", "inline-block");
            $("#plusAddressdiv").css("display", "block");
            
         }else{
            console.log("else문 안");
            $("#address_plus").css("display", "none");
            $("#o_address3").css("display", "block");
            $("#addressOk23").css("display", "inline-block");
            $("#o_addressLabel4").css("display", "inline-block");
            
         }
         
         let payPrice = $("#payPrice").val();
         payPrice = payPrice.replace("원","").replace("," , "");
         payPrice = parseInt(payPrice);
         
         let totalPayPrice = 3000 + payPrice;
         
         totalPayPrice = totalPayPrice.toLocaleString();
         $("#totalPayPrice").val(totalPayPrice+"원");
         
         buyWay = true;
      }else if($("input:radio[name=o_buy]:checked").val()=='픽업' && buyWay == true){
       $("#changeAddrBtn").css("display", "none");
        $("#addressOk23").css("display", "none");
         $("#changeAddrBtn").css("display", "none");  
         $("#changeAddrBtn2").css("display", "none");  
         $("#changeAddrBtn3").css("display", "none");  
         $("#changeAddrBtn4").css("display", "none");  
         $("#o_addressLabel4").css("display", "none");  
        $("#moveUpLabel").css({"background-color" : "white" , "color" : "black"});
        $("#picUpLabel").css({"background-color" : "black" , "color" : "white"});  
        $("#plusAddressPost2").css("display", "none");
        $("#addressOk").css("display", "none");
        $("#address_plus").css("display", "none");
        $("#o_address3").css("display", "none");
        $("#o_address2").css("display", "none");
        $("#o_address5").css("display", "none");
        $("#o_address4").css("display", "none");
         let totalPayPrice = $("#totalPayPrice").val();
         totalPayPrice = totalPayPrice.replace("원","").replace(",","");
         totalPayPrice = parseInt(totalPayPrice);
         totalPayPrice = totalPayPrice - 3000;
         
         totalPayPrice = totalPayPrice.toLocaleString();
         $("#totalPayPrice").val(totalPayPrice+"원");
         $("#plusPrice").val("+0");
         buyWay = false;
      }
      });
});
function cartAllDelete(){
   location.href="cartAllDelete.san";
}
</script>
</head>
<body>
<div id="maindivCR">   
<a href="selectList.san"><img id="backIcon" src="/resources/img/backIcon.png"></a>
<h2 id="receiptfont">장바구니</h2>
<div id="allMenuDelete">
<button type="button" id="CtAllDelBtn" onclick="cartAllDelete()">메뉴전체 삭제하기</button>
</div>
<hr id="hrId">
<form>
 <c:forEach items="${cartList}" var="cartMenu">
       <div class="heightdivim">
       <div class="hrdiv">
            <div class="floatimgdiv">
                  <img src="/resources/img/${cartMenu.c_img}"
                  alt="${cartMenu.c_img}" title="${cartMenu.c_img}"
                  style="width: 100px; height: 100px">
          </div>
          <div class="rightdivCl2">
          <div class="rightdivCl">
             <input type="text" name="cartMenuName" class="in_hidden" size="13" value="${cartMenu.c_name}">
             <button type="button" onclick="deleteMenu('${cartMenu.c_no}', '<%= userId%>')" class="x_button">x</button><br>
             <c:if test="${cartMenu.c_option == '-'}">
                        <input type="text" style="width:20px; text-align:center;" class="in_hidden" name="cartOption"  value="${cartMenu.c_option}" readonly/>/
                    </c:if>
            <c:if test="${cartMenu.c_option != '-'}">
                        <input type="text" style="width:33px; text-align:center;" class="in_hidden" name="cartOption"  value="${cartMenu.c_option}" readonly/>/
                    </c:if>
            <input type="text" style="width:60px;" class="in_hidden" name="cartSize" value="${cartMenu.c_size}" readonly>
            </div>
             <div class="rightdivCl rightdivCl3"  id="rightdivCl">
            <button type="button" class="toMiuPlusBtn" onclick="miu('${cartMenu.c_no}')">-</button>
            <input type="text" name="o_num" style="width:23px;"class="in_hidden" id="${cartMenu.c_no}" value="${cartMenu.c_total}" readonly>
            <input type="text" name="eachPrice" class="${cartMenu.c_no}" value='${cartMenu.c_price}' style="display:none;" readonly>
            <button type="button" class="toMiuPlusBtn" onclick="plus('${cartMenu.c_no}')">+</button>
            <input type="text" size="6" name="${cartMenu.c_no}" class="cartMenuPrice" value="${cartMenu.c_toprice}" readonly>
          </div>
          </div>      
         </div>
      
      </div><hr>
</c:forEach>
<div id="asosP">
       <div>
         총 가격 <input type="text" class="in_hidden" id="allTotalPrice" name="allTotalPrice" value="" readonly>
         </div>
         <div id="clearPoint">
         <div>
         보유 포인트 <input type="number" id="savePoint" name="savePoint" value="" readonly>
         </div>
          <div id="clearUPoint">
          <span id="spanusepoint">사용 포인트</span>
          <input type="text" size="8" name="o_usepoint" id="usePoint" value="0">
             <button type="button" id="reUsePoint" class="btnmargin" onclick="reUsePoint2()">수정</button>
          <button type="button" id="outpointbtn" class="btnmargin" onclick="outPoint()">적용</button><br>
      </div>
         </div>
         <div id="pointcontent">
            <span id="poContent">*포인트 사용 시 포인트는 적립되지 않습니다.</span>
         </div>
         <div id="clearpayPrice">
         결제 금액 <input type="text" size="8" class="in_hidden" id="payPrice" value="" readonly>
         </div>
         
</div><hr>
<div>

         <div id="takePhoneNum">
         연락처  <input type="text" name="o_phone" size="10" id="o_phone" value=""> 
         </div>
         <div id="pickaWay">
         <input type="radio" id="pickUp" name="o_buy" value="픽업" checked><label for="pickUp" id="picUpLabel">픽업</label>
         <input type="radio" id="moveUp" name="o_buy" value="배달"><label for="moveUp" id="moveUpLabel">배달</label>
         </div>
         
         <div id="o_address2" class="o_addressborderbottom">
         <input type="radio" name="o_address" id="o_address" class="in_hidden" value="" checked>
         <span id="radioAddress"></span><br>
         <span id="radioAddress_2"></span>
         <label for="o_address" id="o_addressLabel" class="o_addressLabelTo">
         선택
         </label>
         <button type="button" class="changeAddrBtn" id="changeAddrBtn" onclick="changeAddress('1')">변경</button>
         </div>
         
        <div id ="o_address4" class="o_addressborderbottom"> 
        <input type="radio" name="o_address" id="sub_address" value="">
        <span id="radioAddress3"></span><br>
        <span id="radioAddress3_2"></span>
        <label for="sub_address" id="o_addressLabel2" class="o_addressLabelTo">
        선택
        </label>
        <button type="button" class="changeAddrBtn" id="changeAddrBtn2" onclick="changeAddress('2')">변경</button>
        </div>
        
        <div id ="o_address5" class="o_addressborderbottom">
        <input type="radio" name="o_address" id="sub_address2" value="">
        <span id="radioAddress4"></span><br>
        <span id="radioAddress4_2"></span>
        <label for="sub_address2" id="o_addressLabel3" class="o_addressLabelTo">
        선택
        </label>
        <button type="button" class="changeAddrBtn" id="changeAddrBtn3" onclick="changeAddress('3')">변경</button>
        </div>
        
         <!-- 추가주소  -->
         <div id="o_address3" class="o_addressborderbottom">
            <input type="radio" class="in_hidden" id="plusAddressPost" name="o_address" value="" readonly>
            <span id="radioAddress2"></span><br>
            <span id="radioAddress2_2"></span>
            <label for="plusAddressPost" id="o_addressLabel4" class="o_addressLabelTo">
            선택
            </label> 
            <button type="button" class="changeAddrBtn" id="changeAddrBtn4" onclick="changeAddress('4')">변경</button>
            <input type="text" id="plusAddressPost2"  placeholder="상세주소를 입력해주세요">
            
         <button type="button" id="addressOk23" onclick="ChangeaddressOk()">수정</button>
         <button type="button" id="addressOk" onclick="addressOk2()">확인</button>
         
         </div>
         
         <div id="plusAddressdiv">
         <button type="button" id="address_plus"onclick="PlusAddress()">주소 추가</button>
         </div>
         
         <div>
         <input type="text" style="display:none" class="in_hidden" id="plusDetailAddress" maxlength="100" autocomplete="off" placeholder="상세주소">
         </div>
         
         <div id="payPrice2Di">
         결제 금액<input type="text" class="in_hidden" id="payPrice_2" size="8" value="" readonly>
         </div>
         <div id="pluspriceDi">
         추가 금액 <input type="text" class="in_hidden" id="plusPrice" value="+0" size="7">
         </div>
         <div id="totalPayPriceDi">
         총 결제금액 <input type="text" class="in_hidden" id="totalPayPrice" size="8" value="" readonly>
         </div>
         <hr id="hrJone">
         <div id="hiddenInput">
         <input type="text" class ="in_disno" id="order_id" value="<%= userId%>" readonly>
         <input type="text" class ="in_disno" id="order_email" value="" readonly>
         <input type="text" class ="in_disno" id="merchant_uid" value="">
         </div>
</div>
</form>
            <button id="check_module" type="button">주문하기</button>
</div>  
<script>


function changeAddress(val){
   let number = val;
   if(number == 1){
      $("#changeAddrBtn").css("display", "none");
      
      let o_addr2 = $("#radioAddress4").text().trim();
      if(o_addr2 != "" && o_addr2 != " "){
         
      $("#o_address5").css("display", "block");
      $("#o_addressLabel3").css("display", "inline-block");
      }
        
      let o_addr4 = $("#radioAddress3").text().trim();
      if(o_addr4 != "" && o_addr4 != " "){
      $("#o_address4").css("display", "block");
      $("#o_addressLabel2").css("display", "inline-block");
      }
      
      let o_addr3 = $("#radioAddress2").text().trim();
      if(o_addr3 != "" && o_addr3 != " "){
      $("#o_address3").css("display", "block");
      $("#o_addressLabel4").css("display", "inline-block");
      }
      
      let o_addr = $("#radioAddress").text().trim();
      if(o_addr != "" && o_addr != " "){
         $("#o_address2").css("display", "block");
          $("#o_addressLabel").css("display", "inline-block");
      }
   }else if(number == 2){
      $("#changeAddrBtn2").css("display", "none");
      
      let o_addr2 = $("#radioAddress4").text().trim();
      if(o_addr2 != "" && o_addr2 != " "){
      $("#o_address5").css("display", "block");
      $("#o_addressLabel3").css("display", "inline-block");
      }
        
      let o_addr4 = $("#radioAddress3").text().trim();
      if(o_addr4 != "" && o_addr4 != " "){
      $("#o_address4").css("display", "block");
      $("#o_addressLabel2").css("display", "inline-block");
      }
      
      let o_addr3 = $("#radioAddress2").text().trim();
      if(o_addr3 != "" && o_addr3 != " "){
      $("#o_address3").css("display", "block");
      $("#o_addressLabel4").css("display", "inline-block");
      }
      
      let o_addr = $("#radioAddress").text().trim();
      if(o_addr != "" && o_addr != " "){
         $("#o_address2").css("display", "block");
          $("#o_addressLabel").css("display", "inline-block");
      }
      
   }else if(number == 3){
      $("#changeAddrBtn3").css("display", "none");
      
      let o_addr2 = $("#radioAddress4").text().trim();
      if(o_addr2 !== "" && o_addr2 !== " "){
      $("#o_address5").css("display", "block");
      $("#o_addressLabel3").css("display", "inline-block");
      }
        
      let o_addr4 = $("#radioAddress3").text().trim();
      if(o_addr4 !== "" && o_addr4 !== " "){
      $("#o_address4").css("display", "block");
      $("#o_addressLabel2").css("display", "inline-block");
      }
      
      let o_addr3 = $("#radioAddress2").text().trim();
      if(o_addr3 !== "" && o_addr3 !== " "){
      $("#o_address3").css("display", "block");
      $("#o_addressLabel4").css("display", "inline-block");
      }
      
      let o_addr = $("#radioAddress").text().trim();
      if(o_addr != "" && o_addr != " "){
         $("#o_address2").css("display", "block");
          $("#o_addressLabel").css("display", "inline-block");
      }
      
   }else if(number == 4){
      $("#changeAddrBtn4").css("display", "none");
      
      let o_addr2 = $("#radioAddress4").text().trim();
      if(o_addr2 !== ""){
      $("#o_address5").css("display", "block");
      $("#o_addressLabel3").css("display", "inline-block");
      }
        
      let o_addr4 = $("#radioAddress3").text().trim();
      if(o_addr4 !== ""){
      $("#o_address4").css("display", "block");
      $("#o_addressLabel2").css("display", "inline-block");
      }
      
      
      let o_addr3 = $("#radioAddress2").text().trim();
      if(o_addr3 !== ""){
      $("#o_address3").css("display", "block");
      $("#o_addressLabel4").css("display", "inline-block");
      }
      
      let o_addr = $("#radioAddress").text().trim();
      if(o_addr != "" && o_addr != " "){
         $("#o_address2").css("display", "block");
          $("#o_addressLabel").css("display", "inline-block");
      }
   }
}
document.getElementById("o_addressLabel").addEventListener("click", function() {
   $("#o_address3").css("display","none");
   $("#o_address4").css("display","none");
   $("#o_address5").css("display","none");
   $("#o_addressLabel").css("display","none");
   $("#changeAddrBtn2").css("display", "none");
   $("#changeAddrBtn3").css("display", "none");
   $("#changeAddrBtn4").css("display", "none");
   $("#changeAddrBtn").css("display", "block");
});
document.getElementById("o_addressLabel2").addEventListener("click", function() {
   $("#o_address4").css("display","block");
   $("#o_address2").css("display","none");
   $("#o_address3").css("display","none");
   $("#o_address5").css("display","none");
   $("#o_addressLabel2").css("display","none");
   $("#changeAddrBtn").css("display", "none");
   $("#changeAddrBt3").css("display", "none");
   $("#changeAddrBtn2").css("display", "block");
});
document.getElementById("o_addressLabel3").addEventListener("click", function() {
   $("#o_address4").css("display","none");
   $("#o_address2").css("display","none");
   $("#o_address3").css("display","none");
   $("#o_address5").css("display","block");
   $("#o_addressLabel3").css("display","none");
   $("#changeAddrBtn").css("display","none");
   $("#changeAddrBtn2").css("display","none");
   $("#changeAddrBtn3").css("display", "block");
});
document.getElementById("o_addressLabel4").addEventListener("click", function() {
   $("#o_address2").css("display","none");
   $("#o_address4").css("display","none");
   $("#o_address5").css("display","none");
   $("#o_address3").css("display","block");
   $("#o_addressLabel4").css("display","none");
   $("#changeAddrBtn").css("display","none");
   $("#changeAddrBtn2").css("display","none");
   $("#changeAddrBtn3").css("display", "none");
   $("#changeAddrBtn4").css("display", "block");
   
});

//결제창에서 주소 추가 후 상세주소 입력후 확인버튼
function addressOk2(){
      let r_address = $("#radioAddress2").text();
      let e_address = $("#plusAddressPost2").val();
      
      $("#radioAddress2").text(r_address);
      $("#radioAddress2_2").text(e_address);
      $("#plusAddressPost2").css("display" , "none");
      $("#addressOk").css("display" , "none");
      $("#o_addressLabel4").css("display" , "inline-block");
      $("#addressOk23").css("display" , "inline-block");
   }
   
   // 결제창에서 주소 추가 
   function PlusAddress() {
      new daum.Postcode({
         oncomplete : function(data) {
            var addr = data.userSelectedType === 'R' ? data.roadAddress
                  : data.jibunAddress;
            var detailAddress = document
                  .getElementById("plusDetailAddress").value;
            var fullAddress = data.zonecode + ' ' + addr;
            
            if (detailAddress) {
               fullAddress += ', ' + detailAddress;
            }
         $("#radioAddress2_2").text("");  
         let toaddr =  "("+data.zonecode+")"+addr;
         document.getElementById('plusAddressPost').value = toaddr;
         $("#radioAddress2").text(toaddr);

         $("#address_plus").css("display", "none");
         $("#o_address3").css("display", "block");
         $("#addressOk").css("display", "inline-block");
         $("#plusAddressPost2").css("display", "inline-block");
         $("#plusAddressPost2").val("");
      }
   }).open();
}
   /* 수정 */
   function ChangeaddressOk() {
      $("#radioAddress2_2").text("");
      $("#o_addressLabel4").css("display" , "none");
      $("#changeAddrBtn4").css("display" , "none");
      new daum.Postcode({
         oncomplete : function(data) {
            var addr = data.userSelectedType === 'R' ? data.roadAddress
                  : data.jibunAddress;
            var detailAddress = document
                  .getElementById("plusDetailAddress").value;
            var fullAddress = data.zonecode + ' ' + addr;
            
            if (detailAddress) {
               fullAddress += ', ' + detailAddress;
            }
         $("#radioAddress2_2").text("");  
         let toaddr =  "("+data.zonecode+")"+addr;
         document.getElementById('plusAddressPost').value = toaddr;
         $("#radioAddress2").text(toaddr);
         $("#address_plus").css("display", "none");
         $("#o_address3").css("display", "block");
         $("#addressOk").css("display", "inline-block");
         $("#plusAddressPost2").css("display", "inline-block");
         $("#plusAddressPost2").val("");
         $("#addressOk23").css("display" , "none");
         
      }
   }).open();
}
</script>
<%@include file="../css/footer.jsp"%>
</html>