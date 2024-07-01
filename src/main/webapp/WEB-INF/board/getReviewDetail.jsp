<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../css/header.jsp"%>
<%
String sts = "";
if (session.getAttribute("userNick") == null) {
        sts = "disabled";
}
%>
<style>
.getReviewDetail {
        /* width: 576px; */
        MAX-width: 576px;
        min-width: 275px;
        border: 1px solid #c9c9c9;
        margin: 15px;
        padding: 13px;
        font-size: 14px;
}
/******************************/
textarea {
        width: 100%;
        height: 100%;
        resize: none;
        /*    overflow: visible; */
        outline: none;
        border: 0px solid #f9f5f2;
        /*    background-color: #f9f5f2 !important; */
        scrollbar-width: none;
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
</style>
<body>
        <!--    <div class="bod"> -->
        <div class="sandlim-wrap">
                <div class="sandlim-container">
                        <section class="sandlim-header">
                                <h3>${(board.b_nick)}님의 리뷰</h3>
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
                                        enctype="multipart/form-data">
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
                                                                                                <img class="r_thumbnail" src="resources/rimg/empty.jpg">
                                                                </c:when>
                                                                <c:otherwise>
                                                                        <img class="r_thumbnail" src="/resources/rimg/${board.b_file}"
                                                                                alt="${board.b_file}" style="cursor: pointer;"
                                                                                onclick="seeImg()">
                                                                </c:otherwise>
                                                        </c:choose>

                                                        <div id="imgBox" class="container-fluid" onclick="closeX()">
                                                                <div id="imgBox2">
                                                                        <script>
                                                                                function closeX() {
                                                                                        $("#imgBox").hide();
                                                                                }
                                                                        </script>
                                                                        <img id="r_image" src="/resources/rimg/${board.b_file}" <c:if test="${board.b_file eq NULL}"><img id="r_image" src="/resources/rimg/empty.jpg"</c:if>>
                                                                </div>
                                                        </div>
                                                </div>
                                                <div class="review b_content">
                                                        <textarea rows="5" readonly>${board.b_content}</textarea>
                                                </div>
                                                <div class="review button" style="">
                                                        <%--                <button type="submit" class="btn btn-primary"  <c:if test="${!(userNick eq board.b_nick)}">hidden</c:if>>수정</button>  --%>
                                                        <button id="getReview" type="button" class="btn btn-primary">목록</button>
                                                        <button id="deleteReview" type="button" class="btn btn-primary"
                                                                <c:if test="${!(userNick eq board.b_nick)}">hidden</c:if>>삭제</button>
                                                </div>
                                        </div>
                                </form>

                        </section>
                        <section class="sandlim-footer"></section>
                </div>


                <!--       </div> -->
</body>
<%-- <%@ include file="../css/footer.jsp"%> --%>
<script>
        function seeImg() {
                $("#imgBox").show();
        }
</script>
<style>
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
</style>
</html>