<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
   response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
   response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ include file="../css/header.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<!-- <link rel="stylesheet" href="resources/css/login.css"> -->
<style>
        /* 기본 스타일 */
* {
    font-family: "Noto Sans KR", sans-serif;
}

.form-control {
    border: 1.5px solid #eee !important;
    border-radius: 8px !important;
    padding: 22px 12px !important;
    color: #b8b8b8;
    box-shadow: none !important;
}

.container {
    width: 440px;
    height: 700px;
}

.title {
    text-align: center;
    font-size: 24px;
}

.form-group, .join-btn {
    margin: 16px 0;
}

.login-tit {
    font-weight: 600;
}

#btn {
    width: 100%!important;
    font-weight: 700!important;
    background-color: #272727!important;
    color: #f9f5f2!important;
    border: none!important;
    box-shadow: none !important;
    border-radius: 4px;
    padding: 12px 12px;
}

#btn:hover {
    background-color: #f9f5f2!important;
    color: #272727!important;
}

.join-btn {
    display: flex;
    justify-content: center;
    align-items: center;
}

.join-btn > a {
    color: #c79c79 !important;
    text-decoration: none;
}

.join-btn > .divider {
    margin: 0 10px;
    color: #c79c79;
}

.naver-btn, .kakao-btn {
    position: relative;
    display: block;
    margin: 8px 0;
    padding: 12px 12px;
    height: 52px;
    border: none!important;
    text-align: center;
    text-decoration: none!important;
    font-weight: 700!important;
    border-radius: 4px;
    box-shadow: none!important;
}

.naver-btn {
    color: #fff!important;
    background-color: #03c75b;
}

.naver-btn::before {
    position: absolute;
    left: 70px; /* 아이콘 위치 조정 */
    top: 50%; /* 세로 중앙 정렬 */
    transform: translateY(-50%);
    content: "";
    height: 24px;
    width: 24px;
    background: url(/resources/img/icon_naver_02.svg) no-repeat;
    background-size: 24px 24px;
}

.kakao-btn {
    background-color: #fee500;
    color: rgba(0,0,0,0.8);
}

.kakao-btn::before {
    position: absolute;
    left: 50px; /* 아이콘 위치 조정 */
    top: 55%;/* 세로 중앙 정렬 */
    left: 70px;
    top: 50%; 
    transform: translateY(-50%);
    content: "";
    height: 24px;
    width: 24px;
    background: url(/resources/img/icon_kakao_02.svg) no-repeat;
    background-size: 24px 24px;
}

.naver-btn:hover {
    text-decoration: none!important;
    color: #fff!important;
}

.kakao-btn:hover {
    text-decoration: none!important;
    color: rgba(0,0,0,0.8)!important;
}

/* 미디어 쿼리 추가 */

@media screen and (max-width: 992px) {
    /* 992px 이하 */
    .container {
        width: 360px;
        padding: 16px; /* 여백 추가 */
    }

    .title {
        font-size: 22px; /* 글씨 크기 조정 */
    }

    .form-group, .join-btn {
        margin: 12px 0;
    }

    #btn {
            margin-top: 35px;
        padding: 10px 10px;
        font-size: 14px;
    }

    .naver-btn, .kakao-btn {
        padding: 10px 10px;
        font-size: 14px;
        width: 328px;
        height: 41px;
    }
    
    .naver-btn::before {
            position: absolute;
            left: 50px;
            top: 55%;
            transform: translateY(-50%);
            content: "";
            height: 24px;
            width: 24px;
            background: url(/resources/img/icon_naver_02.svg) no-repeat;
            background-size: 24px 24px;
        }

        .kakao-btn::before {
            position: absolute;
            left: 50px;
            top: 55%;
            transform: translateY(-50%);
            content: "";
            height: 24px;
            width: 24px;
            background: url(/resources/img/icon_kakao_02.svg) no-repeat;
            background-size: 24px 24px;
        }
}

@media screen and (max-width: 768px) {
    /* 768px 이하 */
    .container {
/*         padding: 12px; */
    }

    .title {
        font-size: 20px;
    }

    .form-group, .join-btn {
        margin: 10px 0;
    }

    #btn {
            margin-top: 35px;
        padding: 8px 8px;
        font-size: 13px;
    }

    .naver-btn, .kakao-btn {
        padding: 8px 8px;
        font-size: 13px;
        width: inherit;
        height: 35.5px;
    }
}

@media screen and (max-width: 576px) {
    /* 576px 이하 */
    .container {
/*         padding: 8px; */
    }

    .title {
        font-size: 18px;
    }

    .form-group, .join-btn {
        margin: 8px 0;
    }

    #btn {
            margin-top: 35px;
/*         padding: 6px 6px; */
        font-size: 12px;
    }

    .naver-btn, .kakao-btn {
/*         padding: 6px 6px; */
        font-size: 12px;
        height: 42px;
    }
.naver-btn, .kakao-btn {
        height: 42px;
	padding: 12px 12px;
}

#btn {    
    width: 100% !important;
    font-weight: 700 !important;
    background-color: #272727 !important;
    color: #f9f5f2 !important;
    border: none !important;
    box-shadow: none !important;
    border-radius: 4px;
    padding: 12px 12px;
}
.container{
max-width: 95%;
}
.naver-btn::before, .kakao-btn::before { left: 40px; font-size: 14px; }
}

        
</style>
<body>
<div class="container">
        <div class="top">
            <h3 class="title">로그인</h3>
        </div>
        <%
            if (request.getSession().getAttribute("userError") == "로그인에러") {
            session.invalidate();
            out.println("<div class='alert alert-danger'>");
            out.println("아이디와 비밀번호를 확인해 주세요");
            out.println("</div>");
            }
            if (request.getSession().getAttribute("userError") == "탈퇴회원") {
            session.invalidate();
            out.println("<div class='alert alert-danger'>");
            out.println("이미 탈퇴한 회원입니다");
            out.println("</div>");
            }
        %>
        <form action="login.do" method="post">
            <div class="content">
                <div class="form-group">
                    <label for="id" class="login-tit">아이디&#42;</label>
                    <input type="text" class="form-control" id="id" name="u_id" placeholder="아이디를 입력해주세요." required>
                </div>
                <div class="form-group">
                    <label for="pwd" class="login-tit">비밀번호&#42;</label>
                    <input type="password" class="form-control" id="pwd" name="u_pw" placeholder="비밀번호를 입력해 주세요." required>
                </div>
                <button type="submit" id="btn">로그인</button>
                <small class="join-btn">
                    <a href="findIdPwMain.do">아이디/비밀번호찾기</a>
                    <!-- <a href="findPw">비밀번호찾기</a> -->
                    <span class="divider">|</span>
                    <a href="terms.do">회원가입</a>
                </small>
            </div>
            <div class="bottom">
                <div class="btn_wrap">
                    <c:url var="kakaoAuthUrl" value="https://kauth.kakao.com/oauth/authorize">
                        <c:param name='client_id' value='${kakaoApiKey}' />
                                        <c:param name='redirect_uri' value='${kakaoRedirectUri}' />
                                        <c:param name='response_type' value='code' />
                                    </c:url>
                    <a href="${kakaoAuthUrl}" class="kakao-btn">카카오 1초 회원가입/로그인</a>
                    <c:url var="naverAuthUrl" value="https://nid.naver.com/oauth2.0/authorize">
                        <c:param name='client_id' value='${naverApiKey}' />
                        <c:param name='redirect_uri' value='${naverRedirectUri}' />
                        <c:param name='response_type' value='code' />
                    </c:url>
                    <a href="${naverAuthUrl}" class="naver-btn">네이버 1초 회원가입/로그인</a>
                </div>
            </div>
        </form>
    </div>
  <%@include file="../css/footer.jsp"%>
</body>
</html>