<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>
$(document).ready(function() {
   //사이드 메뉴 height조정
   let idxhdHeight = document.querySelector(".idxhd").getBoundingClientRect().height; //헤더 높이
   let idxbodyHeight = document.querySelector(".idxbody").getBoundingClientRect().height; //사이즈 돞이
   
   let ftHeight = $("footer").height();
   let bclHeight =document.querySelector(".bcl").getBoundingClientRect().height;
   console.log('bclHeight 전 찍어보기: '+ bclHeight);
   
   
   let useHeight = idxhdHeight + idxbodyHeight; //가용(인덱스) height값
   
   if(useHeight > bclHeight){
      $(".bcl").height(idxbodyHeight);
//       $("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
   }
   let bodyHeight =document.body.getBoundingClientRect().height;
   $(".idxbody").height(bclHeight);
//    $(".bcl").height(bodyHeight-50);
   
//    console.log('idxheader: '+ieight);
   console.log('body 전: '+ bodyHeight);
//    console.log('body 후: '+  document.body.getBoundingClientRect().height);
   console.log('bclHeight 후: '+ $(".bcl").height());
});
</script>
<style>
#searchNav {
     -webkit-justify-content: flex-end;
     justify-content: flex-end;
 }

 * {
     font-family: "Noto Sans KR", sans-serif, "Roboto", sans-serif;
 }

 .container {
     display: flex;
     justify-content: center;
     align-items: center;
     width: 100%;
     height: 100%;
     box-sizing: border-box; /* 추가 */
 }
 
 #row1 {
    height: 400px !important;
 }

.row {
   padding: 90px;
    display: flex;
    align-items: stretch;
    height: 780px !important;
}

.column {
    flex: 50%;
    align-items: center !important; /* 수직 정렬 */
    justify-content: center !important; /* 수평 정렬 */
    padding: 10px;
}

.column.right {
    display: flex;
    flex-direction: column;
   /*  align-items: flex-start; */
    flex-wrap: wrap;
    align-items: center !important; /* 수직 정렬 */
    justify-content: center !important; /* 수평 정렬 */
    padding: 10px;
}

 .box {
     flex: 1;
     margin: 20px;
     width: 100% !important;
     height: 350px;
     padding: 20px;
     box-sizing: border-box;
     background-color: #f9f5f2;
     box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
 }

 .data-point {
     width: 100%;
     padding: 10px;
     margin-bottom: 10px;
     border-radius: 5px;
     font-size: 15px;
 }

 #red {
     color: red;
     font-weight: bold !important;
 }

 .sandlim {
     padding: 20px;
     margin-top : 70px;
     padding: 0 100px 0 100px;
 }

 #head {
     font-size: 17px;
     font-weight: bold !important;
 }

 .header-container {
     text-align: center !important;
     padding: 25px;
 }

 .bcl {
     width: 100%;
 }
#line-chart, #bar-chart{
   display: inline-block;
   width: 50% !important;
   height: 55% !important;
}
#pie-chart{
   display: inline-block;
   width: 90% !important;
   height: 60% !important;
}
a{
   text-decoration: none !important;
    color: #f9f5f2 !important;
}
</style>
<meta charset="UTF-8">
<title>산들림</title>
</head>
<body>
   <div class="bodyDiv">
      <div class="bcl">

         <div class="adminMain">
            <!-- <section class="header-container">
               <h3>관리자 메인</h3>
            </section> -->
            <div class="container2">
               <div id="row1" class="row">
                  <div class="box box1"></div>
                  <div class="box box2"></div>
                  <div class="box box3"></div>
                  <div class="box box4"></div>
               </div>
               <div class="row">
               <canvas id="line-chart" class="box box5"></canvas>
               <canvas id="bar-chart" class="box box6"></canvas>
               
               </div>
               
               <%-- <canvas id="line-chart2" class="box box7"></canvas>
               <canvas id="bar-chart2" class="box box8"></canvas>
                  
               <canvas id="pie-chart" class="box box9"></canvas> --%>
            </div>
         </div>
      </div>
   </div>
   <script>
   
   let posList = [];
   
       $(document).ready(function() {
           function loadDataIntoBox(url, boxClass) {
               $.ajax({
                   url: url,
                   method: 'GET',
                   dataType: 'json',
                   success: function(data) {
                       $(boxClass).html(data);
                       
                      
                       if (boxClass === '.box1') {
                          $(boxClass).html("<div class='data-point' id='head'>주문/배송</div>");
                           $(boxClass).append("<hr>");
                           $(boxClass).append("<div class='data-point' id='red'>신규주문: " + data.daily_orderCheck_count + " 건</div>");
                           $(boxClass).append("<div class='data-point'>배송준비: " + data.daily_orderProgress_count + " 건</div>");
                           $(boxClass).append("<div class='data-point'>배송중: " + data.daily_manufactureComplete_count + " 건</div>");
                           $(boxClass).append("<div class='data-point'>배송완료: " + data.daily_complete_count + " 건</div>");
                       }
                      
                       if (boxClass === '.box2') {
                          $(boxClass).html("<div class='data-point' id='head'>매출 통계</div>");
                          $(boxClass).append("<hr>");
                          $(boxClass).append("<div class='data-point' id='red'>일 매출 금액: " + data.daily_sales.toLocaleString('ko-KR') + " 원</div>");
                          $(boxClass).append("<div class='data-point'>월 매출 금액: " + data.monthly_sales.toLocaleString('ko-KR') + " 원</div>");
                       }
   
                       if (boxClass === '.box3') {
                          $(boxClass).html("<div class='data-point' id='head'>상품</div>");
                          $(boxClass).append("<hr>");
                          $(boxClass).append("<div class='data-point'>판매중 상품: " + data.sale + " 개</div>");
                          $(boxClass).append("<div class='data-point'>품절: " + data.soldOut + " 개</div>");
                       }
   
                       if (boxClass === '.box4') {
                          $(boxClass).html("<div class='data-point' id='head'>회원</div>");
                          $(boxClass).append("<hr>");
                          $(boxClass).append("<div class='data-point' id='red'>신규회원: " + data.recentUser + " 명</div>");
                          $(boxClass).append("<div class='data-point'>전체회원: " + data.totalUser + " 명</div>");
                       }
                       
                       
                       if (boxClass === '.box5') {
                          
                         let timeList = [];
                          let countList = [];
                          for (let i = 0; i<data.length; i++){
                              timeList.push(data[i].day+ "일");
                              posList.push(data[i].daily_sales);
                              
                          }

                         new Chart(document.getElementById("line-chart"), {
                            type: 'line',
                            data: {
                                labels: timeList,
                                datasets: [{
                                    data: posList,
                                    label: "주간 매출",
                                    borderColor: "#3e95cd",
                                    fill: false
                                }]
                            },
                            options: {
                                layout: {
                                    padding: {
                                        left: 5 // 이 값을 조절하여 왼쪽 패딩을 설정
                                    }
                                },
                                scales: {
                                    yAxes: [{
                                        ticks: {
                                            fontSize: 30, // y축 텍스트 크기를 30으로 설정
                                            fontStyle: 'bold',
                                            callback: function(value, index, values) {
                                                return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                                            }
                                        },
                                        scaleLabel: {
                                            display: true,
                                            labelString: '금액 (원)',
                                            fontSize: 30, // y축 레이블 텍스트 크기를 30으로 설정
                                            fontStyle: 'bold'
                                        }
                                    }],
                                    xAxes: [{
                                        ticks: {
                                            fontSize: 30, // x축 텍스트 크기를 30으로 설정
                                            fontStyle: 'bold'
                                        }
                                    }]
                                },
                                legend: {
                                    labels: {
                                        fontSize: 30 // 범례의 텍스트 크기를 30으로 설정
                                    }
                                },
                                tooltips: {
                                    bodyFontSize: 40, // 툴팁 본문 글꼴 크기
                                    titleFontSize: 40, // 툴팁 제목 글꼴 크기
                                    callbacks: {
                                        label: function(tooltipItem, data) {
                                            return data.datasets[tooltipItem.datasetIndex].label + ": " + tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
                                        }
                                    }
                                }
                            }
                        });
                         
                       }
                       
                       
                       if (boxClass === '.box6') {
                           console.log("데이터 값은? : ",data);
                           let timeList = [];
                           let completeCountList = [];
                           
                           let countList = [];
                           for (let i = 0; i < data.length; i++) {
                               timeList.push(data[i].day + "일");
                               completeCountList.push(data[i].daily_complete_count); 
                           }
                           
                           new Chart(document.getElementById("bar-chart"), {
                               type: 'bar',
                               data: {
                                   labels: timeList,
                                   datasets: [{
                                       data: completeCountList, // 값
                                       label: "주간 주문건수",
                                       backgroundColor: "#c45850",
                                   }]
                               },
                               options: {
                                   legend: {
                                       position: 'top', // 범례의 위치를 그래프 상단으로 설정
                                       labels: {
                                           fontSize: 30,
                                       }
                                   },
                                   layout: {
                                       padding: {
                                           left: 10 // 이 값을 조절하여 왼쪽 패딩을 설정
                                       }
                                   },
                                   scales: {
                                       xAxes: [{
                                           ticks: {
                                               fontSize: 30, // 가로축의 텍스트 크기를 30으로 설정
                                               fontStyle: 'bold'
                                           }
                                       }],
                                       yAxes: [{
                                           ticks: {
                                               fontSize: 30, // 세로축의 텍스트 크기를 30으로 설정
                                               fontStyle: 'bold',
                                               callback: function(value, index, values) {
                                                   return Math.floor(value) + "건"; // 각 눈금 레이블에 "건"을 붙임
                                               }
                                           }
                                       }]
                                   },
                                   tooltips: {
                                       bodyFontSize: 40, // 툴팁 본문 글꼴 크기
                                       titleFontSize: 40, // 툴팁 제목 글꼴 크기
                                       callbacks: {
                                           label: function(tooltipItem, data) {
                                               return data.datasets[tooltipItem.datasetIndex].label + ": " + tooltipItem.yLabel + "건";
                                           }
                                       }
                                   }
                               }
                           });
                       }
                      
                   },
                   error: function() {
                       $(boxClass).html('Error loading data');
                   }
               });
           }
   
           // 각각의 박스에 데이터 로드
           loadDataIntoBox('getMdTodayStatics.do', '.box1');
           loadDataIntoBox('getMdSaleStatics.do', '.box2');
           loadDataIntoBox('getMdStatics.do', '.box3'); 
           loadDataIntoBox('getSignStatics.do', '.box4');
           loadDataIntoBox('getGraphWeekStatics.do', '.box5');
           loadDataIntoBox('getGraphWeekStatics.do', '.box6');
       });
   </script>


   <%@include file="../css/footer.jsp"%>
</body>
</html>