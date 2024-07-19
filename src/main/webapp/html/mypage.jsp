<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="/include/common_head.jsp"></c:import>
<c:import url="/include/common_body_header.jsp" var="body_header"></c:import>
<c:import url="/include/common_body_footer.jsp" var="body_footer"></c:import>
<script type="text/javascript">
	function sendToLogin() {
		alert("로그인이 필요합니다.");
		location.href = "./login.do";
	}
</script>
<body>
  <div id="skip_navi">
    <a href="#container">본문 바로가기</a>
  </div>
  <div id="wrap">
   ${ body_header }
    <main id="container" class="login_page sub_container">
      <div class="contents">
        <div class="inner">
          <div class="logo_wrap">
            <h2 class="logo">
              <a href="../main/index.do"></a>
              <span class="blind">넥슨로고</span>
              마이페이지
            </h2>
          </div>
          <div class="login_area">
			<c:choose>
				<c:when test="${ not empty UserName }">
					${ UserName } 회원님, 로그인하셨습니다.<br />				
				</c:when>
				<c:otherwise>
					<script>
						sendToLogin();					
					</script>
				</c:otherwise>
			</c:choose>


	      </div>
          <ul class="link_wrap">
            <li><a href="./editmember.do">회원정보 수정</a></li>
            <li><a href="Logout.jsp">로그아웃</a></li>
          </ul>
        </div>
      </div>
    </main>
   ${ body_footer }
  </div>
</body>
</html>