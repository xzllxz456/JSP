<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 파라미터를 사용해서 DB 데이터 수정 처리
	수정할데이터 : 성명, 날짜(sysdate), 금액
	정상처리후 : list.jsp 로 이동
	예외발생시 : 현재페이지(오류메시지) 보여주기
		- 상세보기, 목록보기 링크 제공
--%>
<%
	//post 요청 데이터에 대한 한글처리를 위한 설정
	request.setCharacterEncoding("UTF-8");
	//전달받은 파라미터 값 확인(추출)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = 0;
	try {
		pay = Integer.parseInt(request.getParameter("pay"));
	} catch (NumberFormatException e) {
%>
	<script>
		alert("금액에 숫자가 아닌 문자가 입력되었습니다.\n"
				+ "확인 후 다시 입력하세요");
		history.back(); //이전페이지로 이동
	</script>
<%		
		return; //서비스 메소드 실행종료
	}
	
	//DB데이터 수정 처리
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
		String sql = ""
				+ "UPDATE GUEST "
				+ "   SET NAME = ?, "
				+ "       NALJA = SYSDATE, "
				+ "       PAY = ? "
				+ " WHERE SABUN = ? ";
		pstmt = conn.prepareStatement(sql);
		
		//4. SQL문 실행
		//4-1. 실행시 파라미터 전달
		pstmt.setString(1, name);
		pstmt.setInt(2, pay);
		pstmt.setInt(3, sabun);
		
		result = pstmt.executeUpdate();
	} catch(Exception e) {
		result = -999;
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
		} catch(SQLException e) {}
		try {
			if (conn != null) conn.close();
		} catch(SQLException e) {}
	}	
	if (result == 0) { //SQL 정상실행 + 데이터 수정안됨(못찾아서)
%>		
	<script>
		alert("[수정실패] 대상이 없어서 수정하지 못했습니다."
				+ "\n목록페이지로 이동합니다");
		location.href="list.jsp";
	</script>
<%	
		return;
	} else if (result > 0) {//SQL 정상실행 + 데이터 수정됨
%>
	<script>
		alert("[수정완료] 수정처리 완료하고 목록페이지로 이동합니다");
		location.href="list.jsp";
	</script>
<%	
		return;
	}
%>
<%-- <%!final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	private int insert(int idx, String name, int pay) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			String sql = "" 
						+ "UPDATE GUEST SET "
						 +  " NAME = ?, PAY = ? "
						 + " WHERE SABUN = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, pay);
			pstmt.setInt(3, idx);
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			
		} finally {
			try {
				if (rs != null) rs.close();
			} catch(Exception e) {}	
			try {
				if (pstmt != null) pstmt.close();
			} catch(Exception e) {}	
			try {
				if (conn != null) conn.close();
			} catch(Exception e) {}	
		}

		return result;
	}%>

<%
	int idx = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = 0;
	int result = 0;
	try {
		pay = Integer.parseInt(request.getParameter("pay"));
		//2. 파라미터 값이 정상이면 DB입력처리
		result = insert(idx, name, pay);
	} catch (NumberFormatException e) {
		System.out.println(">> 급여항목에 잘못된 값이 입력되었습니다.");
	}
	if (result > 0) {
		response.sendRedirect("list.jsp");
	}
%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
</head>
<body>
	<h1>사원정보 수정 실패</h1>
	<p>수정작업중 예외가 발생했습니다.<br>
	담당자(8282)에게 연락하세요.</p>
	<a href="detail.jsp?idx=<%=sabun %>">상세페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>