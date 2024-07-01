<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../WEB-INF/css/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css">
<script>
window.onpageshow = function(event) {
    if (event.persisted) {
        window.location.reload();
    }
};
</script>
<body>
	<div id="vov">
		<div class="container" id="main5">
			<div class="top"></div>
			<div class="content" id="vi1">
				<img id="main_vi1"class="main" src="/resources/img/2.gif" title="산들림 라떼아트영상"
					alt="산들림 라떼아트영상"> <img class="main" src="/resources/img/1.gif"
					title="산들림 커피제조영상" alt="산들림 커피제조영상"> <img id="main_vi3" class="main"
					src="/resources/img/0.gif" title="산들림 그라인더영상" alt="산들림 그라인더영상">
			</div>
			<div class="bottom"></div>
		</div>
	</div>
	<section class="mainBack1">
		<div class="mainCo">
			SANDLIM COFFEE, <br> THE LOUNGE
		</div>

		<div class="mainCo2">
			바쁜 일상 속 잠시 쉬어갈 수 있는 공간<br> 산들림 커피입니다.
		</div>
		<img class="mainImg" src="/resources/img/메인이미지1.png" title="산들림 커피이미지"
			alt="산들림 커피이미지">
	</section>

   <% String chkMessage = request.getParameter("chkMessage");
   if(chkMessage != null) { %>
       <script>
       alert('<%=chkMessage%>');
       </script>
   <% } %>
   <%@include file="../WEB-INF/css/footer.jsp"%>
</body>
<script>
	let mainText = document.querySelector(".mainCo");
	let mainText2 = document.querySelector(".mainCo2");
	window.addEventListener("scroll", function() {
		let value = window.scrollY;

		if (value > 500) {
			mainText.style.animation = "slide 3s ease-out";
			mainText2.style.animation = "slide 3s ease-out";
		} else {
			mainText.style.animation = "backSlide 3s ease-out";
			mainText2.style.animation = "backSlide 3s ease-out";
		}
	});
</script>
</html>