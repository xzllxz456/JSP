<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>useBeanDisp</title>
</head>
<body>
	<jsp:useBean id="member" class="com.mystudy.MemberVO" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="member"/>
	<h2>이름 : <%=member.getName() %></h2>
	<h2>나이 : <%=member.getAge() %></h2>
	<h2>암호 : <%=member.getPwd() %></h2>
	<h2>성별 : <%=member.getGender() %></h2>
	<h2>취미 : 
	<%
	for(String hob : member.getHobby()){
	%>
		<%=hob + ", "%>	
	<% 		
	}
	%>
	</h2>
	
	
</body>
</html>