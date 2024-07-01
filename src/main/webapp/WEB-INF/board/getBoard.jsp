<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ include file="../css/header.jsp"%>
<style>
.board.b_content {
        padding: 50px 10px !important;
}

.board.b_file {
        max-width: 100%;
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

</style>
<body>
        <!--    <div class="bod"> -->
        <div class="sandlim-wrap">
                <div class="sandlim-container">
                        <section class="sandlim-header">
                                <h3>글 상세보기</h3>
                        </section>

                        <section class="sandlim-contents">
                                <input type="hidden" name="b_num" value="${board.b_num}">
                                <table class="table ">
                                        <tr>
                                                <th style="text-align: left;" colspan="3"><b
                                                        style="color: red;">[${board.b_cat}]</b> ${board.b_title}</th>
                                        </tr>
                                        <tr>
                                                <td style="text-align: left;">${board.b_nick}ㅣ${board.b_date}</td>
                                                <td style="text-align: right;">조회수 ${board.b_cnt}</td>
                                        </tr>
                                        <tr>
                                                <td class="board b_content" colspan="2"
                                                        style="padding: 100px 0 100px 0;"><img class="board b_file"
                                                        src="resources/bimg/${board.b_file }" alt="${board.b_file }"><br>
<!--                                                         <textarea rows="5" readonly> -->
                                                        ${board.b_content}
<!--                                                         </textarea> -->
                                                        </td>
                                        </tr>

                                        <!--                <tr> -->
                                        <!--                   <th style="text-align: left;" colspan="3"><b -->
                                        <!--                      style="color: red;">[이전글/다음글 추가할까...]</th> -->
                                        <!--                </tr> -->
                                </table>
                        </section>
                        <section class="sandlim-footer">
                                <div id="footer">
                                        <button id="getBoardList" type="button" class="mainbtn">글목록</button>
                                </div>
                        </section>
                </div>
        </div>
</body>
<%@ include file="../css/footer.jsp"%>
</html>