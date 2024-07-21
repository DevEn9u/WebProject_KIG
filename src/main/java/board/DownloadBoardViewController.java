package board;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.CookieManager;

@WebServlet("/download-board/view.do")
public class DownloadBoardViewController extends HttpServlet{

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
		BoardDTO dto = dao.selectViewDown(idx);
		
		dao.close();
		
		// 내용의 경우 엔터 클릭시 줄바꿈을 하게 되므로 br태그로 변경하여 웹 브라우저 출력
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));
		
		// 확장자명 이용해서 image, audio, video 보여주기
		String ext = null, fileName = dto.getSfile(), mimeType = null;
		if (fileName != null) {
			ext = fileName.substring(fileName.lastIndexOf('.') + 1);
		}
		
		String[] extArray1 = {"png", "jpg", "gif", "bmp"};
		String[] extArray2 = {"mp3", "wav"};
		String[] extArray3 = {"mp4", "avi", "wmv"};
		
		List<String> mimeList1 = Arrays.asList(extArray1);
		List<String> mimeList2 = Arrays.asList(extArray2);
		List<String> mimeList3 = Arrays.asList(extArray3);
		
		if (mimeList1.contains(ext)) {
			mimeType = "img";
		}
		else if (mimeList2.contains(ext)) {
			mimeType = "audio";
		}
		else if (mimeList3.contains(ext)) {
			mimeType = "video";
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("mimeType", mimeType);
		req.getRequestDispatcher("/html/download-board-view.jsp").forward(req, resp);
	}
}

