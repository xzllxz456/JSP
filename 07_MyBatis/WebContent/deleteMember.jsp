<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값(id)을 사용해서 DB데이터 삭제하고 화면이동
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
 --%>
<%-- 	<jsp:useBean id="memberVO" class="com.mystudy.mybatis.MemberVO"></jsp:useBean>
	<jsp:setProperty property="id" name="memberVO"/> --%>
<%
	// 파라미터 값 추출
	String id = request.getParameter("id");
	// openSession(true) : 자동커밋 상태
	SqlSession ss = DBService.getFactory().openSession(true);
	
	try{
		ss.delete("member.deleteMember", id);
		response.sendRedirect("selectAll.jsp");
		
	} catch(Exception e){
		response.sendRedirect("error.jsp");
	} finally {
		ss.close();
	}
	
%>