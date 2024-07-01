<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userId") == null) {
   response.sendRedirect("login.jsp");
} else {
%>
<%@ include file="adminIndex.jsp"%>
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
//                 $("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
        }
        let bodyHeight =document.body.getBoundingClientRect().height;
        $(".idxbody").height(bclHeight);
//         $(".bcl").height(bodyHeight-65.59);

});
</script>
<style>
.form-control {
   outline: none;
   border: 1px solid white;
   background-color: white !important;
   padding: 0;
}

select, select[name="b_cat"] option {
   outline: none;
   border: 1px solid white;
   outline: none;
}

#b_cat {
   width: 100px;
}
a{
        text-decoration: none !important;
    color: #f9f5f2 !important;
}
.sandlim-container2{
widht:100%;}
</style>
<body>
<div class="bcl">
   <div class="admin">
      <div class="sandlim-container2">
         <section class="sandlim-header">
            <h3>공지사항 등록</h3>
         </section>

         <section class="sandlim-contents1">
            <form action="insertBoard.do" method="post"
               enctype="multipart/form-data">
               <%--             <input type="hidden" name="b_nick" value="<%=session.getAttribute("userNick").toString()%>"> --%>
               <table class="table ">
                  <tr>
                     <td id="b_cat"><select name="b_cat">
                           <option value="공지사항">공지사항</option>
                           <option value="이벤트">이벤트</option>
                     </select></td>
                     <td><input type="text" class="form-control" name="b_title"
                        placeholder="제목 - 글자 수 30자이내" maxlength="30" required></td>
                  </tr>
                  <tr>
                     <td id="b_cat">작성자</td>
                     <td style="text-align: left;"><input type="text"
                        name="b_nick" class="form-control" readonly
                        value="<%=session.getAttribute("userNick").toString()%>">
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2"><input type="file" class="form-control innm"
                        name="uploadB_file" id="uploadB_file" accept="image/*">
                        <div id="b_imagePreview"></div></td>
                  </tr>
                  <tr>
                     <td colspan="2" id="b_content"><textarea
                           class="form-control" rows="20" id="b_content" name="b_content"
                           placeholder="내용 "></textarea>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <fieldset>
                           <input type="radio" name="b_status" value="공개"> 공개 <input
                              type="radio" name="b_status" value="비공개" checked> 비공개
                        </fieldset>

                     </td>
                  </tr>
               </table>
               <div class="sandlim-footer" style="justify-content:center;">
                  <div class="footer-button-center">
                     <button id="conComplete" type="submit" class="mainbtn">등록하기</button>
                     <button id="adminGetBoardList" type="button" class="subbtn">목록</button>
                  </div>
               </div>
            </form>
         </section>
         <section class="sandlim-footer"></section>
      </div>
   </div>
   </div>
   <%@ include file="../css/footer.jsp"%>
</body>
<%
}
%>
<script>
   document
         .getElementById('uploadB_file')
         .addEventListener(
               'change',
               function() {
                  var preview = document.getElementById('b_imagePreview');
                  var file = this.files[0];
                  var reader = new FileReader();

                  reader.onloadend = function() {
                     preview.innerHTML = '<img src="' + reader.result + '" alt="Uploaded Image" style="width:500px;">';
                  }

                  if (file) {
                     reader.readAsDataURL(file);
                  } else {
                     preview.innerHTML = 'No image selected';
                  }
               });
</script>
</html>