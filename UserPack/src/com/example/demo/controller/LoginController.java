package com.example.demo.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.demo.domain.Member;
import com.example.demo.repository.MemberRepository;


@WebServlet("/loginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//로그아웃 처리
		req.getSession().invalidate();
		resp.sendRedirect("welcome");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		ServletContext application = this.getServletContext();
		MemberRepository repository = (MemberRepository) application.getAttribute("repository");
		
		try {
			Member user = repository.findByMember(new Member(id, password));
			System.out.println("로그인 성공");
			request.getSession().setAttribute("user", user);
		} catch (Exception e) {
			System.out.println(e.getMessage()+"sadasdasdas");
		}
		
		System.out.println(repository);
		System.out.println("id : " + id + ", password : " + password);
		response.sendRedirect("welcome");
	}

}
