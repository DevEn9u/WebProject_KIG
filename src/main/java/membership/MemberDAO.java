package membership;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {

	public MemberDAO(ServletContext application) {
		super(application);
	}

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
			System.out.print(count);
			if (count > 0) {
				isSuccess = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}
