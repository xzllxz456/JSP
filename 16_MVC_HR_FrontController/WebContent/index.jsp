<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<script>
	function all_search(frm) {
		//frm.action = "list.jsp"; // 예전 jsp 직접 호출 방식
		//frm.action = "list"; //list 요청
		frm.action = "controller?type=all";
		frm.submit();
	}
	
	function dept_search(frm) {
		//frm.action = "dept.jsp";
		frm.action = "controller?type=dept";
		frm.submit();
	}
	
	function fullname_search(frm) {
		frm.action = "controller?type=fullname";
		frm.submit();
	}
	
	function search_go(frm) {
		frm.action = "controller?type=search";
		frm.submit();
	}
</script>
</head>
<body>
	<h1>작업선택</h1>
	<form method="post">
		<input type="button" value="전체보기" onclick="all_search(this.form)">
		<input type="button" value="부서코드검색" onclick="dept_search(this.form)">
		<input type="button" value="성명검색(성,이름포함)" onclick="fullname_search(this.form)">
		<input type="button" value="동적검색" onclick="search_go(this.form)">
	</form>
	
	
	
	
</body>
</html>