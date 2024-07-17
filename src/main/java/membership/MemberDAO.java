package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {

	public MemberDAO(ServletContext application) {
		super(application);
	}

	// 회원가입
	public boolean registerMember(MemberDTO dto) {
		boolean isSuccess = false;
		String query = "INSERT INTO member (id, pass, name, email, phone_number) "
				+ " VALUES (?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getPhone());
			
			
			int count = psmt.executeUpdate();

			if (count > 0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public boolean checkLogin(String id, String pass) {
		String query = "SELECT * FROM member WHERE id = ? AND pass = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public String getUserName(String id) {
		String query = "SELECT * FROM member WHERE id = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				return rs.getString("name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public MemberDTO getUserInfo(String id) {
		MemberDTO dto = new MemberDTO();
		
		String query = "SELECT * FROM member WHERE id = ?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			
			if (rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setPhone(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 회원 아이디로 회원 정보 조회 
	public MemberDTO getMemberById(String memberId) {
		MemberDTO member = null;
		String query = "SELECT * FROM member WHERE id = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				String id = rs.getString("id");
				String pass = rs.getString("pass");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone = rs.getString("phone_number");
				
				member = new MemberDTO(id, pass, name, email, phone);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	// 아이디 중복 검사
	public boolean checkDuplicateId(String id) {
		String query = "SELECT count(*) as count FROM member WHERE id = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				int count = rs.getInt("count");
				return count > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	
	// 회원 정보 수정 후 업데이트
	public boolean updateMember(MemberDTO member) {
		boolean isSuccess = false;
		String query = "UPDATE member SET pass = ?, eamil = ?, phone_number = ? WHERE id = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, member.getPass());
			psmt.setString(2, member.getEmail());
			psmt.setString(3, member.getPhone());
			psmt.setString(4, member.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}
