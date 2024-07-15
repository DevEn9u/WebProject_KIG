package membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setPass(pass);
		memberDTO.setName(name);
		memberDTO.setEmail(email);
		memberDTO.setPhone(phone);
		
		// DAO를 통해 DB에 회원 정보를 저장
		MemberDAO dao = new MemberDAO(getServletContext());
		boolean isSuccess = dao.registerMember(memberDTO);
		
		if (isSuccess) {
			// 가입 성공시 메세지를 request로 전달, 가입성공알림을 띄우기 위함
//			req.setAttribute("RegSucMsg", "회원 가입이 완료되었습니다.");
//			req.getRequestDispatcher(req.getContextPath() + "/NexonGames/login.jsp").forward(req, resp);
			resp.sendRedirect(req.getContextPath() + "/NexonGames/login.jsp");
		}
		else {
//			 가입 실패시 register.jsp로 redirect
//			req.setAttribute("RegFailMsg", "회원 가입에 실패하였습니다.");
			resp.sendRedirect(req.getContextPath() + "/NexonGames/register.jsp");

		}
	}
}
