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
	
	// 게시물 개수 카운트(자유 게시판)
	public int selectCountFree(Map<String, Object> map) {
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
	// 게시물 개수 카운트(QnA 게시판)
	public int selectCountQnA(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM qna_board";
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
	// 게시물 개수 카운트(다운로드 게시판)
	public int selectCountDown(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM download_board";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}	
		try {

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
	
	// 목록에 출력할 게시물을 페이지 단위로 얻어옴(자유 게시판)
	public List<BoardDTO> selectListPageFree(Map<String, Object> map) {
		
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
	// 목록에 출력할 게시물을 페이지 단위로 얻어옴(QnA 게시판)
	public List<BoardDTO> selectListPageQnA(Map<String, Object> map) {
		
		List<BoardDTO> board = new Vector<BoardDTO>();
		
		// 페이징 처리용 서브쿼리문, 게시물의 순차적인 일련번호를 rownum으로 지정
		String query = "SELECT * FROM ( "
				+ " 	SELECT Tb.*, ROWNUM rNum FROM ( "
				+ " 		SELECT * FROM qna_board ";
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
	
	// 목록에 출력할 게시물을 페이지 단위로 얻어옴(다운로드 게시판)
	public List<BoardDTO> selectListPageDown(Map<String, Object> map) {
		
		List<BoardDTO> board = new Vector<BoardDTO>();
		
		// 페이징 처리용 서브쿼리문, 게시물의 순차적인 일련번호를 rownum으로 지정
		String query = "SELECT * FROM ( "
				+ " 	SELECT Tb.*, ROWNUM rNum FROM ( "
				+ " 		SELECT * FROM download_board ";
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
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDowncount(rs.getInt(9));
				dto.setVisitcount(rs.getInt(10));
				
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
	
	// 게시물 상세보기를 위해 일련번호에 해당하는 레코드 1개를 인출해서 반환(자유 게시판)
	public BoardDTO selectViewFree(String idx) {
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
				dto.setVisitcount(rs.getInt(7));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	// 게시물 상세보기(QnA 게시판)
	public BoardDTO selectViewQnA(String idx) {
		// 하나의 레코드를 저장하기 위한 DTO 생성
		BoardDTO dto = new BoardDTO();
		String query = "SELECT * FROM qna_board WHERE idx = ?";
		
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
				dto.setVisitcount(rs.getInt(7));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	// 다운로드 게시판 상세보기
	public BoardDTO selectViewDown(String idx) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT * FROM download_board WHERE idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();

			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
				dto.setOfile(rs.getString(7));
				dto.setSfile(rs.getString(8));
				dto.setDowncount(rs.getInt(9));
				dto.setVisitcount(rs.getInt(10));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 게시물의 조회수를 증가 (자유 게시판)
	public void updateVisitcountFree(String idx) {
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
	// 게시물 조회수 증가 (QnA게시판)
	public void updateVisitcountQnA(String idx) {
		/* 게시물의 일련번호를 통해 visitcount를 1 증가시킨다.
		 이 컬럼은 number 타입이므로 사칙연산이 가능하다. */
		String query = "UPDATE qna_board SET "
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
	// 게시물의 조회수를 증가 (자유 게시판)
	public void updateVisitcountDown(String idx) {
		/* 게시물의 일련번호를 통해 visitcount를 1 증가시킨다.
		 이 컬럼은 number 타입이므로 사칙연산이 가능하다. */
		String query = "UPDATE download_board SET "
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
	
	// 게시물 작성페이지에서 작성한 폼값을 테이블(DB)에 insert 하여 저장 (자유 게시판)
	public int insertWriteFree(BoardDTO dto) {
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
	// 게시물 작성(QnA 게시판)
	public int insertWriteQnA(BoardDTO dto) {
		int result = 0;
		
		try {
			// 인파라미터가 있는 insert 쿼리문 작성
			String query = "INSERT INTO qna_board ( "
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
	// 게시물 작성(다운로드 게시판)
	public int insertWriteDown(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO download_board ( "
					+ " idx, name, title, content, id, ofile, sfile) "
					+ " VALUES ( "
					+ " seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getId());
			psmt.setString(5, dto.getOfile()); // 원본 파일명
			psmt.setString(6, dto.getSfile()); // 서버에 저장된 파일명
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 게시물 수정(자유 게시판)
	public int updatePostFree(BoardDTO dto) {
		int result = 0;
		try {
			// 수정을 위한 update 쿼리문 작성
			String query = "UPDATE free_board "
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
	// 게시물 수정(QnA 게시판)
	public int updatePostQnA(BoardDTO dto) {
		int result = 0;
		try {
			// 수정을 위한 update 쿼리문 작성
			String query = "UPDATE qna_board "
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
	// 게시물 수정(다운로드 게시판)
	public int updatePostDown(BoardDTO dto) {
		int result = 0;
		try {
			// 수정을 위한 update 쿼리문 작성
			String query = "UPDATE download_board "
					+ " SET title = ?, content = ?, ofile = ?, sfile = ? "
					+ " WHERE idx = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getIdx());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시물 삭제(자유게시판)
	public int deletePostFree(String idx) {
		int result = 0;
		try {
			String query = "DELETE FROM free_board WHERE idx = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			System.out.println(result);
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	// 게시물 삭제(QnA 게시판)
	public int deletePostQnA(String idx) {
		int result = 0;
		try {
			String query = "DELETE FROM qna_board WHERE idx = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			System.out.println(result);
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	// 게시물 삭제(다운로드 게시판)
	public int deletePostDown(String idx) {
		int result = 0;
		try {
			String query = "DELETE FROM download_board WHERE idx = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			System.out.println(result);
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 파일 다운로드시 카운트 증가
	public void downCountPlus(String idx) {
		String query = "UPDATE download_board SET "
					+ " downcount = downcount + 1 "
					+ " WHERE idx = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch (Exception e) {}
	}
	
}
