package com.example.demo.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.demo.domain.Member;

public class JdbcMemberRepository implements MemberRepository {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER_ID = "mystudy";
	private final String USER_PW = "mystudypw";
	
	private void connect() throws SQLException{
		conn = DriverManager.getConnection(URL, USER_ID, USER_PW);
	}
	
	
	public JdbcMemberRepository() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("로딩 성공");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void close() {
		//rs
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//pstmt
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//conn
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void addMember(Member member) {
		try {
			connect();
			
			String sql = "insert into MEMBER " + 
						" VALUES(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			
			pstmt.execute();
		} catch (SQLException e) {
			
		} finally {
			close();
		}
		
	}

	@Override
	public Member findByMember(Member member) throws Exception {
		try {
			connect();
			
			String sql = "select id from MEMBER " + 
							" where id = ? and password = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return member;
			} else {
				throw new Exception("아이디/패스워드 확인해주세요");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}

	@Override
	public List<String> findIdAll() {
		List<String> list = new ArrayList<>();
		try {
			connect();
			
			String sql = "select id from MEMBER";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String id = rs.getString("id");
				list.add(id);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
}
