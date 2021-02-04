<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 삭제 요청한 데이터를 DB에서 삭제처리 후  목록 페이지 (list.jsp)로 이동 
		- 삭제 실패(댓글있는경우 : 댓글이 있어 삭제 할 수 없다 메시지 표시) 후 상세페이지(view.jsp로 이동처리)
--%>
<% 
	request.setCharacterEncoding("UTF-8");
	String b_idx = ((BBSVO)session.getAttribute("bvo")).getB_idx();	
	String cPage = (String)session.getAttribute("cPage");	
	
	try{
		DAO.delete(b_idx);
		response.sendRedirect("list.jsp");
		
		
		
		response.sendRedirect("list.jsp?cPage=" + session.getAttribute("cPage"));
	} catch (Exception e) {
%>
		<script>
			alert("[삭제실패] 댓글이 있는 경우 삭제할 수 없습니다.\n"
					+ "게시글 내용을 삭제하거나, 담당자에게 문의하세요");
			//history.go(-2); //2페이지전 이동 처리
			location.href = "view.jsp?b_idx=${bvo.b_idx}&cPage=${cPage}";
		</script>
<%		
	}
%>
		
<!--  	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("error.jsp");
		//response.sendRedirect("view.jsp?b_idx=" + b_idx + "&cPage=" + cPage);
	}  -->
	


