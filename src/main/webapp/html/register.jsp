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
	    if (form.id.value == "") {
	        alert("아이디를 입력하세요.");
	        form.id.focus();
	        return false;
	    }
		if (form.idDuplication.value != "idChecked") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
	    if (form.pass.value == "") {
	        alert("비밀번호를 입력하세요.");
	        form.pass.focus();
	        return false;
	    }
	    if (form.pass2.value == "") {
	        alert("비밀번호 확인을 위해 같은 비밀번호를 입력하세요.");
	        form.pass2.focus();
	        return false;
	    }
	    if (form.pass.value != form.pass2.value) {
	    	alert("비밀번호가 일치하지 않습니다.")
	    	form.pass.value = "";
	    	form.pass2.value = "";
	    	form.pass.focus();
	    	return false;
	    }
	    if (form.name.value == "") {
	        alert("이름을 입력하세요.");
	        form.name.focus();
	        return false;
	    }
	    if (form.email.value == "") {
	        alert("이메일을 입력하세요.");
	        form.email.focus();
	        return false;
	    }
	    if (form.phone.value == "") {
	        alert("전화번호를 입력하세요.");
	        form.phone.focus();
	        return false;
	    }
//         if (isNaN(form.phone.value)){
// 			alert("전화번호는 - 제외한 숫자만 입력해주세요.");
// 			return false;
// 		}
		
		// 모든 검증을 통과했을 경우 회원가입 로직 실행
		return true;
	}
	
	function idCheck() {
		let id = document.registerFrm.id.value;
		if (id == '') {
			alert("아이디를 입력하세요.");
			document.registerFrm.id.focus();
			return false;
		}
		else {
			
		window.name = "parentForm";
		window.open("../html/IdCheckForm.jsp?id=" + id,
				"chkForm", "width=500, height=300, resizable = no, scrollbars = no" );
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
              <a href="../main/index.doq"></a>
              <span class="blind">넥슨로고</span>
            </h2>
          </div>
          
          <!-- 회원가입 폼 -->
          <div class="regisetr_wrap">
          	<form name="registerFrm" method="post" action="../member/register.do"
          		onsubmit="return validateForm(this);">
			    아이디 : <input type="text" name="id" placeholder="6-12자 이내의 아이디를 입력해주세요.">
			    <button type="button" onclick="idCheck()">아이디 중복 확인</button> <br />
			    <input type="hidden" name="idDuplication" value="idUnchecked" />
			    비밀번호 : <input type="password" name="pass" placeholder="영문+숫자의 조합으로 8자 이상의 비밀번호를 입력해주세요.">
			    비밀번호 확인 : <input type="password" name="pass2" placeholder="비밀번호 확인을 위해 같은 비밀번호를 입력해주세요.">
			    이름 : <input type="text" name="name" />
			    Email : <input type="email" name="email"> <br />
			    전화번호 : <input type="text" name="phone" oninput="formatPhoneNumber(this)" placeholder="숫자만 입력해주세요." ><br />
			    <button type="submit" class="login_btn">회원가입</button>
			</form>
          </div>
        </div>
      </div>
    </main>
    ${ body_footer }
  </div>
</body>
</html>