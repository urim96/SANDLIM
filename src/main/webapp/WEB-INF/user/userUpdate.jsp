<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>정보 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/signup.css">
</head>
<%@ include file="../css/header.jsp"%>

<style>
* {
	font-family: "Noto Sans KR", sans-serif;
	font-family: Roboto, sans-serif;
	/* 	color: #272727; */
}

h2 {
	padding-top: 60px;
}

#updateBtn {
	width: 35% !important;
	font-weight: 700 !important;
	background-color: #272727 !important;
	color: #f9f5f2 !important;
	border: none !important;
	box-shadow: none !important;
	border-radius: 4px;
	padding: 12px;
	margin-right: 30px;
}

#updateBtn:hover {
	background-color: #f9f5f2 !important;
	color: #272727 !important;
}

#gobackBtn {
	width: 35% !important;
	font-weight: 700 !important;
	background-color: #f9f5f2 !important;
	color: #272727 !important;
	border: none !important;
	box-shadow: none !important;
	border-radius: 4px;
	padding: 12px;
}

#gobackBtn:hover {
	background-color: #272727 !important;
	color: #f9f5f2 !important;
}

.title {
	text-align: center;
}

div .title {
	display: flex;
	margin: 40px auto;
	margin-bottom: 150px;
	justify-content: center;
	align-items: center;
}

#backboard {
	width: 550px;
	margin: 0 auto;
}

table {
	width: 100%;
	margin: 0 auto;
	background-color: #f2f2f2;
	border-collapse: collapse;
	border-radius: 10px;
	margin: 0 auto;
}

table th, table td {
	padding: 10px;
	border: 1px solid white;
	text-align: left;
}

table th {
	color: black;
	text-align: center;
}

tr td:nth-child(1) {
	color: gray;
	width: 20%
}

tr td:nth-child(2) {
	text-align: center;
}

#changePw {
	margin: 10px;
	text-align: right;
}

#changePw:hover {
	cursor: pointer;
	text-decoration: underline;
}

#saveText {
	margin: 10px;
	text-align: right;
	color: red;
	font-size: 11px;
}

#showAddr {
	margin: 5px 0px 0px 0px;
	float: right;
}

#showAddr:hover {
	cursor: pointer;
	text-decoration: underline;
}

#changePwAction, #changePhnoAction, #changeAddrAction01,
	#changeAddrAction02, #changeAddrAction03, #warningAddr01,
	#warningAddr02, #warningAddr03, #subAddr, #u_addr01, #u_addr02,
	#u_addr03 {
	display: none;
}

.search-container {
	position: relative;
}

.search-container input[type="text"] {
	padding-right: 30px;
	background-color: #f2f2f2;
}

#u_addr01Show, #u_addr02Show, #u_addr03Show {
	word-break: keep-all;
	padding-right: 30px;
	background-color: #f2f2f2;
	width: 100%;
	padding: 8px;
	padding-right: 55px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.search-container button {
	width: 8%;
	position: absolute;
	top: 0;
	right: 0;
	margin: 8px 10px;
	padding: 5px 10px;
	background-color: #272727;
	border: none;
	cursor: pointer;
	border-radius: 10px;
	font-size: 11px;
}

.search-container button:hover {
	background-color: #f9f5f2;
}

#postcode01, #postcode02, #postcode03, #checkPhnoNum {
	width: 50%;
}

#searchPostcode1, #searchPostcode2, #searchPostcode3, #delAddr2,
	#delAddr3, #checkPhnobutton, #sendMsgPhno {
	float: right;
	width: 20%;
}

label {
	margin-top: 5px;
	margin-bottom: 0px;
}

#searchPostcode1, #searchPostcode2, #searchPostcode3, #delAddr2:hover,
	#delAddr3:hover, #sendMsgPhno, #checkPhnobutton:hover {
	background-color: #272727;
	color: #f9f5f2;
}

#searchPostcode1:hover, #searchPostcode2:hover, #searchPostcode3:hover,
	#delAddr2, #delAddr3, #sendMsgPhno:hover, #checkPhnobutton {
	background-color: #f9f5f2;
	color: #272727;
}

#timer {
	text-align: center;
}

#searchPostcode1,#searchPostcode2,#searchPostcode3, #delAddr1, #delAddr2, #delAddr3 {
	width: 15%;
    font-size: 11px;
    padding: 12px;
}

/* 반응형 */
@media screen and (max-width: 400px) {
	tr td:nth-child(1) {
		width: 35%;
	}
	#backboard {
		width: 300px;
	}
	.search-container button {
		width: 45px;
	}
	div .title {
		margin: 0px auto;
	}
	h2 {
		padding-top: 30px;
	}
	div .title {
		margin: 0px auto;
		margin-bottom: 90px;
	}
}

@media screen and (max-width: 576px) and (min-width:401px) {
	#backboard {
		width: 400px;
	}
	.search-container button {
		width: 45px;
	}
	tr td:nth-child(1) {
		width: 110px;
	}
}

@media screen and (max-width: 1199px) and (min-width:577px) {
}

@media screen and (min-width:1200px) {
}
</style>

<body>
	<div id="backboard">
		<h2 class="title">정보 수정</h2>
		<div id="saveText">최하단 저장 버튼을 눌러야 변경된 정보가 저장됩니다.</div>
		<table>
			<thead>
				<tr>
					<th colspan="2">기본 정보</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>${user.u_id}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${user.u_name}</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<div id="user_birth"></div> <script>
							var userBirth = "${user.u_birth}";
							var year = userBirth.substring(0, 4);
							var month = userBirth.substring(4, 6);
							var day = userBirth.substring(6);
							var text = year + "년 " + month + "월 " + day + "일";
							document.getElementById("user_birth").innerHTML = text;
						</script>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="changePw"
			onclick="document.getElementById('changePwAction').style.display = 'block';">비밀번호
			변경 ></div>


		<form action="updateUser.do" method="post">
			<input type="hidden" id="u_id" name="u_id" value="${user.u_id}">
			<div id="changePwAction">
				<input type="password" id="u_pw" name="u_pw" maxlength="30"
					placeholder="새 비밀번호"> <br> <br> <input
					type="password" id="u_pw2" name="u_pw2" maxlength="30"
					placeholder="비밀번호 확인"><br>

				<div id="warningPw1">8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해주세요.</div>
				<div id="warningPw2">비밀번호가 일치하지 않습니다.</div>
				<br>
			</div>

			<label for="u_nick">닉네임</label>
			<div class="search-container">
				<input type="text" id="u_nick" name="u_nick" required maxlength="4"
					autocomplete="off" value="${user.u_nick}" readonly>
				<button type="button"
					onclick="toggleReadOnly('u_nick'); toggleText('changeTextNick', 'saveTextNick')">
					<span id="changeTextNick">변경</span> <span id="saveTextNick"
						style="display: none;">등록</span>
				</button>
			</div>

			<div id="warningNick">닉네임은 1글자 이상 4글자 미만의 한글, 영문, 숫자로 가능합니다.</div>

			<label for="u_phno">휴대폰 번호</label>

			<div class="search-container">
				<input type="text" id="u_phno" name="u_phno" required maxlength="11"
					autocomplete="off" value="${user.u_phno}" readonly>
				<button id="changePhnoBtn" type="button"
					onclick="toggleReadOnly('u_phno'); showAction('changePhnoAction'); phnoChange();">
					변경</button>
			</div>

			<div id="needPhno">번호를 입력해주세요.</div>

			<div id="warningSamePhno">이미 등록된 전화번호입니다.</div>

			<div id="warningPhno">
				올바른 번호를 숫자로 입력해주세요.<br>예시) 01012345678
			</div>

			<div id="changePhnoAction">
				<input type="text" id="checkPhnoNum" name="checkPhnoNum"
					autocomplete="off" maxlength="6" placeholder="인증번호를 입력해주세요.">&nbsp;&nbsp;&nbsp;&nbsp;<span
					id="timer"></span> <input id="checkPhnobutton" type="button"
					onclick="checkPhno()" value="인증번호 확인"> <input
					id="sendMsgPhno" type="button" onclick="sendCheck()"
					value="인증번호 발송"> <br>
			</div>
			<div id="checkPhnoOk">인증이 완료되었습니다.</div>
			<div id="warningCheckPhno">인증번호가 일치하지 않습니다.</div>
			<div class="addrTextBox">
				<label for="detailAddress01">주소</label><span id="showAddr"
					onclick="showAction('subAddr')">주소 더보기></span>
			</div>
			<div class="search-container">
				<div id="u_addr01Show">&nbsp;${user.u_addr}</div>
				<input type="text" id="u_addr01" name="u_addr01"
					value="${user.u_addr}" readonly><br>
				<button type="button"
					onclick="showAction('changeAddrAction01'); validateAddr01(); toggleText('changeTextAddr1', 'saveTextAddr1');">
					<span id="changeTextAddr1">변경</span> <span id="saveTextAddr1"
						style="display: none;">등록</span>
				</button>
			</div>

			<div id="changeAddrAction01">
				<br> <input type="text" id="postcode01" name="postcode01"
					onclick="execDaumPostcode01()" placeholder="우편번호" readonly><input
					id="searchPostcode1" type="button" onclick="execDaumPostcode01()"
					value="찾기"><br> <input type="text" id="address01"
					onclick="execDaumPostcode01()" placeholder="주소" readonly><br>
				<input type="text" id="detailAddress01" maxlength="100"
					autocomplete="off" placeholder="상세주소"><br>
				<div id="warningAddr01">우편번호 찾기를 통해, 주소를 입력해주세요.</div>
				<input type="hidden" id="u_addr" name="u_addr"> <br>
			</div>

			<div id="subAddr">
				<div class="search-container">
					<div id="u_addr02Show">&nbsp;${user.u_addr2}</div>
					<input type="text" id="u_addr02" name="u_addr02"
						value="${user.u_addr2}" readonly><br>
					<button type="button"
						onclick="showAction('changeAddrAction02'); validateAddr02(); toggleText('changeTextAddr2', 'saveTextAddr2');">
						<span id="changeTextAddr2">변경</span> <span id="saveTextAddr2"
							style="display: none;">등록</span>
					</button>
				</div>
				<div id="changeAddrAction02">
					<br> <input type="text" id="postcode02" name="postcode02"
						onclick="execDaumPostcode02()" placeholder="우편번호" readonly><input
						id="delAddr2" type="button" onclick="delAddr02();" value="삭제">
					<input type="button" id="searchPostcode2"
						onclick="execDaumPostcode02()" value="찾기"><br> <input
						type="text" id="address02" placeholder="주소"
						onclick="execDaumPostcode02()" readonly><br> <input
						type="text" id="detailAddress02" maxlength="100"
						autocomplete="off" placeholder="상세주소"><br>
					<div id="warningAddr02">우편번호 찾기를 통해, 주소를 입력해주세요.</div>
					<input type="hidden" id="u_addr2" name="u_addr2"> <br>
				</div>

				<div class="search-container">
					<div id="u_addr03Show">&nbsp;${user.u_addr3}</div>
					<input type="text" id="u_addr03" name="u_addr03"
						value="${user.u_addr3}" readonly><br>
					<button type="button"
						onclick="showAction('changeAddrAction03'); validateAddr03(); toggleText('changeTextAddr3', 'saveTextAddr3');">
						<span id="changeTextAddr3">변경</span> <span id="saveTextAddr3"
							style="display: none;">등록</span>
					</button>
				</div>

				<div id="changeAddrAction03">
					<br> <input type="text" id="postcode03" name="postcode03"
						onclick="execDaumPostcode03()" placeholder="우편번호" readonly><input
						id="delAddr3" type="button" onclick="delAddr03();" value="삭제">
					<input type="button" id="searchPostcode3"
						onclick="execDaumPostcode03()" value="찾기"><br> <input
						type="text" id="address03" placeholder="주소"
						onclick="execDaumPostcode03()" readonly><br> <input
						type="text" id="detailAddress03" maxlength="100"
						autocomplete="off" placeholder="상세주소"><br>
					<div id="warningAddr03">우편번호 찾기를 통해, 주소를 입력해주세요.</div>
					<input type="hidden" id="u_addr3" name="u_addr3"> <br>
				</div>
			</div>
			<label for="u_email">이메일</label>

			<div class="search-container">
				<input type="text" id="u_email" name="u_email" maxlength="100"
					autocomplete="off" required value="${user.u_email}" readonly>
				<button type="button"
					onclick="toggleReadOnly('u_email'); toggleText('changeTextEmail', 'saveTextEmail');">
					<span id="changeTextEmail">변경</span> <span id="saveTextEmail"
						style="display: none;">등록</span>
				</button>
			</div>

			<div id="warningSameEmail">이미 등록된 이메일입니다.</div>

			<div id="warningEmail">이메일을 올바른 형식으로 작성해주세요.</div>

			<br> <br> <br>
			<div class="title">
				<button type="submit" id="updateBtn">저장</button>
				<button type="button" id="gobackBtn"
					onclick="javascript:location.href='selUser.do';">돌아가기</button>
			</div>

			<div id="warningNoCheckPhno">번호 인증을 진행해주세요.</div>
		</form>

		<script>
			var checkNum = true;
			var validateSamePhnoCheck = true;
			var validateSameEmailCheck = true;
			var checkPhnoResult = true;

			var timeoutId;
			var countdownId;
			var remainingTime;

			function phnoChange() {
				checkPhnoResult = false;
				hideWarning("checkPhnoOk");
				hideWarning("changePhnoBtn");
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

			function resetRemTime() {
				remainingTime = 180;
			}

			document.getElementById("u_pw").addEventListener("blur",
					validatePassword);

			document.getElementById("u_pw2").addEventListener("blur",
					validatePasswordMatch);

			document.getElementById("u_nick").addEventListener("blur",
					validateNick);

			document.getElementById("u_phno").addEventListener("blur",
					validatePhno);

			document.getElementById("u_phno").addEventListener("blur",
					validateSamePhno);

			document.getElementById("u_email").addEventListener("blur",
					validateEmail);

			document.getElementById("u_email").addEventListener("blur",
					validateSameEmail);

			function validatePassword() {
				var userPw = document.getElementById("u_pw").value;
				var pwdPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\^\w]).{8,16}$/;
				hideWarning("warningPw1");

				if (userPw.trim() != "") {

					if (!pwdPattern.test(userPw)) {
						document.getElementById("warningPw1").style.display = "block";
						return false;
					}

				}
				return true;
			}

			function validatePasswordMatch() {
				var pw = document.getElementById("u_pw").value;
				var pw2 = document.getElementById("u_pw2").value;
				hideWarning("warningPw2");
				if (pw !== pw2) {
					document.getElementById("warningPw2").style.display = "block";
					return false;
				}
				return true;
			}

			function validateNick() {
				var userNick = document.getElementById("u_nick").value;
				var nickPattern = /^[가-힣a-zA-Z0-9_]{1,10}$/;
				hideWarning("warningNick");
				if (!nickPattern.test(userNick)) {
					document.getElementById("warningNick").style.display = "block";
					return false;
				}
				return true;
			}

			function validatePhno() {
				var userPhno = document.getElementById("u_phno").value;
				var phoneNoPattern = /^01[0-9]{1}[0-9]{3,4}[0-9]{4}$/;
				hideWarning("warningPhno");
				hideWarning("needPhno");
				if (!phoneNoPattern.test(userPhno)) {
					document.getElementById("warningPhno").style.display = "block";
					return false;
				}
				return true;
			}

			function validateSamePhno() {
				var userId = document.getElementById("u_id").value;
				var userPhno = document.getElementById("u_phno").value;
				$
						.ajax({
							url : "checkSamePhno2.do",
							type : "post",
							data : JSON.stringify({
								u_id : userId,
								u_phno : userPhno
							}),
							contentType : 'application/json; charset=utf-8',
							cache : false,
							success : function(data) {
								if (data) {
									hideWarning("warningSamePhno");

									validateSamePhnoCheck = true;
								} else {
									hideWarning("warningSamePhno");
									document.getElementById("warningSamePhno").style.display = "block";
									validateSamePhnoCheck = false;
								}
							},
							error : function() {
								alert('error');
							}
						});
			}

			function validateSameEmail() {
				var userId = document.getElementById("u_id").value;
				var userEmail = document.getElementById("u_email").value;
				$
						.ajax({
							url : "checkSameEmail2.do",
							type : "post",
							data : JSON.stringify({
								u_id : userId,
								u_email : userEmail
							}),
							contentType : 'application/json; charset=utf-8',
							cache : false,
							success : function(data) {
								if (data) {
									hideWarning("warningSameEmail");
									validateSameEmailCheck = true;
								} else {
									hideWarning("warningSameEmail");
									document.getElementById("warningSameEmail").style.display = "block";
									validateSameEmailCheck = false;
								}
							},
							error : function() {
								alert('error');
							}
						});

			}

			function sendCheck() {

				document.getElementById('sendMsgPhno').style.backgroundColor = "#f9f5f2";
				document.getElementById('sendMsgPhno').style.color = "#272727";
				document.getElementById('checkPhnobutton').style.backgroundColor = "#272727";
				document.getElementById('checkPhnobutton').style.color = "#f9f5f2";

				document.getElementById('sendMsgPhno').addEventListener(
						'mouseenter', function() {
							this.style.backgroundColor = '#272727';
							this.style.color = '#f9f5f2';
						});

				document.getElementById('sendMsgPhno').addEventListener(
						'mouseleave', function() {
							this.style.backgroundColor = '#f9f5f2';
							this.style.color = '#272727';
						});

				document.getElementById('checkPhnobutton').addEventListener(
						'mouseenter', function() {
							this.style.backgroundColor = '#f9f5f2';
							this.style.color = '#272727';
						});

				document.getElementById('checkPhnobutton').addEventListener(
						'mouseleave', function() {
							this.style.backgroundColor = '#272727';
							this.style.color = '#f9f5f2';
						});

				// 이전 요청이 있다면 취소
				if (timeoutId)
					clearTimeout(timeoutId);
				if (countdownId)
					clearInterval(countdownId);

				var userPhno = document.getElementById("u_phno").value;

				if (validateSamePhnoCheck && validatePhno()) {

					hideWarning("needPhno");

					$
							.ajax({
								url : "checkRealPhno.do",
								type : "post",
								data : JSON.stringify({
									u_phno : userPhno
								}),
								contentType : 'application/json; charset=utf-8',
								cache : false,
								success : function(data) {

									hideWarning("warningNoCheckPhno");

									checkNum = data;

									resetRemTime();
									document.getElementById('timer').textContent = "3:00";
									// 인증 코드 요청이 성공했을 때 시간제한 설정
									startTimer();

								},
								error : function() {
									alert('error');
								}
							});

				} else {

					document.getElementById("needPhno").style.display = "block";

				}

			}

			function startTimer() {
				// 인증 코드가 만료되면 실행될 콜백 함수
				var onTimeout = function() {
					checkNum = null;
					alert('인증 시간이 만료되었습니다.');
				};

				// 인증 코드 요청 후 5분 후에 onTimeout 실행
				timeoutId = setTimeout(onTimeout, 3 * 60 * 1000);

				// 매 초마다 타이머 업데이트
				countdownId = setInterval(function() {
					remainingTime--;
					var minutes = Math.floor(remainingTime / 60);
					var seconds = remainingTime % 60;
					document.getElementById('timer').textContent = minutes
							+ ':' + (seconds < 10 ? '0' : '') + seconds;
					if (remainingTime <= 0) {
						clearInterval(countdownId);
					}
				}, 1000);
			}

			function checkPhno() {

				var checkNum1 = document.getElementById("checkPhnoNum").value;

				console.log(checkNum);
				console.log(checkNum1);

				if (checkNum === checkNum1) {
					hideWarning("warningCheckPhno");
					hideWarning("warningNoCheckPhno");
					document.getElementById("checkPhnoOk").style.display = "block";

					clearTimeout(timeoutId); // 시간제한 해제
					clearInterval(countdownId); // 타이머 해제
					document.getElementById('timer').textContent = "";

					hideWarning("changePhnoAction");

					document.getElementById("checkPhnoNum").value = "";
					document.getElementById("changePhnoBtn").style.display = "block";
					document.getElementById("u_phno").readOnly = true;

					checkPhnoResult = true;
				} else {
					document.getElementById("warningCheckPhno").style.display = "block";
					checkPhnoResult = false;
				}
			}

			function validateEmail() {
				var userEmail = document.getElementById("u_email").value;
				var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
				hideWarning("warningEmail");
				if (!emailPattern.test(userEmail)) {
					document.getElementById("warningEmail").style.display = "block";
					return false;
				}
				return true;
			}

			function execDaumPostcode01() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = data.userSelectedType === 'R' ? data.roadAddress
										: data.jibunAddress;
								var detailAddress = document
										.getElementById("detailAddress01").value;
								var fullAddress = '(' + data.zonecode + ')'
										+ ' ' + addr;

								if (detailAddress) {
									fullAddress += ', ' + detailAddress;
								}

								document.getElementById('postcode01').value = '('
										+ data.zonecode + ')';
								document.getElementById("address01").value = addr;
								document.getElementById("u_addr01").value = fullAddress;
								document.getElementById("u_addr01Show").innerText = fullAddress;
								hideWarning("warningAddr01");
							}
						}).open();
			}

			function validateAddr01() {
				var postcode = document.getElementById('postcode01').value;
				var address = document.getElementById('address01').value;
				var detailAddress = document.getElementById('detailAddress01').value;
				var fullAddress = postcode + address;

				if (detailAddress) {
					fullAddress += ', ' + detailAddress;
				}

				document.getElementById("u_addr").value = fullAddress;
				hideWarning("warningAddr01");

				if (postcode === "" || address === "") {
					fullAddress = document.getElementById('u_addr01').value;
					document.getElementById("u_addr").value = fullAddress;
					return true;
				}

				document.getElementById("u_addr01").value = fullAddress;
				document.getElementById("u_addr01Show").innerText = fullAddress;

				return true;
			}

			function execDaumPostcode02() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = data.userSelectedType === 'R' ? data.roadAddress
										: data.jibunAddress;
								var detailAddress = document
										.getElementById("detailAddress02").value;
								var fullAddress = '(' + data.zonecode + ')'
										+ ' ' + addr;

								if (detailAddress) {
									fullAddress += ', ' + detailAddress;
								}

								document.getElementById('postcode02').value = '('
										+ data.zonecode + ')';
								document.getElementById("address02").value = addr;
								document.getElementById("u_addr02").value = fullAddress;
								document.getElementById("u_addr02Show").innerText = fullAddress;
								hideWarning("warningAddr02");
							}
						}).open();
			}

			function validateAddr02() {
				var postcode = document.getElementById('postcode02').value;
				var address = document.getElementById('address02').value;
				var detailAddress = document.getElementById('detailAddress02').value;
				var fullAddress = postcode + address;

				if (detailAddress) {
					fullAddress += ', ' + detailAddress;
				}

				document.getElementById("u_addr2").value = fullAddress;

				hideWarning("warningAddr02");

				if (postcode === "" || address === "") {
					fullAddress = document.getElementById('u_addr02').value;
					document.getElementById("u_addr2").value = fullAddress;
					return true;
				}

				document.getElementById("u_addr02").value = fullAddress;
				document.getElementById("u_addr02Show").innerText = fullAddress;

				return true;
			}

			function execDaumPostcode03() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = data.userSelectedType === 'R' ? data.roadAddress
										: data.jibunAddress;
								var detailAddress = document
										.getElementById("detailAddress03").value;
								var fullAddress = '(' + data.zonecode + ')'
										+ ' ' + addr;

								if (detailAddress) {
									fullAddress += ', ' + detailAddress;
								}

								document.getElementById('postcode03').value = '('
										+ data.zonecode + ')';
								document.getElementById("address03").value = addr;
								document.getElementById("u_addr03").value = fullAddress;
								document.getElementById("u_addr03Show").innerText = fullAddress;
								hideWarning("warningAddr03");
							}
						}).open();
			}

			function validateAddr03() {
				var postcode = document.getElementById('postcode03').value;
				var address = document.getElementById('address03').value;
				var detailAddress = document.getElementById('detailAddress03').value;
				var fullAddress = postcode + address;

				if (detailAddress) {
					fullAddress += ', ' + detailAddress;
				}

				document.getElementById("u_addr3").value = fullAddress;

				hideWarning("warningAddr03");

				if (postcode === "" || address === "") {
					fullAddress = document.getElementById('u_addr03').value;
					document.getElementById("u_addr3").value = fullAddress;
					return true;
				}

				document.getElementById("u_addr03").value = fullAddress;
				document.getElementById("u_addr03Show").innerText = fullAddress;

				return true;
			}

			function hideWarning(warningId) {
				document.getElementById(warningId).style.display = "none";
			}

			function showAction(tag) {
				var changeAction = document.getElementById(tag);
				var currentDisplay = changeAction.style.display;
				if (currentDisplay === "block") {
					changeAction.style.display = "none";
				} else {
					changeAction.style.display = "block";
				}
			}

			function toggleReadOnly(tag) {
				var input = document.getElementById(tag);
				var isReadOnly = input.hasAttribute("readonly");

				if (isReadOnly) {
					input.removeAttribute("readonly");
				} else {
					input.setAttribute("readonly", "readonly");
				}

				document.getElementById(tag).focus();

			}

			function delAddr02() {
				document.getElementById('postcode02').value = "";
				document.getElementById('address02').value = "";
				document.getElementById('detailAddress02').value = "";
				document.getElementById("u_addr02").value = " ";
				document.getElementById("u_addr2").value = "";
			}

			function delAddr03() {
				document.getElementById('postcode03').value = "";
				document.getElementById('address03').value = "";
				document.getElementById('detailAddress03').value = "";
				document.getElementById("u_addr03").value = " ";
				document.getElementById("u_addr3").value = "";
			}

			document.querySelector("form").onsubmit = function(e) {

				validatePassword();
				if (!validatePassword()) {
					console.log('비밀번호 형식 문제');
					e.preventDefault();
				}

				validatePasswordMatch();
				if (!validatePasswordMatch()) {
					console.log('비밀번호 확인 문제');
					e.preventDefault();
				}

				validatePhno();
				if (!validatePhno()) {
					console.log('번호 문제');
					e.preventDefault();
				}

				validateSamePhno();
				if (!validateSamePhnoCheck) {
					console.log('번호 중복 문제');
					document.getElementById("warningSamePhno").style.display = "block";
					e.preventDefault();
				}

				if (!checkPhnoResult) {
					console.log('번호인증문제');
					document.getElementById("warningNoCheckPhno").style.display = "block";
					e.preventDefault();
				}

				validateAddr01();
				if (!validateAddr01()) {
					console.log('주소 문제');
					e.preventDefault();
				}

				validateAddr02();
				if (!validateAddr02()) {
					console.log('주소2 문제');
					e.preventDefault();
				}

				validateAddr03();
				if (!validateAddr03()) {
					console.log('주소3 문제');
					e.preventDefault();
				}

				validateEmail();
				if (!validateEmail()) {
					console.log('이메일 문제');
					e.preventDefault();
				}

				validateSameEmail();
				if (!validateSameEmailCheck) {
					console.log('이메일 중복 문제');
					document.getElementById("warningSameEmail").style.display = "block";
					e.preventDefault();
				}
				// 			e.preventDefault();
			};
		</script>
	</div><%@ include file="../css/footer.jsp"%>
</body>
</html>