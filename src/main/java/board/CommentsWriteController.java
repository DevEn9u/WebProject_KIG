package board;

import java.io.IOException;

import comments.CommentDAO;
import comments.CommentDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/qna-board/comment_write.do")
public class CommentsWriteController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = (String) req.getSession().getAttribute("UserId");
		String boardIdx = req.getParameter("boardIdx");
		
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setBoardIdx(boardIdx); // 게시글 번호
		commentDTO.setName(req.getParameter("name"));
		commentDTO.setContent(req.getParameter("commCon")); // 댓글 내용
		commentDTO.setId(id);
		
		
		// DAO를 통해 DA에 게시물 내용을 저장한다.
		CommentDAO dao = new CommentDAO(getServletContext());
		int result = dao.insertWriteComm(commentDTO);
		dao.close();
		
		if (result == 1) {
			JSFunction.alertLocation(resp, "댓글을 작성했습니다.", "../qna-board/view.do?idx=" + boardIdx);
		}
		else {
			JSFunction.alertBack(resp, "댓글 작성을 하지 못했습니다.");
		}
		

	}
}
