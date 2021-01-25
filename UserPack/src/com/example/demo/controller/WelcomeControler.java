package com.example.demo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.demo.domain.Member;
import com.example.demo.repository.JdbcMemberRepository;
import com.example.demo.repository.MapMemberRepository;
import com.example.demo.repository.MemberRepository;

@WebServlet("/welcome")
public class WelcomeControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletConfig conf = this.getServletConfig();
		ServletContext application = conf.getServletContext();
		
		MemberRepository Jdbcrepository = (MemberRepository) application.getAttribute("repository");
		
		if (Jdbcrepository == null) {
			Jdbcrepository = new JdbcMemberRepository();
			Member admin = new Member("admin", "1234");
			
			//먼저 member가 있는지 체크하기
			try {
				Jdbcrepository.findByMember(admin); // 멤버가 없으면 Exception 발생
			} catch (Exception e) {
				Jdbcrepository.addMember(admin);	
				System.out.println(e.getMessage());
			}			
			
			application.setAttribute("repository", Jdbcrepository);
		}
		
		//세션얻기
		HttpSession session = request.getSession();
		
		Member user = (Member)session.getAttribute("user");
		
		if (user == null) {
			//로그인 된 상태 => redirect login page 이동
			System.out.println("로그인이 안되있어요");
			response.sendRedirect("login.html");
			//로그인 안된상태 => login page 이동
			
		} else {
			//로그인 안된 상태 => my page로 이동
			System.out.println("user : " + user);
			response.sendRedirect("mypage.jsp");
		}
	}
}
