<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%! 
	private static class Coffee {
		String name; //굳이 이렇게 초기화 할 필요가 없음.
		int coffeePrice;
		Coffee(String name, int coffeePrice){
			this.name = name;
			this.coffeePrice = coffeePrice;
		}
	}
	int tot = 0;
	int su = 0;
	int money = 0;
	
	Map<String, Coffee> coffeeMap = new HashMap<>();
	{
		coffeeMap.put("1", new Coffee("아메리카노", 3000));
		coffeeMap.put("2", new Coffee("카페모카", 3500));
		coffeeMap.put("3", new Coffee("에스프레소", 2500));
		coffeeMap.put("4", new Coffee("카페라떼", 4000));
	
	}
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<%
	String coffeeid = request.getParameter("coffee");
	Coffee coffee = coffeeMap.get(request.getParameter("coffee"));

	su =  Integer.parseInt(request.getParameter("su"));
	money = Integer.parseInt(request.getParameter("money"));	
	String thisCoffee = coffee.name;
	int thisPirce = coffee.coffeePrice;
	tot = su*thisPirce;
%>

	<h2>주문 계산 결과</h2>
	
	<h3>커피종류 : <%=thisCoffee %> </h3>
	<h3>단가  : <%=thisPirce %> </h3>
	<h3>수량 : <%=su %>></h3>
	<h3>구입금액 :<%=tot %></h3>
	<h3>-------------------</h3>
	<h3>입금액 : <%=money %></h3>
	<h3>잔액 : <%=money - tot %> </h3>
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