package com.example.demo.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.demo.domain.Member;
import com.example.demo.repository.MemberRepository;

@WebServlet("/join")
public class joinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    @Override
    	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    		req.setCharacterEncoding("UTF-8");
    		String id = req.getParameter("id");
    		String password = req.getParameter("password");
    		
    		ServletContext applocation = this.getServletContext();
    		MemberRepository repository = (MemberRepository) applocation.getAttribute("repository");
    		
    		repository.addMember(new Member(id, password));
    		System.out.println("repository.findAll() = " + repository.findIdAll());
    		resp.sendRedirect("welcome");
    	}
    
}
