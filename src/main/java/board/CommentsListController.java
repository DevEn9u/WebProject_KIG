package board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import comments.CommentDAO;
import comments.CommentDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPagination;

@WebServlet("/qna-board/comment-list.do")
public class CommentsListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String boardIdx = req.getParameter("boardIdx");
		CommentDAO dao = new CommentDAO(getServletContext());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		// 게시물 개수 카운트
		int totalCount = dao.selectCountComm(map);
		
		/* 페이지네이션 처리 */
		ServletContext application = getServletContext();
		
		// web.xml에 저장한 컨텍스트 초기화 파라미터를 얻어옴
		int pageSize = 
				Integer.parseInt(
						application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = 
				Integer.parseInt(
						application.getInitParameter("PAGES_PER_BLOCK"));
		// 현재 페이지 번호 설정(첫 진입시 무조건 1페이지로 셜정)
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		// 목록에 출력할 게시물의 범위를 계산하여 Map에 저장
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		/* 페이지네이션 end */
		
		// 해당 페이지에 출력할 게시물을 List로 얻어온다.
		List<CommentDTO> commentsList = dao.selectListPageComm(map);
		dao.close();
		
		// 페이지 번호를 String 타입으로 변환
		String pagingImg = BoardPagination.pagingStrComm(
				totalCount, pageSize, blockPage, pageNum, "../qna-board/comment-list.do");
	
		// 페이지 번호를 Map에 추가
		map.put("pagingImg", pagingImg);
		// 전체 게시물 개수
		map.put("totalCount", totalCount);
		// 한 페이지에 출력한 게시물의 개수
		map.put("pageSize", pageSize);
		// 현재 페이지 번호
		map.put("pageNum", pageNum);
		
		// View(JSP)로 전달할 페이지를 request 영역에 저장
		req.setAttribute("commentsList", commentsList);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/html/qna-board-view.jsp").forward(req, resp);
		
	}
}
