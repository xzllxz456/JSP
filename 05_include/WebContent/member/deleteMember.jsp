<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값(id)을 사용해서 DB데이터 삭제하고 화면이동
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
 --%>

<%
	String id = request.getParameter("id");

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
		
		String sql = "DELETE FROM MEMBER2 WHERE ID = ?";
		pstmt = conn.prepareStatement(sql);

		//4. SQL문 실행
		//4-1. 실행시 파라미터 전달
		pstmt.setString(1, id);
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
	if (result == 0) { 
		%>
		
		<script>
		alert("[삭제실패] 대상이 없어서 삭제하지 못했습니다." + "\n목록페이지로 이동합니다");
		location.href = "error.jsp";
		</script>
		
<%		
	} else if(result > 0){
		response.sendRedirect("selectAll.jsp");
	}
%>
