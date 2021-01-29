<%@page import="com.mystudy.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%-- 전달받은 파라미터 값 VO를 저장하고 화면 출력
	1.MemberVO 타입의 객체 생성(memberVO)
	2. 전달받은 파라미터 값을 memberVO객체(인스턴스)에 저장
	3. memberVO 값을 화면 출력
 --%>
 
 <%--
 	//MemberVO 타입의 객체 생성(memberVO)
 	MemberVO memberVO = new MemberVO();
 	memberVO.setName(request.getParameter("name"));
 	memberVO.setAge(request.getParameter("age"));
 --%>

	<jsp:useBean id="memberVO" class="com.mystudy.MemberVO" scope="request" />
	<jsp:setProperty property="*" name="memberVO"/>
<%
	System.out.println("memberVO : " + memberVO);
%>	
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 정보</title>
</head>
<body>
	<h1>회원가입 정보</h1>
	<ul>
		<li>이름 : <%=memberVO.getName() %></li>
		<li>나이 : <%=memberVO.getAge() %></li>
		<li>암호 : <%=memberVO.getPwd() %></li>
		<li>성별 : <%=memberVO.getGender() %></li>
		<li>취미(배열객체) : <%=memberVO.getHobby() %></li>
		<li>취미(배열객체데이터) :
		<%
		if(memberVO.getHobby() != null){
			for (String hobby : memberVO.getHobby()) {
				out.print(hobby + " ");
			}
		}else {
			out.print("선택된 취미가 없습니다");
		}
		%>
		</li>
	</ul>
	<%-- <h2>이름 : <%=memberVO.getName%>() %></h2>
	<h2>나이 : <%=member.getAge() %></h2>
	<h2>암호 : <%=member.getPwd() %></h2>
	<h2>성별 : <%=member.getGender() %></h2>
	<h2>취미 : 
	<%
	if(member.getHobby() !=null) {
		for(String hob : member.getHobby()){
	%>
			<%=hob + ", "%>	
	<% 		
		}
	}
	</h2>
	%> --%>
	<hr><hr>
	<h1>EL 사용 데이터 출력</h1>	<!-- 스코프 상의 데이터만 출력가능 null 표시 안함 -->
	<ul>
		<li>이름 : ${memberVO.getName() } </li>
		<li>나이 : ${memberVO.age}</li>
		<li>암호 : ${memberVO.pwd}</li>
		<li>성별 : ${memberVO.gender }</li>
		<li>취미(배열객체) : ${memberVO.hobby }</li>
		<li>취미(배열값) :
			${memberVO.hobby[0] }
			${memberVO.hobby[1] }
			${memberVO.hobby[2] }
			${memberVO.hobby[3] }
		</li>
	</ul>
</body>
</html>