<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 
	선택된 데이터 삭제 처리(파라미터 pwd 값과 session 데이터 사용)
	전달받은 파라미터 pwd와 session에 저장된 VO객체의 pwd 겂 비교
	  - 일치하면 : 삭제 후 목록페이지로 이동(삭제 메시지 표시)
	  - 불일이하면 : 이전 페이지로 이동(암호 불일치 메시지 표시)
 --%>    

<%
	 request.setCharacterEncoding("UTF-8");
	String pwd = request.getParameter("pwd");
	//세션에 저장딘 VO객체 확인
	
	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");

	// 암호일치여부확인
	if(!pwd.equals(vo.getPwd())){
%>
	<script>
		alert("암호가 다릅니다.");
		history.back();
	</script>		
<%
	return;

	// 암호가 일치하는 경우 : 삭제처리
	} else {
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			//ss.delete("guestbook.delete", pwd);
			ss.delete("guestbook.delete1", Integer.parseInt(vo.getIdx()));
			%>
			
			<script>
				alert("정상삭제됨 목록으로 이동");
				location.href = "list.jsp";
			</script>
<%
			//ss.delete("guestbook.delete1", vo.getIdx());
			//response.sendRedirect("list.jsp");	
		} catch(Exception e){
			
%>
		<script>
			alert("[예외발생] 삭제실패 담담자 연락");
			location.href = "list.jsp";
		</script>
<%			
			e.printStackTrace();
		} finally{
			ss.close();
		}
	}
%>