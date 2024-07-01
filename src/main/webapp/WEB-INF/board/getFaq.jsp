<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../css/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/test.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<title>Insert title here</title>
<style>
/* Note: Try to remove the following lines to see the effect of CSS positioning */
#tabbtn1, #tabbtn2, #tabbtn3, #tabbtn4 {
   display: none;
   /*    color: #f00; */
}

#tabbtncss, #tabbtncss2, #tabbtncss3, #tabbtncss4 {
   background-color: #f9f5f2;
   color: #272727;
}

#tabbtncss:hover, #tabbtncss2:hover, #tabbtncss3:hover, #tabbtncss4:hover
   {
   background-color: #272727;
   color: #f9f5f2;
}

#tabbtncss:active, #tabbtncss:focus, #tabbtncss2:active, #tabbtncss2:focus,
   #tabbtncss3:active, #tabbtncss3:focus, #tabbtncss4:active, #tabbtncss4:focus
   {
   outline: none !important;
}

a {
   color: #272727 !important;
   text-decoration: none !important;
}

.bod {
   padding-top: 80px;
}

.panel-header {
   padding: 5px;
   background-image: url("resources/bimg/ico_fold_down.gif");
   background-position: right center;
   background-repeat: no-repeat;
   display: flex;
   align-items: center;
}

.btndiv {
   display: flex;
   margin: 20px 320px auto;
   align-items: center;
   justify-content: space-around;
}

.tabbtncss {
   border-radius: 50px;
   border: 1px solid #f9f5f2;
   height: 50px;
   padding: 10px 20px 10px 20px;
   align-items: center;
   display: flex;
}

.panel-body {
   padding: 12px;
   background-color: #f9f5f2;
}

.qbox, #qbox {
    background-color: #272727;
    color: #f9f5f2 !important;
    border-radius: 10px;
    /* display: inline-flex; */
    width: 30px;
    justify-content: center;
    align-items: center;
    padding: 1px 0px 5px 8px;
    font-weight: bold;
    margin: 5px;
}

.abox, #abox {
   border-radius: 10px;
   display: inline-flex;
   width: 30px;
   justify-content: center;
   align-items: center;
   padding: 3px 4px 3px 7px;
   font-weight: bold;
   margin: 5px;
}

.qdiv {
   width: 100%
}

.panel-header {
   display: flex;
   align-items: center;
}

.emailtg {
   display: flex;
   text-align: center;
   justify-content: center;
   flex-wrap: wrap;
}

.elink {
   color: gray;
   text-weight: bold;
}

.btndiv2 {
   display: none;
}

@media screen and (max-width: 1140px) {
   .bod {
      padding-top: 80px;
      width: 1000px;
   }
   .btndiv {
      display: flex;
      margin: 20px 250px auto;
      align-items: center;
      justify-content: space-around;
   }
   .btndiv2 {
      visibility: hidden;
   }
}

@media screen and (max-width: 992px) {
   .bod {
      width: 768px;
   }
   .btndiv {
      display: flex;
      margin: 20px 140px auto;
      align-items: center;
      justify-content: space-around;
   }
   .btndiv2 {
      visibility: hidden;
   }
}

@media screen and (max-width: 768px) {
   .bod {
      width: 576px;
   }
   .btndiv {
      display: flex;
      margin: 10px;
      align-items: center;
      justify-content: space-around;
   }
   .btndiv2 {
      visibility: hidden;
   }
}

@media screen and (max-width: 576px) {
   .bod {
      width: 400px;
   }
   .btndiv {
      visibility: hidden;
   }
   .btndiv2 {
      display: block !important;
      visibility: visible !important;
      text-align: center;
      /*    display:flex; align-items: center; justify-content: space-around; */
   }
   .seldiv2 {
      CONTAIN-INTRINSIC-BLOCK-SIZE: AUTO 100PX;
      width: 300px;
      -webkit-appearance: none;
      -moz-appearance: none;
      appearance: none;
      box-sizing: border-box;
      margin: 1px;
      padding-left: 15px;
      height: 50px;
      background-color: #f9f5f2;
      border: none;
   }
   .seldiv2:focus {
      border: none;
   }
}

@media screen and (max-width: 400px) {
   .bod {
      width: 380px;
   }
   #h1 {
      font-size: 2rem !important;
   }
   .btndiv {
      visibility: hidden;
   }
   .btndiv2 {
      display: block !important;
      visibility: visible !important;
      width: 100%;
      text-align: center;
   }
   .seldiv2 {
      CONTAIN-INTRINSIC-BLOCK-SIZE: AUTO 100PX;
      width: 270px;
      -webkit-appearance: none;
      -moz-appearance: none;
      appearance: none;
      box-sizing: border-box;
      margin: 5px;
      padding-left: 15px;
      height: 40px;
      background-color: #f9f5f2;
      border: none;
   }
   .seldiv2:focus {
      border: none;
   }
}

.page-item.active #page-btn2 {
    background-color: #272727 !important;
    color: #f9f5f2 !important;
}

</style>
<script>
   var chkMenu = "";
   var pageSize = 5;
</script>
</head>
<body>

   <div class="bod">
         <h3>자주 묻는 문의</h3>
         <div class=btndiv>
            <button class="tabbtn1 tabbtncss" id="tabbtncss" onclick="tab('메뉴')">메뉴</button>
            <button class="tabbtn2 tabbtncss" id="tabbtncss2"
               onclick="tab('회원')">회원</button>
            <button class="tabbtn3 tabbtncss" id="tabbtncss3"
               onclick="tab('배달')">배달</button>
            <button class="tabbtn4 tabbtncss" id="tabbtncss4"
               onclick="tab('포인트')">포인트</button>
         </div>
   		<div class="btndiv2">
			<select class="seldiv2" onchange="tab(this.value)">
				<option class="tabbtn1 tabbtncss" value="메뉴">> 메뉴</option>
				<option class="tabbtn2 tabbtncss" value="회원">> 회원</option>
				<option class="tabbtn3 tabbtncss" value="배달">> 배달</option>
				<option class="tabbtn4 tabbtncss" value="포인트">> 포인트</option>
			</select>
		</div>
         <br>
         <script>
            $(document).ready(function() {
               // 첫 번째 버튼을 선택하고 해당하는 패널을 보여줍니다.
               tab('메뉴');
            });
         </script>

         <div id="accordion">
            <script>
               function tab(tabId) {
                  chkMenu = tabId;
                  console.log("클릭확인");
                  $
                        .ajax({
                           type : "GET",
                           url : "/getBoardFaq.do", // 이 부분을 실제 서버의 URL로 변경해야 합니다.
                           data : {
                              "searchType" : tabId
                           },
                           success : function(data) {
                              console.log("data: ", data);
                              var html = "";
                              $
                                    .each(
                                          data.faqList,
                                          function(index, board) {
                                             html += '<div class="panel panel-default tabbtn2">';
                                             html += '<hr>';
                                             html += '<div class="panel-header">';
                                             html += '<span class="qbox" id="qbox">Q</span>';
                                             html += '<div class="qdiv" data-toggle="collapse" data-parent="#accordion" href="#collapse' + index + '">';
                                             html += board.b_title;
                                             html += '</div></div>';
                                             html += '<div id="collapse' + index + '" class="panel-collapse collapse">';
                                             html += '<div class="panel-body"><span class="abox" id="abox">A.</span>';
                                             html += board.b_content;
                                             html += '</div></div></div>';
                                          });
                              $("#accordion").html(html);

                              html = '<section class="content-footer">';
                              html += '<div>';
                              html += '<nav aria-label="Page navigation example" style="margin: auto;">';
                              html += '<ul class="pagination justify-content-center">';
                              if (data.pagination.prev) {
                                 html += '<li class="page-item"><a class="page-link" id="page-btn1" href="#" ';
                                 html += 'onClick="fn_prev(event,\''
                                       + data.pagination.currPageNo
                                       + '\', \''
                                       + data.pagination.range
                                       + '\', \''
                                       + data.pagination.pageSize
                                       + '\')">이전</a></li>';
                              }
                              for (var idx = data.pagination.startPage; idx <= data.pagination.endPage; idx++) {
                                 html += '<li class="page-item '
                                       + (data.pagination.currPageNo == idx ? 'active'
                                             : '') + '">';
                                 html += '<a class="page-link page-button" id="page-btn2" href="#" ';
                                 html += 'onClick="fn_pagination(event,\''
                                       + idx
                                       + '\', \''
                                       + data.pagination.range
                                       + '\')">' + idx + '</a>';
                                 html += '</li>';
                              }
                              if (data.pagination.next) {
                                 html += '<li class="page-item"><a class="page-link page-btn" id="page-button3" href="#" ';
                                 html += 'onClick="fn_next(event,\''
                                       + data.pagination.currPageNo
                                       + '\', \''
                                       + data.pagination.range
                                       + '\', \''
                                       + data.pagination.pageSize
                                       + '\')">다음</a></li>';
                              }
                              html += '</ul>';
                              html += '</nav>';
                              html += '</div>';
                              html += '</section>';
                              $("#accordion").append(html);
                           }
                        });
               }

               function fn_prev(event, currPageNo, range, pageSize) {
                  event.preventDefault();
                  var searchType = chkMenu;
                  var keyword = "";
                  var currPageNo = (range - 1) * pageSize;

                  $
                        .ajax({
                           type : "GET",
                           url : "/getBoardFaq.do",
                           data : {
                              "searchType" : chkMenu,
                              "keyword" : "",
                              "currPageNo" : currPageNo,
                              "range" : parseInt(range, 10) - 1
                           },
                           success : function(data) {
                              console.log("data: ", data);
                              var html = "";
                              $
                                    .each(
                                          data.faqList,
                                          function(index, board) {
                                             html += '<div class="panel panel-default tabbtn2">';
                                             html += '<hr>';
                                             html += '<div class="panel-header">';
                                             html += '<span class="qbox" id="qbox">Q.</span>';
                                             html += '<div class="qdiv" data-toggle="collapse" data-parent="#accordion" href="#collapse' + index + '">';
                                             html += board.b_title;
                                             html += '</div></div>';
                                             html += '<div id="collapse' + index + '" class="panel-collapse collapse">';
                                             html += '<div class="panel-body"><span class="abox" id="abox">A.</span>';
                                             html += board.b_content;
                                             html += '</div></div></div>';
                                          });
                              $("#accordion").html(html);

                              html = '<section class="content-footer">';
                              html += '<div>';
                              html += '<nav aria-label="Page navigation example" style="margin: auto;">';
                              html += '<ul class="pagination justify-content-center">';
                              if (data.pagination.prev) {
                                 html += '<li class="page-item"><a class="page-link" id="page-btn1" href="#" ';
                                 html += 'onClick="fn_prev(event,\''
                                       + data.pagination.currPageNo
                                       + '\', \''
                                       + data.pagination.range
                                       + '\', \''
                                       + data.pagination.pageSize
                                       + '\')">이전</a></li>';
                              }
                              for (var idx = data.pagination.startPage; idx <= data.pagination.endPage; idx++) {
                                 html += '<li class="page-item '
                                       + (data.pagination.currPageNo == idx ? 'active'
                                             : '') + '">';
                                 html += '<a class="page-link page-button" id="page-btn2" href="#" ';
                                 html += 'onClick="fn_pagination(event,\''
                                       + idx
                                       + '\', \''
                                       + data.pagination.range
                                       + '\')">' + idx + '</a>';
                                 html += '</li>';
                              }
                              if (data.pagination.next) {
                                 html += '<li class="page-item"><a class="page-link page-btn" id="page-button3" href="#" ';
                                 html += 'onClick="fn_next(event,\''
                                       + data.pagination.currPageNo
                                       + '\', \''
                                       + data.pagination.range
                                       + '\', \''
                                       + data.pagination.pageSize
                                       + '\')">다음</a></li>';
                              }
                              html += '</ul>';
                              html += '</nav>';
                              html += '</div>';
                              html += '</section>';
                              $("#accordion").append(html);
                           }
                        });

               }

               //페이지 번호 클릭
               function fn_pagination(event, currPageNo, range) {
                  event.preventDefault();
                  var searchType = chkMenu;
                  var keyword = "";

                  $
                        .ajax({
                           type : "GET",
                           url : "/getBoardFaq.do",
                           data : {
                              "searchType" : chkMenu,
                              "keyword" : "",
                              "currPageNo" : currPageNo,
                              "range" : range
                           },
                           success : function(data) {
                              console.log("번호클릭 data: ", data);
                              var html = "";
                              $
                                    .each(
                                          data.faqList,
                                          function(index, board) {
                                             html += '<div class="panel panel-default tabbtn2">';
                                             html += '<hr>';
                                             html += '<div class="panel-header">';
                                             html += '<span class="qbox" id="qbox">Q.</span>';
                                             html += '<div class="qdiv" data-toggle="collapse" data-parent="#accordion" href="#collapse' + index + '">';
                                             html += board.b_title;
                                             html += '</div></div>';
                                             html += '<div id="collapse' + index + '" class="panel-collapse collapse">';
                                             html += '<div class="panel-body"><span class="abox" id="abox">A.</span>';
                                             html += board.b_content;
                                             html += '</div></div></div>';
                                          });
                              $("#accordion").html(html);

                              html = '<section class="content-footer">';
                              html += '<div>';
                              html += '<nav aria-label="Page navigation example" style="margin: auto;">';
                              html += '<ul class="pagination justify-content-center">';
                              if (data.pagination.prev) {
                                 html += '<li class="page-item"><a class="page-link" id="page-btn1" href="#" ';
                                 html += 'onClick="fn_prev(event,\''
                                       + data.pagination.currPageNo
                                       + '\', \''
                                       + data.pagination.range
                                       + '\', \''
                                       + data.pagination.pageSize
                                       + '\')">이전</a></li>';
                              }
                              for (var idx = data.pagination.startPage; idx <= data.pagination.endPage; idx++) {
                                 html += '<li class="page-item '
                                       + (data.pagination.currPageNo == idx ? 'active'
                                             : '') + '">';
                                 html += '<a class="page-link page-button" id="page-btn2" href="#" ';
                                 html += 'onClick="fn_pagination(event,\''
                                       + idx
                                       + '\', \''
                                       + data.pagination.range
                                       + '\')">' + idx + '</a>';
                                 html += '</li>';
                              }
                              if (data.pagination.next) {
                                 html += '<li class="page-item"><a class="page-link page-btn" id="page-button3" href="#" ';
                                 html += 'onClick="fn_next(event,\''
                                       + data.pagination.currPageNo
                                       + '\', \''
                                       + data.pagination.range
                                       + '\', \''
                                       + data.pagination.pageSize
                                       + '\')">다음</a></li>';
                              }
                              html += '</ul>';
                              html += '</nav>';
                              html += '</div>';
                              html += '</section>';
                              $("#accordion").append(html);
                           }
                        });
               }
               //다음 버튼 이벤트
               function fn_next(event, currPageNo, range, pageSize) {
                  event.preventDefault();
                  var searchType = chkMenu;
                  var keyword = "";
                  var currPageNo = (range * pageSize) + 1;

                  console.log("range 아작스전: ", range);

                  $
                        .ajax({
                           type : "GET",
                           url : "/getBoardFaq.do",
                           data : {
                              "searchType" : chkMenu,
                              "keyword" : "",
                              "currPageNo" : currPageNo,
                              "range" : parseInt(range, 10) + 1
                           },
                           success : function(data) {

                              console.log("data.range: ",
                                    data.pagination.range);
                              console.log("data: ", data);
                              var html = "";
                              $
                                    .each(
                                          data.faqList,
                                          function(index, board) {
                                             html += '<div class="panel panel-default tabbtn2">';
                                             html += '<hr>';
                                             html += '<div class="panel-header">';
                                             html += '<span class="qbox" id="qbox">Q.</span>';
                                             html += '<div class="qdiv" data-toggle="collapse" data-parent="#accordion" href="#collapse' + index + '">';
                                             html += board.b_title;
                                             html += '</div></div>';
                                             html += '<div id="collapse' + index + '" class="panel-collapse collapse">';
                                             html += '<div class="panel-body"><span class="abox" id="abox">A.</span>';
                                             html += board.b_content;
                                             html += '</div></div></div>';
                                          });
                              $("#accordion").html(html);

                              html = '<section class="content-footer">';
                              html += '<br><br><div>';
                              html += '<nav aria-label="Page navigation example" style="margin: auto;">';
                              html += '<ul class="pagination justify-content-center">';
                              if (data.pagination.prev) {
                                 html += '<li class="page-item"><a class="page-link" id="page-btn1" href="#" ';
                                 html += 'onClick="fn_prev(event,\''
                                       + data.pagination.currPageNo
                                       + '\', \''
                                       + data.pagination.range
                                       + '\', \''
                                       + data.pagination.pageSize
                                       + '\')">이전</a></li>';
                              }
                              console.log(
                                    "data.pagination.startPage ::",
                                    data.pagination.startPage);
                              console.log(
                                    "data.pagination.endPage ::",
                                    data.pagination.endPage);
                              for (var idx = data.pagination.startPage; idx <= data.pagination.endPage; idx++) {

                                 html += '<li class="page-item '
                                       + (data.pagination.currPageNo == idx ? 'active'
                                             : '') + '">';
                                 html += '<a class="page-link page-button" id="page-btn2" href="#" ';
                                 html += 'onClick="fn_pagination(event,\''
                                       + idx
                                       + '\', \''
                                       + data.pagination.range
                                       + '\')">' + idx + '</a>';
                                 html += '</li>';
                              }
                              if (data.pagination.next) {
                                 html += '<li class="page-item"><a class="page-link page-btn" id="page-button3" href="#" ';
                                 html += 'onClick="fn_next(event,\''
                                       + data.pagination.currPageNo
                                       + '\', \''
                                       + data.pagination.range
                                       + '\', \''
                                       + data.pagination.pageSize
                                       + '\')">다음</a></li>';
                              }
                              html += '</ul>';
                              html += '</nav>';
                              html += '</div>';
                              html += '</section>';
                              $("#accordion").append(html);
                           }
                        });
               }
            </script>
         </div>
      </div>

      <hr>

   <div class="emailtg">
      <small>원하는 답변을 찾지 못하셨다면&nbsp;</small><small><a class="elink"
         href="mailto:sandlimCafe@gmail.com">sandlimCafe@gmail.com</a></small><small>&nbsp;으로
         문의 주세요!</small>
   <br><br>
   </div>
   <%@include file="../css/footer.jsp"%>
</body>
</html>