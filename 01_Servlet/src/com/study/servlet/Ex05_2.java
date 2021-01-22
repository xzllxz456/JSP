package com.study.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk2")
public class Ex05_2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//전달 받은 데이터를 연산처리 후 결과를 응답
		//1. 전달받은 파라미터 추출
		String name = request.getParameter("name");
		System.out.println("> doGet() name : " + name);
		String skor = request.getParameter("kor");
		int kor = Integer.parseInt(skor);
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		System.out.println("name : " + name);
		System.out.println("kor : " + kor);
		System.out.println("eng : " + eng);
		System.out.println("math : " + math);
		
		//2. 연산처리
		int tot = kor + eng + math;
		//double avg = tot * 100 / 3 / 100.0; //소수점 이하 세째자리 버림
		//소수점 이하 세째자리 반올림 처리
		double avg = Math.round(tot * 100 / 3.0) / 100.0; 
		System.out.println("tot : " + tot);
		System.out.println("avg : " + avg);
		
		//3. 결과 출력(응답)
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h3>성적처리결과</h3>");
		out.println("<p>이름 : " + name + "</p>");
		out.println("<p>국어 : " + kor + "</p>");
		out.println("<p>영어 : " + eng + "</p>");
		out.println("<p>수학 : " + math + "</p>");
		out.println("<p>--------------</p>");
		out.println("<p>총점 : " + tot + "</p>");
		out.println("<p>평균 : " + avg + "</p>");
		out.println("<hr>");
	}
}



