<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
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
// 		$("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
	}
	let bodyHeight =document.body.getBoundingClientRect().height;
	$(".idxbody").height(bclHeight+50);
// 	$(".bcl").height(bodyHeight-50);
	
// 	console.log('idxheader: '+idxhdHeight);
// 	console.log('idxbody: '+idxbodyHeight);
// 	console.log('footer: '+ ftHeight);
// 	console.log('useHeight: '+useHeight);
// 	console.log('useHeight: '+useHeight);
	console.log('body 전: '+ bodyHeight);
	console.log('body 후: '+  document.body.getBoundingClientRect().height);
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

.row {
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
	width: 90% !important;
	height: 45% !important;
}
#pie-chart{
	display: inline-block;
	width: 90% !important;
	height: 60% !important;
}

a {
   color: #f9f5f2 !important;
   text-decoration: none !important;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="bodyDiv">
		<div class="bcl">

			<div class="sandlim" style="display: flex; justify-content: center;">
				<!-- <section class="header-container">
					<h3>관리자 메인</h3>
				</section> -->

					<div class="row">
						<div class="column left">
							<canvas id="line-chart" class="box box1"></canvas>
							<canvas id="bar-chart" class="box box2"></canvas>
						</div>
						<div class="column right">
							<canvas id="pie-chart" class="box box3"></canvas>
						</div>
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
	                  	            label: "월간 매출",
	                  	            borderColor: "#3e95cd",
	                  	            fill: false
	                  	        }]
	                  	    },
	                  	    options: {
	                  	        scales: {
	                  	            yAxes: [{
	                  	                ticks: {
	                  	                    fontSize: 15, // y축 텍스트 크기를 30으로 설정
	                  	                    fontStyle: 'bold', // y축 텍스트를 볼드로 설정
	                  	                    callback: function(value, index, values) {
	                  	                        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
	                  	                    }
	                  	                }
	                  	            }],
	                  	            xAxes: [{
	                  	                ticks: {
	                  	                    fontSize: 15, // x축 텍스트 크기를 30으로 설정
	                  	                    fontStyle: 'bold' // x축 텍스트를 볼드로 설정
	                  	                }
	                  	            }]
	                  	        },
	                  	        legend: {
	                  	            labels: {
	                  	                fontSize: 18, // 범례 텍스트 크기를 30으로 설정
	                  	                fontStyle: 'bold'
	                  	            }
	                  	        }
	                  	    }
	                  	});
	                    }
	                    
	                    
				  if (boxClass === '.box2') {
					  let timeList = [];
	                  	  let completeCountList = [];
	                  	  
	                  	  let countList = [];
	                  	  for (let i = 0; i<data.length; i++){
	                  		  timeList.push(data[i].day+ "일");
	                  	      completeCountList.push(data[i].daily_complete_count); 
	                  	  }
	
	                  	new Chart(document.getElementById("bar-chart"), {
                	        type: 'bar',
                	        data: {
                	            labels: timeList,
                	            datasets: [{
                	                data: completeCountList, // 값
                	                label: "월간 주문건수",
                	                backgroundColor: "#c45850"
                	            }]
                	        },
                	        options: {
                	            legend: {
                	                position: 'top', // 범례의 위치를 그래프 상단으로 설정
                	                labels: {
                	                    fontSize: 18,
                	                    fontStyle: 'bold'
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
                	                        fontSize: 15, // 가로축의 텍스트 크기를 30으로 설정
                	                        fontStyle: 'bold'
                	                    }
                	                }],
                	                yAxes: [{
                	                    ticks: {
                	                        fontSize: 15, // 세로축의 텍스트 크기를 30으로 설정
                	                        fontStyle: 'bold',
                	                        callback: function(value, index, values) {
                	                            return Math.floor(value) + "건"; // 각 눈금 레이블에 "건"을 붙임
                	                        }
                	                    }
                	                }]
                	            }
                	        }
                	    });
	                    }
	                     
				  if (boxClass === '.box3') {
					  let ageData = data; // 컨트롤러에서 받은 데이터
					  let ageList = Object.keys(ageData).sort(); // 연령대를 가져옵니다.
					  let ageCountList = ageList.map(age => ageData[age]); // 해당 연령대의 카운트를 가져옵니다.
					  
					  console.log("ageData: ",ageData);
					  console.log("ageList: ",ageList);
					  console.log("ageCountList: ",ageCountList);
	
					  new Chart(document.getElementById("pie-chart"), {
						    type: 'pie', // 차트의 유형을 'pie'로 설정합니다.
						    data: {
						        labels: ageList, // 연령대를 레이블로 설정합니다.
						        datasets: [{
						            data: ageCountList, // 연령대별 카운트를 데이터로 설정합니다.
						            label: "회원 연령 분포표",
						            backgroundColor: ["#3498DB", "#2ECC71","#F1C40F","#E74C3C","#9B59B6", "#1ABC9C"], // 필요한 만큼 색상을 추가합니다.
						        }]
						    },
						    options: {
						        title: {
						            display: true,
						            text: '회원 연령 분포표',
						            fontSize: 19, // 타이틀 텍스트 크기를 30으로 설정
						            fontStyle: 'bold' // 타이틀 텍스트를 볼드로 설정
						        },
						        legend: {
						            labels: {
						                fontSize: 14, // 범례 텍스트 크기를 30으로 설정
						                fontStyle: 'bold' // 범례 텍스트를 볼드로 설정
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
           loadDataIntoBox('getGraphMonStatics.do', '.box1');
           loadDataIntoBox('getGraphMonStatics.do', '.box2');
           loadDataIntoBox('getAgeStatics.do', '.box3');
       });
   </script>

	<%@include file="../css/footer.jsp"%>
</body>
</html>