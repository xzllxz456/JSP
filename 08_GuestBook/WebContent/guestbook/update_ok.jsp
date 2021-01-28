<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 DB데이터 수정
	정상 수정처리 : 상세페이지로 이동 (onelist.jsp)
	예외발생 : 예외메시지 표시 후 상세페이지 이동
	
--%>    
<%
// 0. 한글처리를 위한 encoding 타입 설정
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" class="com.bc.mybatis.GuestbookVO" />
<jsp:setProperty property="*" name="vo"/>
		<!-- request.setAttribute("idx", guestMember.getIdx()); -->
<%

	SqlSession ss = DBService.getFactory().openSession();
	//SqlSession ss = DBService.getFactory().openSession(true); // 자동커밋
	int result = 0;
	try {
		result = ss.update("guestbook.update", vo);
		if(result > 0){ 
			ss.commit();
			// response.sendRedirect("onelist.jsp?idx=" + vo.getIdx());
		
	
%>
	<script>
		alert("정상입력되었습니다. \n 목록페이지로 이동합니다 .");
		
		location.href="onelist.jsp?idx=<%=vo.getIdx() %>";
		
	</script>
<%
		} else {
			throw new Exception();
		}

	} catch(Exception e){
		e.printStackTrace();
		ss.rollback();
%>
		<script>
			alert("[예외발생] 입력 처리중 예외가 발생했습니다. \n "
						+ "담당자(8282)에게 연락하세요. \n"
						+ "이전페이지로 이동합니다. ");
			location.href="onelist.jsp?idx=<%=vo.getIdx() %>";
			/* history.go(-2); */ //상세화면
		</script>
<%
	} finally {
		ss.close();
	}
%>
