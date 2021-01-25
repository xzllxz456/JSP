<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB연결하고 GUEST 테이블에서 새로운 사번 만들어 사번항목에 설정  --%>
<%
	//JDBC 프로그램 사용해서 사번 구하기(사번: 가장큰 사원번호 + 1111 자동생성)
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT NVL(MAX(SABUN),0) + 1111 AS SABUN FROM GUEST";
	int sabun = 0;
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		//4. SQL 실행
		rs = pstmt.executeQuery();
		if (rs.next()) {
			sabun = rs.getInt("SABUN"); // 컬럼 명칭 사용
			// sabun = rs.getInt("1"); // 컬럼 인덱스 번호 사용
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		//6. 사용자원 반납(close)
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력</title>
</head>
<body>
	<h1>사원등록</h1>
	<form action="insert.jsp" method="get">
		<table>
			<tr>
				<th>사번</th>
<!--  				<td><input type="text" name="sabun" value="<%=sabun %>" disabled="disabled"></td>-->
				<td><input type="text" name="sabun" value="<%=sabun %>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="number" name="pay"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="사원등록">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>










