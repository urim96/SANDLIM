<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>산들림</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--     <link rel="stylesheet" href="resources/css/signup.css"> -->
        <style>
                .signup-container {
            width: 540px!important;
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            margin-bottom: 100px;
        }
        
        .button:disabled {
            background-color: #f9f5f2;
            cursor: not-allowed;
            color: #272727;
        }
        
        small {
            display: block;
        }
        
        .signup {
            text-align: center;
            color: #272727;
        }
        
        .input::placeholder {
            font-size: 14px;
            font-weight: 400;
        }
        
        .row {
            display: flex;
            margin-bottom: 0.75rem;
        }
        
        .btn, .btn-outline-secondary:focus {
            box-shadow: none!important;
        }
        
        .send-group, .check-group, .addr-group {
            display: flex;
            align-items: center;
        }
        
        .send-group .input, .check-group .input, .addr-group .input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ccc;
            border-right: none;
            border-radius: 4px 0 0 4px;
            box-sizing: border-box;
        }
        
        .send-group #sendbtn, .send-group #sendbtn2, .check-group #checkbtn, #checkbtn2, .addr-group #findpost {
            padding: 10px 12px;
            width: inherit;
            border: 1px solid #ccc;
/*             border-left: none; */
            border-radius: 0 4px 4px 0;
            color: #f9f5f2;
            background-color: #272727;
            cursor: pointer;
            font-size: 14px;
            font-weight: 400;
        }
        
        #warningVerif {
            display: none;
            color: red;
        }
        
        #warningEmailDiv{
                display: flex;
            align-items: center; /* vertically align items */
            justify-content: space-between;
        }
        
        .check-group #checkbtn, .check-group #checkbtn2 {
           color: #272727;
           background-color: #f9f5f2;
           border-top-left-radius: 0;
        }
        
        .form-group {
            margin-bottom: 0.75rem!important;
        }
        
        .addr-group, .detail-addr .input {
            margin-bottom: 0.625rem!important;
        }
        
        .send-group #sendbtn:hover, .send-group #sendbtn2:hover, .addr-group #findpost:hover {
            background-color: #f9f5f2;
            color: #272727;
        }
        
        .check-group #checkbtn:hover, .check-group #checkbtn2:hover {
            background-color: #272727;
            color: #f9f5f2;
        }
        
        input[type="text"], input[type="password"], input[type="button"] {
            width: 100%;
            padding: 8px;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .button {
            display: block;
            margin: 0 auto;
            width: 100%;
            background-color: #272727;
            color: #f9f5f2;
            padding: 14px 20px;
            border: none;
            border-radius: 4px!important;
            cursor: pointer;
        }
        
        .button:hover {
            background-color: #f9f5f2;
            color: #272727;
        }
        
        #warningId,#warningPw1,#warningPw2,#warningBirth,#warningNick,#warningPhno,#warningEmail,#warningAddr,#warningSameId,#warningSameEmail,#warningSamePhno,#warningCheckPhno,#warningNoCheckPhno,#warningName,#needPhno, #checkEmailOk, #warningCheckEmail, #warningNoCheckEmail {
            display: none;
            color: #f00;
        }
        
        #checkPhnoOk, #checkEmailOk {
            display: none;
            color: #2900ee;
        }
        
        input[readOnly] {
            outline: none;
        }
        
        /* 미디어 쿼리 추가 */
        
        /* 1140px 이하 */
        @media screen and (max-width: 1140px) {
            .signup-container {
        /*         width: 100% !important; */
        /*         max-width: 480px; */
                padding: 20px;
            }
        
            .signup {
                font-size: 24px;
            }
        
            .input::placeholder {
                font-size: 13px;
            }
        
            .send-group #sendbtn, .send-group #sendbtn2, .check-group #checkbtn, .check-group #checkbtn2, .addr-group #findpost {
                font-size: 13px;
            }
        
        }
        
        /* 992px 이하 */
        @media screen and (max-width: 992px) {
            .signup-container {
        /*         width: 100% !important; */
        /*         max-width: 400px; */
                padding: 15px;
            }
        
            .signup {
                font-size: 22px;
            }
        
            .input::placeholder {
                font-size: 13px;
            }
        
            .send-group #sendbtn, .send-group #sendbtn2, .check-group #checkbtn, .check-group #checkbtn2, .addr-group #findpost {
                font-size: 13px;
            }
        }
        
        /* 768px 이하 */
        @media screen and (max-width: 768px) {
            .signup-container {
                width: 100% !important;
                        max-width: 95%!important;
                padding: 10px;
            }
        
            .signup {
                font-size: 20px;
            }
        
            .input::placeholder {
                font-size: 12px;
            }
        
            .send-group #sendbtn, .send-group #sendbtn2, .check-group #checkbtn, .check-group #checkbtn2, .addr-group #findpost {
                font-size: 14px;
            }
        
        }
        
        /* 576px 이하 */
        @media screen and (max-width: 576px) {
            .signup-container {
                width: 100% !important;
                padding: inherit!important;
                max-width: 90%!important;
            }
        
            .signup {
                font-size: 18px;
            }
        
            .input::placeholder {
                font-size: 17px!important;
                font-weight: 400;
            }
        
        /*     .send-group #sendbtn, .check-group #checkbtn, .addr-group #findpost { */
        /*         font-size: 11px; */
        /*         padding: 13px 12px; */
        /*     } */
        
           .send-group #sendbtn, .send-group #sendbtn2, .check-group #checkbtn, .check-group #checkbtn2, .addr-group #findpost{
                 font-size: 14px;
                   /*padding: 11px 9px;*/
                   padding: 10px 16px;
                }
                
            .row {
                flex-direction: column;
            }
        
            .col {
                width: 100%;
            }
            
            #u_pw {margin-bottom: 16px;}
        }
        
        /* 400px 이하 및 375px 이상 */
        @media screen and (max-width: 400px) and (min-width: 375px) {
            .signup-container {
                width: 100% !important;
                padding: 5px;
            }
        
            .signup {
                font-size: 16px;
            }
        
            .input::placeholder {
                font-size: 17px!important;
                font-weight: 400;
            }
        
            .send-group #sendbtn, .check-group #checkbtn, .send-group #sendbtn2, .check-group #checkbtn2, .addr-group #findpost {
                font-size: 14px;
                padding: 13px 20px;
            }
        
            .row {
                flex-direction: column;
            }
        
            .col {
                width: 100%;
            }
        }
        
        /* 375px 이하 */
        @media screen and (max-width: 375px) {
            .signup-container {
                width: 100% !important;
                padding: 5px;
                padding: inherit!important;
        /*       margin: auto!important; */
                margin-bottom: 60px;
            }
        
            .signup {
                font-size: 14px;
            }
        
            .input::placeholder {
                font-size: 9px;
            }
        
            .send-group #sendbtn, .check-group #checkbtn,.send-group #sendbtn2, .check-group #checkbtn2, .addr-group #findpost {
            font-size: 14px;
                padding: 10px 20px;
            }
        
            .row {
                flex-direction: column;
            }
        
            .col {
                width: 100%;
            }
            
            #signUp {margin-top: 40px;}
        }
        </style>
</head>
<%@ include file="../css/header.jsp"%>
<body>
    <div class="container signup-container">
        <h2 class="signup">회원가입</h2>
        <form action="insertUser.do" method="post">

            <div class="form-group">
                <input type="text" class="input" id="u_id" name="u_id" required maxlength="30" autocomplete="off" placeholder="&#42;&nbsp;아이디">
            </div>

            <div id="warningId">아이디는 5글자 이상, 20글자 미만의 영문자 또는 숫자만 가능합니다.</div>
            <div id="warningSameId">해당 아이디는 이미 존재합니다.</div>

            <div class="row">
                <div class="col">
                    <input type="password" class="input" id="u_pw" name="u_pw" required maxlength="30" placeholder="&#42;&nbsp;비밀번호">
                </div>
                <div class="col">
                    <input type="password" class="input" id="u_pw2" name="u_pw2" required maxlength="30" placeholder="&#42;&nbsp;비밀번호확인">
                </div>
            </div>

            <div id="warningPw1">8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해주세요.</div>
            <div id="warningPw2">비밀번호가 일치하지 않습니다.</div>

            <div class="form-group">
                <input type="text" class="input" id="u_nick" name="u_nick" required maxlength="4" autocomplete="off" placeholder="&#42;&nbsp;닉네임">
            </div>

            <div id="warningNick">닉네임은 1글자 이상 4글자 미만의 한글, 영문, 숫자로 가능합니다.</div>

            <div class="form-group">
                <input type="text" class="input" id="u_name" name="u_name" required maxlength="30" autocomplete="off" placeholder="&#42;&nbsp;이름">
            </div>
            
            <div id="warningName">올바른 이름을 입력해주세요.</div>

            <div class="form-group send-group">
                <input type="text" class="input" id="u_phno" name="u_phno" required maxlength="11" autocomplete="off" placeholder="&#42;&nbsp;휴대전화번호">
               <button type="button" class="button" id="sendbtn" onclick="validateSamePhno(); sendCheck();">인증</button>
            </div>
            
            <div id="needPhno">전화번호를 입력해주세요.</div>
            <div id="warningSamePhno">이미 등록된 전화번호입니다.</div>
            <div id="warningPhno">
                <%-- 올바른 번호를 숫자로 입력해주세요. --%>
                휴대전화번호가 정확한지 확인해 주세요.
                <small>예시) 01012345678</small>
            </div>

         <div class="form-group check-group">
               <input type="text" class="input" id="checkPhnoNum" name="checkPhnoNum" autocomplete="off" maxlength="6" placeholder="&#42;&nbsp;인증번호를 입력해주세요." required>
               <button type="button" class="button" id="checkbtn" onclick="checkPhno()">확인</button>
         </div>

            <div id="timer"></div>
            <div id="checkPhnoOk">인증이 완료되었습니다.</div>
            <div id="warningCheckPhno">인증번호가 일치하지 않습니다.</div>
            <div id="warningNoCheckPhno">번호 인증을 진행해주세요.</div>
         
         <div class="form-group">
               <div class="addr-group">
                  <input type="text" class="input" id="postcode" name="postcode" onclick="execDaumPostcode()" placeholder="&#42;&nbsp;우편번호" required readonly>
                  <input type="button" class="button" id="findpost" onclick="execDaumPostcode()" value="찾기">
               </div>
               <div class="detail-addr">
                  <input type="text" class="input" onclick="execDaumPostcode()" id="address" placeholder="&#42;&nbsp;주소"  required readonly>
                  <input type="text" class="input" id="detailAddress" maxlength="100" autocomplete="off" placeholder="&nbsp;상세주소">
               </div>
         </div>
      
            <div id="warningAddr">우편번호 찾기를 통해, 주소를 입력해주세요.</div>
            <input type="hidden" id="u_addr" name="u_addr">
            
            <div class="form-group">
               <input type="text" class="input" id="u_birth" name="u_birth" required autocomplete="off" placeholder="&#42;&nbsp;생년월일 8자리" maxlength="8">
            </div>
            <div id="warningBirth">
                생년월일을 숫자로 입력해주세요.
                <small>예시) 20010101</small>
            </div>
         
         <div class="form-group send-group">
                <input type="text" class="input" id="u_email" name="u_email" maxlength="100" autocomplete="off" required placeholder="&#42;&nbsp;이메일">
               <button type="button" class="button" id="sendbtn2" onclick="validateEmail(); requestEmailVerification();">인증</button>
            </div>
            <div id="warningSameEmail">이미 등록된 이메일입니다.</div>
            <div id="warningEmail">이메일을 올바른 형식으로 작성해주세요.</div>
            
            <div id=warningEmailDiv>
                    <div id="timer2"></div>
                    <span id="warningVerif" class="error-text">입력하신 인증 코드가 일치하지 않습니다.</span>
            </div>
            
            <div class="form-group check-group">
               <input type="text" class="input" id="checkEmail" name="checkEmail" autocomplete="off" maxlength="6" placeholder="&#42;&nbsp;인증번호를 입력해주세요." required>
               <button type="button" class="button" id="checkbtn2" onclick="verifyCode()">확인</button>
              </div>
              
            <div id="checkEmailOk">인증이 완료되었습니다.</div>
            <div id="warningCheckEmail">인증번호가 일치하지 않습니다.</div>
            <div id="warningNoCheckEmail">번호 인증을 진행해주세요.</div>
            
            <button type="submit" class="button" id="signUp">회원가입</button>
        </form>
    </div>
    <%@include file="../css/footer.jsp"%>
    <script>
        var checkNum;
        var validateSameIdCheck;
        var validateSamePhnoCheck;
        var validateSameEmailCheck;
        var checkPhnoResult = false;
        var validatePhnoResult;

        var timeoutIds = {};
        var countdownIds = {};
        var remainingTimes = {};

        function resetRemTime(chk) {
           remainingTimes[chk] = 180;
        }

        document.getElementById("u_id").addEventListener("blur", validateId);
        document.getElementById("u_id").addEventListener("blur", validateSameId);
        document.getElementById("u_pw").addEventListener("blur", validatePassword);
        document.getElementById("u_pw2").addEventListener("blur", validatePasswordMatch);
        document.getElementById("u_nick").addEventListener("blur", validateNick);
        document.getElementById("u_name").addEventListener("blur", validateName);
        document.getElementById("u_phno").addEventListener("blur", validatePhno);
        document.getElementById("u_phno").addEventListener("blur", validateSamePhno);
        document.getElementById("u_birth").addEventListener("blur", validateBirth);
        document.getElementById("u_email").addEventListener("blur", validateEmail);
        document.getElementById("u_email").addEventListener("blur", validateSameEmail);

        function validateId() {
            var userId = document.getElementById("u_id").value;
            var idPattern = /^[a-z0-9_-]{5,20}$/;
            hideWarning("warningId");
            if (!idPattern.test(userId)) {
                document.getElementById("warningId").style.display = "block";
                return false;
            }
            return true;
        }

        function validateName() {
            var userName = document.getElementById("u_name").value;
            var namePattern = /^[a-zA-Z가-힣\s'-]{1,50}$/;
            hideWarning("warningName");
            if (!namePattern.test(userName)) {
                document.getElementById("warningName").style.display = "block";
                return false;
            }
            return true;
        }

        function validateSameId() {
            var userId = document.getElementById("u_id").value;
            $.ajax({
                    url: "checkSameId.do",
                    type: "post",
                    data: JSON.stringify({
                        u_id: userId
                    }),
                    contentType: 'application/json; charset=utf-8',
                    cache: false,
                    success: function(data) {
                        if (data) {
                            hideWarning("warningSameId");
                            validateSameIdCheck = true;
                        } else {
                            hideWarning("warningSameId");
                            document.getElementById("warningSameId").style.display = "block";
                            validateSameIdCheck = false;
                        }
                    },
                    error: function() {
                        alert('error');
                    }
                });
        }

        function validatePassword() {
            var userPw = document.getElementById("u_pw").value;
            var pwdPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\^\w]).{8,16}$/;
            hideWarning("warningPw1");
            if (!pwdPattern.test(userPw)) {
                document.getElementById("warningPw1").style.display = "block";
                return false;
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
                validatePhnoResult = false;
                return false;
            }
            validatePhnoResult = true;
            return true;
        }
        
        function validateSamePhno() {
            var userPhno = document.getElementById("u_phno").value;

            // userPhno가 비어있지 않은 경우에만 ajax 호출
            if (userPhno.trim() !== "" && validatePhnoResult) {
                $.ajax({
                    url: "checkSamePhno.do",
                    type: "post",
                    data: JSON.stringify({
                        u_phno: userPhno
                    }),
                    contentType: 'application/json; charset=utf-8',
                    cache: false,
                    success: function(data) {
                        if (data) {
                            hideWarning("warningSamePhno");
                            validateSamePhnoCheck = true;
                        } else {
                            hideWarning("warningSamePhno");
                            document.getElementById("warningSamePhno").style.display = "block";
                            validateSamePhnoCheck = false;
                        }
                    },
                    error: function() {
                        alert('error');
                    }
                });
            } else {
                    document.getElementById("needPhno").style.display = "block";
            }
        }

        function validateSameEmail() {
            var userEmail = document.getElementById("u_email").value;
            $.ajax({
                    url: "checkSameEmail.do",
                    type: "post",
                    data: JSON.stringify({
                        u_email: userEmail
                    }),
                    contentType: 'application/json; charset=utf-8',
                    cache: false,
                    success: function(data) {
                        if (data) {
                            hideWarning("warningSameEmail");
                            validateSameEmailCheck = true;
                        } else {
                            hideWarning("warningSameEmail");
                            document.getElementById("warningSameEmail").style.display = "block";
                            validateSameEmailCheck = false;
                        }
                    },
                    error: function() {
                        alert('error');
                    }
                });

        }
        
         function sendCheck() {
            // 이전 요청이 있다면 취소
            
            
            if (timeoutIds['timer'])
                clearTimeout(timeoutIds['timer']);
            if (countdownIds['timer'])
                clearInterval(countdownIds['timer']);

            var userPhno = document.getElementById("u_phno").value;

            if (validateSamePhnoCheck && validatePhnoResult) {

                hideWarning("needPhno");

                $.ajax({
                    url: "checkRealPhno.do",
                    type: "post",
                    data: JSON.stringify({
                        u_phno: userPhno
                    }),
                    contentType: 'application/json; charset=utf-8',
                    cache: false,
                    success: function(data) {

                        hideWarning("warningNoCheckPhno");

                        checkNum = data;

                        resetRemTime('timer');
                        document.getElementById('timer').textContent = "3:00";
                        // 인증 코드 요청이 성공했을 때 시간제한 설정
                        startTimer('timer');

                    },
                    error: function() {
                        alert('error');
                    }
                });

            } else {

                document.getElementById("needPhno").style.display = "block";

            }

        }
        
        function requestEmailVerification() {
                
                let btnEmail = document.getElementById('sendbtn2');
           
                
           if (validateSameEmailCheck && validateEmail()){
              
                 btnEmail.disabled = true;
              
              // 이전 요청이 있다면 취소
                if(timeoutIds['timer2']) clearTimeout(timeoutIds['timer2']);
                if(countdownIds['timer2']) clearInterval(countdownIds['timer2']);

                var email = document.getElementById('u_email').value;

                // 이메일 필드가 비어있는지 확인
                if (email === '') {
                    btnEmail.disabled = false;
                } else {
                    // 서버에 이메일 인증 코드 요청
                    btnEmail.innerText = "이메일 발송중...";
                    $.ajax({
                        url : "EmailVerificationSign.do",
                        type : "post",
                        data : JSON.stringify({u_email : email}),
                        contentType : 'application/json; charset=utf-8',
                        cache : false,
                        success : function(data) {
                            resetRemTime('timer2');
                            verCode = data;
                            document.getElementById('timer2').textContent = "3:00";
                            // 인증 코드 요청이 성공했을 때 시간제한 설정
                            startTimer('timer2');
                            btnEmail.disabled = false;
                                btnEmail.innerText = "이메일 인증";
                        },
                        error : function() {
                            alert('인증 코드 발송에 실패했습니다.');
                            btnEmail.disabled = false;
                                btnEmail.innerText = "이메일 인증";
                        }
                    });
                }
              
           }
            
        }
         
         function verifyCode() {
        
            var code = verCode;
            var userCode = document.getElementById('checkEmail').value;
        
            // 서버에 이메일 인증 요청
            $.ajax({
                url : "verifyCode.do",
                type : "post",
                data : JSON.stringify({ emailCode : code, inputCode :  userCode}),
                contentType : 'application/json; charset=utf-8',
                success : function(data) {
                    if(data) {
                        clearTimeout(timeoutIds['timer2']); // 시간제한 해제
                        clearInterval(countdownIds['timer2']); // 타이머 해제
                        document.getElementById('timer2').textContent = "";
                        
                        hideWarning("warningCheckEmail");
                        hideWarning("warningNoCheckEmail");
                        document.getElementById("checkEmailOk").style.display = "block";
                        document.getElementById("warningVerif").style.display = "none";
                        document.getElementById('sendbtn2').disabled = true;
                        
                      //sendbtn2 버튼 비활성화 CSS 주는 스크립트
                        var hoverElement = document.getElementById('sendbtn2');
                                        hoverElement.style.backgroundColor = 'gray';
                                        hoverElement.style.color = 'white';
                                        
                               hoverElement.addEventListener('mouseover', function() {
                                 hoverElement.style.backgroundColor = 'gray';
                               });
                               hoverElement.addEventListener('mouseout', function() {
                                 hoverElement.style.backgroundColor = 'gray';
                               });
                               
                       // checkbtn2 버튼 비활성화 CSS 주는 스크립트
                       var hoverElement = document.getElementById('checkbtn2');
                                        hoverElement.style.backgroundColor = 'gray';
                                        hoverElement.style.color = 'white';
                                        
                               hoverElement.addEventListener('mouseover', function() {
                                 hoverElement.style.backgroundColor = 'gray';
                               });
                               hoverElement.addEventListener('mouseout', function() {
                                 hoverElement.style.backgroundColor = 'gray';
                               });
                        
                               document.getElementById("checkEmail").readOnly = true;
                               document.getElementById("u_email").readOnly = true;
                        
                        
                    } else {
                        document.getElementById("warningVerif").style.display = "block";
                    }
                },
                error : function(xhr, status, error) {
                    alert('인증에 실패했습니다: ' + error);
                }
            });
        }
         
         function startTimer(chkTimer) {
               // 인증 코드가 만료되면 실행될 콜백 함수
               var onTimeout = function() {
                   alert('인증 시간이 만료되었습니다.');
                   clearTimeout(timeoutIds[chkTimer]);
                   clearInterval(countdownIds[chkTimer]);
               };

               // 인증 코드 요청 후 3분 후에 onTimeout 실행
               timeoutIds[chkTimer] = setTimeout(onTimeout, 3 * 60 * 1000);

               // 매 초마다 타이머 업데이트
               remainingTimes[chkTimer] = 3 * 60;
               countdownIds[chkTimer] = setInterval(function() {
                   remainingTimes[chkTimer]--;
                   var minutes = Math.floor(remainingTimes[chkTimer] / 60);
                   var seconds = remainingTimes[chkTimer] % 60;
                   document.getElementById(chkTimer).textContent = minutes + ':' +
                       (seconds < 10 ? '0' : '') + seconds;
                   if (remainingTimes[chkTimer] <= 0) {
                       clearInterval(countdownIds[chkTimer]);
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

                clearTimeout(timeoutIds['timer']); // 시간제한 해제
                clearInterval(countdownIds['timer']); // 타이머 해제
                document.getElementById('timer').textContent = "";

                document.querySelector("button[type='button'][onclick='checkPhno()']").disabled = true;
                document.querySelector("button[type='button'][onclick='validateSamePhno(); sendCheck();']").disabled = true;
                
                //sendbtn 버튼 비활성화 CSS 주는 스크립트
                 var hoverElement = document.getElementById('sendbtn');
                                 hoverElement.style.backgroundColor = 'gray';
                                 hoverElement.style.color = 'white';
                                 
                        hoverElement.addEventListener('mouseover', function() {
                          hoverElement.style.backgroundColor = 'gray';
                        });
                        hoverElement.addEventListener('mouseout', function() {
                          hoverElement.style.backgroundColor = 'gray';
                        });
                        
                // checkbtn 버튼 비활성화 CSS 주는 스크립트
                var hoverElement = document.getElementById('checkbtn');
                                 hoverElement.style.backgroundColor = 'gray';
                                 hoverElement.style.color = 'white';
                                 
                        hoverElement.addEventListener('mouseover', function() {
                          hoverElement.style.backgroundColor = 'gray';
                        });
                        hoverElement.addEventListener('mouseout', function() {
                          hoverElement.style.backgroundColor = 'gray';
                        });
                
                        document.getElementById("checkPhnoNum").readOnly = true;
                        document.getElementById("u_phno").readOnly = true
                checkPhnoResult = true;
            } else {
                document.getElementById("warningCheckPhno").style.display = "block";
                checkPhnoResult = false;
            }
        }

        function validateBirth() {
            var userBirth = document.getElementById("u_birth").value;
            var birthPattern = /^\d{4}\d{2}\d{2}$/;
            hideWarning("warningBirth");
            if (!birthPattern.test(userBirth)) {
                document.getElementById("warningBirth").style.display = "block";
                return false;
            }
            return true;
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

        function validateAddr() {
            var postcode = document.getElementById('postcode').value;
            var address = document.getElementById('address').value;
            var detailAddress = document.getElementById('detailAddress').value;

            var fullAddress = postcode + address;
            var fullAddress = '(' + postcode + ')' + address;

            if (detailAddress) {
                fullAddress += ', ' + detailAddress;
            }

            document.getElementById("u_addr").value = fullAddress;

            hideWarning("warningAddr");
            if (postcode === "" || address === "") {
                document.getElementById("warningAddr").style.display = "block";
                return false;
            }
            return true;
        }

        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = data.userSelectedType === 'R' ? data.roadAddress :
                        data.jibunAddress;
                    var detailAddress = document
                        .getElementById("detailAddress").value;
                    var fullAddress = data.zonecode + ' ' + addr;

                    if (detailAddress) {
                        fullAddress += ', ' + detailAddress;
                    }

                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    document.getElementById("u_addr").value = fullAddress;
                    hideWarning("warningAddr");
                }
            }).open();
        }

        function hideWarning(warningId) {
            document.getElementById(warningId).style.display = "none";
        }

        document.querySelector("form").onsubmit = function(e) {

            validateId();
            if (!validateId()) {
                console.log('아이디 문제');
                e.preventDefault();
            }

            validateSameId();
            if (!validateSameIdCheck) {
                console.log('아이디 중복 문제');
                document.getElementById("warningSameId").style.display = "block";
                e.preventDefault();
            }

            validateName();
            if (!validateName()) {
                console.log('이름 문제');
                e.preventDefault();
            }

            validateNick();
            if (!validateNick()) {
                console.log('닉네임 문제');
                e.preventDefault();
            }

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

            validateBirth();
            if (!validateBirth()) {
                console.log('생일 문제');
                e.preventDefault();
            }

            validateAddr();
            if (!validateAddr()) {
                console.log('주소 문제');
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

            console.log('가입성공');
            // e.preventDefault();
        };
    </script>
</body>
</html>