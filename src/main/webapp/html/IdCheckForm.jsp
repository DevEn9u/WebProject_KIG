<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript">
	function checkId() {
		let id = document.IdCheckFrm.id;
		if (id.value == "") {
			id.focus();
			return false;
		}
		else {			
			window.opener.document.registerFrm.id.value = id.value;
			window.opener.document.registerFrm.idDuplication.value = "idChecked";
			
// 			window.close();
		}
	}

</script>
</head>
<body>
	<h2>아이디 중복 확인</h2>
	<form name="IdCheckFrm" action="CheckId.do">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id" value="<%= request.getParameter("id")%>"/>
		<button type="submit" onclick="checkId()">확인</button>
	</form>
</body>
</html>