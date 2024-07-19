package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/free-board/edit.do")

public class FreeBoardEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idx = req.getParameter("idx");
		BoardDAO dao = new BoardDAO(getServletContext());
		BoardDTO dto = dao.selectView(idx);
		// DTO를 request 영역에 저장한 후 수정페이지로 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/html/free-board-edit.jsp").forward(req, resp);
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
		
		/*
		 패스워드 검증에 성공한 경우 session 영역에 저장된 패스워드를 가져온다.
		 영역에 저장시 Object 타입으로 자동형변환되므로 기존 타입으로 다운캐스팅
		 후 사용한다.
		 */
//		HttpSession session = req.getSession();
		BoardDAO dao = new BoardDAO(getServletContext());
		
		// DTO에 저장
		BoardDTO dto = new BoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		
		
		// DB에 수정 내용 적용
		int result = dao.updatePost(dto);
		dao.close();

		if (result == 1) {
			JSFunction.alertLocation(resp, "게시물이 수정되었습니다.",
					"../free-board/view.do?idx=" + idx);
		}
		else {
			//실패하면 경고창을 띄우고 이동한다.
			JSFunction.alertLocation(resp, "예외입니다 확인해봐요.",
					"../free-board/view.do?idx=" + idx);
		}
	}
}