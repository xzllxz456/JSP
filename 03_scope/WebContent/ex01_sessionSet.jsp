<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//request : 파라미터 값 확인
    	String name = request.getParameter("name");
    	String age = request.getParameter("age");
    	System.out.println(">>param name : " + name + " , age : " + age);
    	
    	//세션스코프(session)에 저장
    	session.setAttribute("attr_name", name);
    	session.setAttribute("attr_age", age);
    	//session scope에 저장된 값 조회(읽기, 확인, 검색)
    	String attr_name = (String) session.getAttribute("attr_name");
    	String attr_age = (String) session.getAttribute("attr_age");
    	
    	//-----------------------------------------------
    	//request scope 에 저장
    	request.setAttribute("req_name", name);
    	request.setAttribute("req_age", age);
    	String req_name = (String) request.getAttribute("req_name");
    	String req_age = (String) request.getAttribute("req_age");
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>세션값설정</title>
</head>
<body>
	<h1>세션값설정 [  ex01_sessionSet.jsp  ]</h1>
	<h2>이름(param)<%=name %></h2>
	<h2>나이(param)<%=age %></h2>
	
	<hr>
	<h2>이름 (session attr_name)<%=attr_name %></h2>
	<h2>나이 (session attr_age)<%=(String) session.getAttribute("attr_age") %></h2>
	<hr>
	
	<h2>이름 (request req_name): <%=req_name %></h2>
	<h2>나이 (request req_age): <%=req_age %></h2>
	
	<%
		//리다이렉트 처리(재요청)
		response.sendRedirect("ex01_session.jsp");
	%>
</body>
</html>