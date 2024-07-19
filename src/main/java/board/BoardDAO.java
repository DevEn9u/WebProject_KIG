package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	// 게시물 개수 카운트
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM free_board";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		
		try {
			// 인파라미터가 없는 정적쿼리문이므로 prepared statement 대신 statement
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 목록에 출력할 게시물을 페이지 단위로 얻어옴
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		
		List<BoardDTO> board = new Vector<BoardDTO>();
		
		// 페이징 처리용 서브쿼리문, 게시물의 순차적인 일련번호를 rownum으로 지정
		String query = "SELECT * FROM ( "
				 + " 	SELECT Tb.*, ROWNUM rNum FROM ( "
				 + " 		SELECT * FROM free_board ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
					+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " 			ORDER BY idx DESC "
			   + "		) Tb "
			   + " ) "
			   + " WHERE rNum BETWEEN ? AND ?";
		
		try {
			// 인파라미터가 있는 동적 쿼리문
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
	
			while (rs.next()) {
	
				BoardDTO dto = new BoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
//				dto.setOfile(rs.getString(7));
//				dto.setSfile(rs.getString(8));
//				dto.setDowncount(rs.getInt(9));
				dto.setVisitcount(rs.getInt(7));
			
				// List에 추가한다.
				board.add(dto);
			}
		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		// 인출한 레코드를 저장한 List를 JSP로 반환한다.
		return board;
	}
	
	// 게시물 상세보기를 위해 일련번호에 해당하는 레코드 1개를 인출해서 반환
	public BoardDTO selectView(String idx) {
		// 하나의 레코드를 저장하기 위한 DTO 생성
		BoardDTO dto = new BoardDTO();
		String query = "SELECT * FROM free_board WHERE idx = ?";
		
		try {
			// 쿼리문의 인파라미터를 설정한 후 쿼리문 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			/*
			 일련번호는 중복되지 않으므로 단 한개의 게시물만 인출한다.
			 따라서 while문이 아닌 if문으로 처리한다. next()는 ResultSet으로
			 반환된 레코드를 확인해서 존재유무에 따라 true / false를 반환한다.
			 */
			// 결과를 DTO에 저장
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
//				dto.setOfile(rs.getString(6));
//				dto.setSfile(rs.getString(7));
//				dto.setDowncount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(7));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 게시물의 조회수를 증가
	public void updateVisitcount(String idx) {
		/* 게시물의 일련번호를 통해 visitcount를 1 증가시킨다.
		 이 컬럼은 number 타입이므로 사칙연산이 가능하다. */
		String query = "UPDATE free_board SET "
					+ " visitcount = visitcount + 1 "
					+ " WHERE idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// 게시물 작성페이지에서 작성한 폼값을 테이블(DB)에 insert 하여 저장
	public int insertWire(BoardDTO dto) {
		int result = 0;
		
		try {
			// 인파라미터가 있는 insert 쿼리문 작성
			String query = "INSERT INTO free_board ( "
					+ " idx, name, title, content, id) "
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL, ?, ?, ?, ?)";
			// 일련번호의 경우 시퀀스를 통해 입력한다.
			
			// prepared 인스턴스 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getId());
			
			// 쿼리문 실행
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 게시물 수정
	public int updatePost(BoardDTO dto) {
		int result = 0;
		try {
			// 수정을 위한 update 쿼리문 작성(일련번호와 패스워드까지 조건문에 추가됨)
			String query = "UPDATE free_board"
						 + " SET title = ?, content = ? "
						 + " WHERE idx = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getIdx());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletePost(String idx) {
		int result = 0;
		try {
			String query = "DELETE FROM free_board WHERE idx = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
}
