<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>결제</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<style>
.modal-content {
    max-height: calc(80vh - 100px);
    overflow-y: auto;
    -ms-overflow-style: none; 
    scrollbar-width: none; 
   height: 500px;
   min-height: 100%;
   border-radius: 0; 
}
.modal-content::-webkit-scrollbar {
    display: none; 
}
.modal-dialog{
  width: 100%;
  height: 600px;
  margin: 0;
  padding: 0;
}
#o_noH3{
   margin-top: 15px !important;
   margin-bottom: 15px !important;
}
.modal-content.h2, h2 {
    font-size: 1.5rem;
    }

.modal-content .h3_center  {
    text-align: center;
    font-size: 18px;
    }
#o_receipt{
   width: 100%;
   margin:0 auto;
   margin-bottom : 70px;
   margin-top: 50px;
   border:1px solid rgba(0,0,0,0.2);
}   
#img_logo{
   margin-top : 20px;
   width: 200px;
   height: 40px;
}
.p_dash{
   padding: 0 15px;
}
.h3_center{
   text-align: center;
}
 #orderDate{
    text-align: right;
    margin-right: 8px;
    font-size: 15px;
 }
.modal-content td{
 text-align: center;
 font-size: 14px;
  padding: 0px !important;
}
.modal-content th {
    padding: 3px 0px !important;
    font-size: smaller;
    }
#table_size{
   width: 100%;
   margin-top: 20px;
   border-collapse: separate;
   margin-bottom: 30px;
}
#receipt_margin{
   margin-top: 20px;
}
#receipt_Price, #deliveryblock, #receipt_margin, #receipt_Point, #receipt_savePoint {
    flex-direction: row;
    flex-wrap: wrap;
    align-items: center;
    font-size: smaller;
    margin-left: 12px;
}
.receipt_margin{
   margin-top : 15px;
}
#addressH2{
   font-size: 12px;
   margin-bottom: 6px;
}
#deliveryblock{
   display:none;
}
#barcode{
   width: 260px;
   height: 100px;
}

#barcode_margin{
   text-align:center;
   margin-top: 10px;
   margin-bottom: 10px;
}
.small_ad_dotted{
   margin: 10px 12px 12px 12px;
   border-bottom:1px dotted black;
}
#smalladdott{
   margin-bottom : 12px;
}
.small_ad, #addressH2{
   margin-left: 12px;
}
#thead_fsize{
   color: black;
   font-size: 17px;
   text-align: center;
}
#o_noP2{
   margin-bottom: 15px;
}
.floatrightPay{
   margin-right: 8px;
}
#divNumber{
text-align: center;
margin-bottom: 20px;
}
#back .close {
margin : 20px 15px 0px 0px;
}
    .modal-footer {
    justify-content: center;
    }
    #thead_fsize th{
       border:none !important;
    }
.small_ad_dotted, .receipt_margin{
clear: both;
}   
.floatrightPay{
   float: right;
}
</style>
<body>
<div class="modal-dialog modal-lg">
   <div class="modal-content">
<div id="back">
<button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
</div>
<div id = "o_receipt">
<div style="text-align:center;">
   <img id="img_logo" src ="/resources/img/logo.png" title="logo" alt="logo">
   <h2>전자 영수증</h2>
</div>
   <div class="small_ad">
         <small>TEL: 031-000-0000</small>
   </div>
   <div id="smalladdott" class="small_ad">
         <small id="address">위치: 경기도 안양시 123번가 산들1동 101호(산들림)</small>
   </div>      
   <div class="small_ad_dotted">
   </div>   
   
   <h3 class="h3_center" id="o_noH3">주문 번호</h3>
  <h4 class="h3_center" id="o_noP2"></h4>
   <div class="small_ad_dotted">
   </div>
   <div id="adhs2">
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
      <th>수량</th>
      <th>총 가격</th>
      </tr>
   </thead>
   <tbody id="table_tbody">
   </tbody>
   </table>
   
   <div class="receipt_margin" id="receipt_margin">총금액 
   <span class="floatrightPay" id="span_totalPrice"></span>
   </div>
   
   <div class="small_ad_dotted">
   </div>
   
   <div class="receipt_margin" id="receipt_Point">포인트 
   <span class="floatrightPay" id="span_usePoint"></span>
   </div>
   
   <div class="small_ad_dotted">
   </div>
   
   <div class="receipt_margin" id="deliveryblock">배달비
   <span id="delivery" class="floatrightPay"></span>
   </div>
   
   <div class="receipt_margin" id="receipt_Price">결제액
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
      <div id="divNumber">
         <span id="spanNumber"></span>
   </div>
   </div>
   </div>
   </div>
</div>
</body>
</html>