<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../css/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>결제</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/getMdpayodAll.css">
<script>
$(document).ready(function(){
   $("#hiddenReceipt").css("display" , "none");
   $("#slideReceipt").css("display" , "none");
    let orderNo = '<%= session.getAttribute("oderNo") %>';
    let value = {
       o_no : orderNo
    }
    $.ajax({
       url : "receipt.san",
       type : "POST",
       data : value,
       success: function(data){
          $("#divaddressYN").css("display", "none");
           $("#addressH2").text("");
           
           if(data.o_address != ''){
           $("#divaddressYN").css("display", "block");
           $("#addressH2").text("주소: "+data.o_address);               
           }
            let o_no = data.o_no;
            o_no = o_no.substring("merchant_".length);
            $("#o_noP2").text(o_no); // 주문번호
            $("#spanNumber").text(o_no);
            let o_name = data.o_name; // 상품 명
            let o_total = data.o_total; // 주문 갯수의 총 가격
            let o_num = data.o_num; // 주문 갯수 각각의
            let o_size = data.o_size; // tall grande
            let o_option = data.o_option; // hot ice
            let o_eachPrice = data.o_eachprice; // 상품의 1개당 가격
            let o_toprice = data.o_toprice; // 총 금액
            let o_toprice2 = data.o_toprice; // 총 금액
            o_toprice2 = parseInt(o_toprice2); // 총 금액
            o_toprice = parseInt(o_toprice); // 총 금액
            let o_usePoint = data.o_usepoint;  // 사용 포인트
            o_usePoint = parseInt(o_usePoint); // 사용 포인트
            o_usePoint2 = parseInt(o_usePoint); // 사용 포인트
            let o_savePoint = data.o_savepoint;
            let totalPayPrice = o_toprice - o_usePoint; // 결제 금액 총 금액 - 포인트 금액
            let o_delivery = data.o_delivery; 
            let o_date = data.o_date;
            o_toprice = o_toprice.toLocaleString();  // 총금액 => 배달비 뺀 가격
            o_usePoint = o_usePoint.toLocaleString(); // 사용 포인트
            o_delivery = parseInt(o_delivery); // 배달 비용
            
            let each_name = o_name.split(',');
            let each_num = o_num.split(','); // 갯수
            let each_size = o_size.split(','); // tall/ grande
            let each_option = o_option.split(','); // hot/ ice
            let each_total = o_total.split('원,'); // 개당 가격
            let each_eachPrice = o_eachPrice.split('원,');
            let table = "";
            $("#table_tbody").empty(); // 기존 테이블 데이터 삭제
            for(let i =0 ; i < each_num.length ; i++){
               
               // 상품이름, 기존가격, 갯수 , 총 가격
               table += "<tr><td>"+each_name[i]+"</td><td class='option_margin'>"+each_option[i]+"</td><td>"+each_size[i]+"</td><td>"+each_eachPrice[i]+"원</td><td>"+each_num[i]+"</td><td>"+each_total[i]+"원</td></tr>"
            }
            if(o_delivery === 3000){
               $("#deliveryblock").css("display", "block");
               $("#delivery").text("+3,000원");
               if(o_usePoint2 <= 0){
               o_toprice_2 = o_toprice2 + 3000;  // => 포인트를 뺀 총 금액과 배달비 합친 가격
               o_toprice_2 = o_toprice_2.toLocaleString();
               $("#span_totalPayPrice").text(o_toprice_2+"원");
               }else if(o_usePoint2 > 0){
                  let o_toprice2_2 = totalPayPrice + 3000;
                  o_toprice2_2 = o_toprice2_2.toLocaleString();
                   $("#span_totalPayPrice").text(o_toprice2_2+"원");
               }
            }else{
               if(o_usePoint2 <= 0){
               let o_toprice_3 = o_toprice2.toLocaleString(); // 포인트를 뺀 가격
               $("#span_totalPayPrice").text(o_toprice_3+"원");
               }else if(o_usePoint2 > 0){
               let o_toprice2_2 = totalPayPrice.toLocaleString();
               $("#span_totalPayPrice").text(o_toprice2_2+"원");
               }
            }
            o_savePoint = o_savePoint.toLocaleString();
            $("#table_tbody").append(table);
            $("#span_totalPrice").text(o_toprice+"원");
            $("#span_usePoint").text(o_usePoint+"원");
            $("#span_savePoint").text(o_savePoint+"원");
            $("#orderDate").text(o_date);
         },error: function(){
            alert("실패");
         }
    });
 });
 function addLookReceipt(){ /* 펼치기 */
    $("#hiddenReceipt").css("display" , "block");
    $("#slideReceipt").css("display" , "block");
    $("#LookReceipt").css("display" , "none");
    $("#o_receipt").css("border-bottom" , "1px solid rgba(0,0,0,0.2)");
 }
 function slideReceipt(){ /* 접기  */
    $("#hiddenReceipt").css("display" , "none");
    $("#slideReceipt").css("display" , "none");
    $("#LookReceipt").css("display" , "block");
    $("#o_receipt").css("border-bottom" , "1px dashed rgba(0,0,0,0.2);");
 }
 function goMyOrderList(){
   location.href="odMyList.san"; 
 }
</script>
<style>
   #odThank{
      margin-top: 50px;
   }
   #LookReceipt, #slideReceipt{
         margin-bottom: 80px;
   }
</style>
<body>

<div id="odThank">
   <p class="odTh">주문이 완료되었습니다.</p>
   <p class="odTh">감사합니다.</p>
   <button type="button" id="goMyOdList" onclick="goMyOrderList()">나의 주문현황 바로가기</button>
</div>
<div id = "o_receipt">
<div style="text-align:center;">
   <img id="img_logo" src ="/resources/img/logo.png" title="logo" alt="logo">
   <p id="receiptFontSize">전자 영수증</p>
</div>
   <div class="small_ad">
         <small>안양123번가</small>
   </div>
   <div class="small_ad">
         <small>TEL: 031-000-0000</small>
   </div>
   <div id="smalladdott" class="small_ad">
         <small id="address">위치: 경기도 안양시 123번가 산들1동 101호(산들림)</small>
   </div>      
   <div class="small_ad_dotted">
   </div>   
   
   <p class="P_center" id="o_noP1">주문 번호</p>
   <p class="P_center" id="o_noP2"></p>
   <div class="small_ad_dotted">
   </div>
   
   <!-- 더보기 할때 쓰기 -->
   <div id="hiddenReceipt">
   
   <div id="divaddressYN"> 
   <p id="addressH2"></p>
   <div class="small_ad_dotted">
   </div>
   </div>
   
   <table id="table_size">
   <thead id="thead_fsize">
      <tr>
      <th>메뉴</th>
      <th>Option</th>
      <th>Size</th>
      <th>가격</th>
      <th id="totalth">수량</th>
      <th>총 가격</th>
      </tr>
   </thead>
   <tbody id="table_tbody">
   </tbody>
   </table>
   <div id="font_size_to">
   <div class="receipt_margin" id="receipt_margin">총금액 
   <span class="span_receipt_margin floatrightPay" id="span_totalPrice"></span>
   </div>
   
   <div class="small_ad_dotted">
   </div>
   
   <div class="receipt_margin" id="receipt_Point">포인트 
   <span class="span_receipt_margin floatrightPay" id="span_usePoint"></span>
   </div>
   
   <div class="small_ad_dotted">
   </div>
   
   <div class="receipt_margin" id="deliveryblock">배달비용
   <span id="delivery" class="floatrightPay"></span>
   </div>
   
   <div class="receipt_margin" id="receipt_Price">결제금액
   <span id="span_totalPayPrice" class="floatrightPay"></span>
   </div>
   
   <div class="small_ad_dotted">
   </div>
   
   <div class="receipt_margin" id="receipt_savePoint">적립금 
   <span class="span_receipt_margin floatrightPay" id="span_savePoint"></span>
   </div>
   
    <div class="small_ad_dotted">
   </div>
   <p id="orderDate"></p>
   
   <div id="barcode_margin">
   <img id="barcode" src ="/resources/img/barcode2.jpg" title="barcode" alt="barcode">
   </div>
   <div id="divNumber">
         <span id="spanNumber"></span>
   </div>
   </div>
</div> <!-- 전체 디브 끝나는곳  -->
</div> <!-- 더보기 끝나는곳 -->
<div id="LookReceipt">
<button type="button" class="ReceiptbtnWH" id="addLookBtn" onclick="addLookReceipt()">더보기<img id="arrow_down" src="/resources/img/arrow-down.svg" title="arrow_down"></button>
</div>
<div id="slideReceipt">
<button type="button" class="ReceiptbtnWH"  id="slideLookBtn" onclick="slideReceipt()">접기<img id="arrow_up" src="/resources/img/arrow-up.svg" title="arrow_up"></button>
</div>
  <%@include file="../css/footer.jsp"%>
</body>
</html>