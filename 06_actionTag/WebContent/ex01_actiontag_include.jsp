<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그-include</title>
</head>
<body>
<%-- 
	JSP액션태그 : JSP 페이지 흐름제어 
	사용형태 : <jsp:액션명령></jsp:액션명령>
			<jsp:액션명령/>
--%>

	<h1>디렉티브/액션태그 - include</h1>
	<h2>디렉티브(지시어) - include : 복사 & 붙여넣기 형태 처리</h2>
	<h3>--------ex01_includee.jsp-------</h3>
	<%@ include file="ex01_includee.jsp" %>
	<h3>--------ex01_includee2.jspf-------</h3>
	<%@ include file="ex01_includee2.jspf" %>
	<%-- ===================================== --%>
	<hr><hr>
	<h1>액션태그 (include : 실행결과가 삽입됨) - jsp : include</h1>
	<h3>-------ex01_includee.js----------</h3>
	<jsp:include page="ex01_includee.jsp"></jsp:include>
	
	<%-- include 액션태그는 jspf 를사용하지 않는다  이유는 jspf 내용 전부를 가져온다 --%>
	<h3>--------ex01_includee2.jspf-------</h3>
	<jsp:include page="ex01_includee2.jspf" />	
	<%-- <jsp:include page="ex01_includee2.jspf"> </jsp:include>	 --%>
	<hr>
	
	<h2>액션태그 - jsp:include(파라미터 전달)</h2>
	<jsp:include page="ex01_includee3_param.jsp">
		<jsp:param name="name" value="hoㅎㅎng" />
		<jsp:param name="age" value="27" />
	</jsp:include>
	
</body>
</html>