<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../css/header.jsp"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/getMdpayodAll.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#AllListDiv{
  min-height: 1050px;
  margin-bottom: -165px;
}
#AllListDiv_22{
   margin-top: 110px;
}
</style>
</head>
<body>
 <div id="AllListDiv">
 <div id="AllListDiv_22">
      <section id="header-conTa">
         <p id="odAllList_P">나의 전체기간 주문내역</p>
      </section>
   <form id="frmOdAll">
      <input type="date" name="odAllListDate" id="odAllListDate">
      <button type="button" id="odAllDateClick" onclick="odAllDate()">검색</button>
   </form>

   <table class="table table-hover" id="tableodALl">
      <thead id="theadOdAll">
         <tr>
            <th id="odAll_oDate">주문날짜</th>
            <th id="odAll_oName">주문상품</th>
            <th id="odAll_oPrice">결제금액</th>
            <th id="odAll_oStatus">상세보기</th>
            <th id="odAll_oStat">주문상태</th>
            <th id="odAll-oReview">리뷰작성</th>
         </tr>
      </thead>
      <tbody id="tbodyodAll">
     <c:set var="hasOrders" value="false" />
<c:forEach items="${odMyAllList}" var="odm">
    <c:if test="${not empty odm}">
        <c:set var="hasOrders" value="true" />
        <tr>
            <td>${odm.o_date}</td>
            <td class="overText">${odm.o_name.split(',')[0].trim()}...</td>
            <td>${odm.o_toprice}</td>
            <td><button type="button" class="btn payModalreceiptBtn" data-toggle="modal" data-target="#payModal" onclick="paymo('${odm.o_no}')">전자영수증</button></td>
            <td>${odm.o_state}</td>
            <td>
                <c:if test="${odm.o_state eq '완료' and odm.o_review eq 0}">
                    <button type="button" class="btn review payModalreceiptBtn" data-toggle="modal" data-target="#review" value="${odm.o_no}">리뷰작성</button>
                </c:if>
            </td>
        </tr>
    </c:if>
</c:forEach>
    </tbody>
   </table>
<c:if test="${not hasOrders}">
    <div id="odAllStatus_div">
        <span id="odAllStatus">현재 진행중인 주문내역이 없습니다.</span>
    </div>
    <div id="legoMU_div">
        <button type="button" id="legoMU" onclick="letgoMu()">상품 주문하기</button>
    </div>
</c:if>
   <div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop='static' data-keyboard='false'>
    <%@ include file="order.jsp" %>
   </div>
   <div class="modal fade" id="review" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop='static' data-keyboard='false'>
    <%@ include file="../board/insertReview.jsp" %>
   </div>
   
   <div id="pagediv">
      <nav aria-label="Page navigation example" style="margin: auto;">
         <ul class="pagination justify-content-center ${not hasOrders ? 'hide-pagination' : ''}">
            <c:if test="${pagination.prev}">
               <li class="page-item"><a class="page-link" href="#"
                  onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
            </c:if>
            <c:forEach begin="${pagination.startPage}"
               end="${pagination.endPage}" var="idx">
               <li
                  class="page-item <c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/> ">
                  <button type=button class="pagebtn"
                     onClick="fn_pagination('${idx}', '${pagination.range}')">
                     ${idx}</button>
               </li>
            </c:forEach>
            <c:if test="${pagination.next}">
               <li class="page-item"><a class="page-link" href="#"
                  onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">다음</a></li>
            </c:if>
         </ul>
      </nav>
   </div>

   <div id="paginationData" data-searchType="${pagination.searchType}"
      data-keyword="${pagination.keyword}"></div>

   <script>
      function fn_prev(currPageNo, range, pageSize) {

         var searchType = document.getElementById('paginationData')
               .getAttribute('data-searchType');
         var keyword = document.getElementById('paginationData')
               .getAttribute('data-keyword');
         var currPageNo = (range - 1) * pageSize;
         var range = range - 1;

         var url = "/odMyAllList.san";
         url = url + "?currPageNo=" + currPageNo;
         url = url + "&range=" + range;
         url = url + "&searchType=" + searchType;
         url = url + "&keyword=" + keyword;
         location.href = url;

      }

      function fn_pagination(currPageNo, range) {

         var searchType = document.getElementById('paginationData')
               .getAttribute('data-searchType');
         var keyword = document.getElementById('paginationData')
               .getAttribute('data-keyword');
         var url = "/odMyAllList.san";

         url = url + "?currPageNo=" + currPageNo;
         url = url + "&range=" + range;
         url = url + "&searchType=" + searchType;
         url = url + "&keyword=" + keyword;
         location.href = url;

      }
      function fn_next(currPageNo, range, pageSize) {

         var searchType = document.getElementById('paginationData')
               .getAttribute('data-searchType');
         var keyword = document.getElementById('paginationData')
               .getAttribute('data-keyword');
         var currPageNo = (range * pageSize) + 1;
         var range = parseInt(range) + 1;

         var url = "/odMyAllList.san";
         url = url + "?currPageNo=" + currPageNo;
         url = url + "&range=" + range;
         url = url + "&searchType=" + searchType;
         url = url + "&keyword=" + keyword;
         location.href = url;
      }
      
      function letgoMu(){
       location.href="selectList.san";         
      }
   </script>
   </div>
   </div>
   <%@include file="../css/footer.jsp"%>
</body>
</html>