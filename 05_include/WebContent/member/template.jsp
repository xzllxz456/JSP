<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>표준화면</title>
<script>
	function sel_all(frm) {
		frm.action = "selectAll.jsp";
		frm.submit();
	}
	function sel_one(frm) {
		frm.action = "selectOneID.jsp";
		frm.submit();
	}
	function add_go(frm) {
		// 아이디값 입력 여부 확인
		if(frm.id.value.trim() == "") {
			alert("아이디(ID)는 필수 항목 입니다. \n 입력하세요.")
			frm.id.value = "";
			frm.id.focus();	//커서 위치 시킴			
			return false;
		} 
		
		frm.action = "insertMember.jsp";
		frm.submit();
		
	}
	function del_go(frm) {
		// 아이디값 입력 여부 확인
		if(frm.id.value.trim() == "") {
			alert("아이디(ID)는 필수 항목 입니다. \n 입력하세요.")
			frm.id.value = "";
			frm.id.focus();	//커서 위치 시킴			
			return false;
		} 
		frm.action = "deleteMember.jsp";
		frm.submit();
	}
</script>
</head>
<body>
	<form>
		<table border="">
		<thead>
				<tr><th colspan="2">회원정보</th></tr>
		</thead>
		<tbody>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" value="0"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="전체검색" onclick="sel_all(this.form)">
					<input type="button" value="검색(ID)" onclick="sel_one(this.form)">
					<input type="button" value="입력" onclick="add_go(this.form)">
					<input type="button" value="삭제(ID)" onclick="del_go(this.form)">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</tfoot>
		</table>
	</form>
</body>
</html>