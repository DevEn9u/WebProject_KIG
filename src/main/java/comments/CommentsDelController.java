package comments;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/qna-board/comment_delete.do")
public class CommentsDelController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String commIdx = req.getParameter("commIdx");
		
		CommentDAO commentDAO = new CommentDAO(getServletContext());
		CommentDTO commentDTO = commentDAO.selectInfoCommDel(commIdx);
		String boardIdx = commentDTO.getBoardIdx();
		
		HttpSession session = req.getSession();
		String sessionId = (String) session.getAttribute("UserId");	
		
				
		
		if (sessionId.equals(commentDTO.getId())) {
			int result = commentDAO.deletePostComm(commIdx);
			commentDAO.close();
			
			if (result == 1) {
				JSFunction.alertLocation(resp, "댓글이 삭제되었습니다.",
						"../qna-board/view.do?idx=" + boardIdx);
			}
			else {
				//실패하면 경고창을 띄우고 이동한다.
				JSFunction.alertLocation(resp, "댓글 삭제에 실패하였습니다.",
						"../qna-board/view.do?idx=" + boardIdx);
			}
		}
		else { 
			System.out.println(sessionId + "###" + commentDTO.getId());
			System.out.println(commIdx);
			System.out.println(boardIdx);
			JSFunction.alertBack(resp, "작성자 본인만 삭제 가능합니다.");
		}
	}
}
