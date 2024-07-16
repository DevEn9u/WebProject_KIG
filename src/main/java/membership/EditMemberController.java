package membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editmember.do")
public class EditMemberController extends HttpServlet {

	private MemberDAO dao;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				
		// 세션에서 현재 사용자 아이디 가져오기
		String id = (String) req.getSession().getAttribute("id");
		System.out.println(id);
		
		// DAO를 통해 사용자 정보 가져오기
		MemberDTO member = dao.getMemberById(id);
		
		// 회원 정보를 request에 저장
		req.setAttribute("member", member);
		
		req.getRequestDispatcher("/EditMember.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		

	}
}
