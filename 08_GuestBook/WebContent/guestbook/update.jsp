<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 수정할 데이터를 화면에 표시 --%>
<%
	// 수정할 데이터 확인 
	System.out.println("session guestbookVO : " 
			 + session.getAttribute("guestbookVO"));	
		
	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3><%=session.getAttribute("guestbookVO") %></h3>
</body>
</html>