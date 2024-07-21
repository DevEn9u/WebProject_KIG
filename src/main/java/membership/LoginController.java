package membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.CookieManager;
import utils.JSFunction;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		// 페이지로진입하면 loginId라는 쿠키가 있는지 확인한다.
		String saveId = CookieManager.readCookie(req, "saveId");

		// 이미 생성된 쿠기값이 있다면 체크박스가 체크된 상태로 페이지를 로드한다.
		String cookieCheck = "";
		if (!saveId.equals("")) {
			// 여기에서 부여된 값은 아래 checkbox 의 속성값으로 사용된다.
			cookieCheck = "checked";
			
			// 체크박스를 체크하고 로그인시 만들어진 쿠키값(아이디)과 저장 여부를 세션에 저장
			HttpSession session = req.getSession();
			session.setAttribute("saveId", saveId);
			session.setAttribute("cookieCheck", cookieCheck);
		}
		System.out.println(saveId + "###" + cookieCheck);
		req.getRequestDispatcher("/html/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("user_id");
		String pass = req.getParameter("user_pw");
		String save_check = req.getParameter("save_check");
		
		// dao를 통해 DB의 id와 비밀번호를 검증하고 세션에 저장
		MemberDAO dao = new MemberDAO(getServletContext());
		MemberDTO dto = dao.checkLogin(id, pass);
				
		if (dto.getId() != null) {
			// 로그인 성공시 세션에 정보 저장, 이후 정보수정을 위해서 모든 데이터 저장
			HttpSession session = req.getSession();
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserName", dto.getName());
			
			// 로그인에 성공하고 아이디 저장 체크시
			if (save_check != null && save_check.equals("Y")) {
				// 하루(60 * 60 * 24 = 86400)짜리 쿠키를 생성한다.
				CookieManager.makeCookie(resp, "saveId", id, 86400);
			}
			else {
				// 로그인에 성공했지만 체크를 해제한 상태라면 쿠키를 삭제한다.
				CookieManager.deleteCookie(resp, "saveId");
			}
			
			resp.sendRedirect("../main/index.do");
		}
		else {
			// 로그인에 실패한 경우	경고메세지와 함께 로그인화면으로.	
			JSFunction.alertBack(resp, "아이디 또는 비밀번호가 잘못되었습니다.");
			
		}
		
	}
}
