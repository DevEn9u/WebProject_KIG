package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	// 생성자
	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("jave:comp/env");
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle_nexongames");
			
			con = source.getConnection();
			
			System.out.println("DB 커넥션 풀 연결 성공");
		} 
		catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}
	
	// 사용 끝난 객체를 pool에 반납하는 메서드
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (con != null) {
				con.close();
			}
			
			System.out.println("DB 커넥션 풀 자원 반납");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
