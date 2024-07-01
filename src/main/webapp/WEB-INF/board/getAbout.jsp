<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../css/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>산들림</title>
<style>

.about-daum {
	width: 100%;
	margin: 10px;
	display: flex;
	justify-content: center;
}

.roughmap_maker_label {
	/* 	left: 46px !important; */
	
}

.sandlim-about {
	margin: 10px;
}

.sandlim-header, .about-us {
	text-align: center;
}

.sandlim-contents {
	/* display: flex; */
	justify-content: center;
}

.about.inner {
	padding: 10px;
}

@media only screen and (max-width: 576px) {
	.about-daum {
/* 		display: flex; */
/* 		justify-content: center; */
		flex-wrap: wrap;
	}

	#abp {
    margin-top: 0;
    margin-bottom: 1rem;
    padding: 10px 85px 10px 85px;
}
#abh3{
  font-size: 20px;
}
.abh4{
  font-size: 18px;
}
#abmap{
width:200px;
height:200px;
}
.about.inner {
    padding: 20px 10px 10px 10px;
}
}
@media only screen and (max-width: 400px) {
	.aball {
width: 100% !important;
	}
    #abh3 {
        text-align: start !important;
        font-size: 18px;
        margin: 30px 0 0 15px !important;

}.abh4{
  font-size: 17px;
}
#abti{
  font-size: 19px;
}
#abp {
        padding: 10px 40px 10px 40px;
        font-size: 15px;
        margin-bottom: 70px;
    }
    .abp2{
    font-size:15px;
    }
    .about.inner {
        padding: 20px 20px 10px 5px;
    }
    .about-daum {
    display: block;
}
</style>
</head>
<body>
<div class ="aball">
	<div class="sandlim-wrap">
		<div class="sandlim-container">
			<section class="sandlim-header">
				<div class="about h">
					<h3>ABOUT US</h3>
				</div>
			</section>
			<section class="sandlim-contents">
				<div class="sandlim-about">
					<div class="about-us">
						<h3 id="abti">“커피 이상의 특별한 경험을 소개합니다.”</h3>
						<div class="about1">
							<p id="abp">
								이리저리 돌아다니며 찾아오는 소나기처럼 변화무쌍한 삶 속에서도 잠시나마 쉼을 선사합니다.<br> 생활 속에
								스며들어있는 전 세계의 커피 문화를 일상을 풍요롭게 하는 제3의 공간으로서<br> 국내에서도 지역사회
								속에서 고객과 함께하며 산들림의 새로운 커피문화를 정착시키고 있습니다.
							</p>
						</div>
					</div>



					<div class="map">
						<div>
							<h3 id="abh3">오시는 길</h3>
						</div>
						<div class="about-daum">
							<div id="daumRoughmapContainer1712547335268"
								class="root_daum_roughmap root_daum_roughmap_landing"></div>
							<!-- 							<div class="about addr"> -->
							<div class="about inner" style="text-algin: left;">
								<h4 class= "abh4">주소</h4>
								<p class="abp2">경기도 안양시 만안구 안양로314번길 10 광창빌딩 3층</p>
								<br>
								<h4 class= "abh4">교통편</h4>
								<p class="abp2">
									지하철 : 안양역 1번 출구 도보 10분거리<br> 버스 : 안양1번가 하차 09220 | 안양역 방면<br>
									마을버스 2번<br> 마을버스 9번
								</p>
								<br>
								<h4 class= "abh4">전화</h4>
								<p class="abp2">031-0000-0000</p>
							</div>
							<!-- 							</div> -->
						</div>
					</div>


				</div>
			</section>
			<section class="sandlim-footer"></section>
		</div>

	</div>
	
	</div>

	<%@ include file="../css/footer.jsp"%>
</body>
<script charset="UTF-8" class="daum_roughmap_loader_script"
	src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1712547335268",
		"key" : "2itqn",
		"mapWidth" : "360",
		"mapHeight" : "360"
	}).render();
</script>

<script>
	window.onload = function() {
		document.getElementsByClassName("roughmap_lebel_text")[0].innerText = "산들림";
	};
</script>
</html>