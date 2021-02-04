<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>삭제(암호확인)</title>

</head>
<body>
	
	<form action="delete_ok.jsp" method="post">
		비밀번호 : <input type="password" name="pwd">
		<input type="button" value="삭제" onclick="del_go(this.form)">		
	</form>
<script>
	function del_go(frm) {
		if(frm.pwd.value == "${bvo.pwd}") { // 암호 일치 처리
			var isDelete = confirm("정말 삭제할꺼얌?");
			if(isDelete){
				frm.submit();
			} else {
				history.back();
			}		
		}else {
			alert("비밀번호가 일치하지 않습니다 .확인하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
		}
	}
</script>
</body>
</html>