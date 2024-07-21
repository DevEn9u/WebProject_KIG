package board;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/download-board/edit.do")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 100,
	maxRequestSize = 1024 * 1024 * 300
)
public class DownloadBoardEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idx = req.getParameter("idx");
		BoardDAO dao = new BoardDAO(getServletContext());
		BoardDTO dto = dao.selectViewDown(idx);
		// DTO를 request 영역에 저장한 후 수정페이지로 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/html/download-board-edit.jsp").forward(req, resp);
	}
	
	/*
	 수정할 내용을 입력한 후 전송된 폼값을 update쿼리문으로 실행한다.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");

		// 파일 업로드
		String originalFileName = "";
		try {
			// 업로드가 완료되면 원본파일명을 반환
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		} catch (Exception e) {
			JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
			return;
		}
		
		// 2. 파일 업로드 외 처리

		String idx = req.getParameter("idx");
		String prevOfile = req.getParameter("prevOfile");
		String prevSfile = req.getParameter("prefSfile");
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		// DTO에 저장
		BoardDTO dto = new BoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		
		if (originalFileName != "") {
			// 첨부파일이 있는 경우에는 저장된 파일명을 새롭게 변경한다.
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			
			// 새롭게 등록한 파일의 정보를 DTO에 추가한다.
			dto.setOfile(originalFileName); // 기존 파일명
			dto.setSfile(savedFileName); // 서버에 저장된 파일명
			
			// 기존 파일 삭제
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		else {
			// 첨부파일이 없으면 기존 파일명 유지
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		// DB에 수정 내용 적용
		BoardDAO dao = new BoardDAO(getServletContext());
		int result = dao.updatePostDown(dto);
		dao.close();

		if (result == 1) {
			JSFunction.alertLocation(resp, "게시물이 수정되었습니다.",
					"../download-board/view.do?idx=" + idx);
		}
		else {
			//실패하면 경고창을 띄우고 이동한다.
			JSFunction.alertLocation(resp, "게시물 수정에 실패하였습니다.",
					"../download-board/view.do?idx=" + idx);
		}
	}
}