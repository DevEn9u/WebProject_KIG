package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/qna-board/edit.do")

public class QnABoardEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idx = req.getParameter("idx");
		BoardDAO dao = new BoardDAO(getServletContext());
		BoardDTO dto = dao.selectViewQnA(idx);
		// DTO를 request 영역에 저장한 후 수정페이지로 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/html/qna-board-edit.jsp").forward(req, resp);
	}
	
	/*
	 수정할 내용을 입력한 후 전송된 폼값을 update쿼리문으로 실행한다.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		// 2. 파일 업로드 외 처리
		/*
		 수정을 위해 hidden 입력상자에 저장된 내용도 같이 받아온다. 게시물의
		 일련번호를 받아옴
		 */
		String idx = req.getParameter("idx");
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		BoardDAO dao = new BoardDAO(getServletContext());
		
		// DTO에 저장
		BoardDTO dto = new BoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		
		
		// DB에 수정 내용 적용
		int result = dao.updatePostQnA(dto);
		dao.close();

		if (result == 1) {
			JSFunction.alertLocation(resp, "게시물이 수정되었습니다.",
					"../qna-board/view.do?idx=" + idx);
		}
		else {
			//실패하면 경고창을 띄우고 이동한다.
			JSFunction.alertLocation(resp, "게시물 수정에 실패하였습니다.",
					"../qna-board/view.do?idx=" + idx);
		}
	}
}