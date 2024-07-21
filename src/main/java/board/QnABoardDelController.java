package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/qna-board/delete.do")
public class QnABoardDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		// 파라미터로 idx를 받아옴.
		String idx = req.getParameter("idx");
		
		BoardDAO dao = new BoardDAO(getServletContext());
		BoardDTO dto = dao.selectViewQnA(idx);
		
		String sessionId = (String) session.getAttribute("UserId");		
		
		
		int result = dao.deletePostQnA(idx);
		dao.close();
		if (sessionId.equals(dto.getId())) {
			if (result == 1) {
				JSFunction.alertLocation(resp, "게시물이 삭제되었습니다.",
						"../qna-board/list.do");
				System.out.println(dto +"====");
			}
			else {
				//실패하면 경고창을 띄우고 이동한다.
				JSFunction.alertLocation(resp, "게시물 삭제에 실패하였습니다.",
						"../qna-board/view.do?idx=" + idx);
			}
		}
		else {
			JSFunction.alertBack(resp, "작성자 본인만 삭제 가능합니다.");
		}
	}
}