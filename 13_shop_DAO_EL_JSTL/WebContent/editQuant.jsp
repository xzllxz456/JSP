<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	제품번호, 수량을 전달받아 장바구니(cart) 데이터 수정 후
	장바구니보기 페이지로 이동 
	- 카트 : 세션에 있는 cart 사용
	- 수량 변경 작업 cart에 있는 setQuant()메소드 사용
	- 페이지 이동 : cartList.jsp
--%>

	<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session" />
	
<%
	String pNum = request.getParameter("p_num");
	int su = Integer.parseInt(request.getParameter("su"));
	if(su == 0) {
		response.sendRedirect("delProduct.jsp?p_num=" + pNum);
		return;
	}
	cart.setQuant2(pNum, su);
	response.sendRedirect("cartList.jsp");
%>