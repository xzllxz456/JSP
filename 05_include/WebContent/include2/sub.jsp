<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서브 페이지</title>
</head>
<body>
	<h1>서브페이지(sub)</h1>
	<h2>서브페이지 내용</h2>
	<a href="main.jsp">메인페이지로 이동</a>
	<p>sub........................</p>
	<p>sub........................</p>
	<p>sub........................</p>
	<p>sub........................</p>
	<p>sub........................</p>
	
	
	<%@ include file="01_declatation.jspf" %>
	<%@ include file="02_scriptlet.jspf" %>
	<%@ include file="footer.jspf" %>

	
</body>
</html>