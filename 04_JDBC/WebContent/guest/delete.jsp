<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--(실습) 전달받은 파라미터 값 사용 DB데이터 삭제 처리 
	정상처리후 : list.jsp 로 이동
	예외발생시 : 현재페이지(예외메시지) 보여주기
		(링크추가 : 상세보기, 목록보기)
--%>
<%
	//전달받은 파라미터 값 확인(추출)
	int sabun = Integer.parseInt(request.getParameter("idx"));

	//DB데이터 삭제 처리
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	Connection conn = null;
	PreparedStatement pstmt = null;

	int result = 0;

	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		String sql = "DELETE FROM GUEST WHERE SABUN = ?";
		pstmt = conn.prepareStatement(sql);

		//4. SQL문 실행
		//4-1. 실행시 파라미터 전달
		pstmt.setInt(1, sabun);

		result = pstmt.executeUpdate();
	} catch (Exception e) {
		result = -999;
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
		}
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
		}
	}
	if (result == 0) { //SQL 정상실행 + 데이터 삭제안됨
%>
<script>
	alert("[삭제실패] 대상이 없어서 삭제하지 못했습니다." + "\n목록페이지로 이동합니다");
	location.href = "list.jsp";
</script>
<%
	return;
	} else if (result > 0) {//SQL 정상실행 + 데이터 삭제됨
%>
<script>
	alert("[삭제완료] 삭제처리 완료하고 목록페이지로 이동합니다");
	location.href = "list.jsp";
</script>
<%
	return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 실패</title>
</head>
<body>
	<h1>사원 정보 삭제 실패</h1>
	<p>삭제 작업중 예외가 발생했습니다. <br>
	담당자(8282)에게 연락하세요</p>
	<a href="detail.jsp?idx=<%= sabun%>">상세페이지로 이동</a>
	<a href="list.jsp">전체목록보기</a>
</body>
</html>