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

	public int selectCountComm(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM comments";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("댓글 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	// 목록에 출력할 게시물을 페이지 단위로 얻어옴(댓글)
	public List<CommentDTO>selectListPageComm(Map<String, Object> map) {
		
		List<CommentDTO> comments = new Vector<CommentDTO>();
		
		// 페이징 처리용 서브쿼리문, 게시물의 순차적인 일련번호를 rownum으로 지정
		String query = "SELECT * FROM ( "
				 + " 	SELECT Tb.*, ROWNUM rNum FROM ( "
				 + " 		SELECT * FROM comments "
				 + " 			ORDER BY comm_idx"
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
	
	
	public int insertWriteComm(CommentDTO dto) {
		int result = 0;
		
		try {
			// 인파라미터가 있는 insert 쿼리문 작성
			String query = "INSERT INTO comments ( "
					+ " comm_idx, board_idx, name, content, id) "
					+ " VALUES ( "
					+ " seq_comments_num.NEXTVAL, ?, ?, ?, ?)";
			// 일련번호의 경우 시퀀스를 통해 입력한다.
			
			// prepared 인스턴스 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getBoardIdx());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getId());
			
			// 쿼리문 실행
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("댓글 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
