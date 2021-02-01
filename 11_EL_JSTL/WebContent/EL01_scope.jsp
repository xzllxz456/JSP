<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(Expression Languge)</title>
</head>
<body>
<%-- EL(Expression Languge) : 표현 언어
	1. 표현식을 대신해서 사용 : ${ }
		<%=출력값 %> -------> ${변수}, ${계산식}, ...
	2. 변수값 표시할 경우 반드시 scope 안에 변수(속성)가 존재해야 함
		scope 객체 : pageContext, request, session, application
		해당 scope 상에 setAttribute 설정된 변수(속성) 값만 사용 가능
	3. 같은 이름(속성명)이 다른 scope 상에 존재하는 경우 접근 우선순위 적용됨
		pageContext -> request -> session -> application
		(scope 명칭 page -> request -> session -> application)
--%>
	<h2>표현식(Expression) 산술연산 사용 예</h2>
	<ul>
		<li>15 + 7 = <%=15 + 7 %></li>
		<li>15 - 7 = <%=15 - 7 %></li>
		<li>15 * 7 = <%=15 * 7 %></li>
		<li>15 / 7 = <%=15 / 7 %></li>
		<li>15 % 7 = <%=15 % 7 %></li>
	</ul>
	<h2>EL(Expression Languge) 산술연산 사용 예</h2>
	<ul>
		<li>15 + 7 = ${15 + 7 }</li>
		<li>15 - 7 = ${15 - 7 }</li>
		<li>15 * 7 = ${15 * 7 }</li>
		<li>15 / 7 = ${15 / 7 }</li><%-- 결과값 : double --%>
		<li>15 % 7 = ${15 % 7 }</li>
	</ul>
	<hr><hr>
	
	<h2>선언부, 스크립트릿 변수 사용시</h2>
	<p>표현식은 가능하지만, EL에서는 사용 못함</p>
	<%! int globalNum = 15 + 7; %>
	<% int localNum = 15 + 7; %>
	<ul>
		<li>표현식(선언부 변수) globalNum : 15 + 7 = <%= globalNum %></li>
		<li>표현식(스크립트릿 변수) localNum : 15 + 7 = <%= localNum %></li>
	</ul>
	<ol><%-- 스코프 상의 데이터만 출력가능 --%>
		<li>EL(선언부 변수) globalNum : 15 + 7 = ${globalNum}</li><%-- 사용 못함 --%>
		<li>EL(스크립트릿 변수) localNum : 15 + 7 = ${localNum}</li><%-- 사용 못함 --%>
	</ol>

	
	<hr><hr>
	
	<h2>EL에서 사용하려면 스코프(scope)에 속성 정의 후에 사용</h2>
	<% pageContext.setAttribute("attr_globalNum", globalNum); %>
	<ol>
		<li>EL(속성) attr_globalNum : 15 + 7 = ${attr_globalNum}</li>
	</ol>
	<%--================================================ --%>	
	<h2>동일한 이름의 속성명이 여러 scope 상에 존재 할 때</h2>
	<%
	pageContext.setAttribute("pc", "팬티엄 - pageScope");
	request.setAttribute("pc", "i3 - requestScope");
	session.setAttribute("pc", "i5 - sessionScope");
	application.setAttribute("pc", "i7 - applicationScope");
	%>

	<h2>scope 지정 없이 데이터 사용</h2>	
	<h3>(pageContext -> request -> session -> application)</h3>
	<ul>
		<li>scope 지정 없이 출력 pc : ${pc} }</li>
	</ul>
	
	<h2>scope 명시적 지정 사용 : 해당 영역에서만 찾아서 사용</h2>
	<ol>
		<li>pageScope 지정 : ${pageScope.pc} </li>
		<li>requestScope 지정 : ${requestScope["pc"]} </li>
		<li>sessionScope 지정 : ${sessionScope.pc} </li>
		<li>applicationScope 지정 : ${applicationScope.pc} </li>
	</ol>
</body>
</html>








