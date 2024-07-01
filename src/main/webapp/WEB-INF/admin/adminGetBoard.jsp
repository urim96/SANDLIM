<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="adminIndex.jsp"%>
<%
String sts = "";
if (session.getAttribute("userId") == null) {
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
        //                 $("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
                }
                let bodyHeight =document.body.getBoundingClientRect().height;
                $(".idxbody").height(bclHeight);
                
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
.form-control {
   outline: none;
   border: 1px solid white;
}

select, select[name="b_cat"] option {
   outline: none;
   border: 1px solid white;
   outline: none;
}

#b_cat {
   width: 100px;
}

.b_image, .b_imagePreview {
   width: 700px;
}

.sandlim-footer {
    padding: 30px 0 30px 0;
    display: flex;
    justify-content: center;
}
.sandlim-container {
    padding: 30px 0 30px 0;
     width: 100%;
}

.sandlim-contents1 {
    /* display: flex; */
    justify-content: center;
    width: 1300px;
}

</style>
<body>
<div class="bcl">
   <div class="admin2">
      <div class="sandlim-container">
         <section class="sandlim-header">
            <h3>공지사항 보기 및 수정</h3>
         </section>

         <section class="sandlim-contents1">
            <form name="fm" action="updateBoard.do" method="post"
               enctype="multipart/form-data">
               <input type="hidden" name="b_num" value="${board.b_num}">

               <table class="table ">
                  <tr>
                     <td id="b_cat"><select name="b_cat" id="b_cat_status">
                           <option value="공지사항">공지사항</option>
                           <option value="이벤트">이벤트</option>
                     </select> <script>
                        document
                              .addEventListener(
                                    "DOMContentLoaded",
                                    function() {
                                       var status = "${board.b_cat}";
                                       var selectElement = document
                                             .getElementById('b_cat_status');

                                       if (status === "공지사항") {
                                          selectElement.value = "공지사항";
                                       } else if (status === "이벤트") {
                                          selectElement.value = "이벤트";
                                       }
                                    });
                     </script></td>
                     <td><input type="text" class="form-control" name="b_title"
                        placeholder="제목 - 글자 수 30자이내" value="${board.b_title}" <%=sts %>
                        maxlength="30" required></td>
                  <tr>
                     <td id="b_cat">작성자</td>
                     <td style="text-align: left;"><input type="text"
                        name="b_nick" class="form-control" value="${board.b_nick}"
                        readonly></td>
                  </tr>
                  <tr>
                     <td colspan="2"><input type="file" class="form-control innm"
                        name="uploadB_file" name="uploadB_file" id="uploadB_file"
                        accept="image/*">
                        <div id="b_imagePreview"></div></td>
                  </tr>
                  <tr>
                     <td colspan="2" id="b_content"><img class="b_image"
                        src="resources/bimg/${board.b_file }" alt="${board.b_file }">
                        <textarea class="form-control" rows="10" id="b_content"
                           name="b_content" <%=sts%>>${board.b_content}</textarea></td>
                  </tr>
                  <tr>
                     <td colspan="2"><input type="radio" name="b_status"
                        value="공개" id="open"> <label for="open">공개</label> <input
                        type="radio" name="b_status" value="비공개" id="close"> <label
                        for="close">비공개</label> <script>
                           document
                                 .addEventListener(
                                       "DOMContentLoaded",
                                       function() {
                                          var status = "${board.b_status}";
                                          var open = document
                                                .getElementById('open');
                                          var close = document
                                                .getElementById('close');

                                          if (status === "공개") {
                                             open.checked = true;
                                          } else if (status === "비공개") {
                                             close.checked = true;
                                          }
                                       });
                        </script></td>
                  </tr>
               </table>
               <div class="sandlim-footer">
                  <button type="submit" class="mainbtn">수정</button>
                  <button id="deleteBoard" type="button" class="mainbtn">삭제</button>
                  <button id="adminGetBoardList" type="button"
                     class="subbtn">목록</button>
                  <button id="getInsertBoard" type="button" class="mainbtn">새로등록</button>
               </div>
            </form>
         </section>
         <section class="sandlim-footer"></section>
      </div>
   </div>
   </div>
   <%@ include file="../css/footer.jsp"%>
</body>
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