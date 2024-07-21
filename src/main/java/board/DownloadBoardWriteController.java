package board;

import java.io.IOException;
import java.nio.file.spi.FileTypeDetector;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/download-board/write.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 20
)
public class DownloadBoardWriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/html/download-board-write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String) req.getSession().getAttribute("UserId");
		
		// 파일 업로드 처리
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		// 파일 업로드
		String originalFileName = "";
		try {
			// 업로드가 정상적으로 완료되면 원본파일명을 반환한다.
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		} catch (Exception e) {
			e.printStackTrace();
			// 파일 업로드시 오류가 발생하면 경고창을 띄운 후 작성페이지로 이동한다.
			JSFunction.alertLocation(resp, "파일 업로드 오류입니다.",
					"../download-board/write.do");
			return;
		}
		
		
		// 필요한 폼값만 저장.
		BoardDTO dto = new BoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setId(id);
		
		// 원본 파일명과 저장된 파일 이름 설정
		// 첨부파일이 정상적으로 등록되어 원본 파일명이 반환되었다면
		if (originalFileName != "") {
			// 파일명을 '날짜_시간.확장자' 형식으로 변경하고..
			String savedFileName = 
					FileUtil.renameFile(saveDirectory, originalFileName);
			
			// 원본 파일명과 저장된 파일명을 DTO에 저장
			dto.setOfile(originalFileName);
			dto.setSfile(savedFileName);
		}
		
		// DAO를 통해 DA에 게시물 내용을 저장한다.
		BoardDAO dao = new BoardDAO(getServletContext());
		int result = dao.insertWriteDown(dto);
		dao.close();
		
		// 글 작성이 되면 result가 psmt.executeUpdate();에 의해 1이 됨
		if (result == 1) {
			JSFunction.alertLocation(resp, "글쓰기에 성공했습니다.", "../download-board/list.do");
		}
		else {
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../download-board/write.do");
		}
	}
}
