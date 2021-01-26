<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 한글처리 설정
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>첫 페이지</title>
</head>
<body>
	<h1>첫번쨰 페이지 #1</h1>
	전달받은 파라미터 값 <br>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %> </h2>
	
	<%--================================--%>
	<h2>파라미터 전달 forward (액션태그)</h2>
	<jsp:forward page="ex02_second.jsp">
		<jsp:param name="name" value='<%=name + "-forward" %>' />
		<jsp:param name="age" value='<%=age + "-forward" %>' />
	</jsp:forward>
	<%-- <jsp:forward page="ex02_second.jsp"/> --%>
	
</body>
</html>