<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL VO</title>
</head>
<body>
	<h1>JSTL Bean(VO객체) 다루기</h1>
	<h2>객체에 값 설정(VO 객체)</h2>
	<jsp:useBean id="person" class="com.bc.vo.PersonVO" scope="page"/>
	<c:set target="${person }" property="name" value="홍길동" ></c:set>
	<c:set target="${person }" property="age" value="28"></c:set>
<%
	System.out.println("local person : " + person);
	System.out.println("page person : " + pageContext.getAttribute("person"));
%>
	<p>person : ${person }</p>
	<p>person : <c:out value="${pageScope.person }" /></p>
	<hr>
	
	<p>person.name : ${person.name }</p>
	<p>person.getName() : ${person.getName() }</p>
	<p>person.name : <c:out value="${person.name }" default="이름없음" /></p> <%-- 이름없으면 : 이름없음표시 --%>
	<p>person.name : <c:out value="${person.name }" default="이름없음" /></p> <%-- 이름없으면 : 이름없음표시 --%>
	
	<p>person.age : ${person.age }</p>
	<p>person.getAge() : ${person.getAge() }</p>
	
	<p>person.gender : 
		<c:out value="${person.gender }" default="설정값 없음" />
	</p>
	<hr>
	<p>person.toString() : ${person.toString() }</p>
</body>
</html>