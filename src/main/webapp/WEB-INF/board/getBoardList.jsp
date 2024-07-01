<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../css/header.jsp"%>
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
//       $("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
   }
   let bodyHeight =document.body.getBoundingClientRect().height;
//    $(".idxbody").height(bodyHeight);
   $(".idxbody").height(bclHeight);
   console.log('body 전: '+ bodyHeight);
   console.log('body 후: '+  document.body.getBoundingClientRect().height);
   console.log('bclHeight 후: '+ $(".bcl").height());
});
</script>
<style>
/********************** <start> 576px이하  **********************/
@media only screen and (max-width: 576px) {
   .sandlim {
      min-width: 375px;
   }
   th, .board.b_cnt, .board.b_cat {
      display: none;
   }
   .table td, .table th {
      vertical-align: middle;
      font-size: 14px;
      height: 70px;
   }
}
/**********************<end> 576px이하  **********************/
.b_cat {
   width: 16%;
}

.b_date {
   width: 120px;
}

.b_cnt {
   width: 80px;
}

.page-item.active #page-btn2 {
    background-color: #272727 !important;
    color: #f9f5f2 !important;
}

.page-item a#page-btn2{
color: #272727 !important;
}
.page-item a#page-btn3{
color:#272727 !important;
}
.page-item a#page-btn1{
color:#272727 !important;
}
.page-item a#page-btn1:hover, .page-item a#page-btn2:hover, .page-item a#page-btn3:hover{
    background-color: #272727 !important;
    color: #f9f5f2 !important;
    
}
</style>
<body>
   <div class="sandlim-wrap">
      <div class="sandlim-container">
         <section class="sandlim-header">
            <h3>공지사항</h3>
            <div id="search">
               <form class="form-inline" action="getBoardList.do" method="post">
                  <select class=" " id="sel1" name="searchType"
                     style="display: inline-block !important;">
                     <option value="카테고리">카테고리</option>
                     <option value="제목">제목</option>
                     <option value="내용">내용</option>
                  </select> <input class="search" type="text" name="keyword"
                     placeholder="검색어를 입력하세요.">
                  <button class="mainbtn" type="submit">검색</button>
               </form>
            </div>
         </section>

         <section class="sandlim-contents">
            <input type="hidden" name="b_nick" value="${board.b_nick}">

            <!--          <table class="table table-hover"> -->
            <table class="table">
               <tr>
                  <!--                <th>NO</th> -->
                  <th class="board b_cat">카테고리</th>
                  <th class="board b_title">제목</th>
                  <th class="board b_date">등록일</th>
                  <th class="board b_cnt">조회수</th>
               </tr>
               <c:set var="index" value="${fn:length(notice)}" />
               <c:forEach items="${notice}" var="board" varStatus="loop">
                  <tr onclick="selBoard(${board.b_num})" style="cursor: pointer;">
                     <%--                      <td class="tdCenter">${index}</td> --%>
                     <td class="board b_cat">${board.b_cat}</td>
                     <td class="board b_title" style="text-align: left;">${board.b_title}</td>
                     <td class="board b_date">${board.b_date}</td>
                     <td class="board b_cnt">${board.b_cnt}</td>
                  </tr>
                  <c:set var="index" value="${index - 1}" />
               </c:forEach>
            </table>
         </section>

         <section class="sandlim-footer">
            <div class="footer">
               <!--   페이지네이션 추가 -->
               <div>
                  <nav aria-label="Page navigation example" style="margin: auto;">
                     <ul class="pagination justify-content-center">
                        <c:if test="${pagination3.prev}">
                           <li class="page-item"><a class="page-link" id="page-btn1"
                              href="#"
                              onClick="fn_prev('${pagination3.currPageNo}', '${pagination3.range}', '${pagination3.pageSize}')">이전</a></li>
                        </c:if>
                        <c:forEach begin="${pagination3.startPage}"
                           end="${pagination3.endPage}" var="idx3">
                           <li
                              class="page-item <c:out value="${pagination3.currPageNo == idx3 ? 'active' : ''}"/>">
                              <a class="page-link" id="page-btn2" href="#"
                              onClick="fn_pagination('${idx3}', '${pagination3.range}')">
                                 ${idx3} </a>
                           </li>
                        </c:forEach>
                        <c:if test="${pagination1.next}">
                           <li class="page-item"><a class="page-link" id="page-btn3"
                              href="#"
                              onClick="fn_next('${pagination3.currPageNo}', '${pagination3.range}', '${pagination3.pageSize}')">다음</a></li>
                        </c:if>
                     </ul>
                  </nav>
               </div>

               <div id="paginationData"
                  data-searchType="${pagination3.searchType}"
                  data-keyword="${pagination3.keyword}"></div>
               <script>
               //이전 버튼
            function fn_prev(currPageNo, range, pageSize) {
      
               var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
               var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
               var currPageNo = (range - 1) * pageSize;
               var range = range - 1;
      
               var url = "/getBoardList.do";
               url = url + "?currPageNo=" + currPageNo;
               url = url + "&range=" + range;
               url = url + "&searchType=" + searchType;
               url = url + "&keyword=" + keyword;
               location.href = url;
            }
      
            //페이지 번호 클릭
      
            function fn_pagination(currPageNo, range) {
               var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
               var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
               var url = "/getBoardList.do";
      
               url = url + "?currPageNo=" + currPageNo;
               url = url + "&range=" + range;
               url = url + "&searchType=" + searchType;
               url = url + "&keyword=" + keyword;
               location.href = url;
            }
            //다음 버튼 이벤트
            function fn_next(currPageNo, range, pageSize) {
      
               var searchType = document.getElementById('paginationData')
                     .getAttribute('data-searchType');
               var keyword = document.getElementById('paginationData')
                     .getAttribute('data-keyword');
               var currPageNo = (range * pageSize) + 1;
               var range = parseInt(range) + 1;
      
               var url = "/getBoardList.do";
               url = url + "?currPageNo=" + currPageNo;
               url = url + "&range=" + range;
               url = url + "&searchType=" + searchType;
               url = url + "&keyword=" + keyword;
               location.href = url;
            }
      
         </script>

            </div>
         </section>
      </div>
   </div>

   <%@ include file="../css/footer.jsp"%>
</body>
</html>