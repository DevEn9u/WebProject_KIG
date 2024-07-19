package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/free-board/view.do")
public class FreeBoardViewController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BoardDAO dao = new BoardDAO(getServletContext());
		String idx = req.getParameter("idx");
		// 조회수 증가
		dao.updateVisitcount(idx);
		// 게시물 인출
		BoardDTO dto = dao.selectView(idx);
		
		dao.close();
		
		// 내용의 경우 엔터 클릭시 줄바꿈을 하게 되므로 br태그로 변경하여 웹 브라우저 출력
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/html/free-board-view.jsp").forward(req, resp);
	}
}

