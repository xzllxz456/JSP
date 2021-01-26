<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습)전달받은 파라미터 값을 DB에 입력하고 화면이동 
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
--%>
<%
	//1. 전달받은 데이터(파라미터) 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String address = request.getParameter("address");
	
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
		
		String sql = ""
			+ "INSERT INTO MEMBER "
		    + "       (IDX, ID, PWD, NAME, AGE, ADDRESS, REG) "
		    + "VALUES (MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, address);
		
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







