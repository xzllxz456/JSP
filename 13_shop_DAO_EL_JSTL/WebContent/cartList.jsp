<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 장바구니(cart)에 있는 제품목록을 화면에 표시 --%>

<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session" />
<%
	//카트에서 목록 꺼내기
	//List<ShopVO> list = cart.getList();
	//pageContext.setAttribute("alist", list);
%>
	<c:set var="alist" value="${cart.getList() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니(cart)</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<style>
	table {
		width: 720px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #ddd; }
	.red { color: red; }
	
	.title { width: 30%; }
	tfoot { text-align: center; height: 3em; font-size: 1.5em; font-weight: bold; }
</style>
</head>
<body>
	<%@ include file="common/menu.jspf" %>
	
	<%-- 카트내용 표시 --%>
	<table>
		<thead>
			<tr>
				<td colspan="6">::장바구니 내용</td>
			</tr>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty alist }">
			<tr>
				<td colspan="6">장바구니가 비었습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty alist }">
			<c:forEach var="shop" items="${alist }">
			<tr>
				<td>${shop.p_num}</td>
				<td>${shop.p_name}</td>
				<td>정가:${shop.p_price} 원
					<span class="red">세일가격:${shop.p_saleprice} 원</span>
				</td>
				<td>
					<form action="editQuant.jsp" method="get">
						<input type="number" name="su" size="3" min="0"
								value="${shop.quant}">
						<input type="submit" value="수정">
						<input type="hidden" name="p_num" value="${shop.p_num}">    
					</form>
				</td>
				<td>${shop.totalprice}</td>
				<td>
					<input type="button" value="삭제" onclick='delProduct("${shop.p_num}")'>               
				</td>
			</tr>
			</c:forEach>
		</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">총 결재금액 : ${cart.total}원</td>
			</tr>
		</tfoot>
	</table>
<script>
	function delProduct(pNum) {
		location.href = "delProduct.jsp?p_num=" + pNum;
	}
</script>	
</body>
</html>
