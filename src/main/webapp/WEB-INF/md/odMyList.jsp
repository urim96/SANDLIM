<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../css/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/contentOdMyList.css"> 
<title>Insert title here</title>
<script>
function letgoMenu(){
   location.href="selectList.san";
}
</script>
<style>
#ListAllDiv{
  min-height: 1070px;
  margin-bottom: -165px;
}
#ListAll_22{
   margin-top: 60px;
}
</style>
</head>
<body>

 <div id="ListAllDiv">
 <div id="ListAll_22">
      <section class="header-container">
         <p id="orderListP_L">진행중인 주문내역</p>
      </section>
   <table class="table table-hover" id="ListAllThP">
      <thead>
         <tr>
            <th id="orderDate_th">주문날짜</th>
            <th>주문상품</th>
            <th>결제금액</th> 
            <th>상세보기</th> 
            <th id="orderStatus_th">주문상태</th>
            <th>취소</th>
         </tr>
      </thead>
      <tbody id="ListAllThB">
   <c:forEach items="${odMyList}" var="oml">
      <c:choose>
      <c:when test="${oml.o_state != '완료' && oml.o_state != '취소'}">
      
         <tr>
            <td>${oml.o_date}</td>
            <td> ${oml.o_name.split(',')[0].trim()}  ... </td>
            <td>${oml.o_toprice}</td>
            <td><button type="button" class="btn" data-toggle="modal" data-target="#payModal" onclick="paymo('${oml.o_no}')">전자영수증</button></td>
            <td id="status_${oml.o_no}"><c:choose>
                  
                     <c:when test="${oml.o_state eq '주문진행중'}">
                        <span id="sta_${oml.o_no}"
                           style="color: black; font-weight: bold;">주문진행중</span>
                     </c:when>
                     <c:when test="${oml.o_state eq '픽업완료'}">
                        <span id="sta_${oml.o_no}"
                           style="color: gray; font-weight: bold;">픽업완료</span>
                     </c:when>
                     <c:when test="${oml.o_state eq '제조완료'}">
                        <span id="sta_${oml.o_no}"
                           style="color: green; font-weight: bold;">제조완료</span>
                     </c:when>
                     <c:otherwise>
                        <span id="sta_${oml.o_no}"
                           style="color: hotpink; font-weight: bold;">주문확인중</span>
                     </c:otherwise>
                  </c:choose></td>
                  <td>
            <button type='button' class='btn' id="all_module_${oml.o_no}" onclick="userCancel('${oml.o_no}', '${oml.o_id}' ,'${oml.o_usepoint}', '${oml.o_state}')">취소</button>
         </td>
         </tr>
      </c:when>
      </c:choose>
   </c:forEach>
      </tbody>
   </table>
   
     <c:set var="hasOdList" value="false" />
   <c:forEach items="${odMyList}" var="oml">
       <c:if test="${oml.o_state != '완료' && oml.o_state != '취소'}">
           <c:set var="hasOdList" value="true" />
       </c:if>
   </c:forEach>

   <c:if test="${not hasOdList}">
       <div id="orderStatusNo_div">
           <span id="orderStatusNo">현재 진행중인 주문내역이 없습니다.</span>
       </div>
       <div id="legoMenu_div">
           <button type="button" id="legoMenu" onclick="letgoMenu()">상품 주문하기</button>
    </div>
   </c:if>
   </div>
      <div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop='static' data-keyboard='false'>
    <%@ include file="order.jsp" %>
   </div>
   </div>
   <%@include file="../css/footer.jsp"%>
</body>
</html>