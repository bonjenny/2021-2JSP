package memberManagement;

import java.sql.*;
import java.util.*;

/**
 * File : managementBean.java
 * Desc : 항공권 예약 프로그램 DAO 클래스
 * @author 웹프로젝트실습 기말프로젝트 1조(전채린, 엄지희)
 */

public class ManagementBean {

	Connection conn = null;
	PreparedStatement pstmt = null;

	/*
	 * Oracle 연결정보 String jdbc_driver = "oracle.jdbc.driver.OracleDriver"; String
	 * jdbc_url = "jdbc:oracle:thin:@220.68.14.7:1521";
	 */

	/* MySQL 연결정보 */
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/tripdb?" + 
			   		  "useUnicode=true&characterEncoding=utf-8&" + 
			   		  "serverTimezone=UTC&useSSL=false";

	// DB 연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "admin");
		} catch (Exception e) { e.printStackTrace(); }
	}

	void disconnect() {
		if (pstmt != null) {
			try { pstmt.close(); }
			catch (SQLException e) { e.printStackTrace(); }
		}
		if (conn != null) {
			try { conn.close(); }
			catch (SQLException e) { e.printStackTrace(); }
		}
	}

	// 특정 회원 수정 메서드
	public boolean updateDB(ManagementBook managementbook) {
		connect();
		String sql = "update member set member_name=?, member_birth=?, "+
					 "member_tel=?, member_email=?, member_addr=?"+
					 "where member_id=?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managementbook.getMember_name());
			pstmt.setString(2, managementbook.getMember_birth());
			pstmt.setString(3, managementbook.getMember_tel());
			pstmt.setString(4, managementbook.getMember_email());
			pstmt.setString(5, managementbook.getMember_addr());
			pstmt.setString(6, managementbook.getMember_id());
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}

	// 특정 회원 삭제 메서드
	public boolean deleteDB(String member_id) {
		connect();
		String sql = "delete from member where member_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}

	// 신규 회원 추가 메서드
	public boolean insertDB(ManagementBook managementbook) {
		connect(); // 아래 SQL 중, member_id 는 자동 등록 되므로 입력하지 않는다.
		String sql = "insert into member(member_id, member_pwd, member_name, "+
					 "member_birth,member_tel,member_email,member_addr) "+
					 "values(?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managementbook.getMember_id());
			pstmt.setString(2, managementbook.getMember_pwd());
			pstmt.setString(3, managementbook.getMember_name());
			pstmt.setString(4, managementbook.getMember_birth());
			pstmt.setString(5, managementbook.getMember_tel());
			pstmt.setString(6, managementbook.getMember_email());
			pstmt.setString(7, managementbook.getMember_addr());
			pstmt.executeUpdate();
		}
		catch (SQLException e) { e.printStackTrace(); return false; }
		finally { disconnect(); } return true;
	}

	// 특정 회원 조회 메서드
	public ManagementBook getDB(String member_id) {
		connect();
		String sql = "select * from member where member_id=?";
		ManagementBook managementbook = new ManagementBook();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			ResultSet rs = pstmt.executeQuery();

			rs.next(); // 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			managementbook.setMember_id(rs.getString("member_id"));
			managementbook.setMember_pwd(rs.getString("member_pwd"));
			managementbook.setMember_name(rs.getString("member_name"));
			managementbook.setMember_birth(rs.getString("member_birth"));
			managementbook.setMember_tel(rs.getString("member_tel"));
			managementbook.setMember_email(rs.getString("member_email"));
			managementbook.setMember_addr(rs.getString("member_addr"));
			rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return managementbook;
	}

	// 전체 회원 조회 메서드
	public ArrayList<ManagementBook> getDBList() {
		connect();
		ArrayList<ManagementBook> datas = new ArrayList<ManagementBook>();
		String sql = "select * from member order by member_id;";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ManagementBook managementbook = new ManagementBook();
				managementbook.setMember_id(rs.getString("member_id"));
				managementbook.setMember_pwd(rs.getString("member_pwd"));
				managementbook.setMember_name(rs.getString("member_name"));
				managementbook.setMember_birth(rs.getString("member_birth"));
				managementbook.setMember_tel(rs.getString("member_tel"));
				managementbook.setMember_email(rs.getString("member_email"));
				managementbook.setMember_addr(rs.getString("member_addr"));
				datas.add(managementbook);
			} rs.close();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return datas;
	}
	
	// 로그인 체크 메서드
	public String loginCheck(String member_id, String member_pwd) {
		connect();
		String sql = "select * from member where member_id = ? and member_pwd = ?";
		String loginCon = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pwd);
			ResultSet rs = pstmt.executeQuery();
			rs.next(); loginCon = rs.getString("member_name");
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return loginCon;
	}
	
	// 회원가입 체크 메서드
	public boolean joinCheck(String member_id) {
		connect();
		String sql = "select member_id, member_pwd from member where member_id = ?";
		boolean joinCon = true;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			joinCon = rs.next();
		}
		catch (SQLException e) { e.printStackTrace(); }
		finally { disconnect(); } return joinCon;
	}
}
