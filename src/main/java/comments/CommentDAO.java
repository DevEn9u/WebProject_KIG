package comments;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class CommentDAO extends JDBConnect {

	public CommentDAO(ServletContext application) {
		super(application);
	}

	public int selectCountComm(Map<String, Object> map, String boardIdx) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM comments WHERE board_idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, boardIdx);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("댓글 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 목록에 출력할 게시물을 페이지 단위로 얻어옴(댓글)
	public List<CommentDTO>selectListPageComm(Map<String, Object> map, String boardIdx) {
		List<CommentDTO> comments = new Vector<CommentDTO>();
		
		// 페이징 처리용 서브쿼리문, 게시물의 순차적인 일련번호를 rownum으로 지정
		String query = "SELECT * FROM ( "
				 + " 	SELECT Tb.*, ROWNUM rNum FROM ( "
				 + " 		SELECT * FROM comments WHERE board_idx = ?"
				 + " 			ORDER BY comm_idx DESC "
			     + "		) Tb "
			     + " ) "
			     + " WHERE rNum BETWEEN ? AND ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, boardIdx);
			psmt.setString(2, map.get("start").toString());
			psmt.setString(3, map.get("end").toString());
			rs = psmt.executeQuery();
	
			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				
				dto.setCommIdx(rs.getString(1));
				dto.setBoardIdx(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
			
				// List에 추가한다.
				comments.add(dto);
			}
		} 
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		// 인출한 레코드를 저장한 List를 JSP로 반환한다.
		return comments;
	}
	// 댓글 작성
	public int insertWriteComm(CommentDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO comments ( "
					+ " comm_idx, board_idx, name, content, id) "
					+ " VALUES ( "
					+ " seq_comments_num.NEXTVAL, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getBoardIdx());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getId());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("댓글 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	// 게시물 수정(댓글)
	public int updatePostComm(CommentDTO dto) {
		int result = 0;
		try {
			// 수정을 위한 update 쿼리문 작성
			String query = "UPDATE comments "
						 + " SET content = ? "
						 + " WHERE comm_idx = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getContent());
			psmt.setString(2, dto.getCommIdx());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("댓글 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 댓글의 작성정보를 가져오기 위한 메서드
	public CommentDTO selectInfoComm(String idx) {
		// 하나의 레코드를 저장하기 위한 DTO 생성
		CommentDTO dto = new CommentDTO();
		String query = "SELECT * FROM comments WHERE board_idx = ?";
		
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
				dto.setCommIdx(rs.getString(1));
				dto.setBoardIdx(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
			}
		} catch (Exception e) {
			System.out.println("댓글 정보저장 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	// 게시물 삭제(댓글)
	public int deletePostComm(String commIdx) {
		int result = 0;
		try {
			String query = "DELETE FROM comments WHERE comm_idx = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, commIdx);
			result = psmt.executeUpdate();
			System.out.println(result);
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 댓글 삭제를 위해 댓글 정보를 가져옴
	public CommentDTO selectInfoCommDel(String comm_idx) {
		// 하나의 레코드를 저장하기 위한 DTO 생성
		CommentDTO dto = new CommentDTO();
		String query = "SELECT * FROM comments WHERE comm_idx = ?";
		
		try {
			// 쿼리문의 인파라미터를 설정한 후 쿼리문 실행
			psmt = con.prepareStatement(query);
			psmt.setString(1, comm_idx);
			rs = psmt.executeQuery();
			/*
			 일련번호는 중복되지 않으므로 단 한개의 게시물만 인출한다.
			 따라서 while문이 아닌 if문으로 처리한다. next()는 ResultSet으로
			 반환된 레코드를 확인해서 존재유무에 따라 true / false를 반환한다.
			 */
			// 결과를 DTO에 저장
			if(rs.next()) {
				dto.setCommIdx(rs.getString(1));
				dto.setBoardIdx(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setId(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
			}
		} catch (Exception e) {
			System.out.println("댓글 정보저장 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
}
