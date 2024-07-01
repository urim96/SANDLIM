<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="adminIndex.jsp"%>
<style>
* {
   box-sizing: border-box;
}

#searchNav {
   -webkit-justify-content: flex-end;
   justify-content: flex-end;
}

.subbtn {
   background-color: #f9f5f2 !important;
   color: #272727 !important;
   border: none !important;
   height: 30px !important;
}

.subbtn:hover {
   background-color: #272727 !important;
   color: #f9f5f2 !important;
   border: none !important;
   height: 30px !important;
}

a {
   text-decoration: none !important;
   color: #f9f5f2 !important;
}

.atag {
   color: #272727 !important;
}

#page-btn1:active, #page-btn2:active, #page-btn3:active, .page-button:active{
   background-color: #272727 !important;
   color: #f9f5f2 !important;
}  

a[id^=page-btn] {
   background-color:  #f9f5f2 !important;
   color: #272727 !important;
}


li.page-item a.page-link.active {
   background-color: #272727 !important;
   color: #f9f5f2 !important;
} 

.admin {
        height:1080px;
} 
 .sandlim-container{
width:100%;}
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
      <div class="admin">
         <div class="sandlim-container">
            <section class="sandlim-header">
               <h3>자주 묻는 문의 리스트</h3>


               <form class="form-inline" action="adminGetFaq.do" method="post">

                  <select class=" " id="sel1" name="searchType"
                     style="display: inline-block !important; margin-right: 10px;">
                     <option value="메뉴">메뉴</option>
                     <option value="포인트">포인트</option>
                     <option value="회원">회원</option>
                     <option value="배달">배달</option>
                  </select> <input class="search" type="text" name="keyword"
                     placeholder="검색어를 입력하세요.">
                  <button class="mainbtn" type="submit">검색</button>
                  <button type="button" class="subbtn" id="conList">목록초기화</button>
               </form>

            </section>
            <section class="sandlim-contents">
               <table class="table">
                  <tr>
                     <th>번호</th>
                     <th>카테고리</th>
                     <th>제목</th>
                     <th>등록일</th>
                     <th>공개상태</th>
                  </tr>
                  <c:set var="index" value="${fn:length(faq)}" />
                  <c:forEach items="${faq}" var="board" varStatus="loop">
                     <tr>
                        <td class="tdCenter"><a class="atag"
                           onclick="selFaq(${board.b_num})" style="cursor: pointer;">${board.rnum}</a></td>
                        <td class="tdCenter"><a class="atag"
                           onclick="selFaq(${board.b_num})" style="cursor: pointer;">${board.b_cat}</a></td>
                        <td><a class="atag" onclick="selFaq(${board.b_num})"
                           style="cursor: pointer;">${board.b_title}</a></td>
                        <td class="tdCenter"><a class="atag"
                           onclick="selFaq(${board.b_num})" style="cursor: pointer;">${board.b_date.toString().substring(0,10)}</a></td>
                        <td class="tdCenter"><a class="atag"
                           onclick="selFaq(${board.b_num})" style="cursor: pointer;">${board.b_status}</a></td>
                     </tr>
                     <c:set var="index" value="${index - 1}" />
                  </c:forEach>
               </table>
            </section>
            <section class="sandlim-footer">
               <div class="footer-button-right">
                  <button type="button" id="conWrite" class="mainbtn">새글쓰기</button>
               </div>
               <!--   페이지네이션 추가 -->
               <div>
                  <nav aria-label="Page navigation example" style="margin: auto;">
                     <ul class="pagination justify-content-center">
                        <c:if test="${pagination.prev}">
                           <li class="page-item"><a class="page-link" id="page-btn2"
                              href="#"
                              onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
                        </c:if>
                        <c:forEach begin="${pagination.startPage}"
                           end="${pagination.endPage}" var="idx">
                           <li class="page-item">
                              <a class="page-link page-button <c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/>" id="page-btn${idx}" href="#"
                              onClick="fn_pagination('${idx}', '${pagination.range}')">
                                 ${idx} </a>
                           </li>
                        </c:forEach>
                        <c:if test="${pagination.next}">
                           <li class="page-item "><a class="page-link" id="page-btn3" href="#"
                              onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">다음</a></li>
                        </c:if> 
                     </ul>
                  </nav>
               </div>

               <div id="paginationData" data-searchType="${pagination.searchType}"
                  data-keyword="${pagination.keyword}"></div>
               <script>
                  //이전 버튼
                  function fn_prev(currPageNo, range, pageSize) {
            
                     var searchType = document.getElementById('paginationData').getAttribute('data-searchType');
                     var keyword = document.getElementById('paginationData').getAttribute('data-keyword');
                     var currPageNo = (range - 1) * pageSize;
                     var range = range - 1;
            
                     var url = "/adminGetFaq.do";
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
                     var url = "/adminGetFaq.do";
            
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
            
                     var url = "/adminGetFaq.do";
                     url = url + "?currPageNo=" + currPageNo;
                     url = url + "&range=" + range;
                     url = url + "&searchType=" + searchType;
                     url = url + "&keyword=" + keyword;
                     location.href = url;
                  }
                  
            
                  function selUser(val){
                     location.href = "adminGetFaq.do?u_id="+val;
                  }
            
               </script>
               <!--    페이지네이션 추가 끝 -->


            </section>
         </div>
      </div>
   </div>
   <%@ include file="../css/footer.jsp"%>
</body>
</html>