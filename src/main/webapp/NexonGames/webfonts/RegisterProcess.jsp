<%@page import="common.JDBConnect"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

//application 내장 객체를 이용해서 web.xml에 등록한 접속정보를 읽어온다.
JDBConnect jdbc = new JDBConnect(application);
jdbc.close();
%>