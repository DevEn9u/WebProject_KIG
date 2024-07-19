<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="/include/common_head.jsp"></c:import>
<c:import url="/include/common_body_header.jsp" var="body_header"></c:import>
<c:import url="/include/common_body_footer.jsp" var="body_footer"></c:import>
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
            </h2>
            <ul class="login_type">
              <li class="active"><a href="#">넥슨ID 로그인</a></li>
              <li><a href="#">일회용 로그인</a></li>
              <li><a href="#">QR 로그인</a></li>
            </ul>
          </div>
          <div class="login_area">			
			<c:choose>
				<c:when test="${ UserId eq null }">
					<script>
						function validateForm(form) {
							if (!form.user_id.value) {
								alert("아이디를 입력하세요.");
								form.user_id.focus();
								return false;
							}
							if (form.user_pw.value == "") {
								alert("패스워드를 입력하세요.");
								form.user_pw.focus();
								return false;
							}
						}
					</script>
		            <form name="loginFrm" method="post" action="./login.do"
		            	onsubmit="return validateForm(this);">
		              <fieldset>
		                <legend>로그인</legend>
		                <div class="row input_wrap1">
		                  <input type="text" name="user_id" placeholder="아이디">
		                </div>
		                <div class="row input_wrap2">
		                  <input type="password" name="user_pw" placeholder="비밀번호">
		                </div>
		                <div class="row3 checkbox_wrap">
		                  <input type="checkbox" id="check1" class="blind">
		                  <label for="check1">로그인 상태 유지</label>
		                </div>
		                <button type="submit" class="login_btn">로그인</button>
		              </fieldset>
		            </form>
				</c:when>
          	</c:choose>
	      </div>
          <ul class="link_wrap">
            <li><a href="./register.do">회원가입</a></li>
            <li><a href="#">넥슨ID 찾기</a></li>
            <li><a href="#">비밀번호 찾기</a></li>
          </ul>
        </div>
      </div>
    </main>
   ${ body_footer }
  </div>
</body>
</html>