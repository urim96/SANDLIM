<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../css/header.jsp"%>
<style>
  #seluser-container {
    max-width: 600px;
    margin: 20px auto;
    margin-bottom: 100px;
    padding: 20px;
  }
  .seluser {
    margin-bottom: 20px;
    color: #272727;
    text-align: center;
    font-size: 24px;
    font-weight: bold;
  }
  .input-group-text {
    background-color: #f9f5f2 !important;
  }
  #footer {
    display: flex;
    margin: 40px auto;
    justify-content: center;
    align-items: center;
  }
  .btn {
    width: 150px;
    height: 45px;
    padding: 0;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    margin: 5px;
  }
  .delbtn {
    color: #ccc;
    cursor: pointer;
    font-size: 14px;
  }
  .delbtn:hover {
    text-decoration: none;
    color: #ccc;
  }
  .seltable {
    width: 100%;
    margin-top: 20px;
  }
  .seltable th, .seltable td {
    padding: 12px;
    border: 1px solid #dee2e6;
  }
  .seltable th {
    width: 30%;
    background-color: #e9ecef;
    color: #495057;
  }
  .seltable td {
    width: 70%;
    color: #495057;
/*     white-space: nowrap; /* 한 줄로 유지 */
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .seltable th {
/*     white-space: nowrap; /* 한 줄로 유지 */
    overflow: hidden;
    text-overflow: ellipsis;
  }
  #del-btn {
    text-align: right;
    margin-top: 10px;
  }
  
  .table td, .table th {text-align: inherit;}

  .u_addr {
    word-break: keep-all; /* 단어 단위로 줄 바꿈 유지 */
    white-space: normal; /* 여러 줄로 표시 */
  }
  /* 미디어 쿼리 추가 */
  /* 1140px 이하 */
  @media screen and (max-width: 1140px) {
    #seluser-container {
      width: 100% !important;
      max-width: 60%;
      padding: 20px;
    }

    .seluser {
      font-size: 22px;
    }

    .seltable th, .seltable td {
      font-size: 14px;
    }

    .btn {
      width: 130px;
      height: 40px;
      font-size: 14px;
    }
  }

  /* 992px 이하 */
  @media screen and (max-width: 992px) {
    #seluser-container {
      width: 100% !important;
      max-width: 50%;
      padding: 20px;
    }

    .seluser {
      font-size: 20px;
    }

    .seltable th, .seltable td {
      font-size: 13px;
    }

    .btn {
      width: 120px;
      height: 38px;
      font-size: 13px;
    }
  }

  /* 768px 이하 */
  @media screen and (max-width: 768px) {
    #seluser-container {
      width: 100% !important;
      max-width: 65%;
      padding: 15px;
    }

    .seluser {
      font-size: 18px;
    }

    .seltable th, .seltable td {
      font-size: 14px;
    }

    .btn {
      width: 110px;
      height: 35px;
      font-size: 12px;
    }
  }

  /* 576px 이하 */
  @media screen and (max-width: 576px) {
    #seluser-container {
      width: 100% !important;
      /*max-width: 85%;*/
      max-width: 100%;
      padding: 10px;
    }

    .seluser {
      font-size: 16px;
    }

    .seltable th, .seltable td {
      font-size: 14px;
    }

    .btn {
      width: 100px;
      height: 32px;
      font-size: 11px;
    }
  }
  
  @media screen and (max-width: 480px) and (min-width: 450px){
    #seluser-container {
      width: 100% !important;
      max-width: 95%;
      padding: 10px;
    }

    .seluser {
      font-size: 16px;
    }

    .seltable th, .seltable td {
      font-size: 14px;
    }

    .btn {
      width: 100px;
      height: 32px;
      font-size: 11px;
    }  
  }

  /* 400px 이하 및 375px 이상 */
  @media screen and (max-width: 400px) and (min-width: 375px) {
    #seluser-container {
      width: 100% !important;
/*       max-width: 50%; */
      padding: 8px;
    }

    .seluser {
      font-size: 14px;
    }

    .seltable th, .seltable td {
      font-size: 14px;
    }

    .btn {
      width: 90px;
      height: 30px;
      font-size: 14px;
    }
  }

  /* 375px 이하 */
  @media screen and (max-width: 375px) {
    #seluser-container {
      width: 100% !important;
      max-width: 90%;
      padding: 6px;
    }

    .seluser {
      font-size: 15px;
    }

    .seltable th, .seltable td {
      font-size: 14px;
    }

    .btn {
      width: 80px;
      height: 28px;
      font-size: 14px;
    }
  }
</style>

<body>
  <div class="container" id="seluser-container">
    <h3 class="seluser">내 정보</h3>
    <form name="fm" action="protectInfo.do" method="post" onsubmit="return chk()">
      <table class="table seltable">
        <tbody>
          <tr>
            <th scope="row" style="border-top: 1px solid #dee2e6!important;">아이디</th>
            <td id="userId">${user.u_id}</td>
            <%-- <td>${user.u_id}</td> --%>
          </tr>
          <tr>
            <th scope="row">닉네임</th>
            <td>${user.u_nick}</td>
          </tr>
          <tr>
            <th scope="row">이름</th>
            <td colspan="2">${user.u_name}</td>
          </tr>
          <tr>
            <th scope="row">전화번호</th>
            <td colspan="2">${user.u_phno}</td>
          </tr>
          <tr>
            <th scope="row">현재 주소</th>
            <td colspan="2" class="u_addr">${user.u_addr}</td>
          </tr>
          <tr>
            <th scope="row">생년월일</th>
            <td colspan="2" id="u_birth">${user.u_birth}</td>
          </tr>
          <script>
            var userBirth = "${user.u_birth}";
            var year = userBirth.substring(0, 4);
            var month = userBirth.substring(4, 6);
            var day = userBirth.substring(6);
            var text = year + "년 " + month + "월 " + day + "일";
            document.getElementById('u_birth').textContent = text;
          </script>
          <tr>
            <th scope="row">이메일</th>
            <td colspan="2">${user.u_email}</td>
          </tr>
          <tr>
            <th scope="row">포인트</th>
            <td colspan="2" id="u_point">${user.u_point}</td>
          </tr>
          <script>
            var userPoint = "${user.u_point}";
            var formattedPoint = parseInt(userPoint).toLocaleString();
            document.getElementById('u_point').textContent = formattedPoint;
          </script>
        </tbody>
      </table>
      <div id="del-btn">
        <c:choose>
          <c:when test="${userStatus ne '관리자' }">
            <a onclick="location.href='delUser1.do'" class="delbtn"><small>회원탈퇴&ensp;&gt;</small></a>
          </c:when>
        </c:choose>
      </div>
      <div id="footer">
        <button type="button" class="btn btn-secondary" onclick="javascript:location.href='userMypage.do';" style="font-family: inherit!important;">돌아가기</button>
        <button type="submit" class="btn btn-primary modi-btn" style="font-family: inherit!important;">정보수정</button>
      </div>
    </form>
  <script>
   window.onload = function() {
      if ('${loginChk}' === 'naver') {  // 세션의 loginChk 값이 'naver'인지 확인
        document.getElementById("userId").innerText = '네이버 소셜회원'; 
      }
      if ('${loginChk}' === 'kakao') {  // 세션의 loginChk 값이 'naver'인지 확인
          document.getElementById("userId").innerText = '카카오 소셜회원'; 
        }
   };
  
  </script>
  </div>
  <%@ include file="../css/footer.jsp"%>
</body>
</html>