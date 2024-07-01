<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="adminIndex.jsp"%>


<style>
#b_nick, #b_date {
   width: 130px;
}

#b_index, #b_cat, #b_cnt, #b_status {
   width: 100px;
}

section {
   
} /* width: 1500px !important;} */
a {
   text-decoration: none !important;
   color: #f9f5f2 !important;
}

.atag {
   color: #272727 !important;
}

.sandlim-contents {
    /* display: flex; */
    justify-content: center;
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
   $(".idxbody").height(bclHeight+100);
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
               <h3>공지사항 관리</h3>

               <!--             <div id="search"> -->
               <form class="form-inline" action="adminGetBoardList.do"
                  method="post">
                  <select class=" " id="sel1" name="searchType"
                     style="display: inline-block !important; margin-right: 10px;">
                     <c:forEach items="${conditionMap}" var="option">
                        <option value="${option.value}">${option.key}</option>
                     </c:forEach>
                     <%-- <option value="${conditionMap['제목']}">제목</option> --%>
                     <%-- <option value="${conditionMap['내용']}">내용</option> --%>
                  </select> <input class="search" type="text" name="keyword"
                     placeholder="검색어를 입력하세요.">
                  <button class="mainbtn" type="submit">검색</button>

               </form>
               <!--             </div> -->
            </section>

            <section class="sandlim-contents">
               <table class="table">
                  <tr>
                     <th>번호</th>
                     <th>카테고리</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>등록일</th>
                     <th>조회수</th>
                     <th>공개</th>
                  </tr>
                  <c:set var="index" value="${fn:length(notice)}" />

                  <c:forEach items="${notice}" var="board" varStatus="loop">
                     <tr>
                        <td id="b_index"><a class="atag"
                           onclick="selAdminBoard(${board.b_num})"
                           style="cursor: pointer;">${board.rnum}</a></td>
                        <td id="b_cat"><a class="atag"
                           onclick="selAdminBoard(${board.b_num})"
                           style="cursor: pointer;">${board.b_cat}</a></td>
                        <td id="b_title" style="text-align:left;"><a class="atag"
                           onclick="selAdminBoard(${board.b_num})"
                           style="cursor: pointer;">${board.b_title}</a></td>
                        <td id="b_nick"><a class="atag"
                           onclick="selAdminBoard(${board.b_num})"
                           style="cursor: pointer;">${board.b_nick}</a></td>
                        <td id="b_date"><a class="atag"
                           onclick="selAdminBoard(${board.b_num})"
                           style="cursor: pointer;">${board.b_date.toString().substring(0,10)}</a></td>
                        <td id="b_cnt"><a class="atag"
                           onclick="selAdminBoard(${board.b_num})"
                           style="cursor: pointer;">${board.b_cnt}</a></td>
                        <td id="b_status"><a class="atag"
                           onclick="selAdminBoard(${board.b_num})"
                           style="cursor: pointer;">${board.b_status}</a></td>
                     </tr>
                     <c:set var="index" value="${index - 1}" />
                  </c:forEach>
               </table>
            </section>
            <section class="sandlim-footer">
               <div class="footer-button-right">
                  <button type="button" id="getInsertBoard" class="mainbtn" >공지등록</button>
               </div>
               <!--   페이지네이션 추가 -->
               <div>
                  <nav aria-label="Page navigation example" style="margin: auto;">
                     <ul class="pagination justify-content-center">
                        <c:if test="${pagination1.prev}">
                           <li class="page-item"><a class="page-link" id="page-btn"
                              href="#"
                              onClick="fn_prev('${pagination1.currPageNo}', '${pagination1.range}', '${pagination1.pageSize}')">이전</a></li>
                        </c:if>
                        <c:forEach begin="${pagination1.startPage}"
                           end="${pagination1.endPage}" var="idx1">
                           <li class="page-item">
                                   
                              <a class="page-link <c:out value="${pagination1.currPageNo == idx1 ? 'active' : ''}"/>" id="page-btn2" href="#"
                              onClick="fn_pagination('${idx1}', '${pagination1.range}')">
                                 ${idx1} </a>
                           </li>
                        </c:forEach>
                        <c:if test="${pagination1.next}">
                           <li class="page-item"><a class="page-link" id="page-btn3" href="#"
                              onClick="fn_next('${pagination1.currPageNo}', '${pagination1.range}', '${pagination1.pageSize}')">다음</a></li>
                        </c:if>
                     </ul>
                  </nav>
               </div>

               <div id="paginationData"
                  data-searchType="${pagination1.searchType}"
                  data-keyword="${pagination1.keyword}"></div>
               <script>
           function selAdminBoard(val){
                 location.href = "adminGetBoard.do?b_num="+val;
              }
      //이전 버튼
      function fn_prev(currPageNo, range, pageSize) {

         var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
         var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
         var currPageNo = (range - 1) * pageSize;
         var range = range - 1;

         var url = "/adminGetBoardList.do";
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
         var url = "/adminGetBoardList.do";

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

         var url = "/adminGetBoardList.do";
         url = url + "?currPageNo=" + currPageNo;
         url = url + "&range=" + range;
         url = url + "&searchType=" + searchType;
         url = url + "&keyword=" + keyword;
         location.href = url;
      }
      

      function selUser(val){
         location.href = "adminGetBoardList.do?u_id="+val;
      }

   </script>
               <!--    페이지네이션 추가 끝 -->


            </section>
         </div>
      </div>
   </div>
   <%@ include file="../css/footer.jsp"%>
</body>