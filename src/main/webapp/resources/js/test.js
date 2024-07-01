$(document).ready(function(){ 
   $( window ).resize(function() {
      var windowWidth = $( window ).width();
      if(windowWidth >= 978) {
         $("#subNavMenu").hide();
      }
   });
   
   $("#clMenu").click(function(){
      $("#subNavMenu").toggle();
   });
      
   
   // [ADMIN] NOTICE 등록
    $("#getInsertBoard").click(function(){
      location.href = "getInsertBoard.do";
   });


   // [ADMIN] NOTICE 삭제
   $("#deleteBoard").click(function(){
      if(confirm("공지사항을 삭제하시겠습니까?") == true){
         let v = document.fm.b_num.value;
      location.href = "deleteBoard.do?b_num="+v;
      }
   });

   
  // NOTICE 목록 (관리자)
   $("#adminGetBoardList").click(function(){
      location.href = "adminGetBoardList.do";
   });
   
   // NOTICE 목록 (사용자)
   $("#getBoardList").click(function(){
      location.href = "getBoardList.do";
   });
   
      // REVIEW 목록 (관리자)
   $("#adminGetReview").click(function(){
      location.href = "adminGetReview.do";
   });
   
      // REVIEW 등록 (사용자) 불러오기
   $("#getinsertReview").click(function(){
      location.href = "getinsertReview.do";
   });

   
   // REVIEW 목록 (사용자)
   $("#getReview").click(function(){
      location.href = "getReview.do";
   });
   
   // REVIEW 수정 (사용자) xxxxxxxxxxxxxxxxxxxxxxx 보류
   $("#updateReview").click(function(){
      if(confirm("리뷰를 수정하시겠습니까?") == true){
      location.href = "updateReview.do";
      }
   });
   
   // REVIEW 비공개 (사용자)
   $("#deleteReview").click(function(){
      if(confirm("리뷰를 삭제하시겠습니까? 삭제된 리뷰는 비공개처리 되며, 서버에 90일간 보관 후 영구삭제됩니다.") == true){
      let v = document.rv.b_num.value;
      location.href = "deleteReview.do?b_num="+v;}
   });

   
    // REVIEW 공개 (관리자)
   $("#adminUpdateReview").click(function() {
         let v2 = document.rv.b_status.value;
      if (confirm("리뷰를 "+v2+" 처리하시겠습니까?") == true) {
         let v = document.rv.b_num.value;
         location.href = "adminUpdateReview.do?b_num=" + v;
      }
   });
        
        // NOTICE 상세 조회 (관리자)
        function selAdminBoard(val){
           location.href = "adminGetBoard.do?b_num="+val;
        }
        
        // FAQ 상세 조회 (관리자)
        function selFaq(val){
           location.href = "adminFaqDetail.do?b_num="+val;
        }
   
   //FAQ 등록 (관리자)
   $("#conWrite").click(function(){
      location.href = "adminInsertFaq.do";
   });
   
   // FAQ 목록 (관리자)   
   $("#conList").click(function(){
      location.href = "adminGetFaq.do";
   });
   
   // FAQ 삭제 (관리자)
   $("#conFaqDel").click(function(){
      if(confirm("정말 삭제하시겠습니까?") == true){
         let v = document.fm.num.value;
         //let v = document.getElementById("num").innerText;
         location.href = "deleteFaq.do?b_num="+v;
      }else{
      }
   });
   
   // FAQ 목록 (사용자)
   $("#conList2").click(function(){
      location.href = "getFaq.do";
   });
   
});


function selBoard(val){
   location.href = "getBoard.do?b_num="+val;
}

function selReview(val){
   location.href = "getReviewDetail.do?b_num="+val;
}

function selFaq(val){
   location.href = "adminFaqDetail.do?b_num="+val;
}
   
// NOTICE 상세 조회 (사용자)
function selBoard(val){
  location.href = "getBoard.do?b_num="+val;
}

        
// REVIEW 상세 조회 (사용자)
function selReview(val){
   location.href = "getReviewDetail.do?b_num="+val;
   location.href = "getCount.do?b_num="+val;
   location.href = "getReviewDetail.do?b_num="+val;
}

// REVIEW 상세 조회 (관리자)
function selAdminReview(val){
   location.href = "adminGetReviewDetail.do?b_num="+val;
}