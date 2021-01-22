<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%! 
	String coffee = "";
	String coffeeName = "";
	int coffeePrice = 0;
	int tot = 0;
	int su = 0;
	int money = 0;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	//coffee = Integer.parseInt(getInitParameter("coffee"));
	coffee = request.getParameter("coffee");
	
	su =  Integer.parseInt(request.getParameter("su"));
	
	money = Integer.parseInt(request.getParameter("money"));
	
	
	if(coffee.equals("1")){
		coffeeName = "아메리카노";
		coffeePrice = 3000;
	} else if(coffee.equals("2")){
		coffeeName = "카페모카";
		coffeePrice = 3500;
	} else if(coffee.equals("3")){
		coffeeName = "에스프레소";
		coffeePrice = 2500;
	} else if(coffee.equals("4")) {
		coffeeName = "카페라떼";
		coffeePrice = 4000;
	}
	tot = coffeePrice * su;
	
%>

	<h2>주문 계산 결과</h2>
	
	<h3>커피종류 : <%=coffeeName%> </h3>
	<h3>단가 : <%=coffeePrice %></h3>
	<h3>수량 : <%=su %></h3>
	<h3>구입금액 : <%=tot %></h3>
	<h3>-------------------</h3>
	<h3>입금액 : <%=money %></h3>
	<h3>잔액 : <%=money-tot %></h3>
	<%-- 
		커피종류 : 아메리카노
		단가 : 3000원
		수량 : 3
		구입금액 : 9000원 (단가 * 수량)
		------------------------
		입금액 : 10000원
		잔액 : 1000원 (입금액 - 구입금액)
	 --%>
</body>
</html>