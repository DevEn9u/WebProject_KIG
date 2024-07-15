package membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("user_id");
		String pass = req.getParameter("user_pw");
		
		if (id == null || id.isEmpty()) {
			req.setAttribute("LoginErrMag", "아이디를 입력하세요.");
			req.getRequestDispatcher("/NexonGames/login.jsp").forward(req, resp);
			return;
		}
		if (pass == null || pass.isEmpty()) {
			req.setAttribute("LoginErrMag", "비밀번호를 입력하세요.");
			req.getRequestDispatcher("/NexonGames/login.jsp").forward(req, resp);
			return;
		}
		
	}
}
