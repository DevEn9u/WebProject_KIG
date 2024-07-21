package board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPagination;

@WebServlet("/download-board/list.do")
public class DownloadBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// DB 연결
		BoardDAO dao = new BoardDAO(getServletContext());
		
		// 게시물 구간 및 검색어 관련 파라미터 저장을 위한 Map 계열 컬렉션 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 검색어 파라미터가 있는 경우 값을 받은 후 Map에 저장한다.
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		if (searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		// 게시물 개수 카운트
		int totalCount = dao.selectCountDown(map);
		
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
		List<BoardDTO> boardLists = dao.selectListPageDown(map);
		dao.close();
		
		// 페이지 번호를 String 타입으로 변환
		String pagingImg = BoardPagination.pagingStr(
				totalCount, pageSize, blockPage, pageNum, "../download-board/list.do",
				searchField, searchWord);
	
		// 페이지 번호를 Map에 추가
		map.put("pagingImg", pagingImg);
		// 전체 게시물 개수
		map.put("totalCount", totalCount);
		// 한 페이지에 출력한 게시물의 개수
		map.put("pageSize", pageSize);
		// 현재 페이지 번호
		map.put("pageNum", pageNum);
		
		// View(JSP)로 전달할 페이지를 request 영역에 저장
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/html/download-board-list.jsp").forward(req, resp);
	}
}

