<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.CommVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 전달받은 데이터를 DB에 댓글 입력 처리
	입력 후 페이지 전환 : 선세페이지로 이동(댓글 입력상태 확인)--%>
	
<%
	request.setCharacterEncoding("UTF-8");
//페이지값 추출(상세페이지 이동시 전달할 값)
	/* CommVO cvo = new CommVO();
	cvo.setWriter(request.getParameter("writer"));
	cvo.setContent(request.getParameter("content"));
	cvo.setPwd(request.getParameter("pwd"));
	cvo.setIp(request.getRemoteAddr());
	cvo.setB_idx(request.getParameter("b_idx"));
	System.out.println("cvocvocvo:" + cvo);
	String cPage = (String)session.getAttribute("cPage");
	DAO.insertComment(cvo);
	response.sendRedirect("view.jsp?b_idx=" + cvo.getB_idx() + "&cPage=" + cPage); */
%>
	<jsp:useBean id="cvo" class="com.bc.mybatis.CommVO"/>
	<jsp:setProperty property="*" name="cvo"/>
<%
	cvo.setIp(request.getRemoteAddr());

	System.out.println("cvocvocvo:" + cvo);
	String cPage = (String)session.getAttribute("cPage");
	DAO.insertComment(cvo);
	response.sendRedirect("view.jsp?b_idx=" + cvo.getB_idx() + "&cPage=" + cPage);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
</body>
</html>