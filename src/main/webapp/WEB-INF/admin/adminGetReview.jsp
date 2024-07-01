<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="adminIndex.jsp"%>
<style>
.review.b_title, .review.b_content {
   /*    padding: 4px; */
   /*    border-radius: 20px; */
   /*    background-color: #f9f5f2; */
   /*    margin: 0 0 15px 0; */
   overflow: hidden;
   display: -webkit-box;
   -webkit-box-orient: vertical;
   -webkit-line-clamp: 3;
}

td {
   height: 100px;
}

#r_image {
   height: 100%;
   /* text-align: left; */
   display: flex;
}

a{
   text-decoration: none !important;
    color: #f9f5f2 !important ;
}

a[id^=page-btn] {
        background-color:  #f9f5f2 !important;
        color: #272727 !important;
}


li.page-item a.page-link.active {
   background-color: #272727 !important;
   color: #f9f5f2 !important;
} 
.sandlim-container {
	width: 100% !important;
}
</style>
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
   $(".idxbody").height(bclHeight);
//    $(".bcl").height(bodyHeight-65.59);
   
//    console.log('idxheader: '+idxhdHeight);
//    console.log('idxbody: '+idxbodyHeight);
//    console.log('footer: '+ ftHeight);
//    console.log('useHeight: '+useHeight);
//    console.log('useHeight: '+useHeight);
//    console.log('body 전: '+ bodyHeight);
//    console.log('body 후: '+  document.body.getBoundingClientRect().height);
//    console.log('bclHeight 후: '+ $(".bcl").height());
});
</script>
<body>
   <div class="bcl">
      <div class="admin2">
         <div class="sandlim-container">
            <section class="sandlim-header">
               <h3>리뷰관리</h3>
               <!--             <div id="search"> -->
               <form class="form-inline" action="adminGetReview.do" method="post">
                  <select class=" " id="sel1" name="searchType"
                     style="display: inline-block !important; margin-right: 10px;">
                     <%--                   <c:forEach items="${conditionMap}" var="option"> --%>
                     <%--                      <option value="${option.value}">${option.key}</option> --%>
                     <%--                   </c:forEach> --%>
                     <option value="${conditionMap['제목']}">메뉴</option>
                     <option value="${conditionMap['내용']}">내용</option>
                  </select> <input class="search" type="text" name="keyword"
                     placeholder="검색어를 입력하세요.">
                  <button class="mainbtn" type="submit">검색</button>
               </form>
               <!--             </div> -->

            </section>

            <section class="sandlim-contents">
               <table class="table">
                  <tr>
                     <th>메뉴</th>
                     <th>평점</th>
                     <th>내용</th>
                     <th>사진</th>
                     <th>작성자</th>
                     <th>등록일</th>
                     <th>공개</th>
                  </tr>

                  <c:set var="index" value="${fn:length(boardList)}" />
                  <c:forEach items="${review}" var="board" varStatus="loop">
                     <tr onclick="selAdminReview(${board.b_num})"
                        style="cursor: pointer;">
                        <%--                               <tr onclick="selReview(${board.b_num})" style="cursor: pointer;"> --%>
                        <td class="" style="font-size: 14px; text-align: left; width:150px;"><div
                              class="review b_title">${board.b_title}</div></td>
                        <td class="review b_rev">
                           <div class="star-ratings">
                              <div class="star-ratings-fill space-x-2 text-lg"
                                 style="width: ${(board.b_rev*20)}%">
                                 <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                              </div>
                              <div class="star-ratings-base space-x-2 text-lg">
                                 <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                              </div>
                           </div>
                        </td>
                        <td style="text-align: left; font-size: 14px;"><div class="review b_content">${board.b_content}</div></td>
                        <td class="review b_file"  style="width: 130px;"><img id="r_image" src="resources/rimg/${board.b_file}"
                           <c:if test="${board.b_file eq NULL}">hidden</c:if>></td>
                        <td class="review b_nick" style="width: 130px;">${board.b_nick}</td>
                        <td class="review b_date" style="width: 130px;">${board.b_date}</td>
                        <td class="review b_status" style="width: 100px;">${board.b_status}</td>
                        <%--                <c:choose> --%>
                        <%--                      <c:when test="${board.b_status eq '공개'}"> --%>
                        <!--                         <button type='button' class='btn btn-primary' -->
                        <!--                            id="adminUpdateReview" -->
                        <%--                            onclick="adminUpdateReview(${board.b_num})">공개</button> --%>
                        <%--                      </c:when> --%>
                        <%--                      <c:otherwise> --%>
                        <!--                         <button type='button' class='btn btn-primary' -->
                        <%--                            onclick="adminUpdateReview(${board.b_num})">비공개</button> --%>
                        <%--                      </c:otherwise> --%>

                        <%--                   </c:choose></td> --%>
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
                           <c:if test="${pagination4.prev}">
                              <li class="page-item"><a class="page-link" id="page-btn1"
                                 href="#"
                                 onClick="fn_prev('${pagination4.currPageNo}', '${pagination4.range}', '${pagination4.pageSize}')">이전</a></li>
                           </c:if>
                           <c:forEach begin="${pagination4.startPage}"
                              end="${pagination4.endPage}" var="idx4">
                              <li
                                 class="page-item">
                                 <a class="page-link <c:out value="${pagination4.currPageNo == idx4 ? 'active' : ''}"/>" id="page-btn${ idx4}" href="#"
                                 onClick="fn_pagination('${idx4}', '${pagination4.range}')">
                                    ${idx4} </a>
                              </li>
                           </c:forEach>
                           <c:if test="${pagination4.next}">
                              <li class="page-item"><a class="page-link" id="page-btn3"
                                 href="#"
                                 onClick="fn_next('${pagination4.currPageNo}', '${pagination4.range}', '${pagination4.pageSize}')">다음</a></li>
                           </c:if>
                        </ul>
                     </nav>
                  </div>

                  <div id="paginationData"
                     data-searchType="${pagination4.searchType}"
                     data-keyword="${pagination4.keyword}"></div>

                  <script>
         //이전 버튼
         function fn_prev(currPageNo, range, pageSize) {
   
            var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
            var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
            var currPageNo = (range - 1) * pageSize;
            var range = range - 1;
   
            var url = "/adminGetReview.do";
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
            var url = "/adminGetReview.do";
   
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
   
            var url = "/adminGetReview.do";
            url = url + "?currPageNo=" + currPageNo;
            url = url + "&range=" + range;
            url = url + "&searchType=" + searchType;
            url = url + "&keyword=" + keyword;
            location.href = url;
         }
         
   
         function selUser(val){
            location.href = "adminGetReview.do?u_id="+val;
         }
   
         </script>
                  <!--    페이지네이션 추가 끝 -->
               </div>
            </section>
         </div>
      </div></div>
      <%@ include file="../css/footer.jsp"%>
</body>
</html>