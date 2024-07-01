<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
} else {
%>
<meta http-equiv="Cache-Control"
        content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<%-- <%@ include file="../css/header.jsp"%> --%>
<style>
.star-rating {
        display: flex;
        flex-direction: row-reverse;
        font-size: 1.5rem;
        line-height: 2.5rem;
        justify-content: center;
        /*         padding: 0 0.2em; */
        text-align: center;
        width: 3em;
}
.star-rating input {
        display: none;
}
.star-rating label {
        -webkit-text-fill-color: transparent;
        /* Will override color (regardless of order) */
        -webkit-text-stroke-width: 1px;
        -webkit-text-stroke-color: #2b2a29;
        cursor: pointer;
}
.star-rating :checked ~ label {
        -webkit-text-fill-color: gold;
}
.star-rating label:hover, .star-rating label:hover ~ label {
        -webkit-text-fill-color: #fff58c;
}
.pr-4, .px-4 {
        padding-right: 0 !important;
}




ul {
        margin: 0;
        padding: 0;
}

li::marker {
        font-size: 5px !important;
}

textarea {
        width: 100%;
        /*         height: 100%; */
        resize: none;
        /*         overflow: visible; */
        outline: none;
        border: 0px solid #f9f5f2;
        background-color: #f9f5f2 !important;
}

.sandlim-review {
        /* padding: 10px; */
        margin: 10px;
        border: 1px solid #c9c9c9;
}

.insertReview {
        /*         width: 400px; */
        /*         border: 1px solid #272727; */
        /*         margin: 30px; */
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

.o_name, .review.b_file, .review.b_content, .review.b_nick {
        margin: 0 0 15px 0;
}

.r_thumbnail {
        max-width: 100%;
        /*         max-height: 100%; */
}

.review.button {
        display: flex;
        /* justify-content: space-evenly; */
}


.b_comment {
        text-align: left;
        padding: 10px;
}

input.b_sign {
        border: none !important;
        width: 30%;
}
</style>

<body>
        <div class="modal-dialog">
                    
                <div class="modal-content">
                              
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close" onclick="rewimgno()">×</button>
                        <div class="modal-header">
                                        
                                <h4 class="modal-title" id="myModalLabel">리뷰 작성</h4>
                                      
                        </div>
                        <div class="sandlim-review">
                                <section class="contents-container">
                                        <form name="rv" action="insertReview.do" method="post"
                                                enctype="multipart/form-data">
                                                <input type="hidden" value="" id="rewo_no" name="o_no">
                                                <div class="insertReview">
                                                        <div class="o_name">주문상품</div>
                                                        <div class="review b_title">
                                                                <textarea type="text" name="b_title" id="rewb_title" value=""
                                                                        readonly></textarea>
                                                        </div>
                                                        <div class="contents-star">
                                                                <div class="star-rating space-x-4 mx-auto">

                                                                        <input type="radio" id="5-stars" name="b_rev" value="5" /> <label
                                                                                for="5-stars" class="star pr-4">★</label> <input type="radio"
                                                                                id="4-stars" name="b_rev" value="4" /> <label for="4-stars"
                                                                                class="star">★</label> <input type="radio" id="3-stars"
                                                                                name="b_rev" value="3" /> <label for="3-stars" class="star">★</label>
                                                                        <input type="radio" id="2-stars" name="b_rev" value="2" /> <label
                                                                                for="2-stars" class="star">★</label> <input type="radio"
                                                                                id="1-star" name="b_rev" value="1" required /> <label
                                                                                for="1-star" class="star">★</label>
                                                                </div>
                                                        </div>

                                                        <div class="review b_content">
                                                                <textarea rows="5" id="comment" name="b_content" minlength="5"
                                                                        maxlength="1000" placeholder="글자 수 최소 5이상 1000자이내로 작성해주세요."></textarea>
                                                        </div>
                                                        <div class="review b_file" id="uploadB_file2">
                                                                <input type="file" name="uploadB_file" id="uploadB_file"
                                                                        accept="image/*">
                                                        </div>
                                                        <div id="b_imagePreview"></div>
                                                        <!--                                                 </div> -->
                                                        <!--                                                 <div class="modal-footer"> -->
                                                        <div class="b_comment">
                                                                <ul type="square">
                                                                        <small>
                                                                                <li>작성한 리뷰는 닉네임과 함께 누구나 볼 수 있도록 공개됩니다. <br> 리뷰 내용에
                                                                                        민감한 개인정보가 포함되지 않도록 조심해주세요.
                                                                        </li>
                                                                                <li>작성된 리뷰는 악의적인 사용방지를 위하여<br> 삭제는 가능하지만, 수정이 불가하오니
                                                                                        신중하게 작성해주세요.
                                                                        </li>
                                                                                <li>솔직하게 작성하신 리뷰는 주문을 고민하는 분들께 큰 도움이 됩니다. <br> 하지만
                                                                                        허위리뷰나 명예훼손, 욕설, 타인비방글 등 선량한 업주나<br> 제 3자의 권리를 침해하는 게시물은
                                                                                        서비스 이용약관이나 관련 법률에 따라 제재를 받을 수 있습니다.
                                                                        </li>
                                                                                <li>산들림은 위와 같은 게시물 작성자에게 경고, 주의 등의 조치를 취할 수 있고, 해당 게시물을
                                                                                        삭제하거나 보이지 않게 할 수 있습니다. <br>게시에 따른 책임은 작성자에게 있으며,<br>
                                                                                        산들림은 이에 대한 법적 책임을 지지 않습니다.
                                                                        </li>
                                                                        </small>
                                                                </ul>
                                                        </div>
                                                        <div class="review b_nick" style="text-align: right;">
                                                                작성자 : <input type="text" class="b_sign" name="b_nick"
                                                                        style="text-align: right;"
                                                                        value="<%=session.getAttribute("userNick").toString()%>"
                                                                        readonly>
                                                        </div>
                                                        <div class="review button" style="">
                                                                <button id="insertReview" type="submit" class="btn btn-primary"
                                                                        style="width: 100%; height: 50px;">작성완료</button>
                                                                <!--                                         <button id="getReview" type="button" class="btn btn-primary">리뷰목록</button> -->
                                                        </div>
                                                </div>
                                        </form>
                                </section>
                        </div>
                </div>
        </div>

</body>
<%
}
%>
<script>
        document.getElementById('uploadB_file').addEventListener(
                        'change',
                        function() {
                                var preview = document.getElementById('b_imagePreview');
                                var file = this.files[0];
                                var reader = new FileReader();

                                reader.onloadend = function() {
                                        preview.innerHTML = '<img src="' + reader.result
                                                        + '" alt="Uploaded Image" style="width:100%;">';
                                }

                                if (file) {
                                        reader.readAsDataURL(file);
                                } else {
                                        preview.innerHTML = 'No image selected';
                                }
                        });
</script>
</html>