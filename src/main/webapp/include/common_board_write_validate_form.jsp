<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value == "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
    }
</script>