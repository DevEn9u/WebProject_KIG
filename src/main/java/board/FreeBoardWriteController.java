package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/free-board/write.do")
public class FreeBoardWriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/html/free-board-write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String) req.getSession().getAttribute("UserId");
		
		// 필요한 폼값만 저장.
		BoardDTO dto = new BoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setId(id);
		
		
		// DAO를 통해 DA에 게시물 내용을 저장한다.
		BoardDAO dao = new BoardDAO(getServletContext());
		int result = dao.insertWire(dto);
		dao.close();
		
		// 글 작성이 되면 result가 psmt.executeUpdate();에 의해 1이 됨
		if (result == 1) {
			JSFunction.alertBack(resp, "글쓰기에 성공했습니다.");
			resp.sendRedirect("../free-board/list.do");
		}
		else {
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../free-board/write.do");
		}
	}
}
