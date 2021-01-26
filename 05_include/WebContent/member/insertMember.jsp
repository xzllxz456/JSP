<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 DB에 입력하고 화면이동하고
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
 --%>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = 0;
	try{
		age = Integer.parseInt(request.getParameter("age"));
		if(age == 0){
			throw new Exception("0살은 좀...");
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("error.jsp");
		return;
	}
	String add = request.getParameter("address");
	

	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	try {
		Class.forName(DRIVER);
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		String sql = ""
				+ "INSERT INTO MEMBER2 "
		+ " VALUES (MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, add);
		
		result = pstmt.executeUpdate();
		
	} catch (Exception e){
		response.sendRedirect("error.jsp");
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
		} catch(SQLException e) {}
		try {
			if (conn != null) conn.close();
		} catch(SQLException e) {}
		
	}
	if(result > 0) {
		response.sendRedirect("selectAll.jsp");
	}
	
	
%>