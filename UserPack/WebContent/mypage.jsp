<%@page import="com.example.demo.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member user = (Member) request.getSession().getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Page</title>
</head>
<body>
	<h2>접속한 유저 아이디 : <%=user.getId()%> 님 환영합니다 </h2>
	<!-- 유저 리스트, 로그아웃 -->
	<form action="">
		<button type="button" id="user-list">user list</button><br>
		<button type="button" id="logout">Logout</button><br>
	</form>
	<script>
		document.querySelector("#user-list").addEventListener("click", function() {
			location.href = "user-list.jsp"
		});
		document.querySelector("#logout").addEventListener("click", function() {
			alert("logout");
			this.form.action = "loginController";
			this.form.method = 'get';
			this.form.submit();
		});
	</script>
</body>
</html>