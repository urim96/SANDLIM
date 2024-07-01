<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="adminIndex.jsp"%>
<%
String sts = "";
if (session.getAttribute("userNick") == null) {
   sts = "disabled";
}
%>
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
   
   console.log('idxheader: '+idxhdHeight);
   console.log('idxbody: '+idxbodyHeight);
   console.log('footer: '+ ftHeight);
   console.log('useHeight: '+useHeight);
   console.log('useHeight: '+useHeight);
   console.log('body 전: '+ bodyHeight);
   console.log('body 후: '+  document.body.getBoundingClientRect().height);
   console.log('bclHeight 후: '+ $(".bcl").height());
});
</script>
<style>
textarea {
   width: 100%;
   height: 100%;
   resize: none;
   /*    overflow: visible; */
   outline: none;
   border: 0px solid #f9f5f2;
   /*    background-color: #f9f5f2 !important; */
}

.getReviewDetail {
    width: 576px;
   border: 1px solid #c9c9c9;
   margin: 30px;
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
   padding: 7px;
   border-radius: 20px;
   background-color: #f9f5f2;
   margin: 0 0 15px 0;
}

.review.b_file, .review.b_content {
   margin: 0 0 15px 0;
   height: auto;
}

.r_thumbnail {
   max-width: 100%;
   /*    max-height: 100%; */
}

.review.button {
   display: flex;
   /* justify-content: space-evenly; */
}

.btn {
   text-aline: center;
   width: 100%;
   height: 50px;
   background-color: #272727 !important;
   border: none;
   color: #f9f5f2 !important;
   /*     padding: 0; */
   /*     border-radius: 0; */
}

.btn:last-child {
   background-color: #f9f5f2 !important;
   color: #272727 !important;
}

.btn:last-child:hover {
   background-color: #272727 !important;
   color: #f9f5f2 !important;
}
a{
   text-decoration: none !important;
    color: #f9f5f2 !important ;
}

#imgBox {
   display: none;
   position: absolute;
   top: 0;
   left: 0;
   height: 100vh !important;
   background-color: rgba(0, 0, 0, 0.5);
   z-index: 9999999;
}

#imgBox2 {
   width: 600px;
   top: 30%;
   left: 30%;
   overflow: auto;
   position: absolute;
   z-index: 9999999;
}

#r_image {
   width: 100%;
}
.sandlim-container {
	width: 100% !important;
}
</style>
<body>
   <!--    <div class="bod"> -->
   <div class="admin2">
      <div class="sandlim-container">
         <section class="sandlim-header">
            <h3>리뷰 상세보기</h3>
         </section>

         <section class="sandlim-contents">
            <%
            if (request.getParameter("error") != null) {
               out.println("<div class='alert alert-danger'>");
               out.println("해당 글은 작성자만이 수정할 수 있습니다.");
               out.println("</div>");
            }
            %>
            <form name="rv" action="updateReview.do" method="post"
               enctype="multipart/form-data"  >
               <input type="hidden" name="b_num" value="${board.b_num}">
               <div class="getReviewDetail">
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

                  <div class="review b_file">
                     <c:choose>
                        <c:when test="${board.b_file == null}">
                           <!--                         <img class="r_thumbnail" src="resources/rimg/empty.png"> -->
                        </c:when>
                        <c:otherwise>
                           <img class="r_thumbnail" src="resources/rimg/${board.b_file}"
                              alt="${board.b_file}" style="cursor: pointer;"
                              onclick="seeImg()">
                        </c:otherwise>
                     </c:choose>

                     <script>
                        function seeImg() {
                           $("#imgBox").show();
                        }
                     </script>
                     
                  </div>
                  <div class="review b_content">
                     <textarea rows="5" readonly>${board.b_content}</textarea>
                  </div>
                  <div class="review button" style="">
                     <%--                <button type="submit" class="btn btn-primary"  <c:if test="${!(userNick eq board.b_nick)}">hidden</c:if>>수정</button>  --%>
                     <button id="adminGetReview" type="button" class="btn btn-primary">목록</button>
                     <!--                   <button id="adminUpdateReview" type="button" class="btn btn-primary" -->
                     <!--                      >비공개 전환</button> -->
                     <c:choose>
                        <c:when test="${board.b_status eq '공개'}">
                           <button type='button' class='btn btn-primary' name="b_status"
                              value="비공개" id="adminUpdateReview">비공개 전환</button>
                        </c:when>
                        <c:otherwise>
                           <button type='button' class='btn btn-primary' name="b_status"
                              value="공개" id="adminUpdateReview">공개 전환</button>
                        </c:otherwise>

                     </c:choose>
                  </div></div>
            </form>
         </section>
         <section class="sandlim-footer"></section>
      </div>

      <div id="imgBox" class="container-fluid" onclick="closeX()">
         <div id="imgBox2">
            <script>
               function closeX() {
                  $("#imgBox").hide();
               }
            </script>
            <img id="r_image" src="resources/rimg/${board.b_file}">
         </div>
               </div>
         </div>
                  <%@ include file="../css/footer.jsp"%>
</body>
</html>