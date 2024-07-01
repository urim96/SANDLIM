<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../css/header.jsp"%>

<style>
.page-item.active #page-btn2 {
    background-color: #272727 !important;
    color: #f9f5f2 !important;
    border: none;
}
#page-btn2{
color: #272727;
}
#page-btn3{
color:#272727;
}
#page-btn1{
color:#272727;
}
.getReview {
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
   max-width: 768px;
           min-width: 275px;
}

.selReview {
   width: 100%;
   border: 1px solid #c9c9c9;
   margin: 15px;
   padding: 13px;
   font-size: 14px;
}

.contents-review, .contents-star {
   display: flex;
   justify-content: space-between;
   align-items: center;
   margin: 0 0 15px 0;
}

.contents-review {
   align-items: flex-start;
}

.review.b_title {
   padding: 4px;
   border-radius: 20px;
   background-color: #f9f5f2;
   margin: 0 0 15px 0;
   overflow: hidden;
   display: -webkit-box;
   -webkit-box-orient: vertical;
   -webkit-line-clamp: 1;
}

.review.b_content {
   width: 70%;
   overflow: hidden;
   display: -webkit-box;
   -webkit-box-orient: vertical;
   -webkit-line-clamp: 5;
}

.review.b_file {
   width: 200px;
   height: 200px;
   overflow: hidden;
   display: flex;
   align-items: center;
   justify-content: center;
}

.r_thumbnail {
   max-width: 100%;
   /*    max-height: 100%; */
}

@media screen and (max-width: 480px) {
   .review.b_file {
      width: auto;
      height: auto;
      /* overflow: hidden; */
      /* display: flex; */
      /* align-items: center; */
      /* justify-content: center; */
   }
   .contents-review {
      align-items: flex-start;
      /* display: flex; */
      flex-direction: column-reverse;
   }
   .review.b_content {
      width: auto;
   }
}

.page-item.active #page-btn2 {
    background-color: #272727 !important;
    color: #f9f5f2 !important;
}

</style>
<body>
   <!--    <div class="bod"> -->
   <div class="sandlim-wrap">
      <div class="sandlim-container">
         <section class="sandlim-header">
            <h3>리뷰</h3>
         </section>

         <section class="sandlim-contents">
            <%--          <input type="hidden" name="b_num" value="${board.b_num}"> --%>
            <div class="getReview">
               <c:set var="index" value="${fn:length(boardList)}" />
               <c:forEach items="${review}" var="board" varStatus="loop">
                  <div class="selReview" onclick="selReview(${board.b_num})"
                     style="cursor: pointer;">
                     <div class="contents-star">
                        <div class="star-ratings">
                           <div class="star-ratings-fill space-x-2 text-lg"
                              style="width: ${(board.b_rev*20)}%">
                              <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                           </div>
                           <div class="star-ratings-base space-x-2 text-lg">
                              <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                           </div>
                        </div>
                        <div class="review b_nick">${board.b_nick}</div>
                        <div class="review b_date" style="text-align: right;">${board.b_date}</div>
                     </div>
                     <div class="review b_title">${board.b_title}</div>

                     <div class="contents-review">
                        <div class="review b_content">${board.b_content}</div>
                        <div class="review b_file">
                             <c:choose>
                                                                <c:when test="${board.b_file == null}">
                                                                                                <img class="r_thumbnail" src="resources/rimg/empty.jpg">
                                                                </c:when>
                                                                <c:otherwise>
                                                                        <img class="r_thumbnail" src="/resources/rimg/${board.b_file}"
                                                                                alt="${board.b_file}" style="cursor: pointer;"
                                                                                onclick="seeImg()">
                                                                </c:otherwise>
                                                        </c:choose>
                        </div>

                     </div>

                  </div>
                  <c:set var="index" value="${index - 1}" />
               </c:forEach>
            </div>

         </section>
            <section class="sandlim-footer">
               <div class="footer">
                  <!--   페이지네이션 추가 -->
                  <div>
                     <nav aria-label="Page navigation example" style="margin: auto;">
                        <ul class="pagination justify-content-center">
                           <c:if test="${pagination5.prev}">
                              <li class="page-item"><a class="page-link" id="page-btn1"
                                 href="#"
                                 onClick="fn_prev('${pagination5.currPageNo}', '${pagination5.range}', '${pagination5.pageSize}')">이전</a></li>
                           </c:if>
                           <c:forEach begin="${pagination5.startPage}"
                              end="${pagination5.endPage}" var="idx5">
                              <li
                                 class="page-item <c:out value="${pagination5.currPageNo == idx5 ? 'active' : ''}"/> ">
                                 <a class="page-link" id="page-btn2" href="#"
                                 onClick="fn_pagination('${idx5}', '${pagination5.range}')">
                                    ${idx5} </a>
                              </li>
                           </c:forEach>
                           <c:if test="${pagination5.next}">
                              <li class="page-item"><a class="page-link" id="page-btn3"
                                 href="#"
                                 onClick="fn_next('${pagination5.currPageNo}', '${pagination5.range}', '${pagination5.pageSize}')">다음</a></li>
                           </c:if>
                        </ul>
                     </nav>
                  </div>

                  <div id="paginationData"
                     data-searchType="${pagination5.searchType}"
                     data-keyword="${pagination5.keyword}"></div>

                  <script>
         //이전 버튼
         function fn_prev(currPageNo, range, pageSize) {
   
            var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
            var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
            var currPageNo = (range - 1) * pageSize;
            var range = range - 1;
   
            var url = "/getReview.do";
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
            var url = "/getReview.do";
   
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
   
            var url = "/getReview.do";
            url = url + "?currPageNo=" + currPageNo;
            url = url + "&range=" + range;
            url = url + "&searchType=" + searchType;
            url = url + "&keyword=" + keyword;
            location.href = url;
         }
         
         </script>
                  <!--    페이지네이션 추가 끝 -->
               </div>
            </section>
         </div>
      </div>
<!--    </div> -->
   <%@ include file="../css/footer.jsp"%>
</body>
</html>