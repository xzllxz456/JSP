<%@page import="com.mystudy.mybatis.MemberVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 1. 전달받은 파라미터 값 추출
	String id = request.getParameter("id");
	// 2. DB연동 작업을 위한 SqlSession 객체 생성해서 DB 연동 작업
	SqlSession ss = DBService.getFactory().openSession();
	MemberVO  vo = ss.selectOne("member.selectOne", id);
	ss.close();
	// 3. 조회(검색)된 데이터 화면 출력
	System.out.println(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID검색결과</title>
<script src="includee/event.js" type="text/javascript"></script>

</head>
<body>
	<%@ include file="includee/menu.jspf"%>
	<hr>
	<h1>ID 검색 결과</h1>
	<%
		if(vo != null) { %>
		<ul>
			<li>
			<%=vo.getIdx() %> :: 
			<%=vo.getId() %> :: 
			<%=vo.getPwd() %> :: 
			<%=vo.getName() %> :: 
			<%=vo.getAge() %> :: 
			<%=vo.getAddress() %> :: 
			</li>
		</ul>			
<% 			
		} else {
			out.print("<h2>검색된 데이터가 없습니다!!!</h2>");
		}
%>

</body>
</html>
