package membership;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/member/checkId.do")
public class CheckIdController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		MemberDAO dao = new MemberDAO(getServletContext());
		boolean isDuplicate = dao.checkDuplicateId(id);
		if (!(id.length() < 6 || id.length() > 13)) {
			if (isDuplicate) {
				JSFunction.alertBack(resp, "이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
			}
			else {
				JSFunction.alertBack(resp, "사용할 수 있는 아이디입니다.");
				// 아이디 중복확인이 끝나면 js로 창 닫기
				JSFunction.closeWindow(resp);
			}
		}
		else {
			JSFunction.alertBack(resp, "6-12자 사이의 아이디를 입력해주세요.");
		
		}

	}
}
