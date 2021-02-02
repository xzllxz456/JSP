<%@page import="javafx.geometry.VPos"%>
<%@page import="com.bc.mybatis.ShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 제품번호를 사용해서 DB데이터 조회 후 화면 표시 --%>
<%
	// 전달 받은 값 추출(파라미터 값)
	String p_num = request.getParameter("p_num");
	
%>
	<%-- 액션태그 useBean scope 상에 id명 속성 값이
		있으면 사용하고, 없으면 클래스 속성 타입의 객체 생성 + scope 등록--%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session" />
<%
	// DAO 객체(인스턴스) 사용해서 제품정보 조회 후 VO에 저장
	ShopVO vo = dao.selectOne(p_num);
	pageContext.setAttribute("avo", vo);
	System.out.println(">> content vo : " + vo);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제품 상세 정보</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<style>
	table {
		width: 600px;
		margin: 30px auto 0; /* 상 좌우 하*/
		border: 1px solid navy; 
		border-collapse: collapse;
		font-size: 0.8em;
	}	
	th, td {
		border: 1px solid navy; padding: 4px;
	}
	th { background-color: #ddd; }

	.red { color: red; }
	
	.title { width: 30%;  }
	tfoot { text-align: center; height: 3em; }
</style>
</head>
<body>

	<%@ include file="common/menu.jspf" %>

	<table>
		<tbody>
			<tr>
				<th class="title">제품Category</th>
				<td>${avo.category}</td>
			</tr>
			<tr>
				<th>제품번호</th>
				<td>${avo.p_num}</td>
			</tr>
			<tr>
				<th>제품명</th>
				<td>${avo.p_name}</td>
			</tr>
			<tr>
				<th>제조사</th>
				<td>${avo.p_company}</td>
			</tr>
			<tr>
				<th>제품가격</th>
				<td>정가 : ${avo.p_price}
				<span class="red">(할인가격 : ) ${avo.p_saleprice}</span></td>
			</tr>
			<tr>
				<th>제품설명</th>
				<td>${avo.p_content}</td>
			</tr>
			<tr>
				<td colspan="2">
					<img alt="제품이미지" src="images/${avo.p_image_l}">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" class="center">
					<input type="button" value="장바구니에 담기" onclick="add()">
					<input type="button" value="장바구니에 보기"
					 	onclick="javascript:location.href='cartList.jsp'">
				</td>
			</tr>
		</tfoot>
	</table>
<script>
	function add() {
		location.href = "addProduct.jsp?p_num=${avo.p_num}";
	}
	function cart_go() {
		location.href = "cartList.jsp";
	}
	
</script>
</body>
</html>