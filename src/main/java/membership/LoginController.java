package membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("user_id");
		String pass = req.getParameter("user_pw");
		
		if (id == null || id.isEmpty()) {
			req.setAttribute("LoginErrMag", "아이디를 입력하세요.");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
			return;
		}
		if (pass == null || pass.isEmpty()) {
			req.setAttribute("LoginErrMag", "비밀번호를 입력하세요.");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
			return;
		}
		
		// dao를 통해 DB의 id와 비밀번호를 검증하고 세션에 저장
		MemberDAO dao = new MemberDAO(getServletContext());
		boolean loginResult = dao.checkLogin(id, pass);
		
		if (loginResult) {
			// 로그인 성공시 세션에 정보 저장
			HttpSession session = req.getSession();
			session.setAttribute("UserId", id);
			session.setAttribute("UserName", dao.getUserName(id));
			
			resp.sendRedirect("./login.do");
		}
		else {
			req.setAttribute("LoginErrMsg", "아이디 또는 비밀번호가 잘못되었습니다.");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
		
	}
}
