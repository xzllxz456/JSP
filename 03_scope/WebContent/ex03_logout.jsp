<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    session.invalidate();
    response.sendRedirect("ex03_login.jsp");
    
    
    %>
<%--
	[로그아웃] 세션 초기화(무효화) 후 로그인 화면 이동
 --%>
