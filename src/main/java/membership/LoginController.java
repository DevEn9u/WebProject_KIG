package membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/html/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("user_id");
		String pass = req.getParameter("user_pw");
		
		
		// dao를 통해 DB의 id와 비밀번호를 검증하고 세션에 저장
		MemberDAO dao = new MemberDAO(getServletContext());
		MemberDTO dto = dao.checkLogin(id, pass);
				
		if (dto.getId() != null) {
			// 로그인 성공시 세션에 정보 저장, 이후 정보수정을 위해서 모든 데이터 저장
			HttpSession session = req.getSession();
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserName", dto.getName());
			
			resp.sendRedirect("../main/index.do");
		}
		else {
			// 로그인에 실패한 경우	경고메세지와 함께 로그인화면으로.	
			JSFunction.alertBack(resp, "아이디 또는 비밀번호가 잘못되었습니다.");
			
		}
		
	}
}
