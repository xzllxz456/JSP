<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- 전달받은 데이터를 화면 표시 - 자바 빈(Bean) VO 저장 사용 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="person" class="com.bc.vo.PersonVO" />
<jsp:setProperty property="*" name="person"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결과보기 - 자바 빈</title>
</head>
<body>
		<h2>결과보기(표현식으로 form 데이터 표시)</h2>
	<ul>
		<li>이름 : <%=person.getName() %></li>
		<li>나이 : <%=person.getAge() %></li>
		<li>성별 : <%=person.getGender() %></li>
		<li>취미 : <%=person.getHobby() %></li>
		<li>취미(반복문) : 
<%
		for (String h : person.getHobby()) {
			out.print(h + " ");
		}
%>		
		</li>
	</ul>
	<hr>
	<h2>Bean 데이터 EL 사용 출력</h2>
	<ol>
		<li>이름 : ${person.getName()}</li>
		<li>나이 : ${person.getAge() }</li>
		<li>성별 : ${person.gender}</li>
		<li>취미 : ${person.hobby}</li>	
		<li>취미(데이터) : 
			${person.hobby[0] }
			${person.hobby[1] }
			${person.hobby[2] }
			${person.hobby[3] }
		</li>
	</ol>

	
	
</body>
</html>