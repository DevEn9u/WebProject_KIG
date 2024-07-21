package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.CookieManager;

@WebServlet("/qna-board/view.do")
public class QnABoardViewController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BoardDAO dao = new BoardDAO(getServletContext());
		String idx = req.getParameter("idx");
		
		// 쿠키를 이용해 하루에 조회수 1씩 증가
		String ckValue = CookieManager.readCookie(req, "board-" + idx);
		if(!ckValue.equals("read")) {
			CookieManager.makeCookie(resp, "board-" + idx, "read", 86400);
			// 게시물 조회수 증가
			dao.updateVisitcountFree(idx);
		}
		// 게시물 인출
		BoardDTO dto = dao.selectViewQnA(idx);
		
		dao.close();
		
		// 내용의 경우 엔터 클릭시 줄바꿈을 하게 되므로 br태그로 변경하여 웹 브라우저 출력
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/html/qna-board-view.jsp").forward(req, resp);
	}
}

