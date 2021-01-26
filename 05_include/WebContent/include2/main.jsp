<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인 페이지</title>
</head>
<body>
	<h1>메인페이지(main)</h1>
	<h2>메인페이지 내용</h2>
	<a href="sub.jsp">서브페이지로 이동</a>
	<p>........................</p>
	<p>........................</p>
	<p>........................</p>
	<p>........................</p>
	<p>........................</p>
	
	<%-- 디렉티브(지시어, derective) include : copy & paste 적용 --%>
	<%-- 단순히 포한되어서 사용되어지는 파일은 확장자 jspf 사용 --%>
	<%@ include file="01_declatation.jspf" %>
	<%@ include file="02_scriptlet.jspf" %>
	
	
	<%@ include file="footer.jspf" %>
	

</body>
</html>