package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/free-board/delete.do")

public class FreeBoardDelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/html/free-board-edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		// 파라미터로 idx를 받아옴.
		String idx = req.getParameter("idx");
		
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = new BoardDAO(getServletContext());
		String sessionId = (String) session.getAttribute("UserId");
		dto = dao.selectView(idx);
		int result = dao.deletePost(idx);
		dao.close();
		if (sessionId.equals(dto.getId())) {
			// 게시물이 삭제되면 deletePost() 메서드에 의해 result가 1이 됨.
			if (result == 1) {
				JSFunction.alertLocation(resp, "게시물이 삭제되었습니다.",
						"../free-board/list.do");
			}
			else {
				//실패하면 경고창을 띄우고 이동한다.
				JSFunction.alertLocation(resp, "삭제에 실패하였습니다.",
						"../free-board/view.do?idx=" + idx);
			}
		}
	}
}