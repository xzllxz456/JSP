<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//1. 전달받은 파라미터 추출
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	//2. 총점, 평균 연산처리
	int tot = kor + eng + math;
	double avg = Math.round(tot * 100 / 3.0) / 100.0; 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리결과(JSP)</title>
<style>
	table { border-collapse: collapse; }
	th, td { width: 100px; border: 1px solid gray; padding: 10px}
	th { background-color: orange; }
</style>
</head>
<body>
	<h3>성적처리 결과(JSP - ex06_response.jsp)</h3>
	<table>
	<tbody>
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>국어</th>
			<td><%=kor %></td>
		</tr>
		<tr>
			<th>영어</th>
			<td><%=eng %></td>
		</tr>
		<tr>
			<th>수학</th>
			<td><%=math %></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<th>총점</th>
			<td><%=tot %></td>
		</tr>
		<tr>
			<th>평균</th>
			<td><%=avg %></td>
		</tr>
	<tfoot>
	</table>
</body>
</html>