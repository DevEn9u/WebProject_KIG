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
import utils.CookieManager;

@WebServlet("/qna-board/view.do")
public class QnABoardViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String boardIdx = req.getParameter("idx");
        BoardDAO boardDAO = new BoardDAO(getServletContext());
        CommentDAO commentDAO = new CommentDAO(getServletContext());

        // 쿠키를 이용해 하루에 조회수 1씩 증가
        String ckValue = CookieManager.readCookie(req, "board-" + boardIdx);
        if (!ckValue.equals("read")) {
            CookieManager.makeCookie(resp, "board-" + boardIdx, "read", 86400);
            // 게시물 조회수 증가
            boardDAO.updateVisitcountQnA(boardIdx);
        }

        // 게시글 인출
        BoardDTO dto = boardDAO.selectViewQnA(boardIdx);
        CommentDTO commentDTO = commentDAO.selectInfoComm(boardIdx);
		
        // 내용의 경우 엔터 클릭시 줄바꿈을 하게 되므로 br태그로 변경하여 웹 브라우저 출력
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));
        
        // 댓글 목록 조회
        Map<String, Object> map = new HashMap<>();
        int totalCount = commentDAO.selectCountComm(map, boardIdx);

        // 페이지네이션 처리
        ServletContext application = getServletContext();
        int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
        int pageNum = 1;
        String pageTemp = req.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals("")) {
            pageNum = Integer.parseInt(pageTemp);
        }
        int start = (pageNum - 1) * pageSize + 1;
        int end = pageNum * pageSize;
        map.put("start", start);
        map.put("end", end);

        List<CommentDTO> commentsList = commentDAO.selectListPageComm(map, boardIdx);
        commentDAO.close();

        String pagingImg = BoardPagination.pagingStrComm(
                totalCount, pageSize, blockPage, pageNum, "../qna-board/view.do", boardIdx);
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize); 
        map.put("pageNum", pageNum);
        
        
        // 데이터를 request에 저장하고 JSP로 포워딩
        req.setAttribute("dto", dto);
        req.setAttribute("commentDTO", commentDTO);
        req.setAttribute("commentsList", commentsList);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/html/qna-board-view.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String boardIdx = req.getParameter("boardIdx");
        String name = req.getParameter("name");
        String commCon = req.getParameter("commCon");

        CommentDTO commentDTO = new CommentDTO();
        commentDTO.setBoardIdx(boardIdx);
        commentDTO.setName(name);
        commentDTO.setContent(commCon);

        CommentDAO commentDAO = new CommentDAO(getServletContext());
        commentDAO.insertWriteComm(commentDTO);
        commentDAO.close();

        // 댓글 작성 후 다시 doGet 메서드 호출하여 게시글 및 댓글 목록 갱신
        doGet(req, resp);
    }
}
