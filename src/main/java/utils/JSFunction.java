package utils;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspWriter;

// 자주 사용하는 JavaScript의 함수를 클래스로 정의
public class JSFunction {

	public static void alertLocation(String msg, String url, JspWriter out) {
		/*
		 Java 클래스에서는 JSP의 내장객체를 즉시 사용할 수 없으므로
		 반드시 매개변수로 전달받아 사용해야 한다.
		 여기서는 웹브라우저에 문자열을 출력하기 위해 out내장객체를
		 JspWriter 타입으로 받은 후 사용하고 있다.
		 */
		try {
			// JavaScript를 하나의 문자열로 정의한다.
			String script = ""
						+ "<script>"
						+ "		alert('" + msg + "');"
						+ "		location.href='" + url + "';"
						+ "</script>";
			// 해당 문자열을 웹 브라우저에 출력한다.
			out.println(script);
		}
		catch (Exception e) {}
	}
	
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+ "<script>"
					+ "		alert('" + msg + "');"
					+ "		history.back();"
					+ "</script>";
			out.println(script);
		}
		catch (Exception e) {}
	}
	
	
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {

		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
						+ "<script>"
						+ "		alert('" + msg + "');"
						+ "		location.href='" + url + "';"
						+ "</script>";
			writer.println(script);
		}
		catch (Exception e) {}
	}
	
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+ "<script>"
					+ "		alert('" + msg + "');"
					+ "		history.back();"
					+ "</script>";
			writer.println(script);
		}
		catch (Exception e) {}
	}
	
	public static void alertOnly(HttpServletResponse resp, String msg) {
	    try {
	        resp.setContentType("text/html;charset=UTF-8");
	        PrintWriter writer = resp.getWriter();
	        String script = ""
	                    + "<script>"
	                    + "    alert('" + msg + "');"
	                    + "</script>";
	        writer.println(script);
	    }
	    catch (Exception e) {}
	}
	
	// 새창 닫기
	public static void closeWindow(HttpServletResponse resp) {
	    try {
	        resp.setContentType("text/html;charset=UTF-8");
	        PrintWriter writer = resp.getWriter();
	        String script = ""
	                    + "<script>"
	                    + "    window.close();"
	                    + "</script>";
	        writer.println(script);
	    }
	    catch (Exception e) {}
	}
}
