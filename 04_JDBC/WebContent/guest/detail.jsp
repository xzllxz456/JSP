<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 사번으로 DB데이터 조회해서 가져온 데이터 화면 표시 --%>
<%
	//1. 파라미터 값 추출
	String idx = request.getParameter("idx");

	//2. DB데이터 조회(idx : 사번)
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	int sabun = 0;
	String name = "";
	Date nalja = null;
	int pay = 0;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		String sql = ""
				+ "SELECT SABUN, NAME, NALJA, PAY "
				+ "  FROM GUEST "
				+ " WHERE SABUN = ?";
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(idx));
		
		//4. SQL 실행
		rs = pstmt.executeQuery();
		if (rs.next()) {
			sabun = rs.getInt("SABUN");
			name = rs.getString("NAME");
			nalja = rs.getDate("NALJA");
			pay = rs.getInt("PAY");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		//6. 사용자원 반납(close)
		try {
			if (rs != null) rs.close();
		} catch(SQLException e) {}	
		try {
			if (pstmt != null) pstmt.close();
		} catch(SQLException e) {}	
		try {
			if (conn != null) conn.close();
		} catch(SQLException e) {}	
		
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
	<h1>[<%=name %>]상세정보</h1>
	<table border>
		<tr>
			<th>사번</th>
			<td><%=sabun %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=nalja %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=pay %></td>
		</tr>
	</table>
	<%-- URLEncoder.encode 한글처리 --%>
	<a href="editForm.jsp?idx=<%=sabun %>&name=<%=URLEncoder.encode(name, "UTF-8")%>&pay=<%=pay %>">수정</a>
	<a href="delete.jsp?idx=<%=sabun %>">삭제</a>
</body>
</html>









