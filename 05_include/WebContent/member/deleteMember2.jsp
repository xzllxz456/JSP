<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습)전달받은 파라미터 값(id)을 사용해서 DB데이터 삭제하고 화면이동 
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
--%>
<%
	//1. 전달받은 데이터(파라미터) 추출
	String id = request.getParameter("id");
	
	//2. DB에 입력처리
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;	
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		String sql = "DELETE FROM MEMBER WHERE ID = ?";
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		//4. SQL 실행
		pstmt.executeUpdate();	
		
		//정상입력 처리된 경우
		response.sendRedirect("selectAll.jsp");
	} catch (Exception e) {
		//e.printStackTrace();
		//try 구문 실행중 예외발생
		response.sendRedirect("error.jsp");
	} finally {
		try {
			if (pstmt != null) pstmt.close();
		} catch(SQLException e) {}	
		try {
			if (conn != null) conn.close();
		} catch(SQLException e) {}	
		
	}		
%>