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

@WebServlet("/register.do")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/register.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		

		// 아이디 유효성 검사
		if (!isValidId(id)) {
			JSFunction.alertBack(resp, "아이디는 6~12자 이내이고 특수문자를 제외해야 합니다.");
			return;
		}
		// 비밀번호 유효성 검사
		if (!isValidPass(pass)) {
			JSFunction.alertBack(resp, "비밀번호는 숫자와 영문자 조합으로 8자 이상이어야 합니다.");
			return;
		}
		MemberDTO memberDTO = new MemberDTO();

		memberDTO.setId(id);
		memberDTO.setPass(pass);
		memberDTO.setName(name);
		memberDTO.setEmail(email);
		memberDTO.setPhone(phone);			
		
//		try {
//			phone = formatPhoneNumberForDB(phone);
//			memberDTO.setPhone(phone);
//		} catch (Exception e) {
//			JSFunction.alertBack(resp, e.getMessage());
//			return;
//		}
		

		
		// DAO를 통해 DB에 회원 정보를 저장
		MemberDAO dao = new MemberDAO(getServletContext());
		boolean isSuccess = dao.registerMember(memberDTO);
		
		if (isSuccess) {
			// 가입 성공시 성공 알림 띄워줌
			JSFunction.alertLocation(resp, "가입에 성공하였습니다.", "./login.jsp");
		}
		else {
			// 가입 실패시 실패 알림 띄워줌
			JSFunction.alertLocation(resp, "가입에 실패하였습니다.", "./register.do");
		}
	}
	
	// 아이디 유효성 검사 메서드
	private boolean isValidId(String id) {
		/* regex는 Regular Expression(정규평가식 이하 정규식)을 나타낸 변수로 자바에서는 정규식으로
		 문자열에서 규칙검사시 사용된다. */
		// 아이디는 6~12자 이내이고 특수문자를 제외한 영대소문자, 숫자로 표현한다.
		String regex = "^[a-zA-Z0-9]{6,12}$";
		// Pattern 클래스는 주어진 정규식을 compile하여 패턴 객체로 만들어준다.
		Pattern pattern = Pattern.compile(regex);
		/* Matcher 클래스는 패턴 객체에 대해 matcher() 메서드를 호출하여 Matcher 객체를 생성하고,
		이를 통해 문자열에서 일치하는 부분을 찾아낼 수 있다. */
		Matcher matcher = pattern.matcher(id);
		return matcher.matches();
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

	// 핸드폰 번호 형식 변환 메서드
//	private String formatPhoneNumberForDB(String phoneNumber) {
//	    // 입력 형식 체크 (00000000000)
//	    if (!phoneNumber.matches("\\d{11}")) {
//	        throw new IllegalArgumentException("핸드폰 번호는 11자리 숫자여야 합니다.");
//	    }
//
//	    // DB에 저장할 형식으로 변환 (000-0000-0000)
//	    return phoneNumber.substring(0, 3) + "-" + phoneNumber.substring(3, 7) + "-" + phoneNumber.substring(7);
//	}
	
}

