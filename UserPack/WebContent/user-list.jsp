<%@page import="java.util.List"%>
<%@page import="com.example.demo.repository.MemberRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberRepository repository = (MemberRepository)application.getAttribute("repository");    
	List<String> idlist = repository.findIdAll();
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User List</title>
</head>
<body>
	<h2>User List</h2>
	<ul>
<%
	for(String id : idlist){
		out.print("<li>" + id + "</li>");	
	}
%>
	</ul>
</body>
</html>