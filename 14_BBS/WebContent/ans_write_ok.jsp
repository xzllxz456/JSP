<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.CommVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	CommVO cvo = new CommVO();
	cvo.setWriter(request.getParameter("writer"));
	cvo.setContent(request.getParameter("content"));
	cvo.setPwd(request.getParameter("pwd"));
	cvo.setIp(request.getRemoteAddr());
	cvo.setB_idx(request.getParameter("b_idx"));
	System.out.println("cvocvocvo:" + cvo);
	String cPage = (String)session.getAttribute("cPage");
	DAO.insertComment(cvo);
	response.sendRedirect("view.jsp?b_idx=" + cvo.getB_idx() + "&cPage=" + cPage);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
</body>
</html>