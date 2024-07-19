<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<c:import url="/include/common_head.jsp"></c:import>
<c:import url="/include/common_body_header.jsp" var="body_header"></c:import>
<c:import url="/include/common_body_footer.jsp" var="body_footer"></c:import>
  <script type="text/javascript">
  	
	function validateForm(form) {  // 폼 내용 검증
	    if (form.pass.value == "") {
	        alert("비밀번호를 입력하세요. 에디트멤버");
	        form.pass.focus();
	        return false;
	    }
	    if (form.pass.value != form.pass2.value) {
	        alert("비밀번호 확인을 위해 같은 비밀번호를 입력하세요. 에멤");
	        form.pass.value = "";
	        form.pass2.value = "";
	        form.pass.focus();
	        return false;
	    }
	    if (form.email.value == "") {
	        alert("이메일을 입력하세요. 에멤");
	        form.email.focus();
	        return false;
	    }
	    if (form.tel.value == "") {
	        alert("전화번호를 입력하세요. 에멤");
	        form.tel.focus();
	        return false;
	    }
	}
	function formatPhoneNumber(input) {
		let phone = document.registerFrm.phone.value;
		
		let cleanedInput = input.value.replace(/[^\d]/g, '');
		
		cleanedInput = cleanedInput.slice(0, 11);
		
		// 3번째 숫자와 7번째 숫자 뒤에 '-'를 추가하여 '010-1234-5678' 구조로 만들기
		let dashInput = '';
		
		for (let i = 0; i < cleanedInput.length; i++) {
			if (i === 3 || i === 7) {
				dashInput += '-';
			}
			dashInput += cleanedInput[i];
		}
		input.value = dashInput;
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
              <a href="index.jsp"></a>
              <span class="blind">넥슨로고</span>
            </h2>
          </div>
          
          <!-- 회원가입 폼 -->
          <div class="regisetr_wrap">
          	<form name="editFrm" method="post" action="./editmember.do"
          		onsubmit="return validateForm(this);">
          		<fieldset>
          		<legend>회원정보 수정 양식</legend>
				    아이디 : <input type="text" name="id" value="${ dto.id }" readonly="readonly">
				    비밀번호 : <input type="password" name="pass" value="${ dto.pass }" placeholder="영문+숫자의 조합으로 8자 이상의 비밀번호를 입력해주세요.">
				    비밀번호 확인 : <input type="password" name="pass2" placeholder="비밀번호를 다시 입력해주세요.">
				    이름 : <input type="text" name="name" value="${ dto.name }" readonly="readonly"/>
				    Email : <input type="email" name="email" value="${ dto.email }" > <br />
			    	전화번호 : <input type="text" name="phone" oninput="formatPhoneNumber(this)" value="${ dto.phone }" ><br />
			    	<button type="submit">수정하기</button>
          		</fieldset>
			</form>
          </div>
        </div>
      </div>
    </main>
    ${ body_footer }
  </div>
</body>
</html>