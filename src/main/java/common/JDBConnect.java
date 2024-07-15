package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	// 멤버변수 : DB 연결, 정적쿼리실행, 동적쿼리실행, select결과 반환
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs; 
	

	public JDBConnect(ServletContext application) {
		try {
			/* 내장객체를 전달받았으므로 Java 클래스 내에서 web.xml에
			접근할 수 있다. 그러면 JSP에서 DB 연결을 위해 반복적으로
			사용했던 코드를 메서드로 정의하여 중복된 코드를 줄일 수 있다. */
			String driver = application.getInitParameter("OracleDriver");
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결 성공");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(con != null) {
				con.close();
			}

			System.out.println("JDBC 자원 해제");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	 
}
