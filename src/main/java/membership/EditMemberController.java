package membership;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/member/editmember.do")
public class EditMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 로그인한 계정의 아이디를 불러옴
		String userId = (String) req.getSession().getAttribute("UserId");
		
		MemberDAO dao = new MemberDAO(getServletContext());
		// 아이디를 통해 다른 정보를 가져와 dto에 저장하고 jsp에서 변수를 통해 화면에 보여줌
		MemberDTO dto = dao.getMemberById(userId);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/html/EditMember.jsp").forward(req, resp);
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
		
		// 비밀번호 유효성 검사
		if (!isValidPass(pass)) {
			JSFunction.alertBack(resp, "비밀번호는 숫자와 영문자 조합으로 8자 이상이어야 합니다.");
			return;
		}
		
		// DAO를 통해 사용자 정보 가져오기
		MemberDAO dao = new MemberDAO(getServletContext());
		boolean isSuccess = dao.updateMember(dto);
		
		if (isSuccess) {
			// 수정 성공시 성공 알림 띄워줌
			JSFunction.alertLocation(resp, "회원 정보 수정에 성공하였습니다.", "../member/mypage.do");
		}
		else {
			// 수정 실패시 실패 알림 띄워줌
			JSFunction.alertLocation(resp, "회원 정보 수정에 실패하였습니다.", "./member/register.do");
		}
		
		System.out.println(dto.getPhone() + "에디트컨트롤러");
		System.out.println(dto.getPass () + "에디트컨트롤러");
		

		req.getRequestDispatcher("/editmember.do").forward(req, resp);
	}
	
	// 비밀번호 유효성 검사 메서드
	private boolean isValidPass(String pass) {
		/* regex는 Regular Expression(정규평가식 이하 정규식)을 나타낸 변수로 자바에서는 정규식으로
		 문자열에서 규칙검사시 사용된다. */
		// 비밀번호는 8자 이상이고 숫자와 영문자 조합이다.
		String regex = "^(?=.*[0-9])(?=.*[a-zA-Z])(.{8,})$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(pass);
		return matcher.matches();
	}
	
}
