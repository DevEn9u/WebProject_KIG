<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃 처리 : session 영역의 속성명을 지정해서 삭제
session.removeAttribute("UserId");
session.removeAttribute("UserName");

// 로그아웃 처리 후 로그인 페이지로 '이동'한다.
response.sendRedirect("./login.do");
%>