<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이름검색결과</title>
</head>
<body>
	<h1>부서 직원 목록</h1>
	<h3>사번, 성명, 직종, 부서코드</h3>
	<ul>
	<c:forEach var="vo" items="${n_list }">
		<li>
			${vo.employee_id }, ${vo.first_name }, ${vo.last_name },
			${vo.job_id }, ${vo.department_id }
		</li>
	</c:forEach>
	</ul>
</body>
</html>