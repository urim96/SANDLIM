<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../css/header.jsp"%>
<html>
<head>
<script src="${pageContext.request.contextPath }/resources/js/san.js"></script>
<style>
* {
   white-space: nowrap;
}

#backBoard {
   display: flex;
   justify-content: center;
   align-items: center;
    margin: 40px; 
}

#myPageBoard {
   width: 80%;
   margin-top: 30px;
}

.title {
   text-align: center;
}

.subtext {
   font-size: small;
}

.subtext2 {
   font-size: small;
}

.mobileImg {
   padding-top: 20px;
}

#pointBox {
   text-align: center;
}

#mobile, .divSpace, .divSpace2, .changeLine, #nMobile, #wildSize,
   #nMobile, .changeLineMobile {
   display: none;
}

.icon {
   width: 30px;
   height: 30px;
}

.iconMobile {
   width: 30px;
   height: 30px;
}

.iconMobile2 {
   width: 25px;
   height: 25px;
}

.imgBox {
   border: 1px solid #f9f5f2;
   text-align: center;
   padding: 25px 55px;
   background-color: #f9f5f2;
   box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
   cursor: pointer;
   margin: 10px;
}

.imgBox:hover {
   color: #c79c79;
}

.mobileImg:hover {
   color: #c79c79;
}

.mobileBox {
   border: 1px solid #f9f5f2;
   margin: 0 5%;
   text-align: center;
   padding-top: 25px;
   padding-bottom: 25px;
   background-color: #f9f5f2;
   box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
   cursor: pointer;
}

#wildBox, .imgText, .changeLine, .mobileImg, .mobileText, #wildSize,
   #nMobile {
   text-align: center;
   display: flex;
   align-items: center;
   justify-content: space-evenly;
}

#logout {
   display: none;
   text-align: center;
}
/* 반응형 */
@media screen and (max-width: 400px) {
   #mobile, .mobileImgSmall, .divSpace, .changeLineMobile {
      display: block;
   }
   #nMobile, .mobileImgBig, #wildSize, .mobileText, #nonMobileTitle {
      display: none;
   }
   .mobileImg {
      border: 1px solid #f9f5f2;
      margin: 0 auto;
      text-align: center;
      display: flex;
      align-items: center;
      justify-content: space-evenly;
      padding-top: 25px;
      padding-bottom: 25px;
      width: 300px;
      height: 175px;
      background-color: #f9f5f2;
      box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
      cursor: pointer;
   }
   .mobileImg:hover {
      cursor: pointer;
   }
   #myPageBoard {
      width: 300px;
      height: unset;
   }
   #pointBox {
      margin-right: 10%;
   }
   .mobileBox {
      border: none;
      margin: 0;
      text-align: center;
      padding-top: 0;
      padding-bottom: 0;
      background-color: white;
      box-shadow: none;
      cursor: default;
   }
}

@media screen and (max-width: 576px) and (min-width:401px) {
   #mobile, .mobileImgSmall, #wildSize, #nonMobileTitle {
      display: none;
   }
   .mobileImgBig, .divSpace2, #nMobile, .changeLineMobile {
      display: block;
   }
   #myPageBoard {
      width: 500px;
   }
   #logout {
      display: block;
      text-align: center;
   }
   .imgBox {
      width: 150px;
      height: 130px;
      padding: 25px 5px;
      margin: 10px;
   }
   #backBoard {
    margin: 0px; 
}
}

@media screen and (max-width: 1199px) and (min-width:577px) {
   #nMobile {
      display: block;
   }
   #wildSize, #mobile {
      display: none;
   }
   #myPageBoard {
      width: 800px;
      height: 800px;
   }
   .imgBox {
      width: 220px;
      height: 210px;
   }
      #backBoard {
    margin: 0px; 
}
}

@media screen and (min-width:1200px) {
   #wildSize {
      display: block;
      margin-top: 5%;
   }
   #myPageBoard {
      width: 80%;
      height: 700px;
   }
   #nMobile, #mobile {
      display: none;
   }
   .imgBox {
      width: 250px;
      height: 330px;
      padding-top: 80px;
   }
#backBoard {
    margin: 0px; 
    
}
}
</style>
</head>
<body>

   <!-- id="backBoard" 시작 -->
   <div id="backBoard">

      <!-- id="myPageBoard 시작    -->
      <div id="myPageBoard">

         <div id="nonMobileTitle">
            <h3 class="title">${user.u_nick}님의&nbsp;마이페이지</h3>
         </div>
         <div class="changeLineMobile">
            <h3 class="title">${user.u_nick}님의<br>마이페이지
            </h3>
         </div>

         <div id="pointBox">
            <script>
               var userPoint = ${user.u_point};
               var formattedPoint = userPoint.toLocaleString();
               document.write(formattedPoint);
            </script>
            &nbsp;point
         </div>
         <br>


         <!-- id = "wildSize" 시작 -->
         <div id="wildSize">
            <!--                회원정보시작 -->
            <div id=wildBox>
               <div class="imgBox" onclick="goUserInfo()">
                  <img class="icon" src="../../resources/icon/user_info_icon.svg">
                  <br> <br> Profile <br> <span class="subtext">회원
                     정보</span> <br> <br>
                  <div class="imgText">
                     <span class="subtext">고객님의 개인정보를<br> 관리하는
                        공간입니다.
                     </span>
                  </div>
               </div>
               <!--                회원정보종료 -->

               <!--                리뷰관리시작 -->
               <div class="imgBox" onclick="goBoard()">
                  <img class="icon" src="../../resources/icon/point_icon.svg">
                  <br> <br> Board <br> <span class="subtext">리뷰
                     관리</span> <br> <br>
                  <div class="imgText">
                     <span class="subtext">고객님께서 작성하신<br> 리뷰를 관리하는<br>
                        공간입니다.
                     </span>
                  </div>
               </div>
               <!--                리뷰관리종료 -->

               <!--                구매내역시작 -->
               <div class="imgBox" onclick="goAllList()">
                  <img class="icon" src="../../resources/icon/order_list_icon.svg">
                  <br> <br> BuyList <br> <span class="subtext">구매내역
                     조회</span> <br> <br>
                  <div class="imgText">
                     <span class="subtext">고객님의 구매 내역을<br> 확인하실 수 있습니다.
                     </span>
                  </div>
               </div>
               <!--                구매내역종료 -->

               <!--                진행중인 주문시작 -->
               <div class="imgBox" onclick="orderList()">
                  <img class="icon" src="../../resources/icon/coffee_icon.svg">
                  <br> <br> Order <br> <span class="subtext">진행중인
                     주문</span> <br> <br>
                  <div class="imgText">
                     <span class="subtext">진행중인 주문의 상태를<br> 확인하실 수 있습니다.
                     </span>
                  </div>
               </div>
               <!--                진행중인 주문종료 -->
            </div>
         </div>
         <!-- id = "wildSize" 종료 -->


         <!--  id="nMobile" 시작          -->
         <div id="nMobile">

            <div class="changeLine">

               <!--                회원정보 시작-->
               <div class="imgBox" onclick="goUserInfo()">
                  <img class="icon" src="../../resources/icon/user_info_icon.svg">
                  <br> Profile <br> <span class="subtext">회원 정보</span> <br>
                  <br>
                  <div class="imgText">
                     <span class="subtext2">고객님의 개인정보를<br>관리하는 공간입니다.
                     </span>
                  </div>
               </div>
               <!--                회원정보 종료-->

               <!--                리뷰관리 시작-->
               <div class="imgBox" onclick="goBoard()">
                  <img class="icon" src="../../resources/icon/point_icon.svg">
                  <br> Board <br> <span class="subtext">리뷰 관리</span> <br>
                  <br>
                  <div class="imgText">
                     <span class="subtext2">고객님께서 작성하신<br> 리뷰를 관리하는<br>
                        공간입니다.
                     </span>
                  </div>
               </div>
               <!--                리뷰관리 종료-->
            </div>

            <br> <br>

            <!-- class="changeLine" 시작 -->
            <div class="changeLine">

               <!--                구매내역 시작-->
               <div class="imgBox" onclick="goAllList()">
                  <img class="icon" src="../../resources/icon/order_list_icon.svg">
                  <br> BuyList <br> <span class="subtext">구매내역 조회</span> <br>
                  <br>
                  <div class="imgText">
                     <span class="subtext2">고객님의 구매 내역을<br> 확인하실 수 있습니다.
                     </span>
                  </div>
               </div>
               <!--                구매내역 종료-->


               <!--                진행중인주문 시작-->
               <div class="imgBox" onclick="orderList()">
                  <img class="icon" src="../../resources/icon/coffee_icon.svg">
                  <br> Order <br> <span class="subtext">진행중인 주문</span> <br>
                  <br>
                  <div class="imgText">
                     <span class="subtext2">진행중인 주문의 상태를<br> 확인하실 수 있습니다.
                     </span>
                  </div>
               </div>
               <!--                진행중인주문 종료-->


            </div>
            <!-- class="changeLine" 종료 -->

         </div>
         <!--  id="nMobile" 종료          -->


         <!--  id="mobile" 시작 -->
         <div id="mobile">

            <!--           class="mobileBox" 시작 -->
            <div class="mobileBox" onclick="goUserInfo()">

               <!--              class="mobileImg" 시작 -->
               <div class="mobileImg" onclick="goUserInfo()">

                  <!--                회원정보 시작1 -->
                  <div class="mobileImgBig">
                     <img class="iconMobile"
                        src="../../resources/icon/user_info_icon.svg"> <br>
                     Profile <br> <span class="subtext">회원 정보</span> <br>
                  </div>
                  <!--                회원정보 종료1 -->

                  <!--                회원정보 시작2 -->
                  <div class="mobileImgSmall">
                     <img class="iconMobile2"
                        src="../../resources/icon/user_info_icon.svg"> Profile <br>
                     <span class="subtext">회원 정보</span><br>
                  </div>
                  <!--                회원정보 종료2 -->


               </div>
               <!--              class="mobileImg" 종료 -->

               <div class="divSpace">
                  <br>
               </div>

               <!--                class="mobileText" 시작 -->
               <div class="mobileText">
                  <span class="subtext">고객님의 개인정보를<br>관리하는공간입니다.
                  </span>
               </div>
               <!--                class="mobileText" 종료 -->

            </div>
            <!--           class="mobileBox" 종료 -->


            <div class="divSpace2">
               <br> <br>
            </div>

            <!--  class="mobileBox" 시작 -->
            <div class="mobileBox" onclick="goBoard()">

               <!--             class="mobileImg" 시작 -->
               <div class="mobileImg" onclick="goBoard()">

                  <!--                리뷰관리 시작1 -->
                  <div class="mobileImgBig">
                     <img class="iconMobile" src="../../resources/icon/point_icon.svg">
                     <br> Board <br> <span class="subtext">리뷰 관리</span> <br>
                  </div>
                  <!--                리뷰관리 종료1 -->


                  <!--                리뷰관리 시작2 -->
                  <div class="mobileImgSmall">
                     <img class="iconMobile2"
                        src="../../resources/icon/point_icon.svg"> Board <br>
                     <span class="subtext">리뷰 관리</span> <br>
                  </div>
                  <!--                리뷰관리 종료2 -->
               </div>
               <!--             class="mobileImg" 종료 -->

               <div class="divSpace">
                  <br>
               </div>

               <!--             class="mobileText" 시작 -->
               <div class="mobileText">
                  <span class="subtext">고객님께서 작성하신<br> 리뷰를 관리하는<br>공간입니다.
                  </span>
               </div>
               <!--             class="mobileText" 종료 -->

            </div>
            <!--  class="mobileBox" 종료 -->

            <div class="divSpace2">
               <br> <br>
            </div>

            <!-- class="mobileBox" 시작 -->
            <div class="mobileBox" onclick="goAllList()">

               <!--             class="mobileImg" 시작-->
               <div class="mobileImg" onclick="goAllList()">

                  <!--                   구매내역 조회1 시작 -->
                  <div class="mobileImgBig">
                     <img class="iconMobile"
                        src="../../resources/icon/order_list_icon.svg"> <br>
                     BuyList <br> <span class="subtext">구매내역 조회</span> <br>
                  </div>
                  <!--                   구매내역 조회1 종료 -->
                  <!--                   구매내역 조회2 시작 -->
                  <div class="mobileImgSmall">
                     <img class="iconMobile2"
                        src="../../resources/icon/order_list_icon.svg"> BuyList <br>
                     <span class="subtext">구매내역 조회</span> <br>
                  </div>
                  <!--                   구매내역 조회2 종료 -->
               </div>
               <!--             class="mobileImg" 종료 -->


               <div class="divSpace">
                  <br>
               </div>

               <!--                 class="mobileText" 시작 -->
               <div class="mobileText">
                  <span class="subtext">고객님의 구매 내역을<br> 확인하실 수 있습니다.
                  </span>
               </div>
               <!--                 class="mobileText" 종료 -->
            </div>
            <!-- class="mobileBox" 종료 -->


            <div class="divSpace2">
               <br> <br>
            </div>

            <!-- class="mobileBox" 시작 -->
            <div class="mobileBox" onclick="orderList()">

               <!--             class="mobileImg" 시작 -->
               <div class="mobileImg" onclick="orderList()">

                  <!--                    진행중인 주문 시작1 -->
                  <div class="mobileImgBig">
                     <img class="iconMobile"
                        src="../../resources/icon/coffee_icon.svg"> <br>
                     Order <br> <span class="subtext">진행중인 주문</span>
                  </div>
                  <!--                    진행중인 주문 종료1 -->


                  <!--                    진행중인 주문 시작2 -->
                  <div class="mobileImgSmall">
                     <img class="iconMobile2"
                        src="../../resources/icon/coffee_icon.svg"> Order <br>
                     <span class="subtext">진행중인 주문</span>
                  </div>
                  <!--                    진행중인 주문 종료2 -->

               </div>
               <!--             class="mobileImg" 종료 -->


               <div class="divSpace">
                  <br>
               </div>

               <!--                 class="mobileText" 시작 -->
               <div class="mobileText">
                  <span class="subtext">진행중인 주문의 상태를<br> 확인하실 수 있습니다.
                  </span>
               </div>
               <!--                 class="mobileText" 종료 -->
            </div>
            <!-- class="mobileBox" 종료 -->

         </div>
         <!--  id="mobile" 종료  -->
         <!-- 기본적으로 숨김 -->
         <div id="logout">
            <small><a href="javascript: logout()">로그아웃</a></small>
         </div>
      </div>
      <!-- id="myPageBoard 종료    -->
   </div>
   <!-- id="backBoard" 종료 -->
   <!--    <div id="webDiv"> -->
   <%@ include file="../css/footer.jsp"%>
   <!--    </div> -->
   <script>
      function goUserInfo() {
         window.location.href = 'selUser.do';
      }

      function goBoard() {
         window.location.href = 'getMyReview.do';
      }

      function goAllList() {
         window.location.href = 'odMyAllList.san';
      }

      function orderList() {
         window.location.href = 'odMyList.san';
      }
   </script>
</body>
</html>