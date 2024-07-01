<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="adminIndex.jsp"%>
<style>
#selectuser-container {
    max-width: 680px;
    margin: 0px auto;
    padding: 0 20px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
}
.selectuser {
    color: #272727;
}
input.fffcolor {
	background-color: #f9f5f2 !important;
}

select.fffcolor {
	background-color: #f9f5f2 !important;
}
.notice {display: flex; flex-direction: row-reverse; color: #f00;}

/* input.innm.innm-read{background-color: #f9f5f2 !important;} */

.innm {background-color: #fff !important}
.form-control:focus {border-color:  #ced4da; box-shadow: none;}
a{
   text-decoration: none !important;
    color: #f9f5f2 !important ;
}
</style>
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
// 		$("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
	}
	let bodyHeight =document.body.getBoundingClientRect().height;
	$(".idxbody").height(bclHeight);
// 	$(".bcl").height(bodyHeight-65.59);
	
// 	console.log('idxheader: '+idxhdHeight);
// 	console.log('idxbody: '+idxbodyHeight);
// 	console.log('footer: '+ ftHeight);
// 	console.log('useHeight: '+useHeight);
// 	console.log('useHeight: '+useHeight);
// 	console.log('body 전: '+ bodyHeight);
// 	console.log('body 후: '+  document.body.getBoundingClientRect().height);
// 	console.log('bclHeight 후: '+ $(".bcl").height());
});
</script>
<body>
<div class="bcl">
	<div class="sandlim" id="selectuser-container">
		<section class="header-container">
			<h3 class="selectuser">회원상세</h3>			
		</section>

		<form name="fm" action="updateUserAdmin.do" method="post" onsubmit="return chk()">

			<input type="hidden" id="u_pw" name="u_pw" value="">

			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">아이디</span>
				</div>
				<input type="text" class="form-control innm select-input innm-read" id="u_id" name="u_id" value="${user.u_id}" readonly>
			</div>

			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">닉네임</span>
				</div>
				<input type="text" class="form-control innm select-input innm-read" id="u_nick" name="u_nick" value="${user.u_nick}" readonly>
			</div>

			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">

					<span class="input-group-text">이름</span>

				</div>
				<input type="text" class="form-control innm select-input innm-read" id="u_name" name="u_name" value="${user.u_name}" readonly>
			</div>

			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">전화번호</span>
				</div>
				<input type="text" class="form-control innm select-input innm-read" id="u_phno" name="u_phno" value="${user.u_phno}" readonly>
			</div>

			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">대표 주소 </span>
				</div>
				<input type="text" class="form-control innm select-input" id="u_addr" name="u_addr" value="${user.u_addr}" readonly>
			</div>

			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">생년월일</span>
				</div>
				<input type="text" class="form-control innm select-input" id="u_birth" name="u_birth" value="${user.u_birth}" readonly>

				<script>
					var userBirth = "${user.u_birth}";
					var year = userBirth.substring(0, 4);
					var month = userBirth.substring(4, 6);
					var day = userBirth.substring(6);
					var text = year + "년 " + month + "월 " + day + "일";
					document.getElementById('u_birth').value = text;
				</script>
				
			</div>

			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">이메일 </span>
				</div>
				<input type="text" class="form-control innm select-input" id="u_email" name="u_email" value="${user.u_email}" readonly>
			</div>
			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">포인트 </span>
				</div>
				<input type="text" class="form-control innm select-input" id="u_point" onblur="setDefaultIfEmpty()" name="u_point" value="${user.u_point}" readonly>
			</div>

			<div class="input-group mb-3" style="margin-bottom: 5px !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">상태</span>
				</div>
				<select class="form-control innm select-input" id="u_status" name="u_status" required>
					<option disabled>권한 수정</option>
					<option value="일반회원"<c:if test="${user.u_status eq '일반회원' }">selected</c:if>>일반회원</option>
					<option value="탈퇴회원"<c:if test="${user.u_status eq '탈퇴회원' }">selected</c:if>>탈퇴회원</option>
					<option value="스태프"<c:if test="${user.u_status eq '스태프' }">selected</c:if>>스태프</option>
					<option value="관리자"<c:if test="${user.u_status eq '관리자' }">selected</c:if>>관리자</option>
				</select>
			</div>
			<div class="small notice">*저장버튼을 누를시 변경된 내용이 저장됩니다. </div>
			<div id="footer">

				<button type="button" class="btn btn-primary" onclick="toggleReadOnly();">
					<span id="changeDatabtn">변경</span>
					<span id="saveDatabtn" style="display: none;">등록</span>
				</button>
				<button type="submit" class="btn btn-primary">저장</button>
				<button type="button" class="btn btn-primary" onclick="javascript:location.href='userList.do';">회원목록</button>
			</div>
		</form>
	</div>
</div>
	<script>
		function setDefaultIfEmpty() {
			var inputField = document.getElementById('u_point');
			if (inputField.value.trim() === '') {
				inputField.value = '0';
			}
		}

		function toggleReadOnly() {

			toggleText('changeDatabtn', 'saveDatabtn');

			var isReadOnly = document.getElementById('u_nick').hasAttribute(
					"readonly");
			if (isReadOnly) {
				document.getElementById('u_nick').removeAttribute("readonly");
				document.getElementById('u_phno').removeAttribute("readonly");
				document.getElementById('u_addr').removeAttribute("readonly");
				document.getElementById('u_email').removeAttribute("readonly");
				document.getElementById('u_point').removeAttribute("readonly");

				document.getElementById('u_nick').classList.add("fffcolor");
				document.getElementById('u_phno').classList.add("fffcolor");
				document.getElementById('u_addr').classList.add("fffcolor");
				document.getElementById('u_email').classList.add("fffcolor");
				document.getElementById('u_point').classList.add("fffcolor");
				document.getElementById('u_status').classList.add("fffcolor");
			} else {
				document.getElementById('u_nick').setAttribute("readonly",
						"readonly");
				document.getElementById('u_phno').setAttribute("readonly",
						"readonly");
				document.getElementById('u_addr').setAttribute("readonly",
						"readonly");
				document.getElementById('u_email').setAttribute("readonly",
						"readonly");
				document.getElementById('u_point').setAttribute("readonly",
						"readonly");

				document.getElementById('u_nick').classList.remove("fffcolor");
				document.getElementById('u_phno').classList.remove("fffcolor");
				document.getElementById('u_addr').classList.remove("fffcolor");
				document.getElementById('u_email').classList.remove("fffcolor");
				document.getElementById('u_point').classList.remove("fffcolor");
				document.getElementById('u_status').classList
						.remove("fffcolor");
			}
			document.getElementById('u_nick').focus();
		}
		function toggleText(changeText, saveText) {
			var changeSpan = document.getElementById(changeText);
			var saveSpan = document.getElementById(saveText);
			if (changeSpan.style.display === "none") {
				changeSpan.style.display = "inline";
				saveSpan.style.display = "none";
			} else {
				changeSpan.style.display = "none";
				saveSpan.style.display = "inline";
			}
		}
	</script>
	<%@ include file="../css/footer.jsp"%>
</body>
</html>
