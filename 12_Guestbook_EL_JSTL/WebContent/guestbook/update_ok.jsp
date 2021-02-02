<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습)전달받은 데이터를 사용해서 DB데이터 수정하고 페이지 전환
	정상수정처리 : 상세페이지로 이동(onelist.jsp)
	예외발생 : 예외메시지 표시 후 상세페이지 이동
--%>
<%
	//0. 한글처리를 위한 encoding 타입 설정
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출
%>
	<jsp:useBean id="vo" class="com.bc.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="vo"/>
<%
	System.out.println(">> vo : " + vo);
	System.out.println(">> page vo : " + pageContext.getAttribute("vo"));
	
	//2. SqlSession 객체 생성 및 DB 수정 처리
	//SqlSession ss = DBService.getFactory().openSession(true); //자동커밋
	SqlSession ss = DBService.getFactory().openSession(); //자동커밋 아님
	
	try {
		ss.update("guestbook.update", vo);
		ss.commit();
		//3. 화면전환 - 정상처리된 경우
		//response.sendRedirect("onelist.jsp?idx=" + vo.getIdx());
%> 
		<script>
			alert("수정처리 되었습니다.");
			location.href = "onelist.jsp?idx=<%=vo.getIdx() %>";
		</script>		
<%		
	} catch(Exception e) {
		ss.rollback();
		e.printStackTrace();
		//3. 화면전환 - 예외발생 경우
%>
		<script>
			alert("[예외발생] 수정되지 않았습니다");
			history.go(-2); //상세화면으로 이동
		</script>
<%		
	} finally {
		ss.close();
	}
%>










