<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 수정할 데이터를 화면에 표시 --%>
<%
	request.setCharacterEncoding("UTF-8");
	//수정할 데이터 확인
	System.out.println("session guestbookVO : "
			+ session.getAttribute("guestbookVO"));

	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<script>
	function save_go(frm) {
		//비빌번호 확인 후 수정요청 처리
		var pwd1 = frm.pwd.value; //새로 입력 암호(확인용)
		<%-- var pwd2 = "<%=vo.getPwd() %>"; 소스보기로 노출이 되어 안쓴다--%> 
		var pwd2 = <%=vo.getPwd() %>;
		if (pwd1 != pwd2) {
			alert("암호가 일치하지 않습니다. 암호를 확인하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		//암호가 일치하면 DB수정 요청
		frm.action = "update_ok.jsp";
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h2>방명록 : 수정화면</h2>
	<hr>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	
	<form method="post">
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="<%=vo.getSubject() %>"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="<%=vo.getEmail() %>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60"><%=vo.getContent() %></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="save_go(this.form)">
					<input type="reset" value="다시작성">
					<input type="hidden" name="idx" value="<%=vo.getIdx() %>">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>

</div>
	
</body>
</html>









