package membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editmember.do")
public class EditMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private MemberDAO dao;

    @Override
    public void init() throws ServletException {
        super.init();
        dao = new MemberDAO(getServletContext());
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String userId = (String) req.getSession().getAttribute("UserId");
		
		MemberDTO dto = dao.getMemberById(userId);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/EditMember.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		MemberDTO dto = new MemberDTO();

		dto.setId(id);
		dto.setPass(pass);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPhone(phone);
		
		// DAO를 통해 사용자 정보 가져오기
		
		dao.getUserInfo(id);
//		System.out.println(id);
		System.out.println(dto.getPhone() + "에디트컨트롤러");
		
		
		req.setAttribute("dto", dto);
//		req.getRequestDispatcher("/EditMember.jsp").forward(req, resp);
	}
	
}
