<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="adminIndex.jsp"%>
<style>
/* .header-container{display: flex;}  */
/* #userStatus {margin-left: 30px;} */
#searchNav {
        -webkit-justify-content: flex-end;
        justify-content: flex-end;
        background-color: inherit!important; 
}

#page-btn {
    background-color: #f9f5f2 !important;
    color: #272727 !important;
    border-radius: 0;
        width: 45px;
        height: 38px;
    display: flex;
    justify-content: center;
    align-items: center;
    
/*     line-height: 1.25; */
    border: 1px solid #dee2e6;
}

.form-control:focus {
        border-color: inherit!important;
        background-color: inherit!important;
        box-shadow: none!important;
}
.btn-success {margin-right: 5px;}
.btnstatus {width: 115px; height: 30px; background-color: #bfbfbf !important; border: none; color: #f9f5f2 !important; padding: 0; border-radius: 0;}
.page-link:focus{box-shadow: none;}
a{
   text-decoration: none !important;
    color: #f9f5f2 !important ;
}

a[id^=page-btn] {
        background-color: #f9f5f2 !important;
    color: #272727 !important;
    font-family: bolder !important;
}

li.page-item a.page-link.active {
        background-color: #272727 !important;
    color: #f9f5f2 !important;
    font-family: bolder !important;
}


.page-link:hover, .page-link:active, #page-btn:hover, #page-btn:active {
    background-color: #272727 !important;
    color: #f9f5f2 !important;
    font-family: bolder !important;
}
</style>
<script>
$(document).ready(function() {
        //사이드 메뉴 height조정
        let idxhdHeight = document.querySelector(".idxhd").getBoundingClientRect().height; //헤더 높이
        let idxbodyHeight = document.querySelector(".idxbody").getBoundingClientRect().height; //사이즈 높이
        
        let ftHeight = $("footer").height();
        let bclHeight =document.querySelector(".bcl").getBoundingClientRect().height;
        
        
        let useHeight = idxhdHeight + idxbodyHeight; //가용 height값
        
        if(useHeight > bclHeight){
                $(".bcl").height(idxbodyHeight);
//                 $("footer").css({"position": "absolute", "bottom" : "0px", "width":"100%", "z-index": 1000}); 
        }
        let bodyHeight =document.body.getBoundingClientRect().height;
        $(".idxbody").height(bclHeight+50);
//         $(".bcl").height(bodyHeight-65.59);
        
//         console.log('idxheader: '+idxhdHeight);
//         console.log('idxbody: '+idxbodyHeight);
//         console.log('footer: '+ ftHeight);
//         console.log('useHeight: '+useHeight);
//         console.log('useHeight: '+useHeight);
//         console.log('body 전: '+ bodyHeight);
//         console.log('body 후: '+  document.body.getBoundingClientRect().height);
//         console.log('bclHeight 후: '+ $(".bcl").height());
});
</script>
<body>
<div class="bcl">
        <div class="admin">
                <section class="header-container">
                        <h3>회원목록</h3>
                </section>
                <%-- 검색 --%>
                <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
                        <form class="form-inline" action="userList.do" method="post">
                                <select name="searchType" class="form-control mr-sm-2">
                                        <option value="u_id">아이디</option>
                                        <option value="u_name">이름</option>
                                        <option value="u_nick">닉네임</option>
                                        <option value="u_phno">전화번호</option>
                                        <option value="u_addr">주소</option>
                                        <option value="u_birth">생년월일</option>
                                        <option value="u_email">이메일</option>
                                        <option value="u_status">회원상태</option>
                                </select> <input class="form-control mr-sm-2" type="text" name="keyword"
                                        autocomplete="off" placeholder="검색어를 입력하세요.">
                                <button class="btn btn-success" type="submit">검색</button>
                        </form>
                        <button class="btnstatus" onclick="javascript:location.href='updateUserStatus.do';">탈퇴회원 갱신</button>
                </nav>
                <section class="contents-container">
                        <table class="table">
                                <tr>
                                        <th>아이디</th>
                                        <th>이름</th>
                                        <th>역할</th>
                                        <th>
                                                <c:choose>
                                                        <c:when test="${pagination.searchType eq 'u_nick'}">닉네임</c:when>
                                                        <c:when test="${pagination.searchType eq 'u_phno'}">전화번호</c:when>
                                                        <c:when test="${pagination.searchType eq 'u_addr'}">주소</c:when>
                                                        <c:when test="${pagination.searchType eq 'u_birth'}">생년월일</c:when>
                                                        <c:when test="${pagination.searchType eq 'u_email'}">이메일</c:when>
                                                        <c:when test="${pagination.searchType eq 'u_id'}">아이디</c:when>
                                                        <c:when test="${pagination.searchType eq 'u_name'}">이름</c:when>
                                                        <c:when test="${pagination.searchType eq 'u_status'}">상태</c:when>
                                                        <c:otherwise></c:otherwise>
                                                </c:choose>
                                        </th>
                                </tr>
<!--                         </table> -->
<!--                         <table class="table"> -->
                                <c:forEach items="${userList}" var="user">
                                        <tr onclick="selUser('${user.u_id}')" style="cursor: pointer;">
                                                <td class="tdCenter">${user.u_id}</td>
                                                <td>${user.u_name}</td>
                                                <td class="tdCenter">${user.u_status}</td>
                                                <td class="tdCenter" id="statusText">
                                                        <c:choose>
                                                                <c:when test="${pagination.searchType eq 'u_nick'}">${user.u_nick}</c:when>
                                                                <c:when test="${pagination.searchType eq 'u_phno'}">${user.u_phno}</c:when>
                                                                <c:when test="${pagination.searchType eq 'u_addr'}">${user.u_addr}</c:when>
                                                                <c:when test="${pagination.searchType eq 'u_birth'}">
                                                                        <div class="user_birth">${user.u_birth}</div>
                                                                </c:when>
                                                                <c:when test="${pagination.searchType eq 'u_email'}">${user.u_email}</c:when>
                                                                <c:when test="${pagination.searchType eq 'u_id'}">${user.u_id}</c:when>
                                                                <c:when test="${pagination.searchType eq 'u_name'}">${user.u_name}</c:when>
                                                                <c:when test="${pagination.searchType eq 'u_status'}">${user.u_status}</c:when>
                                                                <c:otherwise></c:otherwise>
                                                        </c:choose>
                                                </td>
                                        </tr>
                                </c:forEach>
                        </table>
                </section>
                <section class="contents-footer">
                        <%-- 페이지네이션 --%>
                        <div>
                                <nav aria-label="Page navigation example" style="margin: auto;">
                                        <ul class="pagination justify-content-center">
                                                <c:if test="${pagination.prev}">
                                                        <li class="page-item"><a class="page-link" id="page-btn" href="#"
                                                                onClick="fn_prev('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">이전</a></li>
                                                </c:if>
                                                <c:forEach begin="${pagination.startPage}"
                                                        end="${pagination.endPage}" var="idx">
                                                        <li
                                                                class="page-item"><a
                                                                class="page-link <c:out value="${pagination.currPageNo == idx ? 'active' : ''}"/> " id="page-btn${idx }" href="#"
                                                                onClick="fn_pagination('${idx}', '${pagination.range}')">
                                                                        ${idx} </a></li>
                                                </c:forEach>
                                                <c:if test="${pagination.next}">
                                                        <li class="page-item"><a class="page-link" id="page-btn" href="#"
                                                                onClick="fn_next('${pagination.currPageNo}', '${pagination.range}', '${pagination.pageSize}')">다음</a></li>
                                                </c:if>
                                        </ul>
                                </nav>
                        </div>
                        <div id="paginationData" data-searchType="${pagination.searchType}" data-keyword="${pagination.keyword}"></div>
                        <script>
                                //이전 버튼
                                function fn_prev(currPageNo, range, pageSize) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var currPageNo = (range - 1) * pageSize;
                                        var range = range - 1;
        
                                        var url = "/userList.do";
                                        url = url + "?currPageNo=" + currPageNo;
                                        url = url + "&range=" + range;
                                        url = url + "&searchType=" + searchType;
                                        url = url + "&keyword=" + keyword;
                                        location.href = url;
        
                                }

                                //페이지 번호 클릭
        
                                function fn_pagination(currPageNo, range) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var url = "/userList.do";
        
                                        url = url + "?currPageNo=" + currPageNo;
                                        url = url + "&range=" + range;
                                        url = url + "&searchType=" + searchType;
                                        url = url + "&keyword=" + keyword;
                                        location.href = url;
        
                                }
                                //다음 버튼 이벤트
                                function fn_next(currPageNo, range, pageSize) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var currPageNo = (range * pageSize) + 1;
                                        var range = parseInt(range) + 1;
        
                                        var url = "/userList.do";
                                        url = url + "?currPageNo=" + currPageNo;
                                        url = url + "&range=" + range;
                                        url = url + "&searchType=" + searchType;
                                        url = url + "&keyword=" + keyword;
                                        location.href = url;
                                }
        
                                function selUser(val) {
                                        location.href = "selectUser.do?u_id=" + val;
                                }
                                
                                  // 모든 user_birth 클래스를 가진 요소에 대해 생년월일을 설정하는 함수
                                  function setUserBirth() {
                                    var userBirthElements = document.getElementsByClassName("user_birth");
                                    for (var i = 0; i < userBirthElements.length; i++) {
                                      var userBirth = userBirthElements[i].innerText;
                                      var year = userBirth.substring(0, 4);
                                      var month = userBirth.substring(4, 6);
                                      var day = userBirth.substring(6);
                                      var text = year + "년 " + month + "월 " + day + "일";
                                      userBirthElements[i].innerHTML = text;
                                    }
                                  }
        
                          // 페이지가 로드될 때 setUserBirth 함수를 호출하여 생년월일을 설정
                          window.onload = setUserBirth;
                        </script>
                </section>
        </div>
</div>
        <%@ include file="../css/footer.jsp"%>
</body>
</html>
