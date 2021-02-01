<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL : format</title>
</head>
<body>
	<h1>데이터 포맷 지정</h1>
	<h1>숫자 포맷 지정 태그 - formatNumber</h1>
<%--
	minIntegerDigits : 정수부 최소 표시 자리수 지정(없으면 0 표시)
	minFractionDigits : 소수부(소수점 이하 ) 최소 표시 자리수 지정(없으면 0 표시)
	maxIntegerDigits : 정수부 최대 표시 자리수 지정(많으면 버려짐)
	maxFractionDigits : 소수부(소수점 이하 ) 최대 표시 자리수 지정(넘치면 버려짐 6부터 올림처림 6아래는 버림)
--%>
	<fmt:formatNumber value="123" type="number" /><br>
	<fmt:formatNumber value="123" type="number" 
			minIntegerDigits="10"/><br> <%-- 최소 자릿수 표시 --%>
	<fmt:formatNumber value="123.4" type="number" 
			minFractionDigits="2"/><br>
	<fmt:formatNumber value="123" type="number" 
			minIntegerDigits="2"/><br>
			
	<fmt:formatNumber value="123" type="number" 
			maxIntegerDigits="2"/><br>
			
	123.4567 : <fmt:formatNumber value="123.4567" type="number"
			maxFractionDigits="2"/><br> <%-- 반올림 처리됨 --%>
	123.455 : <fmt:formatNumber value="123.455" type="number"
			maxFractionDigits="2"/><br>
	123.454 : <fmt:formatNumber value="123.454" type="number"
			maxFractionDigits="2"/><br>
	<h2>formatNumber : pattern 적용</h2>
	pattern=".000" : <fmt:formatNumber value="123456.78" pattern=".000"/><br>
	pattern=".###" : <fmt:formatNumber value="123456.78" pattern=".###"/><br>
	<fmt:formatNumber value="123456.7889" pattern=".000"/><br>
	<fmt:formatNumber value="123456.7889" pattern=".###"/><br>
	
	123456.7886 : <fmt:formatNumber value="123456.7886" pattern=".###"/><br>
	123456.7885 : <fmt:formatNumber value="123456.7885" pattern=".###"/><br>
	123456.7884 : <fmt:formatNumber value="123456.7884" pattern=".###"/><br>
	<p>소수점 이하 3자리만 표시할 경우 4번쨰 자리 숫자는 4초과 부터 올림 5이하 버림</p>
	<hr><hr>
	
	<h2>정수부 패턴 적용(#,###.## / 0,000.00)</h2>
	<fmt:formatNumber value="91123456.678" pattern="#,###.##" /><br>
	<fmt:formatNumber value="91123456.678" pattern="0,000.00" /><br>
	
	<fmt:formatNumber value="1.687" pattern="#,###.##" /><br>
	<fmt:formatNumber value="1.687" pattern="0,000.00" /><br>
	
	<fmt:formatNumber value="1" pattern="#,###.##" /><br>
	<fmt:formatNumber value="1" pattern="0,000.00" /><br>
	
	<fmt:formatNumber value="0" pattern="#,###.##" /><br>
	<fmt:formatNumber value="0" pattern="0,000.00" /><br>
	<hr><hr>
	
	<%-- =======날짜 출력======== --%>
	<h2>formatDate : 날짜 출력</h2>
	<% Date now = new Date(); %>
	표현식 : <%=now %>
	
	<%pageContext.setAttribute("now", now); %>
	<p>날짜 (now) : ${now }</p>
	
	<h3>formatDate 사용(날짜, 시간 표시 - pattern)</h3>
	<fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/><br>
	<fmt:formatDate value="${now }" pattern="yyyy-MM-dd HH:mm:ss"/><br>
	<fmt:formatDate value="${now }" pattern="yyyy/MM/dd HH:mm:ss"/><br>
	<fmt:formatDate value="${now }" pattern="yyyy.MM.dd HH:mm:ss"/><br>
	
	<hr>
	
	<h3>formatDate 사용(날짜 표시)</h3>
	dateStyle 설정안함  : <fmt:formatDate value="${now }"/><br>
	dateStyle="short" : <fmt:formatDate value="${now }" dateStyle="short"/><br>
	dateStyle="medium" : <fmt:formatDate value="${now }" dateStyle="medium"/><br>
	dateStyle="long" : <fmt:formatDate value="${now }" dateStyle="long"/><br>
	dateStyle="full" : <fmt:formatDate value="${now }" dateStyle="full"/><br>
	<hr>
	
	<h3>formatDate 사용(날짜, 시간표시)</h3>
	<h3>formatDate 사용(시간표시)</h3>
	timeStyle 설정안함  : <fmt:formatDate type="time" value="${now }"/><br>
	timeStyle="short" : <fmt:formatDate type="time" value="${now }" timeStyle="short"/><br>
	timeStyle="medium" : <fmt:formatDate type="time" value="${now }" timeStyle="medium"/><br>
	timeStyle="long" : <fmt:formatDate type="time" value="${now }" timeStyle="long"/><br>
	timeStyle="full" : <fmt:formatDate type="time" value="${now }" timeStyle="full"/><br>
	<hr>

	<h3>formatDate 사용(날짜, 시간표시)</h3>
	timeStyle 설정안함  : <fmt:formatDate type="both" value="${now }"/><br>
	timeStyle="short" : <fmt:formatDate type="both" value="${now }" timeStyle="short"/><br>
	timeStyle="medium" : <fmt:formatDate type="both" value="${now }" timeStyle="medium"/><br>
	timeStyle="long" : <fmt:formatDate type="both" value="${now }" timeStyle="long"/><br>
	timeStyle="full" : <fmt:formatDate type="both" value="${now }" timeStyle="full"/><br>
	<hr>
	
	<h3>formatDate 사용(날짜, 시간표시)</h3>
	timeStyle 설정안함  : <fmt:formatDate type="both" value="${now }"/><br>
	timeStyle="short" : <fmt:formatDate type="both" value="${now }" timeStyle="short" dateStyle="short"/><br>
	timeStyle="medium" : <fmt:formatDate type="both" value="${now }" timeStyle="medium" dateStyle="medium"/><br>
	timeStyle="long" : <fmt:formatDate type="both" value="${now }" timeStyle="long" dateStyle="long"/><br>
	timeStyle="full" : <fmt:formatDate type="both" value="${now }" timeStyle="full" dateStyle="full"/><br>
	<hr>
	
</body>
</html>